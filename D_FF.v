`timescale 1ns / 1ps
module D_FF(clk,en,D,Q);
input clk,en;
input [3:0]D;
output reg [3:0]Q;
always@(posedge clk)
begin
	if(en==1)
		Q<=D;
end
endmodule
