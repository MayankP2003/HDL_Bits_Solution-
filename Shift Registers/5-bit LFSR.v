module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
wire w1,w2;
    assign w1 = q[0];
    assign w2 = q[3]^q[0];
    
    always @(posedge clk) begin
        if(reset) q <= 1;
        else q <= {w1,q[4],w2,q[2:1]};
    end
endmodule

3-bit LFSR
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
wire w1,w2,w3,w4;
    assign w1 = (KEY[1])?SW[0]:LEDR[2];
    assign w2 = (KEY[1])?SW[1]:LEDR[0];
    assign w3 = LEDR[1]^LEDR[2];
    assign w4 = (KEY[1])?SW[2]:w3;
    always @(posedge KEY[0]) begin
        LEDR <= {w4,w2,w1};
    end
endmodule
