`timescale 1ns/1ns
`define timeslice 100
module EEPROM(scl,sda);
input scl;
inout sda;
reg out_flag;
reg [7:0] memory[2047:0];
reg [10:0] address;
reg [7:0] memoory_buf;
reg [7:0] sda_buf;
reg [7::0] shift; //SDA数据输入寄存器
reg [7:0] addr_byte;
reg [7:0] ctrl_byte;
reg [1:0] State;
integer i;

parameter r7 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r6 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r5 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r4 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r3 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r2 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r1 = 8'b1010_1111,w7 = 8'b1010_1110;
parameter r0 = 8'b1010_1111,w7 = 8'b1010_1110;
endmodule