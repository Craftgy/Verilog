`include "mult_4.v"
`timescale 1ns / 1ps
module test;

mult_4 test1(X,Y,Product);

reg [3:0] X,Y;
wire [7:0] Product;
initial 
begin
  #10 X=5;
  Y=5;
  #30 X=10;
  Y=10;
  #100;
end

initial
begin            
    $dumpfile("mult_4.vcd");        //生成的vcd文件名称
    $dumpvars(0, test1);     //tb模块名称 0代表这个模块下所有波形
end
endmodule