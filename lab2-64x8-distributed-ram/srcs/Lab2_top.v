`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 08:41:56
// Design Name: 
// Module Name: Lab2_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab2_top(
    input clk,
    input rst,
    input write_en,
    input save_data,
    input show_reg,
    input [7:0] d_in,
    output [7:0] d_out
    );
    
    reg [7:0] reg_d;
    wire [7:0] mem_d;
   
    Lab2_mem U1 (
    .a(d_in[5:0]),      // input wire [5 : 0] a
    .d(reg_d),      // input wire [7 : 0] d
    .clk(clk),  // input wire clk
    .we(write_en),    // input wire we
    .spo(mem_d)  // output wire [7 : 0] spo
    );
    
    always @ (posedge clk) begin
        if (rst)
            reg_d <= 8'd0;
        else if (save_data)
            reg_d <= d_in;
        end
        
    assign d_out = (show_reg) ? mem_d : reg_d; // multiplexer
    
endmodule
