`timescale 1ns/1ns
module EEPROM_WR(SDA,SCL,ACK,RESET,CLK,WR,RD,ADDR,DATE);
output SCL; //串行时钟线
output ACK; //读写一个周期的应答信号
input RESET;//
input CLK;
input WR,RD;//读写信号
input [10:0] ADDR;//地址线
inout SDA;//串行数据线
inout [7:0] DATA;//并行数据线

endmodule