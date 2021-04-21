`include "add_4.v"
`timescale 1ns / 1ps
module test;

add_4 test1(X,Y,sum,C);
add_4 test2(X,Y,sum,C);

reg [3:0] X,Y;
wire [3:0] sum;
wire C;
initial 
begin
  #10 X=5;
  #20 Y=5;
  #30 X=10;
  #50 Y=10;
  #100;
end

initial
begin            
    $dumpfile("add_4.vcd");        //生成的vcd文件名称
    $dumpvars(0, test1);     //tb模块名称 0代表这个模块下所有波形
    $dumpvars(0, test2);     //tb模块名称 0代表这个模块下所有波形
end
endmodule