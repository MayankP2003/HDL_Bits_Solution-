module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] q;
    d_ff (clk,in,q[2],resetn);
    d_ff (clk,q[2],q[1],resetn);
    d_ff (clk,q[1],q[0],resetn);
    d_ff (clk,q[0],out,resetn);
    
endmodule
module d_ff(clk,d,q,rst);
    input clk,d,rst;
    output q;
    always @(posedge clk) begin
        if (!rst) q<=0;
        else q<=d;
    end
endmodule
