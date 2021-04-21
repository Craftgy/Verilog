`include "compare_n.v"
`timescale 1ns / 1ps
module test;

compare_n test1(X,Y,XGY,XSY,XEY);

reg [7:0] X,Y;
wire XGY,XSY,XEY;
initial 
begin
  #10 X=5;
  Y=5;
  #30 X=10;
  #30 Y=20;
  #100;
end

initial
begin            
    $dumpfile("compare_n.vcd");        //生成的vcd文件名称
    $dumpvars(0, test1);     //tb模块名称 0代表这个模块下所有波形
end
endmodule