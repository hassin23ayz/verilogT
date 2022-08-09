// Build a circuit that has two 3-bit inputs that computes the bitwise-OR of the two vectors, 
// the logical-OR of the two vectors, and the inverse (NOT) of both vectors. 
// Place the inverse of b in the upper half of out_not (i.e., bits [5:3]), 
// and the inverse of a in the lower half.

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.

module top_module(
	input  [2:0] a,
	input  [2:0] b,
	output [2:0] out_or_bitwise,
	output out_or_logical,
	output [5:0] out_not
	);

	assign out_or_bitwise = a | b;
	assign out_or_logical = a || b;
	assign out_not[5:3] = ~b;
	assign out_not[2:0] = ~a;


endmodule