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
reg ACK;
reg SCL;
reg WF,RF;//读写标志
reg FF;//标志寄存器
reg [1:0]head_buf;
reg [1:0]stop_buf;
reg [7:0]sh8out_buf;
reg [8:0] sh8out_state;
reg [9:0] sh8in_state;
reg [2:0] head_state;
reg [2:0] stop_state;
reg [10:0] main_state;
reg [7:0] date_from_rm;
reg link_sda;
reg link_read;
reg link_head;
reg link_write;
reg link_stop;
wire sda1,sda2,sda3,sda4;
//------串行

endmodule