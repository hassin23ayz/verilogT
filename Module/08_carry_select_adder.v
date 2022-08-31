// faster adder16 

// module add16 defition already provided and has the following declaration
module add16 ( 
    input[15:0] a, 
    input[15:0] b, 
    input cin, 
    output[15:0] sum, 
    output cout 
    );    
endmodule

module top_module(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
    );

    reg [15:0] sumU;
    wire addL16_cout;
    wire [15:0] addU16_zero_sum;
    wire [15:0] addU16_one_sum;

    add16 addL16(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(addL16_cout),
        .sum(sum[15:0])
    );

    add16 addU16_zero(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(addU16_zero_sum)
    );

    add16 addU16_one(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(addU16_one_sum)
    );

    always @(*) begin
        if (addL16_cout == 1'b0) begin
            sumU = addU16_zero_sum;
        end
        else if (addL16_cout == 1'b1) begin
            sumU = addU16_one_sum;
        end
    end

    assign sum[31:16] = sumU;

endmodule