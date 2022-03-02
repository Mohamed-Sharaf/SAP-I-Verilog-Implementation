/*
	this module doesn't have a carry after adding operation 
	we can't add this because W-Bus & output reg are only 8 bits
	so we decided to add a flag register that contain flag to overflow
*/
module add_sub(W, Su, ACC, Breg, Eu);
output reg [7:0]W;
input Su, Eu;
input [7:0] ACC, Breg;
always @(*)	
	if(Eu==1)					
		begin
			if(Su==1)		W <= ACC-Breg;
			else			W <= ACC+Breg;
		end
	else		W<=8'bz;
endmodule
/* 
module add_sub2(W, Su, ACC, Breg, Eu);
output reg [7:0]W;
input Su, Eu;
input [7:0] ACC, Breg;
reg res;
always @(Eu, Su)	
	if(Su==1)  res<= ACC-Breg;
	else	   res<= ACC+Breg;
	
	if(Eu==1)	W<=res;
	else		W<=8'bz;
endmodule
 */
module t_add_sub ;
reg Su,Eu ;
reg [7:0] ACC,Breg ;
wire [7:0] W ;	
add_sub T (W,Su,ACC,Breg,Eu);
initial 
begin 
		    Eu = 1'b0 ; Su = 1'b0 ; ACC = 8'd10 ; Breg = 8'd10 ;//Addition
#(100)	    Eu = 1'b0 ; Su = 1'b1 ; ACC = 8'd10 ; Breg = 8'd10 ;//Subtractaion
#(100)		Eu = 1'b1 ; Su = 1'b0 ; ACC = 8'd15 ; Breg = 8'd5 ;//Addition
#(100)		Eu = 1'b1 ; Su = 1'b1 ; ACC = 8'd5 ; Breg = 8'd3 ; //Subtractaion
end
endmodule 