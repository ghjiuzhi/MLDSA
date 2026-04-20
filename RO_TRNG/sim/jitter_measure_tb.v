`timescale 1ns / 1ps

module jitter_measure_tb ();

    parameter BYTE_NUM = 100_0000;

    reg  clk_100M_p = 1'b0;
    wire clk_100M_n;
    reg  por_n_i;

    always #(5.000) clk_100M_p = ~clk_100M_p;
    assign clk_100M_n = ~clk_100M_p;

    initial begin
        por_n_i = 1'b0;
        #100;
        por_n_i = 1'b1;
    end

    jitter_measure u_jitter_measure (
        .clk_100M_n(clk_100M_n),
        .clk_100M_p(clk_100M_p),
        .por_n_i   (por_n_i)
    );


    initial begin
        #100;
        $stop;
    end
endmodule
