`timescale 1ns / 1ps

module tb_KAD_NTT_Ctrl_compare;

    localparam integer COEF_NUM = 256;
    localparam integer WORD_NUM = COEF_NUM / 2;
    localparam integer MAX_CYCLES = 200000;

    reg         clk;
    reg         aresetn;
    reg         start;
    reg         KAD_Mode;
    reg         Multi_Mode;
    reg         Rm_tvalid;
    wire        Rm_tready;
    reg [63:0]  Rm_tdata;
    reg [7:0]   Rm_tkeep;
    reg         Rm_tlast;
    wire        Ws_tvalid;
    reg         Ws_tready;
    wire [63:0] Ws_tdata;
    wire [7:0]  Ws_tkeep;
    wire        Ws_tlast;
    wire        write_done;

    reg [31:0] input_data [0:COEF_NUM-1];
    reg [31:0] dut_out [0:COEF_NUM-1];
    reg [31:0] golden_1003 [0:COEF_NUM-1];
    reg [31:0] golden_pqclean [0:COEF_NUM-1];
    reg [22:0] shadow_bank0 [0:63];
    reg [22:0] shadow_bank1 [0:63];
    reg [22:0] shadow_bank2 [0:63];
    reg [22:0] shadow_bank3 [0:63];
    reg [22:0] compute_bank0 [0:63];
    reg [22:0] compute_bank1 [0:63];
    reg [22:0] compute_bank2 [0:63];
    reg [22:0] compute_bank3 [0:63];

    integer cycle_count;
    integer in_idx;
    integer out_idx;
    integer fp_dut;
    integer fp_bank;
    integer fp_1003;
    integer fp_pqclean;
    integer fp_dbg;
    integer fp_compute;
    integer fp_bank_write;
    integer fp_bank_readout;
    integer scan_ret;
    integer i;
    integer bank_idx;
    integer compute_log_count;
    integer write_log_count;
    integer topntt_log_count;
    integer mismatch_1003;
    integer mismatch_pqclean;
    reg golden_1003_loaded;
    reg golden_pqclean_loaded;
    reg [1023:0] golden_1003_path;
    reg [1023:0] golden_pqclean_path;
    reg send_done;
    reg compare_done;
    reg read_dump_done;
    reg compute_seeded;
    reg compute_dump_done;
    reg s4_dump_done;
    reg [4:0] addrgen_cs_d1;
    reg [1:0] write_src_bank_d0;
    reg [1:0] write_src_bank_d1;
    reg [1:0] write_src_bank_d2;
    reg [5:0] write_src_addra_d0;
    reg [5:0] write_src_addra_d1;
    reg [5:0] write_src_addra_d2;
    reg [5:0] write_src_addrb_d0;
    reg [5:0] write_src_addrb_d1;
    reg [5:0] write_src_addrb_d2;
    wire last_output_beat;
    wire capture_complete;

    KAD_NTT_Ctrl dut (
        .clk        (clk),
        .aresetn    (aresetn),
        .start      (start),
        .KAD_Mode   (KAD_Mode),
        .Multi_Mode (Multi_Mode),
        .Rm_tvalid  (Rm_tvalid),
        .Rm_tready  (Rm_tready),
        .Rm_tdata   (Rm_tdata),
        .Rm_tkeep   (Rm_tkeep),
        .Rm_tlast   (Rm_tlast),
        .Ws_tvalid  (Ws_tvalid),
        .Ws_tready  (Ws_tready),
        .Ws_tdata   (Ws_tdata),
        .Ws_tkeep   (Ws_tkeep),
        .Ws_tlast   (Ws_tlast),
        .write_done (write_done)
    );

    assign last_output_beat = Ws_tvalid && Ws_tready && (out_idx == COEF_NUM - 2);
    assign capture_complete = (out_idx >= COEF_NUM) || last_output_beat;

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        for (i = 0; i < COEF_NUM; i = i + 1) begin
            input_data[i] = i + 1;
            dut_out[i] = 32'd0;
            golden_1003[i] = 32'd0;
            golden_pqclean[i] = 32'd0;
        end
        for (i = 0; i < 64; i = i + 1) begin
            shadow_bank0[i] = 23'd0;
            shadow_bank1[i] = 23'd0;
            shadow_bank2[i] = 23'd0;
            shadow_bank3[i] = 23'd0;
            compute_bank0[i] = 23'd0;
            compute_bank1[i] = 23'd0;
            compute_bank2[i] = 23'd0;
            compute_bank3[i] = 23'd0;
        end

        golden_1003_loaded = 1'b0;
        golden_pqclean_loaded = 1'b0;
        golden_1003_path = "golden_1003_ntt_1_256.txt";
        golden_pqclean_path = "golden_pqclean_ntt_1_256.txt";

        fp_1003 = $fopen(golden_1003_path, "r");
        if (fp_1003 == 0) begin
            golden_1003_path = "../../../../../../PQC_PRJ_20251003/PQC_HW_ACC_IP/PQC_HW_ACC_IP.sim/sim_1/behav/xsim/golden_1003_ntt_1_256.txt";
            fp_1003 = $fopen(golden_1003_path, "r");
        end
        if (fp_1003 != 0) begin
            golden_1003_loaded = 1'b1;
            $display("Loaded golden_1003 from %0s", golden_1003_path);
            for (i = 0; i < COEF_NUM; i = i + 1) begin
                scan_ret = $fscanf(fp_1003, "%d", golden_1003[i]);
                if (scan_ret != 1) begin
                    golden_1003_loaded = 1'b0;
                    i = COEF_NUM;
                end
            end
            $fclose(fp_1003);
        end

        fp_pqclean = $fopen(golden_pqclean_path, "r");
        if (fp_pqclean == 0) begin
            golden_pqclean_path = "../../../../../../tools/golden_pqclean_ntt_1_256.txt";
            fp_pqclean = $fopen(golden_pqclean_path, "r");
        end
        if (fp_pqclean != 0) begin
            golden_pqclean_loaded = 1'b1;
            $display("Loaded golden_pqclean from %0s", golden_pqclean_path);
            for (i = 0; i < COEF_NUM; i = i + 1) begin
                scan_ret = $fscanf(fp_pqclean, "%d", golden_pqclean[i]);
                if (scan_ret != 1) begin
                    golden_pqclean_loaded = 1'b0;
                    i = COEF_NUM;
                end
            end
            $fclose(fp_pqclean);
        end

        fp_dbg = $fopen("dut_ntt_debug_trace.txt", "w");
        fp_bank_write = $fopen("pqc1027_ntt_bank_write_map.csv", "w");
        if (fp_bank_write != 0) begin
            $fdisplay(fp_bank_write, "time,bank,port,addr,data,counter,counter_1,rev_counter,CS,NS,Rm_tdata");
        end else begin
            $display("WARNING: cannot open pqc1027_ntt_bank_write_map.csv");
        end
        fp_bank_readout = $fopen("pqc1027_ntt_bank_readout_map.csv", "w");
        if (fp_bank_readout != 0) begin
            $fdisplay(fp_bank_readout, "time,CS,cnt_128_ntt,cnt_30,cnt_31,cnt_2,Ws_valid,Ws_data,data1,data2");
        end else begin
            $display("WARNING: cannot open pqc1027_ntt_bank_readout_map.csv");
        end
    end

    initial begin
        aresetn = 1'b0;
        start = 1'b0;
        KAD_Mode = 1'b1;
        Multi_Mode = 1'b1;
        Rm_tvalid = 1'b0;
        Rm_tdata = 64'd0;
        Rm_tkeep = 8'h00;
        Rm_tlast = 1'b0;
        Ws_tready = 1'b1;
        cycle_count = 0;
        in_idx = 0;
        out_idx = 0;
        send_done = 1'b0;
        compare_done = 1'b0;
        read_dump_done = 1'b0;
        compute_seeded = 1'b0;
        compute_dump_done = 1'b0;
        s4_dump_done = 1'b0;
        addrgen_cs_d1 = 5'b0;
        write_src_bank_d0 = 2'd0;
        write_src_bank_d1 = 2'd0;
        write_src_bank_d2 = 2'd0;
        write_src_addra_d0 = 6'd0;
        write_src_addra_d1 = 6'd0;
        write_src_addra_d2 = 6'd0;
        write_src_addrb_d0 = 6'd0;
        write_src_addrb_d1 = 6'd0;
        write_src_addrb_d2 = 6'd0;
        compute_log_count = 0;
        write_log_count = 0;
        topntt_log_count = 0;
        mismatch_1003 = 0;
        mismatch_pqclean = 0;

        #40;
        aresetn = 1'b1;
        #40;
        start = 1'b1;
        #10;
        start = 1'b0;
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            in_idx <= 0;
            send_done <= 1'b0;
            Rm_tvalid <= 1'b0;
            Rm_tdata <= 64'd0;
            Rm_tkeep <= 8'h00;
            Rm_tlast <= 1'b0;
        end else if (!send_done && dut.read_working) begin
            if (!Rm_tvalid || Rm_tready) begin
                if (in_idx < COEF_NUM) begin
                    Rm_tvalid <= 1'b1;
                    Rm_tdata <= {input_data[in_idx + 1], input_data[in_idx]};
                    Rm_tkeep <= 8'hFF;
                    Rm_tlast <= (in_idx == COEF_NUM - 2);
                    in_idx <= in_idx + 2;
                end else begin
                    Rm_tvalid <= 1'b0;
                    Rm_tdata <= 64'd0;
                    Rm_tkeep <= 8'h00;
                    Rm_tlast <= 1'b0;
                    send_done <= 1'b1;
                end
            end
        end else if (!send_done) begin
            Rm_tvalid <= 1'b0;
            Rm_tdata <= 64'd0;
            Rm_tkeep <= 8'h00;
            Rm_tlast <= 1'b0;
        end else begin
            Rm_tvalid <= 1'b0;
            Rm_tdata <= 64'd0;
            Rm_tkeep <= 8'h00;
            Rm_tlast <= 1'b0;
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            out_idx <= 0;
        end else if (Ws_tvalid && Ws_tready && out_idx < COEF_NUM) begin
            dut_out[out_idx] <= Ws_tdata[11:0];
            dut_out[out_idx + 1] <= Ws_tdata[43:32];
            out_idx <= out_idx + 2;
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            for (bank_idx = 0; bank_idx < 64; bank_idx = bank_idx + 1) begin
                shadow_bank0[bank_idx] <= 23'd0;
                shadow_bank1[bank_idx] <= 23'd0;
                shadow_bank2[bank_idx] <= 23'd0;
                shadow_bank3[bank_idx] <= 23'd0;
                compute_bank0[bank_idx] <= 23'd0;
                compute_bank1[bank_idx] <= 23'd0;
                compute_bank2[bank_idx] <= 23'd0;
                compute_bank3[bank_idx] <= 23'd0;
            end
        end else begin
            if (dut.read_working) begin
                if (dut.coef_ena_bram0 && dut.coef_wea_bram0) shadow_bank0[dut.coef_addra_bram0] <= dut.coef_dina_bram0;
                if (dut.coef_enb_bram0 && dut.coef_web_bram0) shadow_bank0[dut.coef_addrb_bram0] <= dut.coef_dinb_bram0;
                if (dut.coef_ena_bram1 && dut.coef_wea_bram1) shadow_bank1[dut.coef_addra_bram1] <= dut.coef_dina_bram1;
                if (dut.coef_enb_bram1 && dut.coef_web_bram1) shadow_bank1[dut.coef_addrb_bram1] <= dut.coef_dinb_bram1;
                if (dut.coef_ena_bram2 && dut.coef_wea_bram2) shadow_bank2[dut.coef_addra_bram2] <= dut.coef_dina_bram2;
                if (dut.coef_enb_bram2 && dut.coef_web_bram2) shadow_bank2[dut.coef_addrb_bram2] <= dut.coef_dinb_bram2;
                if (dut.coef_ena_bram3 && dut.coef_wea_bram3) shadow_bank3[dut.coef_addra_bram3] <= dut.coef_dina_bram3;
                if (dut.coef_enb_bram3 && dut.coef_web_bram3) shadow_bank3[dut.coef_addrb_bram3] <= dut.coef_dinb_bram3;
            end

            if (!compute_seeded && dut.compu_working) begin
                for (bank_idx = 0; bank_idx < 64; bank_idx = bank_idx + 1) begin
                    compute_bank0[bank_idx] <= shadow_bank0[bank_idx];
                    compute_bank1[bank_idx] <= shadow_bank1[bank_idx];
                    compute_bank2[bank_idx] <= shadow_bank2[bank_idx];
                    compute_bank3[bank_idx] <= shadow_bank3[bank_idx];
                end
                compute_seeded <= 1'b1;
            end

            if (dut.compu_working) begin
                if (dut.coef_ena_bram0 && dut.coef_wea_bram0) compute_bank0[dut.coef_addra_bram0] <= dut.coef_dina_bram0;
                if (dut.coef_enb_bram0 && dut.coef_web_bram0) compute_bank0[dut.coef_addrb_bram0] <= dut.coef_dinb_bram0;
                if (dut.coef_ena_bram1 && dut.coef_wea_bram1) compute_bank1[dut.coef_addra_bram1] <= dut.coef_dina_bram1;
                if (dut.coef_enb_bram1 && dut.coef_web_bram1) compute_bank1[dut.coef_addrb_bram1] <= dut.coef_dinb_bram1;
                if (dut.coef_ena_bram2 && dut.coef_wea_bram2) compute_bank2[dut.coef_addra_bram2] <= dut.coef_dina_bram2;
                if (dut.coef_enb_bram2 && dut.coef_web_bram2) compute_bank2[dut.coef_addrb_bram2] <= dut.coef_dinb_bram2;
                if (dut.coef_ena_bram3 && dut.coef_wea_bram3) compute_bank3[dut.coef_addra_bram3] <= dut.coef_dina_bram3;
                if (dut.coef_enb_bram3 && dut.coef_web_bram3) compute_bank3[dut.coef_addrb_bram3] <= dut.coef_dinb_bram3;
            end
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            cycle_count <= 0;
        end else begin
            cycle_count <= cycle_count + 1;
            if (cycle_count > MAX_CYCLES) begin
                $display("ERROR: timeout, output words captured = %0d", out_idx);
                $finish;
            end
        end
    end

    always @(posedge clk) begin
        if (aresetn && Rm_tvalid && Rm_tready && in_idx <= 16) begin
            if (fp_dbg != 0) begin
                $fdisplay(fp_dbg, "TB handshake  t=%0t in_idx=%0d data_hi=%0d data_lo=%0d start=%b read_working=%b read_start=%b",
                          $time, in_idx, Rm_tdata[63:32], Rm_tdata[31:0], start, dut.read_working, dut.read_start);
            end
        end
    end

    always @(posedge clk) begin
        if (aresetn && dut.u_KAD_NTT_mem_read.rd_en && dut.u_KAD_NTT_mem_read.counter <= 8) begin
            if (fp_dbg != 0) begin
                $fdisplay(fp_dbg, "MEM accept    t=%0t counter=%0d data1=%0d data2=%0d module_start=%b read_working=%b",
                          $time,
                          dut.u_KAD_NTT_mem_read.counter,
                          dut.u_KAD_NTT_mem_read.data_1,
                          dut.u_KAD_NTT_mem_read.data_2,
                          dut.read_start,
                          dut.read_working);
            end
        end
    end

    always @(posedge clk) begin
        if (aresetn && dut.read_working && fp_bank_write != 0) begin
            if (dut.coef_ena_bram0 && dut.coef_wea_bram0) begin
                $fdisplay(fp_bank_write, "%0t,0,A,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addra_bram0, dut.coef_dina_bram0,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_enb_bram0 && dut.coef_web_bram0) begin
                $fdisplay(fp_bank_write, "%0t,0,B,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addrb_bram0, dut.coef_dinb_bram0,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_ena_bram1 && dut.coef_wea_bram1) begin
                $fdisplay(fp_bank_write, "%0t,1,A,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addra_bram1, dut.coef_dina_bram1,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_enb_bram1 && dut.coef_web_bram1) begin
                $fdisplay(fp_bank_write, "%0t,1,B,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addrb_bram1, dut.coef_dinb_bram1,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_ena_bram2 && dut.coef_wea_bram2) begin
                $fdisplay(fp_bank_write, "%0t,2,A,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addra_bram2, dut.coef_dina_bram2,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_enb_bram2 && dut.coef_web_bram2) begin
                $fdisplay(fp_bank_write, "%0t,2,B,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addrb_bram2, dut.coef_dinb_bram2,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_ena_bram3 && dut.coef_wea_bram3) begin
                $fdisplay(fp_bank_write, "%0t,3,A,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addra_bram3, dut.coef_dina_bram3,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
            if (dut.coef_enb_bram3 && dut.coef_web_bram3) begin
                $fdisplay(fp_bank_write, "%0t,3,B,%0d,%0d,%0d,%0d,%0d,%0d,%0d,%h",
                    $time, dut.coef_addrb_bram3, dut.coef_dinb_bram3,
                    dut.u_KAD_NTT_mem_read.counter,
                    dut.u_KAD_NTT_mem_read.counter_1,
                    dut.u_KAD_NTT_mem_read.rev_counter,
                    dut.u_KAD_NTT_mem_read.CS,
                    dut.u_KAD_NTT_mem_read.NS,
                    Rm_tdata);
            end
        end
    end

    always @(posedge clk) begin
        if (aresetn && dut.write_working && fp_bank_readout != 0) begin
            $fdisplay(fp_bank_readout, "%0t,%0d,%0d,%0d,%0d,%0d,%0d,%h,%0d,%0d",
                $time,
                dut.u_KAD_NTT_mem_write.CS,
                dut.u_KAD_NTT_mem_write.cnt_128_ntt,
                dut.u_KAD_NTT_mem_write.cnt_30,
                dut.u_KAD_NTT_mem_write.cnt_31,
                dut.u_KAD_NTT_mem_write.cnt_2,
                Ws_tvalid,
                Ws_tdata,
                dut.u_KAD_NTT_mem_write.data1,
                dut.u_KAD_NTT_mem_write.data2);
        end
    end

    task dump_read_banks;
        integer k;
        begin
            fp_bank = $fopen("dut_ntt_1027_read_banks.txt", "w");
            if (fp_bank != 0) begin
                $fdisplay(fp_bank, "bank0");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_bank, "%0d %0d", k, shadow_bank0[k]);
                end
                $fdisplay(fp_bank, "bank1");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_bank, "%0d %0d", k, shadow_bank1[k]);
                end
                $fdisplay(fp_bank, "bank2");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_bank, "%0d %0d", k, shadow_bank2[k]);
                end
                $fdisplay(fp_bank, "bank3");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_bank, "%0d %0d", k, shadow_bank3[k]);
                end
                $fclose(fp_bank);
                $display("Read-bank snapshot written to dut_ntt_1027_read_banks.txt");
            end else begin
                $display("WARNING: cannot open dut_ntt_1027_read_banks.txt");
            end
        end
    endtask

    task dump_compute_banks;
        integer k;
        begin
            fp_compute = $fopen("dut_ntt_1027_compute_banks.txt", "w");
            if (fp_compute != 0) begin
                $fdisplay(fp_compute, "bank0");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_compute, "%0d %0d", k, compute_bank0[k][11:0]);
                end
                $fdisplay(fp_compute, "bank1");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_compute, "%0d %0d", k, compute_bank1[k][11:0]);
                end
                $fdisplay(fp_compute, "bank2");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_compute, "%0d %0d", k, compute_bank2[k][11:0]);
                end
                $fdisplay(fp_compute, "bank3");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_compute, "%0d %0d", k, compute_bank3[k][11:0]);
                end
                $fclose(fp_compute);
                $display("Compute-bank snapshot written to dut_ntt_1027_compute_banks.txt");
            end else begin
                $display("WARNING: cannot open dut_ntt_1027_compute_banks.txt");
            end
        end
    endtask

    task dump_s4_entry_banks;
        integer k;
        integer fp_s4;
        begin
            fp_s4 = $fopen("dut_ntt_1027_s4_entry_banks.txt", "w");
            if (fp_s4 != 0) begin
                $fdisplay(fp_s4, "bank0");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_s4, "%0d %0d", k, compute_bank0[k][11:0]);
                end
                $fdisplay(fp_s4, "bank1");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_s4, "%0d %0d", k, compute_bank1[k][11:0]);
                end
                $fdisplay(fp_s4, "bank2");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_s4, "%0d %0d", k, compute_bank2[k][11:0]);
                end
                $fdisplay(fp_s4, "bank3");
                for (k = 0; k < 64; k = k + 1) begin
                    $fdisplay(fp_s4, "%0d %0d", k, compute_bank3[k][11:0]);
                end
                $fclose(fp_s4);
                $display("S4-entry bank snapshot written to dut_ntt_1027_s4_entry_banks.txt");
            end else begin
                $display("WARNING: cannot open dut_ntt_1027_s4_entry_banks.txt");
            end
        end
    endtask

    task dump_dut_output;
        integer k;
        begin
            fp_dut = $fopen("dut_ntt_1027_out.txt", "w");
            if (fp_dut != 0) begin
                for (k = 0; k < COEF_NUM; k = k + 1) begin
                    $fdisplay(fp_dut, "%0d", dut_out[k]);
                end
                $fclose(fp_dut);
                $display("DUT output written to dut_ntt_1027_out.txt");
            end else begin
                $display("WARNING: cannot open dut_ntt_1027_out.txt");
            end
        end
    endtask

    task compare_against_golden;
        integer k;
        begin
            mismatch_1003 = 0;
            mismatch_pqclean = 0;

            if (golden_1003_loaded) begin
                for (k = 0; k < COEF_NUM; k = k + 1) begin
                    if (dut_out[k] !== golden_1003[k]) begin
                        mismatch_1003 = mismatch_1003 + 1;
                        if (mismatch_1003 <= 16) begin
                            $display("1003 mismatch [%0d]: dut=%0d ref=%0d",
                                     k, dut_out[k], golden_1003[k]);
                        end
                    end
                end
                $display("1003 compare done, mismatches = %0d", mismatch_1003);
            end else begin
                $display("1003 golden file not loaded, skip compare");
            end

            if (golden_pqclean_loaded) begin
                for (k = 0; k < COEF_NUM; k = k + 1) begin
                    if (dut_out[k] !== golden_pqclean[k]) begin
                        mismatch_pqclean = mismatch_pqclean + 1;
                        if (mismatch_pqclean <= 16) begin
                            $display("PQClean mismatch [%0d]: dut=%0d ref=%0d",
                                     k, dut_out[k], golden_pqclean[k]);
                        end
                    end
                end
                $display("PQClean compare done, mismatches = %0d", mismatch_pqclean);
            end else begin
                $display("PQClean golden file not loaded, skip compare");
            end
        end
    endtask

    always @(posedge clk) begin
        if (aresetn && !read_dump_done && dut.read_done) begin
            read_dump_done <= 1'b1;
            #1;
            dump_read_banks();
        end
    end

    always @(posedge clk) begin
        if (aresetn && !compute_dump_done && dut.write_working) begin
            compute_dump_done <= 1'b1;
            #1;
            dump_compute_banks();
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            addrgen_cs_d1 <= 5'b0;
            s4_dump_done <= 1'b0;
        end else begin
            addrgen_cs_d1 <= dut.u_top_NTT.inst_address.CS;
            if (!s4_dump_done &&
                addrgen_cs_d1 != 5'b01000 &&
                dut.u_top_NTT.inst_address.CS == 5'b01000) begin
                s4_dump_done <= 1'b1;
                #1;
                dump_s4_entry_banks();
            end
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            write_src_bank_d0 <= 2'd0;
            write_src_bank_d1 <= 2'd0;
            write_src_bank_d2 <= 2'd0;
            write_src_addra_d0 <= 6'd0;
            write_src_addra_d1 <= 6'd0;
            write_src_addra_d2 <= 6'd0;
            write_src_addrb_d0 <= 6'd0;
            write_src_addrb_d1 <= 6'd0;
            write_src_addrb_d2 <= 6'd0;
        end else begin
            write_src_bank_d2 <= write_src_bank_d1;
            write_src_bank_d1 <= write_src_bank_d0;
            write_src_addra_d2 <= write_src_addra_d1;
            write_src_addra_d1 <= write_src_addra_d0;
            write_src_addrb_d2 <= write_src_addrb_d1;
            write_src_addrb_d1 <= write_src_addrb_d0;

            case (dut.u_KAD_NTT_mem_write.CS)
                5'b00001: begin
                    if (dut.u_KAD_NTT_mem_write.cnt_2 == 1'b0) begin
                        write_src_bank_d0 <= 2'd0;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram0;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram0;
                    end else begin
                        write_src_bank_d0 <= 2'd2;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram2;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram2;
                    end
                end
                5'b00010,
                5'b00100: begin
                    if (dut.u_KAD_NTT_mem_write.cnt_2 == 1'b0) begin
                        write_src_bank_d0 <= 2'd1;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram1;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram1;
                    end else begin
                        write_src_bank_d0 <= 2'd3;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram3;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram3;
                    end
                end
                5'b01000: begin
                    if (dut.u_KAD_NTT_mem_write.cnt_2 == 1'b0) begin
                        write_src_bank_d0 <= 2'd0;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram0;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram0;
                    end else begin
                        write_src_bank_d0 <= 2'd2;
                        write_src_addra_d0 <= dut.u_KAD_NTT_mem_write.coef_addra_bram2;
                        write_src_addrb_d0 <= dut.u_KAD_NTT_mem_write.coef_addrb_bram2;
                    end
                end
                default: begin
                    write_src_bank_d0 <= 2'd0;
                    write_src_addra_d0 <= 6'd0;
                    write_src_addrb_d0 <= 6'd0;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (!aresetn) begin
            compute_log_count <= 0;
            write_log_count <= 0;
            topntt_log_count <= 0;
        end else if (dut.compu_working && compute_log_count < 300) begin
            if (dut.coef_ena_bram0 && dut.coef_wea_bram0) begin
                $fdisplay(fp_dbg,
                    "COMPUTE wr bank0 t=%0t addr=%0d data=%0d raw=%h",
                    $time, dut.coef_addra_bram0, dut.coef_dina_bram0[11:0], dut.coef_dina_bram0);
                compute_log_count <= compute_log_count + 1;
            end
            if (dut.coef_ena_bram1 && dut.coef_wea_bram1 && compute_log_count < 300) begin
                $fdisplay(fp_dbg,
                    "COMPUTE wr bank1 t=%0t addr=%0d data=%0d raw=%h",
                    $time, dut.coef_addra_bram1, dut.coef_dina_bram1[11:0], dut.coef_dina_bram1);
                compute_log_count <= compute_log_count + 1;
            end
            if (dut.coef_ena_bram2 && dut.coef_wea_bram2 && compute_log_count < 300) begin
                $fdisplay(fp_dbg,
                    "COMPUTE wr bank2 t=%0t addr=%0d data=%0d raw=%h",
                    $time, dut.coef_addra_bram2, dut.coef_dina_bram2[11:0], dut.coef_dina_bram2);
                compute_log_count <= compute_log_count + 1;
            end
            if (dut.coef_ena_bram3 && dut.coef_wea_bram3 && compute_log_count < 300) begin
                $fdisplay(fp_dbg,
                    "COMPUTE wr bank3 t=%0t addr=%0d data=%0d raw=%h",
                    $time, dut.coef_addra_bram3, dut.coef_dina_bram3[11:0], dut.coef_dina_bram3);
                compute_log_count <= compute_log_count + 1;
            end
        end

        if (aresetn && dut.compu_working && topntt_log_count < 300) begin
            $fdisplay(fp_dbg,
                "TOPNTT step=%0d t=%0t wr_en=%b%b%b%b wr_addr=%0d/%0d/%0d/%0d cnt4=%0d/%0d/%0d/%0d sw=%b%b%b%b tw=%0d/%0d/%0d ain=%0d/%0d/%0d/%0d bin=%0d/%0d/%0d/%0d alu=%0d/%0d/%0d/%0d rd_addr=%0d",
                topntt_log_count, $time,
                dut.u_top_NTT.wr0_en, dut.u_top_NTT.wr1_en, dut.u_top_NTT.wr2_en, dut.u_top_NTT.wr3_en,
                dut.u_top_NTT.wr0_addr, dut.u_top_NTT.wr1_addr, dut.u_top_NTT.wr2_addr, dut.u_top_NTT.wr3_addr,
                dut.u_top_NTT.bank0_cnt4, dut.u_top_NTT.bank1_cnt4, dut.u_top_NTT.bank2_cnt4, dut.u_top_NTT.bank3_cnt4,
                dut.u_top_NTT.KAD_bank0_switch, dut.u_top_NTT.KAD_bank1_switch, dut.u_top_NTT.KAD_bank2_switch, dut.u_top_NTT.KAD_bank3_switch,
                dut.u_top_NTT.inst_ALU.tw1[11:0], dut.u_top_NTT.inst_ALU.tw2[11:0], dut.u_top_NTT.inst_ALU.tw3[11:0],
                dut.u_top_NTT.ALU_in0[11:0], dut.u_top_NTT.ALU_in1[11:0], dut.u_top_NTT.ALU_in2[11:0], dut.u_top_NTT.ALU_in3[11:0],
                dut.u_top_NTT.bank0_in[11:0], dut.u_top_NTT.bank1_in[11:0], dut.u_top_NTT.bank2_in[11:0], dut.u_top_NTT.bank3_in[11:0],
                dut.u_top_NTT.ALU_out0[11:0], dut.u_top_NTT.ALU_out1[11:0], dut.u_top_NTT.ALU_out2[11:0], dut.u_top_NTT.ALU_out3[11:0],
                dut.u_top_NTT.rd_addr);
            if (topntt_log_count >= 120 && topntt_log_count <= 180) begin
                $fdisplay(fp_dbg,
                    "ALUDET step=%0d pe2=%0d/%0d/%0d/%0d pe2d=%0d/%0d/%0d/%0d/%0d/%0d pe1d=%0d/%0d/%0d",
                    topntt_log_count,
                    dut.u_top_NTT.inst_ALU.PE2_out_0[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_1[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_2[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_3[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_1_d1[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_2_d1[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_2_d2[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_3_d1[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_3_d2[11:0],
                    dut.u_top_NTT.inst_ALU.PE2_out_3_d3[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_2_d7[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_1_d8[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_3_mid_d9[11:0]);
                $fdisplay(fp_dbg,
                    "ALUPE1 step=%0d in=%0d/%0d/%0d/%0d out=%0d/%0d/%0d/%0d d4=%0d/%0d/%0d mid=%0d sw=%b/%b/%b",
                    topntt_log_count,
                    dut.u_top_NTT.inst_ALU.PE1_in_0[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_in_1[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_in_2[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_in_3[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_0[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_1[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_2[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_3[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_0_d4[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_1_d4[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_2_d4[11:0],
                    dut.u_top_NTT.inst_ALU.PE1_out_3_mid[11:0],
                    dut.u_top_NTT.inst_ALU.switch_delay[4],
                    dut.u_top_NTT.inst_ALU.switch_delay[8],
                    dut.u_top_NTT.inst_ALU.switch_delay[12]);
                $fdisplay(fp_dbg,
                    "ALUMUL step=%0d mul=%0d/%0d/%0d tw=%0d/%0d/%0d p=%0d/%0d/%0d en=%b/%b",
                    topntt_log_count,
                    dut.u_top_NTT.inst_ALU.mul_row_in_1[11:0],
                    dut.u_top_NTT.inst_ALU.mul_row_in_2[11:0],
                    dut.u_top_NTT.inst_ALU.mul_row_in_3[11:0],
                    dut.u_top_NTT.inst_ALU.tw1[11:0],
                    dut.u_top_NTT.inst_ALU.tw2[11:0],
                    dut.u_top_NTT.inst_ALU.tw3[11:0],
                    dut.u_top_NTT.inst_ALU.p1[11:0],
                    dut.u_top_NTT.inst_ALU.p2[11:0],
                    dut.u_top_NTT.inst_ALU.p3[11:0],
                    dut.u_top_NTT.inst_ALU.enable_rom_cnt,
                    dut.u_top_NTT.inst_ALU.enable_rom);
            end
            topntt_log_count <= topntt_log_count + 1;
        end

        if (aresetn && ((dut.compu_working && dut.u_top_NTT.rd_addr >= 6'd60) ||
                        (dut.compu_working && dut.u_top_NTT.rd_addr == 6'd0 &&
                         (dut.u_top_NTT.wr0_en || dut.u_top_NTT.wr1_en || dut.u_top_NTT.wr2_en || dut.u_top_NTT.wr3_en)) ||
                        dut.compute_done || dut.write_start)) begin
            $fdisplay(fp_dbg,
                "TAIL ctrl t=%0t cur=%b comp=%b cdone=%b wstart=%b wwork=%b done_flag=%b rd_done=%b rd_done_d15=%b rd_addr=%0d wr_en=%b%b%b%b sw=%b%b%b%b",
                $time,
                dut.cur_state,
                dut.compu_working,
                dut.compute_done,
                dut.write_start,
                dut.write_working,
                dut.u_top_NTT.done_flag,
                dut.u_top_NTT.rd_done,
                dut.u_top_NTT.rd_done_delay[15],
                dut.u_top_NTT.rd_addr,
                dut.u_top_NTT.wr0_en, dut.u_top_NTT.wr1_en, dut.u_top_NTT.wr2_en, dut.u_top_NTT.wr3_en,
                dut.u_top_NTT.KAD_bank0_switch, dut.u_top_NTT.KAD_bank1_switch, dut.u_top_NTT.KAD_bank2_switch, dut.u_top_NTT.KAD_bank3_switch);
        end

        if (aresetn && dut.Ws_tvalid && dut.Ws_tready && write_log_count < 140) begin
            $fdisplay(fp_dbg,
                "WRITE beat=%0d t=%0t cnt_128_ntt=%0d CS=%0b data1=%0d data2=%0d out_lo=%0d out_hi=%0d src_bank=%0d src_a=%0d src_b=%0d a0=%0d b0=%0d a1=%0d b1=%0d a2=%0d b2=%0d a3=%0d b3=%0d",
                write_log_count, $time,
                dut.u_KAD_NTT_mem_write.cnt_128_ntt,
                dut.u_KAD_NTT_mem_write.CS,
                dut.u_KAD_NTT_mem_write.data1[11:0],
                dut.u_KAD_NTT_mem_write.data2[11:0],
                dut.Ws_tdata[11:0], dut.Ws_tdata[43:32],
                write_src_bank_d2,
                write_src_addra_d2,
                write_src_addrb_d2,
                dut.u_KAD_NTT_mem_write.coef_addra_bram0,
                dut.u_KAD_NTT_mem_write.coef_addrb_bram0,
                dut.u_KAD_NTT_mem_write.coef_addra_bram1,
                dut.u_KAD_NTT_mem_write.coef_addrb_bram1,
                dut.u_KAD_NTT_mem_write.coef_addra_bram2,
                dut.u_KAD_NTT_mem_write.coef_addrb_bram2,
                dut.u_KAD_NTT_mem_write.coef_addra_bram3,
                dut.u_KAD_NTT_mem_write.coef_addrb_bram3);
            write_log_count <= write_log_count + 1;
        end
    end

    always @(posedge clk) begin
        if (aresetn && !compare_done && write_done && capture_complete) begin
            compare_done <= 1'b1;
            #20;
            dump_dut_output();
            compare_against_golden();
            $display("Simulation finished");
            $finish;
        end
    end

endmodule
