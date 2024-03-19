`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 19.03.2024 14:12:32
// Design Name: 
// Module Name: programmable_sequence_detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module programmable_sequence_detector_tb;

    // Parameters
    parameter WIDTH = 6;
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk, rst, data_i, load_i;
    reg [WIDTH-1:0] prog_sequence_i;

    // Outputs
    wire detect_o;

    // Instantiate the module under test
    programmable_sequence_detector #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .data_i(data_i),
        .load_i(load_i),
        .prog_sequence_i(prog_sequence_i),
        .detect_o(detect_o)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initializations
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        data_i = 0;
        load_i = 0;
        prog_sequence_i = {WIDTH{1'b0}};

        // Wait for a few clock cycles to ensure reset settles
        # (10 * CLK_PERIOD);

        // De-assert reset
        rst = 0;

        // Load programmable sequence
        load_i = 1;
        prog_sequence_i = {WIDTH{1'b1}};
        # (CLK_PERIOD);
        load_i = 0;
        prog_sequence_i = {WIDTH{1'b0}};

        // Apply input stimulus
        // For example, provide input data to detect the sequence
        data_i = 1;
        # (10 * CLK_PERIOD);
        data_i = 0;
        # (10 * CLK_PERIOD);
        data_i = 1;
        # (10 * CLK_PERIOD);
        data_i = 1;
        # (10 * CLK_PERIOD);
        data_i = 0;
        # (10 * CLK_PERIOD);
        data_i = 1;
        # (10 * CLK_PERIOD);
        load_i = 1;
        prog_sequence_i = {6'b110000};
        # (CLK_PERIOD);
        load_i = 0;
        prog_sequence_i = {WIDTH{1'b0}};
        data_i = 0;
        # (10 * CLK_PERIOD);
        // Add more test cases as needed

        // Finish simulation
        #1000 $finish;
    end

endmodule


