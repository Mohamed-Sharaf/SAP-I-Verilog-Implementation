module  MAR (clr,in,out,clk,nLm);
output reg [3:0]   out;
input          clr,clk,nLm;
input  [3:0]   in;

always@(posedge clk)
if(clr)  out<=8'b0;
else if(!nLm) out<=in;
else 	 out<= out;

endmodule