module RAM(W,address,clr,nCE);

	output [7:0]W;
	input  [3:0]address;
	input   clr,nCE;
	reg [7:0] Data;
	reg [7:0]mem [0:15];
	
	assign W= nCE? 8'bz:Data;
	
	always @(*)
	if (clr) begin      //     Op_Co  Add
	                mem[00]<=8'b0000_1010; // LDA AH
					mem[01]<=8'b0001_1011; // ADD BH
					mem[02]<=8'b0001_1100; // ADD CH
					mem[03]<=8'b1110_XXXX; // OUT
					mem[04]<=8'b1111_XXXX; // HLT
					mem[05]<=8'b0000_0010; 
					mem[06]<=8'b0000_0010; 
					mem[07]<=8'b0000_0010;
					mem[08]<=8'b0000_0010;  
					mem[09]<=8'b0000_0010; 
					mem[10]<=8'b0000_0101; // 5
					mem[11]<=8'b0000_0111; // 7
					mem[12]<=8'b0000_1000; // 8 
					mem[13]<=8'b0000_0010; 
					mem[14]<=8'b0000_0010; 
					mem[15]<=8'b0000_0010;
	         end 
	else		 
		Data<=mem[address];
endmodule