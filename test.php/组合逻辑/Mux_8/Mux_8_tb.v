`include "Mux_8.v"
`timescale 1ns / 1ps
module test;

Mux_8 test1(addr,in1,in2,in3,in4,in5,in6,in7,in8,Mout,nCS);

reg [2:0] addr;
reg [7:0] in1,in2,in3,in4,in5,in6,in7,in8;
reg nCS;
wire [7:0] Mout;
initial 
begin
  in1=1;in2=2;in3=6;in4=5;in5=9;in6=10;in7=13;in8=30;
  nCS=0;
  #10 addr=1;
  #10 addr=3;
  #10 addr=5;
  #30 nCS=1;
  #30 nCS=0;
  addr=7;
  #100;
end

initial
begin            
    $dumpfile("Mux_8.vcd");        //生成的vcd文件名称
    $dumpvars(0, test1);     //tb模块名称 0代表这个模块下所有波形
end
endmodule