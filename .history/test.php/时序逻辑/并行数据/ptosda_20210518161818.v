module ptosda(rst,sclk,ack,scl,sda,data);
input sclk,rst;
input [3:0] data;
output ack,scl,sda;
reg scl,link_sda,ack,sdabuf;
reg [3:0] databuf;
reg [7:0] state

endmodule