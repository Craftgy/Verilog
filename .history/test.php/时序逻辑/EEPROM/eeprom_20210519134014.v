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

endmodule