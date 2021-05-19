module seqdet (
    x,z,clk,rst
);
input x,clk,rst;
output z;
reg [2:0] state;
wire z;
parameter IDLE = 3'b000;
parameter A =3'001 ;
parameter B =3'b010 ;
parameter C = 3'b011;
parameter D = 3'b100;
parameter E = 3'b101;
parameter F = 3'b110;
parameter G = 3'b111;

always @() begin
    
end

endmodule