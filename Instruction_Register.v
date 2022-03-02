module Instruction_Register (IR_in,IR_W,clr,nLi,nEi,clk,I_sequencer);

output  [3:0] IR_W ,I_sequencer;
input   [7:0] IR_in ;
input   clr,nLi ,nEi ,clk;
reg     [7:0] Data;

assign IR_W = (~nEi)?  Data[3:0] : 4'bz ;
assign I_sequencer = Data[7:4];       // I7  I6  I5  I4

always@(posedge clk)
if (clr) Data<=8'b0;
else if (~(nLi))
   Data <= IR_in;  
else
   Data <= Data;    
   
endmodule