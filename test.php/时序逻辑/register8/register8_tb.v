`include "register8.v"
`timescale 1ns / 1ps
module test;

register8 test1(out,data,ena,rst,clk);

reg [7:0] data;
reg ena,rst,clk;
wire [7:0] out;
initial
begin            
    $dumpfile("register.vcd");        //生成的vcd文件名称
    $dumpvars(0, test1);     //tb模块名称 0代表这个模块下所有波形
    #200 $finish;
end
initial 
begin
  clk=1;
  ena=1;
  rst=0;
  data=30;
  #30 rst=1;
  data=15;
  #30 ena=0;
  #100;
end
always
#5 clk=~clk;

endmodule