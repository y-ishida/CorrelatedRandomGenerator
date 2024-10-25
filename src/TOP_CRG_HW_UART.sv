`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AIST
// Engineer: Junichi Sakamoto
// 
// Create Date: 2024/10/24
// Module Name: TOP_CRG_HW_UART
// Target Devices: Arty-A7(-100)
// Tool Versions: Vivado 2020.1
//////////////////////////////////////////////////////////////////////////////////


module TOP_CRG_HW_UART(
    input   CLK100MHZ,
            ck_rst_n,
            uart_txd_in,
    output  uart_rxd_out,
    [3:0]   led
    );

    localparam len_din = 256;
    localparam len_dout = 768;

    wire clk = CLK100MHZ;
    wire rst_n = ck_rst_n;
    wire run, extin_en;
    wire [7:0] addr_extin, addr_extout;
    logic [len_din - 1:0] extin_data;

    UART_CTRL #(.len_din(len_din), .len_dout(len_dout)) uart_ctrl (
        .uart_rx(uart_txd_in),
        .uart_tx(uart_rxd_out),
        .extout_data({500'd0, 12'h58f, extin_data}),
        .addr_extin,
        .addr_extout,
        .extin_data,
        .extin_en,
        .run
    );

endmodule