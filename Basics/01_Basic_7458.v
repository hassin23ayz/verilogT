module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire p1_A1, p1_A2;
    assign p1_A1 = p1a & p1c & p1b;
    assign p1_A2 = p1f & p1e & p1d;
    assign p1y = p1_A1 | p1_A2;
    
    wire p2_A1, p2_A2;
    assign p2_A1 = p2a & p2b;
    assign p2_A2 = p2c & p2d;
    assign p2y = p2_A1 | p2_A2;
    
endmodule