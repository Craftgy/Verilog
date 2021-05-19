module fsm (
    Clock,Reset,A,K2,K1,state
);
    input Clock,Reset,A;
    output K1,K2;
    output [4:0] state;
    reg [4:0] state;
    assign K2=state[4]; // 状态变量的最高位用作输出K2
    assign K1=state[0]; //状态变量的最低位用作输出K1
    parameter Idle = 5'b00000,
              Start = 5'b00001,
              Stop = 5'b00010,
              StopToClear = 5'b11000,
              Clear = 5'b01010,
              ClearToIdle = 5'b00111;

    always @(posedge Clock) begin
        if(!Reset) begin
          state<=Idle;
        end
        else
        case(state)
        Idle:if(A) 
          state<=Start;
        else 
          state<=Idle;
        Start:if(!A) state<=Stop;
                else state<=Start;
        Stop:if(A) 
                    state<=ClearToIdle;
        else 
                    state<=Stop;
        StopToClear:state<=Clear;
        Clear:if(!A)
                    state<=ClearToIdle;  
            else 
                    state<=Clear;
        default:state<=Idle;
        endcase
    end
endmodule