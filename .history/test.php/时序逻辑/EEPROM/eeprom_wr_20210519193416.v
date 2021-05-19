`timescale 1ns/1ns
module EEPROM_WR(SDA,SCL,ACK,RESET,CLK,WR,RD,ADDR,DATE);
output SCL;
output ACK; 
input RESET;
input CLK;
input WR,RD;
input [10:0] ADDER;

endmodule