//ML-DSA NTT and INTT test:
//use DSA_Bank_group_0/1/2/3.coe and DSA_mont_row.coe
//set KAD_Mode = 0

//ML-KEM NTT test:
//use KEM_Bank_group_0/1/2/3.coe and KEM_mont_row_2.coe
//set KAD_Mode = 1 and Multi_Mode = 1

//ML-KEM NTT test:
//use KEM_Bank_group_intt_0/1/2/3.coe and KEM_mont_row_2.coe
//set KAD_Mode = 1 and Multi_Mode = 0

module tb_top_NTT();
reg				clk;
reg				rst_n;
reg				enable;
reg				KAD_Mode;
reg				Multi_Mode;
wire			done_flag;
reg				start;
reg		[7:0]	cnt;

top_NTT inst_top_NTT (
	.clk		(clk),
	.rst_n		(rst_n),
	.enable		(enable),
	.KAD_Mode	(KAD_Mode),
	.Multi_Mode	(Multi_Mode),
	.done_flag	(done_flag)
);

always #5 clk = ~clk;

initial
begin
	clk = 0;
	rst_n = 0;
	start = 0;
	KAD_Mode = 1;
	#1000
	rst_n = 1;
	#1000
	start = 1;
	#10
	start = 0;
end

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			enable		<= 0;
			Multi_Mode	<= 0;
		end
		else begin
			if (start) begin
				enable		<= 1;
				Multi_Mode	<= 1;
			end
			else if (done_flag) begin
				enable		<= 0;
				Multi_Mode	<= 0;
			end
			else if (cnt == 20) begin
				enable		<= 1;
				Multi_Mode	<= 0;
			end
		end
	end
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt	<= 0;
		end
		else if (cnt > 0) begin
			cnt <= cnt + 1'b1;
		end
		else if (done_flag) begin
			cnt	<= 1;
		end
	end
endmodule