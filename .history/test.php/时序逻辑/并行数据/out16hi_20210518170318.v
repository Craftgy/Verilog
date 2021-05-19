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
parameter ready = 
endmodule