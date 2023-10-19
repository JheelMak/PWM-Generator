`timescale 1ns / 1ps
module PWM_PushButton(clk,Button1,Button2,pwm);
input Button1,Button2,clk;
output pwm;
wire inc,dec;
wire sclk, Q1_b1, Q2_b1, Q2bar_b1;
wire Q1_b2, Q2_b2, Q2bar_b2;
reg [3:0]DUTY=5;
reg [3:0] counter = 0;

assign Q2bar_b1 = ~Q2_b1;
assign Q2bar_b2 = ~Q2_b2;

Slow_Clock s1(clk,sclk);

D_FF d1(clk,sclk,Button1,Q1_b1);
D_FF d2(clk,sclk,Q1_b1,Q2_b1);

assign inc = Q1_b1 & Q2bar_b1 & sclk;

D_FF d3(clk,sclk,Button2,Q1_b2);
D_FF d4(clk,sclk,Q1_b2,Q2_b2);

assign dec = Q1_b2 & Q2bar_b2 & sclk;


always @(posedge clk)
 begin
 counter <= counter + 1;
   if(counter >= 9) 
    counter <= 0;
	 
   if(inc==1 && DUTY <= 8) 
    DUTY <= DUTY + 2;
   else if(dec==1 && DUTY >= 2) 
    DUTY <= DUTY - 2;
 end 

 assign pwm = counter < DUTY ? 1:0;

endmodule
