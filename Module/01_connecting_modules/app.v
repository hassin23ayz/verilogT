// A Module can contain instances of other modules 
// And this is how a larger complex circuits are designed 
// the other module is at mod_a.v file 


module top_module (
    input a,b,
    output out
    );

    mod_a mA (
        .in1(a),
        .in2(b),
        .out(out)
    );

    
endmodule