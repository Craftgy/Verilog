`timescale 1ns/1ns
`define halfperiod 20

module t;
reg clk,rst;
reg [23:0] data;
wire z,x;
assign x=data[23];

initial begin
    clk=0;
    rst=1;
    #2 rst=0;
    #30 rst=10;
    data= 20'b1100_1001_0000_1001_0100
end
endmodule