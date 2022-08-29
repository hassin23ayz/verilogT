module add1(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );

    assign sum  = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule

// module add16 defition already provided and has the following declaration
// module add16 ( 
//     input[15:0] a, 
//     input[15:0] b, 
//     input cin, 
//     output[15:0] sum, 
//     output cout 
//     );    
// endmodule


module top_module (
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