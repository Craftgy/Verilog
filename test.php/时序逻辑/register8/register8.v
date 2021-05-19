module register8 (
    out,data,ena,rst,clk
);
    input [7:0] data;
    input ena,rst,clk;
    output [7:0] out;
    reg [7:0] out;
    always @(posedge clk) begin
        if(!rst)
         out<=0;
        else if(ena)
         out<=data;
    end
endmodule