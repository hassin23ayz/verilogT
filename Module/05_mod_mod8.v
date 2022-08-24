
module my_dff8(
    input clk,
    input  [7:0] d,
    output [7:0] q
    );
endmodule

module top_module(
    input  clk,
    input  [7:0] d,
    input  [2:0] sel,
    output [7:0] q
    );

    wire [7:0] qW1;
    wire [7:0] qW2;
    wire [7:0] qW3;
    reg [7:0] qWTmp; 

    my_dff8 df1(clk, d, qW1);
    my_dff8 df2(clk, qW1, qW2);
    my_dff8 df3(clk, qW2, qW3);

    always @(*) begin
        if (sel == 2'b00 ) begin
            // reset
            qWTmp = d;
        end
        else if (sel == 2'b01 ) begin
            qWTmp = qW1;
        end
        else if (sel == 2'b10 ) begin
            qWTmp = qW2;
        end
        else if (sel == 2'b11 ) begin
            qWTmp = qW3;
        end
    end

    assign q[7:0] = qWTmp;
    
endmodule