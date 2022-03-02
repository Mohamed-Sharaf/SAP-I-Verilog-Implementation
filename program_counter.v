module program_counter(Pc_w, Cp, clk, clr, Ep);
output  [3:0]Pc_w;
input  Cp, clk, clr, Ep;
reg  [3:0] count;


  assign Pc_w=(Ep)? count:4'bz;
  
always @(posedge clk)
  if (clr)    count<=4'b0000;
  else if (Cp) count<= count+1'b1;
  else         count<= count;
endmodule

module t_program_counter;
 
  wire [3:0]Pc_w;
  reg  Cp, clk, clr, Ep;
  
program_counter m(Pc_w, Cp, clk, clr, Ep);

 initial  begin clk=0; forever #50 clk=~clk; end
 initial  begin
  Ep=0;
  clr=0;  Cp=0; 
#100 clr=1;  Cp=0; 
#100 clr=1;  Cp=1;
#100 clr=1;  Cp=0; 
end
endmodule