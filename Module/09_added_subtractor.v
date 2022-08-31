// adder subtractor 
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
    input sub,
    output [31:0] sum
    );

    reg [31:0] bF;
    wire addL16_cout;

    always @(*) begin
        if (sub == 1'b0) begin
        bF = b;
        end
        else if (sub == 1'b1) begin
        bF =  {32{sub}} ^b; //Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed as b[31:0] XORed with sub replicated 32 times
        end
    end

    add16 addL16(
        .a(a[15:0]),
        .b(bF[15:0]),
        .cin(sub),
        .cout(addL16_cout),
        .sum(sum[15:0])
    );

    add16 addU16(
        .a(a[31:16]),
        .b(bF[31:16]),
        .cin(addL16_cout),
        .sum(sum[31:16])
    );

endmodule
