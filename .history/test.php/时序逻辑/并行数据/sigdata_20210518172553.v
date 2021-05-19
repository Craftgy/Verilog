`timescale 1ns/1ns
`define halfperiod 50
module sigdata(rst,sclk,data,ask_for_data);
output rst;
output [3:0] data;
output sclk;
input ask_for_data;
reg rst,sclk;

initial begin
    rst=1;
end
endmodule
