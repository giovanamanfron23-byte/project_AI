`timescale 1ns / 1ps

module instruction_memory(
    input  wire [31:0] address,
    output wire [31:0] instruction
);

    reg [31:0] memory [0:255];     //for the single FC layer - which I figured is a dot product 

    initial begin
        memory[0] = 32'b0111_000000000000000_00101_00000_00; //addi 
        memory[1] = 32'b0111_000000000000000_00001_00000_00;    //addi
        memory[2] = 32'b1010_000000000000000_00010_00001_00;    //LW
        memory[3] = 32'b1010_000000000000000_00011_00001_00;    //LW
        memory[4] = 32'b0010_000000000000000_00100_00010_00011_00;      //Multiply 
        memory[5] = 32'b0000_000000000000000_00101_00101_00100_00;      //add
        memory[6] = 32'b0111_000000000000001_00001_00001_00;        //addi 
        memory[7] = 32'b1101_000000000000100_00001_00000_00;       //BNE 
        memory[8] = 32'b1011_000000000000000_00101_00000_00;        //SW
    end

    assign instruction = memory[address[9:2]];

endmodule
