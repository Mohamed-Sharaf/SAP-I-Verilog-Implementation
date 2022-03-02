module Register_8_bit (B_in,B_add_sup,clr,nLb,clk);

output  [7:0] B_add_sup ;
input   [7:0]B_in ;
input   clr,nLb ,clk;
reg     [7:0] Data;

assign B_add_sup = Data;

always@(posedge clk)
if (clr) Data<=8'b0;
else if (~(nLb))
   Data <= B_in;  
else
   Data <= Data;    
   
endmodule


module Register_8_bit_t ;

wire [7:0] B_add_sup ;
reg  [7:0]B_in ;
reg  clr,nLb ,clk ;
 
Register_8_bit T(B_in,B_add_sup,clr,nLb,clk);

initial begin  clk =1'b0 ; forever  # 50 clk = ~clk; end 
initial begin 
        nLb = 1'b0 ;  B_in = 8'b11001100 ;
#100    nLb = 1'b1 ;  B_in = 8'b11001100 ;
end 
endmodule 