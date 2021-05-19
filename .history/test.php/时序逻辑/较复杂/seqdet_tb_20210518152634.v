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
    data= 20'b1100_1001_0000_1001_0100;
    #(`halfperiod*1000)$stop;
end
always #(`halfperiod)clk=~clk;
always @(posedge clk) begin
    #2 data={data[22:0],data[23]};
end
seqdet m(.x(x),.z(z),.clk(clk),.rst(rst));
initial
begin            
    $dumpfile("seq.vcd");        //生成的vcd文件名称
    $dumpvars(0, test);     //tb模块名称 0代表这个模块下所有波形 
end
endmodule