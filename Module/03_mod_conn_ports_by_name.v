 // You are given a module named mod_a that has 2 outputs and 4 inputs, in some order. 
 // You must connect the 6 ports by name 
 // to your top-level module's ports out1, out2, a, b, c, and d, in that order.

// module mod_a ( output, output, input, input, input, input );

module mod_a (
    output out1,
    output out2,
    input  in1,
    input  in2,
    input  in3,
    input  in4
);
endmodule

module top_module(
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
    );

mod_a inst1 (
    .out1(out1),
    .out2(out2),
    .in1(a),
    .in2(b),
    .in3(c),
    .in4(d)
);

endmodule