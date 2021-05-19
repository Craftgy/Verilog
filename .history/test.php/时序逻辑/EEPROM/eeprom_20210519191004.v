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

always @(negedge sda) begin
    if(scl==1)
        begin
            State=State+1;
            if(State==2'b11)
                disable write_to_eeprm;
        end
end
always @(posedge sda) begin
    if(scl==1)
   stop_W_R;
   else
    begin
      casex(State)
        2'b01:
        begin
          read_in;
            if (ctrl_byte==w7||ctrl_byte==w6||ctrl_byte==w5||ctrl_byte==w4||ctrl_byte==w3||ctrl_byte==w2||ctrl_byte==w1||ctrl_byte==w0) begin
                begin
                  State=2'b10;
                  write_to_eeprm;
                end
            else
                State=2'b00;
            end
        end
        2'b11:
            read_from_eeprm;
        default:
            State=2'b00;
      endcase
    end 
end
//操作停止
task stop_W_R;
    begin
        State     = 2'b00;
        addr_byte = 0;
        ctrl_byte = 0;
        out_flag  = 0;
        sda_buf   = 0;
    end
endtask
//读和存储
task read_in;
    begin
      shift_in(ctrl_byte);
      shift_in(addr_byte);
    end
endtask
//EEPROM的写操作
task write_to_eeprm;
    begin
       shift_in(memoory_buf);
              address  = {ctrl_byte[3:1],addr_byte};
       memory[address] = memory_buf;
       $display("eeprm-----memory[%0h]=%0h",address,memory[address]);
       State=2'b00; 
    end
endtask
//EEPROM读操作
task read_from_eeprm;
    begin
        shift_in(ctrl_byte);
        if(ctrl_byte==r7||)       
    end
endmodule