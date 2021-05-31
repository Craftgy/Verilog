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
//------串行数据在开关控制下有秩序的输出或输入
assign sda1=(link_head)?head_buf[1]:1'b0;
assign sda2=(link_write)?sh8out_buf[7]:1'b0;
assign sda3=(link_stop)？stop_buf[1]:1'b0;
assign sda4 = (sda1|sda2|sda3);
assign SDA  = (link_sda)?sda4:1'bz;
assign DATA=(link_read)?data_from_rm:8'hzz;

//主状态机状态定义
parameter Idle = 11'b000_0000_0001;
parameter Ready = 11'b000_0000_0010;
parameter Write_start = 11'b000_0000_0100;
parameter Ctrl_write = 11'b000_0000_1000;
parameter Addr_write = 11'b000_0001_0000;
parameter Data_write = 11'b000_0010_000;
parameter Read_start = 11'b000_0100_0000;
parameter Ctrl_read = 11'b000_1000_0000;
parameter Data_read = 11'b001_0000_0000;
parameter Stop = 11'b010_0000_0000;
parameter Ackn = 11'b100_0000_0000;

//并行数据串行输出状态
parameter sh8out_bit7 = 9'b0_0000_0001;
parameter sh8out_bit6 = 9'b0_0000_0010;
parameter sh8out_bit5 = 9'b0_0000_0100;
parameter sh8out_bit4 = 9'b0_0000_1000;
parameter sh8out_bit3 = 9'b0_0001_0000;
parameter sh8out_bit2 = 9'b0_0010_0000;
parameter sh8out_bit1 = 9'b0_0100_0000;
parameter sh8out_bit0 = 9'b0_1000_0000;
parameter sh8out_end  = 9'b0_0000_0000;

//串行数据并行输出状态
parameter shin_begin = 10'b00_0000_0001;
parameter shin_bit7 = 10'b00_0000_0010;
parameter shin_bit6 = 10'b00_0000_0100;
parameter shin_bit5 = 10'b00_0000_1000;
parameter shin_bit4 = 10'b00_0001_0000;
parameter shin_bit3 = 10'b00_0010_0000;
parameter shin_bit2 = 10'b00_0100_0000;
parameter shin_bit1 = 10'b00_1000_0000;
parameter shin_bit0 = 10'b01_0000_0000;
parameter shin_end = 10'b10_0000_0000;

//启动状态
parameter head_begin = 3'b001;
parameter head_bit = 3'b010;
parameter head_end = 3'b100;

//停止状态  
parameter stop_begin = 3'b001;
parameter stop_bit = 3'b010;
parameter stop_end = 3'b100;

parameter YES = 1;
parameter NO  = 0;

//产生串行时钟SCL，为输入时钟的二分频
always @(negedge CLK) begin
    if(RESET)
        SCL<=0;
    else
        SCL<=~SCL;

//主状态机程序  
always @(posedge CLK) begin
    if(RESET)
     begin
         link_read<=NO;
         link_write<=NO;
         link_head<=NO;
         link_stop<=NO;
         link_sda<=NO;
         ACK<=0;
         RF<=0;
         WF<=0;
         FF<=0;
         main_state<=Idle;
    else
     begin
         casex (main_state)
             Idle: begin
                    link_read<=NO;
                    link_write<=NO;
                    link_head<=NO;
                    link_stop<=NO;
                    link_sda<=NO;
                    if(WR)
                        begin
                        WF<=1;
                        main_state<=Ready;
end
             default: 
             end
         endcase
     end
     end
end

end
endmodule