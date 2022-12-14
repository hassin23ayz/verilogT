// Build an XOR gate three ways, using an assign statement, a combinational always block, and a clocked always block.
// There are three types of assignments in Verilog: Here we have examples of all of them 

module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   
    );

    assign out_assign = a ^ b;

    always @(*) begin
        out_always_comb = a ^ b;
    end

    always @(posedge clk) begin
        out_always_ff <= a ^ b;
    end

endmodule