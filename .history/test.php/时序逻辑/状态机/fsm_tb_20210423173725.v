`include "/Users/craft/资料/verilog_study/test.php/时序逻辑/状态机/fsm.v"
`timescale 1ns/1ns
module test;
    reg a;
    reg clock,rst;
    wire k2,k1;
initial 
    begin
        a=0;
        rst=1;
        clock=0;
        #22 rst=0;
        #133 rst=1;
    end

always #50 clock