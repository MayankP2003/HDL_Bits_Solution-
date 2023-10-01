module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
wire w1,w2,w3,w4;
    assign w1 = q[0];
    assign w2 = q[22]^q[0];
    assign w3 = q[2]^q[0];
    assign w4 = q[1]^q[0];
    
always @(posedge clk) begin
        if (reset) q <=1;
    else begin q[31] <= w1;
        q[30:22] <= q[31:23];
        q[21] <= w2;
        q[20:2] <= q[21:3];
        q[1] <= w3;
        q[0] <= w4;
    end
end
        
endmodule


