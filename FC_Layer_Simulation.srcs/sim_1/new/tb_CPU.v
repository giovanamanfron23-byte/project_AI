`timescale 1ns / 1ps

module tb_CPU;

    // basic inputs
    reg clk = 0;
    reg reset = 1;

    // declare outputs so Vivado sees them
    wire [31:0] PC;
    wire [31:0] instruction;
    wire [31:0] ALU_result;
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] write_data;
    wire register_write;

    // Instantiate DUT
    CPU uut (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .instruction(instruction),
        .ALU_result(ALU_result),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .write_data(write_data),
        .register_write(register_write)
    );

    // Clock generator
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // keep reset asserted a little
        #20 reset = 0;
        // let it run a while
        #200;
        $stop;
    end

endmodule
