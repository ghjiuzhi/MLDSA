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
integer fp_ml_read;
integer fp_ml_write;
integer fp_ml_final;
integer dump_idx;
reg     [5:0]   dump_addr;
reg             dump_done;

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
	dump_addr = 6'b0;
	dump_done = 0;
	fp_ml_read = $fopen("ml_kem_ntt_bank_read_trace.csv", "w");
	$fdisplay(fp_ml_read, "time,rd_addr,bank0_out,bank1_out,bank2_out,bank3_out,ALU_in0,ALU_in1,ALU_in2,ALU_in3,switch");
	fp_ml_write = $fopen("ml_kem_ntt_bank_writeback_trace.csv", "w");
	$fdisplay(fp_ml_write, "time,bank,addr,data,wr_en,bank_cnt4,KAD_bank_switch");
	fp_ml_final = $fopen("ml_kem_ntt_final_bank_snapshot.csv", "w");
	$fdisplay(fp_ml_final, "bank,addr,data");
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

always @(posedge clk) begin
	if (rst_n && enable && inst_top_NTT.rd_en && fp_ml_read != 0) begin
		$fdisplay(fp_ml_read, "%0t,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d",
			$time,
			inst_top_NTT.rd_addr,
			inst_top_NTT.bank0_out,
			inst_top_NTT.bank1_out,
			inst_top_NTT.bank2_out,
			inst_top_NTT.bank3_out,
			inst_top_NTT.ALU_in0,
			inst_top_NTT.ALU_in1,
			inst_top_NTT.ALU_in2,
			inst_top_NTT.ALU_in3,
			inst_top_NTT.switch);
	end
	if (rst_n && enable && fp_ml_write != 0) begin
		if (inst_top_NTT.wr0_en)
			$fdisplay(fp_ml_write, "%0t,0,%0d,%0d,%0d,%0d,%0d",
				$time, inst_top_NTT.wr0_addr, inst_top_NTT.bank0_in,
				inst_top_NTT.wr0_en, inst_top_NTT.bank0_cnt4, inst_top_NTT.KAD_bank0_switch);
		if (inst_top_NTT.wr1_en)
			$fdisplay(fp_ml_write, "%0t,1,%0d,%0d,%0d,%0d,%0d",
				$time, inst_top_NTT.wr1_addr, inst_top_NTT.bank1_in,
				inst_top_NTT.wr1_en, inst_top_NTT.bank1_cnt4, inst_top_NTT.KAD_bank1_switch);
		if (inst_top_NTT.wr2_en)
			$fdisplay(fp_ml_write, "%0t,2,%0d,%0d,%0d,%0d,%0d",
				$time, inst_top_NTT.wr2_addr, inst_top_NTT.bank2_in,
				inst_top_NTT.wr2_en, inst_top_NTT.bank2_cnt4, inst_top_NTT.KAD_bank2_switch);
		if (inst_top_NTT.wr3_en)
			$fdisplay(fp_ml_write, "%0t,3,%0d,%0d,%0d,%0d,%0d",
				$time, inst_top_NTT.wr3_addr, inst_top_NTT.bank3_in,
				inst_top_NTT.wr3_en, inst_top_NTT.bank3_cnt4, inst_top_NTT.KAD_bank3_switch);
	end
	if (rst_n && done_flag && !dump_done) begin
		dump_done <= 1'b1;
		force enable = 1'b0;
		force Multi_Mode = 1'b1;
		for (dump_idx = 0; dump_idx < 64; dump_idx = dump_idx + 1) begin
			dump_addr = dump_idx;
			@(negedge clk);
			force inst_top_NTT.rd_en = 1'b1;
			force inst_top_NTT.rd_addr = dump_addr;
			@(posedge clk);
			#1;
			$fdisplay(fp_ml_final, "0,%0d,%0d", dump_addr, inst_top_NTT.bank0_out);
			$fdisplay(fp_ml_final, "1,%0d,%0d", dump_addr, inst_top_NTT.bank1_out);
			$fdisplay(fp_ml_final, "2,%0d,%0d", dump_addr, inst_top_NTT.bank2_out);
			$fdisplay(fp_ml_final, "3,%0d,%0d", dump_addr, inst_top_NTT.bank3_out);
		end
		release inst_top_NTT.rd_en;
		release inst_top_NTT.rd_addr;
		release enable;
		release Multi_Mode;
		$fclose(fp_ml_read);
		$fclose(fp_ml_write);
		$fclose(fp_ml_final);
		$finish;
	end
end
endmodule
