// You are given a module my_dff with two inputs and one output (that implements a D flip-flop). Instantiate three of them, then 
// chain them together to make a shift register of length 3. The clk port needs to be connected to all instances.

module my_dff( 
    input clk, 
    input d, 
    output q 
    );
endmodule

module top_module( 
    input clk, 
    input d, 
    output q 
    );

    wire q_df1, q_df2;

    my_dff df1( clk, d, q_df1);
    my_dff df2( clk, q_df1, q_df2);
    my_dff df3( clk, q_df2, q);
endmodule