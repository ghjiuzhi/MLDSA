module keccak_top(
	input					clk_i,              //system clock
	input					rst_ni,             //system reset, active low
	input		[2:0]		mode_i,             //1: SHA3_256, 3: SHA3_512, 4: SHAKE128, 5: SHAKE256
	input					start_i,            //start of SHAKE process, 1 clock pulse
	input		[63:0]		din_i,              //data input
	input					din_valid_i,        //data input valid signal
	input					last_din_i,         //last data input
	input		[3:0]		last_din_byte_i,    //byte length of last data input, 0 to 8
	input					dout_ready_i,       //signal to request output data
	input					dout_squeeze_i,		
	output					din_ready_o,        //signal showing shake module ready
	output		[1343:0]	dout_o,             //data output
	output	reg				dout_valid_o        //data output valid signal
);

localparam  MODE_SHA3_256 = 3'd1;
localparam  MODE_SHA3_512 = 3'd3;
localparam  MODE_SHAKE128 = 3'd4;
localparam  MODE_SHAKE256 = 3'd5;

// Delimiters
localparam  DELIMITER_SHAKE = 8'h1F;  // For SHAKE128/256
localparam  DELIMITER_SHA3  = 8'h06;  // For SHA3-256/512
// Rate parameters in bytes
localparam  RATE_SHAKE128 = 168;  // 1344 bits
localparam  RATE_SHAKE256 = 136;  // 1088 bits  
localparam  RATE_SHA3_256 = 136;  // 1088 bits (same as SHAKE256)
localparam  RATE_SHA3_512 = 72;   // 576 bits

//state parameter
localparam  S_IDLE      = 3'd0;
localparam  S_ABSORB    = 3'd1;
localparam  S_FULL      = 3'd2;
localparam  S_APPEND    = 3'd3;
localparam  S_LAST_FULL = 3'd4;
localparam  S_SQUEEZE   = 3'd5;

reg		[2:0]		state, nstate;
reg					last_data;
reg					first_append;
reg		[3:0]		last_din_byte;
reg		[2:0]		mode_reg;  // Registered mode signal

wire				buf_overflow;
wire	[63:0]		sampled_din;
reg		[63:0]		last_sampled_din;
wire				buf_en;
reg		[7:0]		byte_cnt;
wire	[7:0]		byte_cnt_next;
reg		[7:0]		rate_bytes;  // Current rate in bytes
wire	[7:0]		delimiter;   // Current delimiter

reg		[8:0]		output_cnt;  // Counter for SHA3 output words
// Use maximum size buffer for both modes
reg		[1343:0]	data_buf;   // Max size for SHAKE128 (168*8 - 1)

wire				keccak_start;
wire				keccak_squeeze;
wire				keccak_ready;
reg		[1599:0]	keccak_state_in;  // 改为reg类型
wire	[1599:0]	keccak_state_out;

reg	[4:0]	count24;


// Mode-dependent parameters
always @(*) begin
	case(mode_reg)
		MODE_SHAKE128: rate_bytes = RATE_SHAKE128;
		MODE_SHAKE256: rate_bytes = RATE_SHAKE256;
		MODE_SHA3_256: rate_bytes = RATE_SHA3_256;
		MODE_SHA3_512: rate_bytes = RATE_SHA3_512;
		default:       rate_bytes = RATE_SHAKE256;
	endcase
end
// Delimiter selection
assign delimiter = (mode_reg == MODE_SHAKE128 || mode_reg == MODE_SHAKE256) ? DELIMITER_SHAKE : DELIMITER_SHA3;

// Register mode at start
always @(posedge clk_i) begin
	if(!rst_ni)
		mode_reg <= 3'd0;
	else if(start_i)
		mode_reg <= mode_i;
end

////////////////////////////////////////////////////////////////////////////////
//Input buffer data path
always @(posedge clk_i) begin
	if(!rst_ni)
		data_buf <= 1344'd0;
	else if(count24 == 5'd24) begin
		case(mode_reg)
			MODE_SHA3_256: begin  
				data_buf[1343:256]	<= keccak_state_out[1599:512];  // 1088 bits
				data_buf[255:0]		<= 256'd0;
			end
			MODE_SHA3_512: begin
				data_buf[1343:768]	<= keccak_state_out[1599:1024];  // 576 bits
				data_buf[767:0]		<= 768'd0;
			end
			MODE_SHAKE128: begin
				data_buf	<= keccak_state_out[1599:256];  // 1344 bits
			end
			MODE_SHAKE256: begin
				data_buf[1343:256]	<= keccak_state_out[1599:512];  // 1088 bits
				data_buf[255:0]		<= 256'd0;
			end
			default : data_buf <= 1344'd0;
		endcase
	end
	else if (buf_en) begin
		if (state != S_SQUEEZE) begin
			data_buf <= {data_buf[1343-64:0], sampled_din};
		end
	end
end
  
assign buf_en = din_ready_o & din_valid_i & (last_din_i? last_din_byte_i!=0 : 1'b1) | state==S_APPEND | (dout_ready_i & state==S_SQUEEZE);

assign sampled_din = (din_ready_o & din_valid_i & last_din_i)? last_sampled_din :
                     state==S_APPEND? ((first_append & last_din_byte[2:0]==3'b000)? 
                                      {delimiter, 56'd0} : 64'd0) :
                     state==S_SQUEEZE? 64'd0 : din_i;

always @(*) begin
	case(last_din_byte_i)
		1: last_sampled_din = {din_i[63-:1*8], delimiter, {6*8{1'b0}}};
		2: last_sampled_din = {din_i[63-:2*8], delimiter, {5*8{1'b0}}};
		3: last_sampled_din = {din_i[63-:3*8], delimiter, {4*8{1'b0}}};
		4: last_sampled_din = {din_i[63-:4*8], delimiter, {3*8{1'b0}}};
		5: last_sampled_din = {din_i[63-:5*8], delimiter, {2*8{1'b0}}};
		6: last_sampled_din = {din_i[63-:6*8], delimiter, {1*8{1'b0}}};
		7: last_sampled_din = {din_i[63-:7*8], delimiter};
		default: last_sampled_din = din_i;
	endcase
end

//input byte counter
always @(posedge clk_i) begin
	if(!rst_ni)
		byte_cnt <= 0;
	else if(start_i | buf_overflow)
		byte_cnt <= 0;
	else if(buf_en)
		byte_cnt <= byte_cnt_next;
end
  
assign byte_cnt_next = (state != S_SQUEEZE & din_valid_i & last_din_i & last_din_byte_i == 0) ? byte_cnt : byte_cnt + 8;
assign buf_overflow  = buf_en & byte_cnt_next == rate_bytes;

////////////////////////////////////////////////////////////////////////////////
//FSM
always @(posedge clk_i) begin
	if(!rst_ni)
		state <= S_IDLE;
	else if(start_i)
		state <= S_ABSORB;
	else
		state <= nstate;
end
  
always @(*)begin
	nstate = state;
	case(state)
		S_IDLE:
			if(start_i)
				nstate = S_ABSORB;
		S_ABSORB: 
			if (din_valid_i & last_din_i & last_din_byte_i!=8 & byte_cnt==(rate_bytes-8))
				nstate = S_LAST_FULL;
			else if (buf_overflow)
				nstate = S_FULL;
			else if (din_valid_i & last_din_i)
				nstate = S_APPEND;
		S_FULL:
			if(keccak_ready)
				nstate = (last_data | last_din_i & din_valid_i)? S_APPEND : S_ABSORB;
		S_APPEND:
			if(buf_overflow)
				nstate = S_LAST_FULL;
		S_LAST_FULL:
			if(keccak_ready)
				nstate = S_SQUEEZE;
		S_SQUEEZE:
			if(start_i)
				nstate = S_ABSORB;
		default: nstate = S_IDLE;
	endcase
end

//last data signal
always @(posedge clk_i) begin
	if(!rst_ni) begin
		last_data     <= 0;
		first_append  <= 0;
		last_din_byte <= 0;
	end
	else if(start_i) begin
		last_data     <= 0;
		first_append  <= 0;
		last_din_byte <= 0;
	end
	else if(last_din_i & din_ready_o) begin
		last_data     <= 1;
		first_append  <= 1;
		last_din_byte <= last_din_byte_i;
	end
	else if (first_append & state==S_APPEND)
		first_append <= 0;
end

//data input ready
assign din_ready_o = state==S_ABSORB | state==S_FULL & keccak_ready & ~last_data;

////////////////////////////////////////////////////////////////////////////////
//keccak permutation interface
assign keccak_start = (state==S_FULL | state==S_LAST_FULL) & keccak_ready;
assign keccak_squeeze = state==S_SQUEEZE & keccak_ready & dout_ready_i;

// Create keccak_state_in based on mode
wire [1599:0] keccak_state_in_shake128;
wire [1599:0] keccak_state_in_shake256;
wire [1599:0] keccak_state_in_sha3_256;
wire [1599:0] keccak_state_in_sha3_512;

assign keccak_state_in_shake128 = {keccak_state_out[1599:256] ^ {data_buf[1343:8], data_buf[7]^(state==S_LAST_FULL), data_buf[6:0]}, keccak_state_out[255:0]};
assign keccak_state_in_shake256 = {keccak_state_out[1599-:1088] ^ {data_buf[1087:8], data_buf[7]^(state==S_LAST_FULL), data_buf[6:0]}, keccak_state_out[511:0]};
assign keccak_state_in_sha3_256 = keccak_state_in_shake256;
assign keccak_state_in_sha3_512 = {keccak_state_out[1599-:576] ^ {data_buf[575:8], data_buf[7]^(state==S_LAST_FULL), data_buf[6:0]}, keccak_state_out[1023:0]};

// Select appropriate state input
always @(*) begin
	case(mode_reg)
		MODE_SHAKE128: keccak_state_in = keccak_state_in_shake128;
		MODE_SHAKE256: keccak_state_in = keccak_state_in_shake256;
		MODE_SHA3_256: keccak_state_in = keccak_state_in_sha3_256;
		MODE_SHA3_512: keccak_state_in = keccak_state_in_sha3_512;
		default:       keccak_state_in = keccak_state_in_shake256;
	endcase
end

assign dout_o = data_buf;

always @(posedge clk_i) begin
	if(!rst_ni) begin
		dout_valid_o	<= 1'b0;
	end
	else begin
		if (dout_ready_i && count24 == 5'd24) begin
			dout_valid_o	<= 1'b1;
		end
		else begin
			dout_valid_o	<= 1'b0;
		end
	end
end

always @(posedge clk_i) begin
	if (keccak_ready) begin
		count24	<= 5'd0;
	end
	else begin
		count24	<= count24 + 1'b1;
	end
end

keccak_sha3 u_keccak_sha3 (
    .Clock    (clk_i            ),
    .Reset    (~rst_ni | start_i),
    .Start    (keccak_start     ),
    .Din      (keccak_state_in  ),
    .Req_more (dout_squeeze_i   ),
    .Ready    (keccak_ready     ),
    .Dout     (keccak_state_out ));

endmodule