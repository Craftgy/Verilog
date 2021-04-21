module mult_4 (
    X,Y,Product
);
input [3:0] X,Y;
output [7:0] Product;
assign Product=X*Y;

endmodule