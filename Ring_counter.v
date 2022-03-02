module Ring_counter(clr,clk,State);
input      clr,clk;
output  reg [5:0] State;

always @(negedge clk)
  if (clr)    State<=6'b00_0001;
  else        State<= {State[4:0],State[5]};
endmodule

module t_Ring_counter;
reg      clr,clk;
wire  [5:0] State;
  
Ring_counter T(clr,clk,State);

 initial  begin clk=0; forever #50 clk=~clk; end
 initial  begin
    clr=1;   
#70 clr=0;
end
endmodule