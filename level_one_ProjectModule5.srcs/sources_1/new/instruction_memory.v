`timescale 1ns / 1ps

module instruction_memory(
    input  wire [31:0] address,
    output wire [31:0] instruction
);

    reg [31:0] memory [0:255];

    initial begin
        // Load input vector values into registers
        memory[0] = 32'b0111_000000000000001_00001_00000_00; // addi R1, R0
        memory[1] = 32'b0111_000000000000010_00010_00000_00; // addi R2, R0
        memory[2] = 32'b0111_000000000000011_00011_00000_00; // addi R3, R0

        // Load weights into registers
        memory[3] = 32'b0111_000000000000100_00100_00000_00; // addi W1, R0
        memory[4] = 32'b0111_000000000000101_00101_00000_00; // addi W2, R0
        memory[5] = 32'b0111_000000000000110_00110_00000_00; // addi W3, R0

        // Multiply inputs and weights
        memory[6] = 32'b0010_000000000100_00101_00111_00; // R7 = R1*W1
        memory[7] = 32'b0010_000000000101_00110_01000_00; // R8 = R2*W2
        memory[8] = 32'b0010_000000000110_00011_01001_00; // R9 = R3*W3

        // Add partial products
        memory[9]  = 32'b0000_000000000111_01000_01010_00; // V10 = R7 + R8
        memory[10] = 32'b0000_000000001010_01001_00111_00; // V7 = R10 + R9 (final dot product)
    end

    assign instruction = memory[address[9:2]];

endmodule

