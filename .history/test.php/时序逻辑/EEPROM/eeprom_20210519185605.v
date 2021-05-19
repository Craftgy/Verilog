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
parameter r6 = 8'b1010_1101,w6 = 8'b1010_1100;
parameter r5 = 8'b1010_1011,w5 = 8'b1010_1010;
parameter r4 = 8'b1010_1001,w4 = 8'b1010_1000;
parameter r3 = 8'b1010_0111,w3 = 8'b1010_0110;
parameter r2 = 8'b1010_0101,w2 = 8'b1010_0100;
parameter r1 = 8'b1010_0011,w1 = 8'b1010_0010;
parameter r0 = 8'b1010_0001,w0 = 8'b1010_0000;
//sda始能位
assign sda = (out_flag==1)? sda_buf[7]:1'bz;
//寄存器和存储器初始化
initial begin
    addr_byte = 0;
    ctrl_byte = 0;
    out_flag  = 0;
    sda_buf   = 0;
    State     = 2'b00;
    memoory_buf = 0;
    address     = 0;
    shift       = 0;
    for (i = 0; i<2047; i=i+1) begin
        memory[i] = 0;
    end
end

endmodule