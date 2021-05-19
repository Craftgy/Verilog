module fsm (
    Clock,Reset,A,K2,K1,state
);
    input Clock,Reset,A;
    output K1,K2;
    output [1:0] state;
    reg K2,K1;
    reg [1:0] state;
    parameter Idle = 2'b00,
              Start = 2'b01,
              Stop = 2'b10,
              Clear = 2'b11;

    always @(posedge Clock) begin
        if(!Reset) begin
          state<=Idle;
          K2<=0;
          K1<=0;
        end
        else
        case(state)
        Idle:if(A) begin
          state<=Start;
          K1<=0;
        end
        else begin
          state<=Idle;
          K2<=0;
          K1<=0;
        end
        Start:if(!A) state<=Stop;
                else state<=Start;
        Stop:if(A) begin
                    state<=Clear;
                    K2<=1;
                    end        
             else begin
                    state<=Stop;
                    K2<=0;
                    K1<=0;
             end
        Clear:if(!A) begin
                    state<=Idle;
                    K2<=0;
                    K1<=0;
        end   
            else begin
                    state<=Clear;
                    K2<=0;
                    K1<=1;
            end
        default:state<=2'bxx;
        endcase
    end
endmodule
