module  Controller_Seg (State,Op_Code,Cont_Singal);
input      [05:0] State;
input      [03:0] Op_Code;
output reg [11:0] Cont_Singal;


parameter T1=6'b00_0001,
          T2=6'b00_0010,
		  T3=6'b00_0100,
		  T4=6'b00_1000,
		  T5=6'b01_0000,
		  T6=6'b10_0000;
parameter LDA=4'b0000,
          ADD=4'b0001,
          SUB=4'b0010,	
          OUT=4'b1110,
          HLT=4'b1111;		  
                        //            11 10 09  08  07  06  05  04 03 02 01  00 
always@(*)             //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T1)  Cont_Singal<=12'b_0__1__0___1___1___1___1___0__x__0__1___1;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T2)  Cont_Singal<=12'b_1__0__1___1___1___1___1___0__x__0__1___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T3)  Cont_Singal<=12'b_0__0__1___0___0___1___1___0__x__0__1___1;

//----------------------------------Instructions----------------------------------
else case (Op_Code)
//--------------------------------------LDA---------------------------------------
LDA:                 //               CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T4)  Cont_Singal<=12'b_0__0__0___1___1___0___1___0__x__0__1___1;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T5)  Cont_Singal<=12'b_0__0__1___0___1___1___0___0__x__0__1___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T6)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

else               //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
                     Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop

//--------------------------------------ADD---------------------------------------
ADD:                 //               CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T4)  Cont_Singal<=12'b_0__0__0___1___1___0___1___0__x__0__1___1;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T5)  Cont_Singal<=12'b_0__0__1___0___1___1___1___0__x__0__0___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T6)  Cont_Singal<=12'b_0__0__1___1___1___1___0___0__0__1__1___1;

else               //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
                     Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop
					 
//--------------------------------------SUB---------------------------------------
SUB:                 //               CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T4)  Cont_Singal<=12'b_0__0__0___1___1___0___1___0__x__0__1___1;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T5)  Cont_Singal<=12'b_0__0__1___0___1___1___1___0__x__0__0___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T6)  Cont_Singal<=12'b_0__0__1___1___1___1___0___0__1__1__1___1;

else               //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
                     Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop
					 

//--------------------------------------OUT---------------------------------------
OUT:                 //               CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T4)  Cont_Singal<=12'b_0__0__1___1___1___1___1___1__x__0__1___0;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T5)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T6)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

else               //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
                     Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop

//--------------------------------------HLT---------------------------------------
HLT:                 //               CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
     if (State==T4)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

                       //             CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T5)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

                   //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
else if (State==T6)  Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;

else               //                 CP_Ep_LM'_CE'_LI'_EI'_LA'_EA_SU_EU_LB'_LO'
                     Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop
					 
default 			 Cont_Singal<=12'b_0__0__1___1___1___1___1___0__x__0__1___1;// Stop		 
endcase
endmodule