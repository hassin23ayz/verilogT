// You are given a module add16 that performs a 16-bit addition. Instantiate two of them to create a 32-bit adder. 
// One add16 module computes the lower 16 bits of the addition result, while the second add16 module computes the upper 16 bits of the result, 
// after receiving the carry-out from the first adder. Your 32-bit adder does not need to handle carry-in (assume 0) or carry-out (ignored), 
// but the internal modules need to in order to function correctly. 
// (In other words, the add16 module performs 16-bit a + b + cin, while your module performs 32-bit a + b).

module add16 ( 
    input[15:0] a, 
    input[15:0] b, 
    input cin, 
    output[15:0] sum, 
    output cout 
    );
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
    );

    wire [31:0] sumF;
    wire addU16_carry;
    wire addL16_carry;
    
    add16 addU16(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sumF[15:0]),
        .cout(addU16_carry)
    );

    add16 addL16(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(addU16_carry),
        .sum(sumF[31:16]),
        .cout(addL16_carry)
    );

    assign sum = sumF;

endmodule