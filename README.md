# Project Name: SAP-I-Verilog-Implementation
  The goal of this project is to implementa Simple-As-Possible Computer in verilog. Which can only perform addition and subtraction and no logical operation.
  
# Table of Contents:

- [Description](#description)
- [Components](#components)
- [Instruction Set](#instruction-set)

# Description
The Simple-As-Possible (SAP)-1 computer is a very basic model of a microprocessor which is a bus-organized computer and makes use of Von-Neumann architecture. It makes use of an 8-bit central bus and has ten main components. A pictorial representation of its architecture is shown below.


![Architecture](Architecture.PNG)

# Components

- Program Counter (PC)
  - implemented in [program_counter.v](./program_counter.v) file
  - it counts from 0000 to 1111 and it signals the memory address of next instruction to be fetched and executed
- Input and Memory Address Register (MAR)
  - implemented in [MAR.v](./MAR.v) file
  - During a computer run, the address in PC is latched into Memory Address Register (MAR).
- Random-Access Memory (RAM)
  - implemented in [RAM.v](./RAM.v) file
  - the program code to be executed and data for SAP1 computer is stored here
  - During a computer run, the RAM receives its 4-bit address from the MAR and read operation is performed. In this way the instruction or data word stored in the RAM is placed on the W bus for use in some other part of the computer.
- Instruction Register
  - implemented in [Instruction_Register.v](./Instruction_Register.v) file
  - The instruction receives and stores the instruction placed on the bus from the RAM. The content of the instruction register are then split into two nibbles. The upper nibble is a two-state output that goes into the Controller-sequencer while the lower nibble is a three-state output that is read from the bus when needed.
- Controller-Sequencer
  - implemented in [Controller_Seg.v](./Controller_Seg.v) file
  - The controller-sequencer sends out signals that control the computer and makes sure things happen only when they are supposed to. The 12 bit output signals from controller-sequencer is called the control word which determines how the registers will react to the next positive clock edge.
- Accumulator
  - implemented in [Accumelator.v](./Accumelator.v) file
  - The accumulator is an 8-bit buffer register that stores intermediate answers during a computer run. The accumulator has two outputs. The two-state output goes directly to the adder-subtractor and the three-state output goes to the bus. This implies that the 8-bit accumulator word continuously drives the adder- subtractor but only appears on the W bus when Ea is high.
- Adder-Subtractor
  - implemented in [add_sub.v](./add_sub.v) file
  - The adder-subtractor asynchronously adds to or subtracts a value from the the accumulator depending on the value of Su. It makes use of 2’s complement to achieve this When Su is low the output of the adder-subtractor is the sum of the values in the accumulator and in the B-register (O/P = A + B). When Su is high, the output is the difference between them (O/P = A + B’).
- B-Register & Output Register
  - the same code for both implemented in [Register_8_bit.v](./Register_8_bit.v) file
  - The B-register is a buffer register used in performing arithmetic operations. It supplies the number to be added or subtracted from the contents of the accumulator to the adder/subtractor. When data is available at the bus and Lb is low, at the positive clock edge, B register gets and stores the data.
  - The output register gets and stores the value stored in the accumulator usually after the performance of an arithmetic operation. The answer that is stored in the accumulator is loaded into the output register through the W bus. This is done in the next positive clock edge when Ea is high and Lo is low. The processed data can now be displayed to the outside world.
- Binary Display
  - The binary display is row of eight light emitting diodes(LEDs). 

# Note:
In these files, I combined Designs and its testbench in the same file, but if you want to use it you have to separate them.
