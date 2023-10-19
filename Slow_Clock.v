`timescale 1ns / 1ps
module Slow_Clock(clk,sclk);
input clk;
output sclk;
reg [7:0]count = 0;
reg clk_out=0;


always@(posedge clk)
begin
	count <= count + 1;
	if(count == 16)
	begin
		count <= 0;
		clk_out<=~clk_out;
	end
	
end	

assign sclk = clk_out;
//assign sclk = count == 16 ? 1:0;


endmodule
