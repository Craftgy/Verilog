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

always @(posedge clk or negedge rst) begin
    if(!rst)
    state<=IDLE;
    else
    casex (state)
        IDLE:if(x==1)
                state<=A;
             else 
                state<=IDLE;
        A:if(x==0)
            state<=B;
          else if(x==1)
                state<=A;
                else
                    state<=IDLE; 
        B:if(x==0)
            state<=C;
          else if(x==1)
                state<=F;
                else
                    state<=IDLE;
        C:if(x==0)
            state<=G;
          else if(x==1)
                state<=D;
                else
                    state<=IDLE;
        D:if(x==0)
            state<=E;
          else if(x==1)
                state<=A;
                else
                    state<=IDLE;
        E:if(x==0)
            state<=C;
          else if(x==1)
                state<=A;
                else
                    state<=IDLE;
        F:if(x==0)
            state<=B;
          else if(x==1)
                state<=A;
                else
                    state<=IDLE;
        G:if(x==0)
            state<=B;
          else if(x==1)
                state<=A;
                else
                    state<=IDLE                 
                 
        default: 
    endcase
end

endmodule