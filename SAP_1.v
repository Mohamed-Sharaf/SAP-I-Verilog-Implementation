module SAP_1(clock,clear,Data_out);
input clock,clear;
output [7:0] Data_out;

wire [03:0] address,Op_code;
wire [05:0] State;
wire [07:0] Bus,OP_A,OP_B;
wire [11:0] Cont_Singal;


//                        //            11 10 09  08  07  06  05  04 03 02 01  00 
//always@(*)             //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'


program_counter PC(.Pc_w (Bus[3:0]),. Cp (Cont_Singal[11]),. clk (clock),. clr (clear),. Ep (Cont_Singal[10]));
MAR mar(.clr (clear),.in (Bus[3:0]),.out (address),.clk (clock),.nLm (Cont_Singal[09]));
RAM Mem(.W (Bus),.address (address),.clr (clear),.nCE (Cont_Singal[08]));
Instruction_Register IR(.IR_in (Bus),.IR_W (Bus[3:0]),.clr (clear),.nLi (Cont_Singal[07]),.nEi (Cont_Singal[06]),.clk (clock),.I_sequencer (Op_code));
Ring_counter RC(.clr (clear),.clk (clock),.State (State));
Controller_Seg CS(.State (State),.Op_Code (Op_code),.Cont_Singal (Cont_Singal));
Accumelator Acc(.Acc_in (Bus),.Acc_W (Bus),.Acc_add_sup (OP_A),.clr (clear),.nLa (Cont_Singal[05]),.Ea (Cont_Singal[04]),.clk (clock));
add_sub  AU(.W (Bus),. Su (Cont_Singal[03]),. ACC (OP_A),. Breg (OP_B),. Eu (Cont_Singal[02]));
Register_8_bit Breg(.B_in (Bus),.B_add_sup (OP_B),.clr (clear),.nLb (Cont_Singal[01]),.clk (clock));
Register_8_bit O_reg(.B_in (Bus),.B_add_sup (Data_out),.clr (clear),.nLb (Cont_Singal[00]),.clk (clock));

	
endmodule


module Asim_SAP_1;
reg clock,clear;
wire [7:0] Data_out;

SAP_1 T(clock,clear,Data_out);
initial  begin clock=0; forever #50 clock=~clock; end
 initial  begin
    clear=1;   
#70 clear=0;
end
endmodule