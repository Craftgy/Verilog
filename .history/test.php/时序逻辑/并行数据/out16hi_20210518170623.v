module out16hi(scl,sda,outhigh);
input scl,sda;
output [15:0] outhigh;
reg [5:0] mstate;
reg [3:0] pdata,
            padatabuf;
reg [15:0] outhigh;
reg StartFlag,EndFlag;
always @(negedge sda) begin
    if(scl)
    begin
      StartFlag<=1;
    end
    else if(EndFlag)
        StartFlag<=0;
    end

always @(posedge sda ) begin
    if(scl)
    begin
        EndFlag<=1;
        pdatabuf<=pdata;
    end
    else
        EndFlag<=0;
    end
parameter ready = 6'b00_0000,
          sbit0 = 6'b00_0001,
          sbit1 = 6'b00_0010,
          sbit2 = 6'b00_0100,
          sbit3 = 6'b00_1000,
          sbit4 = 6'b01_0000;
always @(pdatabuf) begin
    case(padatabuf)
        4'b0001:outhigh = 16'b0000_0000_0000_0001;
end
endmodule