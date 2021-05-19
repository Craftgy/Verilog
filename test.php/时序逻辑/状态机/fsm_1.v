module fsm (
    Clock,Reset,A,K2
);
    input Clock,Reset,A;
    output K1,K2;
    reg K2,K1;
    reg [3:0] state;
    parameter Idle = 4'b0000,
              Start = 4'b0010,
              Stop = 4'b0100,
              Clear = 4'b1000;

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