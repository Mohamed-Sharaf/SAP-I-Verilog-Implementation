module Accumelator (Acc_in,Acc_W,Acc_add_sup,clr,nLa,Ea,clk);

output  [7:0] Acc_add_sup ,Acc_W ;
input  [7:0]Acc_in ;
input  clr,nLa ,Ea ,clk;

reg [7:0] Data;
assign Acc_add_sup = Data;
assign Acc_W = (Ea)?  Data : 8'bz ;


always@(posedge clk)
    if (clr)  Data<=8'b0;
    else if (~(nLa))
      Data <= Acc_in;
    else
      Data <= Data;   
endmodule



module t_Accumelator;
wire  [7:0] Acc_add_sup ,Acc_W ;
reg  [7:0]Acc_in ;
reg  clr,nLa ,Ea ,clk;
Accumelator M1(Acc_in,Acc_W,Acc_add_sup,clr,nLa,Ea,clk);
 
initial begin clk=1'b0; forever   #50 clk=~clk;  end
initial begin
        clr<=1;
#70     clr<=0;	nLa=1'b0;   Ea=1'b0;   Acc_in=8'b00110011;	
        
#130	nLa=1'b0;   Ea=1'b1;   Acc_in=8'b00110011;
#100	nLa=1'b1;   Ea=1'b0;   Acc_in=8'b11001100;
#100	nLa=1'b1;   Ea=1'b1;   Acc_in=8'b11001100;
#100	nLa=1'b1;   Ea=1'b0;   Acc_in=8'b00110011;
end	
endmodule