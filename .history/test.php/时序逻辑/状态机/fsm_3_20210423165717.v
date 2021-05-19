module fsm (
    Clock,Reset,A,K2,K1,state
);
    input Clock,Reset,A;
    output K1,K2;
    reg K2,K1;
    reg [1:0] state,nextstate;
    parameter Idle = 2'b00,
              Start = 2'b01,
              Stop = 2'b10,
              Clear = 2'b11;
              //每一个时钟沿产生一次可能的状态变化
    always @(posedge Clock ) begin
        if(!Reset)
            state<=Idle;
        else
            state<=nextstate;
    end
    //产生下一状态的组合逻辑
    always @(state or A) 
    begin
        case(state)
            Idle:if(A)
                        nextstate = Start;
                 else   nextstate = Idle;
            Start:if(!A) nextstate = Stop;
                 else nextstate = Start;
            Stop:if(A) nextstate = Clear;
                 else nextstate = Stop;
            Clear:if(!A) nextstate = Idle;
                    else nextstate = Clear;
            default:    nextstate = 2'bxx;
    end
        endcase
    //产生输出K1的组合逻辑
    always @(state or Reset or A) 
    begin
    if(!Reset) K1=0;
        else
            if(state = = Cleear)    
    end