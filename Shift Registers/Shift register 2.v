module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF G1(KEY[0],KEY[3],SW[3],KEY[1],KEY[2],LEDR[3]);
    MUXDFF G2(KEY[0],LEDR[3],SW[2],KEY[1],KEY[2],LEDR[2]);
    MUXDFF G3(KEY[0],LEDR[2],SW[1],KEY[1],KEY[2],LEDR[1]);
    MUXDFF G4(KEY[0],LEDR[1],SW[0],KEY[1],KEY[2],LEDR[0]);
endmodule

module MUXDFF (clk,w,R,E,L,Q);
input clk;
input w, R, E, L;
output Q;

wire w1,w2;
    assign w1 = (E)?w:Q;
    assign w2 = (L)?R:w1;
    always @(posedge clk) begin
      Q <= w2;  
    end

endmodule
