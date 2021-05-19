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

always #50 clock = ~clock;
always @(posedge clock ) 
    begin
        #30 a={$random}%2;
        #(3*50+12);
    end
initial
begin            
    $dumpfile("fsm.vcd");        //生成的vcd文件名称
    $dumpvars(0, test);     //tb模块名称 0代表这个模块下所有波形 
end
initial 
    begin
    #1000000 $stop;
    end

fsm test(.Clock(clock),.Reset(rst),.A(a),.K2(k2),.K1(k1));
endmodule