# Project Description

In this lab exercise, I designed a Moore Finite State Machine (FSM) controller for a simple vending machine by using Verilog Hardware Description Language (HDL), verified its behaviour through testbench simulations, and implemented the validated design on the Xilinx Artix-7 FPGA (BASYS 3 Board).

I followed the lab manual created by my professors at Nanyang Technological University (NTU) and utilised supplementary code provided which will be explicitly mentioned.
# Background
A Moore machine is a type of FSM where the output depends solely on the current state. It is typically more stable, predictable and easy to design compared to Mealy machines. Debugging and verifying its behaviour is also more straightforward, since outputs tied directly to states only are easier to follow.

However, Moore machines respond slower because output updates to an input change can only occur a clock cycle later. Additionally, they generally require more states than Mealy machines to accommodate for different output behaviours, leading to increased hardware usage and complexity.
# State Diagram
<img width="502" height="388" alt="image" src="https://github.com/user-attachments/assets/2d4434dd-c569-41b0-b745-5af98cdd3e45" />

Design Logic:

1. If the customer inserts more than $1 (for example, 50c then $1), the FSM must reject the transaction and return all coins.
2. At any time, if the cancel input is asserted, the FSM must refund the amount inserted and return to the default state.
3. When a refund is issued, the FSM sends a money_return signal to the coin mechanism and must immediately return to the default/reset state.
4. When the customer has inserted exactly $1, the FSM must dispense the product immediately.
5. After dispensing, the machine will stay in the dispense state until a manual reset is applied. This reset simulates the signal normally provided by the vending mechanism.
# Folder Hierarchy
## sources
### [a link] lab1-moore-vending-machine/srcs/top_FSM.v - provided
/top_FSM.v the vending machine design. This file includes a top_FSM module that maps and connects lab1_FSM.v, clkgen.v, and seven_seg.v
### lab1_FSM.v
### clkgen.v - provided
### seven_seg.v - provided
## testbench
### lab1_FSM_tb.v
## constraints
### Lab1.xdc - provided
