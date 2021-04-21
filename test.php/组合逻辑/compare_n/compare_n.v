module compare_n (
    X,Y,XGY,XSY,XEY
);
    input [width-1:0] X,Y;
    output  XGY,XSY,XEY;
    reg XGY,XSY,XEY;
    parameter width = 8;
    always @(X or Y) begin
        if(X==Y)
            XEY=1;
        else 
            XEY=0;
        if(X>Y)
            XGY=1;
        else
            XGY=0;
        if(X<Y)
            XSY=1;
        else   
            XSY=0;
    end
endmodule