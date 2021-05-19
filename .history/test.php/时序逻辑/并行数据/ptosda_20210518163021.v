module ptosda(rst,sclk,ack,scl,sda,data);
input sclk,rst;
input [3:0] data;
output ack,scl,sda;
reg scl,link_sda,ack,sdabuf;
reg [3:0] databuf;
reg [7:0] state;
assign sda = link_sda?sdabuf:1'b0;

parameter ready = 8'b0000_0000,
          start = 8'b0000_0001,
          bit1 = 8'b0000_0010,
          bit2 = 8'b0000_0100,
          bit3 = 8'b0000_1000,
          bit4 = 8'b0001_0000,
          bit5 = 8'b0010_0000,
          stop = 8'b0100_0000,
          IDLE = 8'b1000_0000;
always @(posedge sclk or negedge rst) begin
    if(!rst)
        scl<=1;
    else
        scl<=~scl;
end
always @(posedge ack) begin
    databuf<=date;
end
always @(negedge sclk or negedge rst) begin
    if(!rst)
    begin
        link_sda<=0;
        state<=ready;
        sdabuf<=1;
        ack<=0;
    end
    else
    begin
        case(state)
        ready:if(ack)
            begin
               link_sda<=1;
               state<=start; 
            end
             else
             begin
               link_sda<=0;
               state<=ready;
               ack<=1;
             end
        start:if(scl&&ack)
            begin
              sdabuf<=0;
              state<=bit1;
            end
            else state<=start;
        bit1:if(!scl)
            begin
              sdabuf<=databuf[3];
              state<=bit2;
              ack<=0;
            end
    end
end
endmodule