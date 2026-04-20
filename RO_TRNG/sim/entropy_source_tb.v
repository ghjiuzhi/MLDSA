`timescale 1ns / 1ps

module entropy_source_tb ();

    parameter BYTE_NUM = 100_0000;

    localparam RO_NUM = 8;
    localparam RO_STAGES = 2;
    localparam SAMPLE_STAGES = 9;

    reg                en;
    wire               rand_bit;
    wire               rand_clk;
    reg     [    31:0] counter = 0;
    reg     [     7:0] bit_buffer;
    reg     [     2:0] bit_count = 0;
    integer            fd;
    reg     [14*8-1:0] date;  // YYYYMMDDHHMMSS
    reg     [   511:0] filename;

    initial begin
        en = 1'b0;
        #100;
        en = 1'b1;
    end

    entropy_source #(
        .RO_NUM       (RO_NUM),  // RO number
        .RO_STAGES    (RO_STAGES),  // RO stages
        .SAMPLE_STAGES(SAMPLE_STAGES)   // sample clock stages
    ) u_entropy_source (
        .en      (en),        // enable signal
        .rand_bit(rand_bit),  // random bit output
        .clk_o   (rand_clk)
    );

    initial begin
        fd = $fopen("E:/Project/RO_TRNG/sim/timestamp.txt", "r");
        if (!fd) begin
            $display("--- iii --- Failed to open file");
            $stop;
        end
        $fscanf(fd, "%s", date);
        $fclose(fd);
        $display("The time is %s", date);
        $sformat(filename, "E:/Project/RO_TRNG/sim/entropy_source_%0d_%0dx%0d_%s.txt", 
                RO_STAGES, RO_NUM, SAMPLE_STAGES, date);
        fd = $fopen(filename, "w");
        if (!fd) begin
            $display("--- iii --- Failed to open file");
            $stop;
        end else begin
            $display("--- iii --- File has been opened successfully: %s", filename);
        end
    end

    always @(posedge rand_clk or negedge en) begin
        if (~en) begin
            bit_count <= 'd0;
            counter <= 'd0;
            bit_buffer <= 'd0;
        end else begin
            if (counter < BYTE_NUM * 8) begin
                // txt
                if (bit_count == 'd7) begin
                    bit_count <= 'd0;
                    counter   <= counter + 1;
                    $fwrite(fd, "%0d%0d%0d%0d%0d%0d%0d%0d", bit_buffer[0], bit_buffer[1],
                                    bit_buffer[2], bit_buffer[3], bit_buffer[4], bit_buffer[5],
                                    bit_buffer[6], rand_bit);
                    // $fwrite(fd, "%c", {rand_bit, bit_buffer[6], bit_buffer[5], bit_buffer[4],
                    //                 bit_buffer[3], bit_buffer[2], bit_buffer[1], bit_buffer[0]});
                end else begin
                    bit_count <= bit_count + 1;
                    bit_buffer[bit_count] <= rand_bit;
                end
                // $fwrite(fd, "%0d", rand_bit);
                // counter <= counter + 1;

                // bin
                // if (bit_count == 'd7) begin
                //     bit_count <= 'd0;
                //     counter   <= counter + 1;
                //     // $fwrite(fd, "%c", {bit_buffer[0], bit_buffer[1], bit_buffer[2], bit_buffer[3],
                //     //                    bit_buffer[4], bit_buffer[5], bit_buffer[6], rand_bit});
                //     $fwrite(fd, "%c", {rand_bit, bit_buffer[6], bit_buffer[5], bit_buffer[4],
                //                     bit_buffer[3], bit_buffer[2], bit_buffer[1], bit_buffer[0]});
                // end else begin
                //     bit_count <= bit_count + 1;
                //     bit_buffer[bit_count] <= rand_bit;
                // end
            end else begin
                $fclose(fd);
                $display("--- iii --- Finish generate random bits!");
                $stop;
            end
        end
    end

endmodule
