`timescale 1ns/1ns
`define halfperiod 20

module t;
reg clk,rst;
reg [23:0] data;
wire z,x;
assign x=data[23];


endmodule