module ptosda(rst,sclk,ack,scl,sda,data);
input sclk,rst;
input [3:0] data;
output ack,scl,sda;
reg scl,link_sda,ack,sdabuf;
reg [3:0] databuf;
reg [7:0] state;
parameter ready = 8'b0000_0000,
          start = 8'b0000_0001,
          bit1 = 

endmodule