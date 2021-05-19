`timescale 1ns/1ns
`include "sigdata.v"
`include "ptosda.v"
`include "out16hi.v"

module top();
wire [3:0] data;
wire sclk;
wire scl;
wire sda;
wire rst;
wire [15:0] outhigh;
sigdata m0(.rst(rst),.sclk(sclk),.data(data),.ask_for_data(ack));
ptosda m1(.rst(rst),.sclk(sclk),.ack(ack),.scl(scl),.sda(sda),.data(data));
out16hi m2(.scl(scl),.sda(sda),.outhigh(outhigh));
initial
begin            
    $dumpfile("top.vcd");        //生成的vcd文件名称
    $dumpvars(0,top);     //tb模块名称 0代表这个模块下所有波形 
end
endmodule