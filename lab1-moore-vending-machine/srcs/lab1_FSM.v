`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 09:52:13
// Design Name: 
// Module Name: lab1_FSM
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


module lab1_FSM(
    input clk,
    input rst,
    input fifty,
    input dollar,
    input cancel,
    output reg [1:0] st,
    output reg insert_coin,
    output reg money_return,
    output reg dispense
    );
    parameter INIT   = 2'd0;
    parameter S50c   = 2'd1;
    parameter VEND   = 2'd2;
    parameter RETURN = 2'd3;

    reg [1:0] nst;

    always @ (posedge clk)
    begin
    if (rst)
        st <= INIT;
    else
        st <= nst;  

    end

    always @ (*)
    begin
    // defaults to prevent latches and ensure predictable behaviour
    nst = st;
    insert_coin = 0;
    money_return = 0;
    dispense = 0;

    case (st)
    INIT:
        begin
            insert_coin = 1;
            if (fifty)
                nst = S50c;
            if (dollar)
                nst = VEND;
        end

    S50c:
        begin
            insert_coin = 1;
            if (fifty)
                nst = VEND;
            if (dollar)
                nst = RETURN;
            if (cancel)
                nst = RETURN;
        end

    VEND:
        begin
            dispense = 1;
            nst = VEND;
        end

    RETURN:
        begin
            money_return = 1;
            nst = INIT;
        end

    default:
        begin
            nst = INIT;
        end
    endcase
    end
endmodule
