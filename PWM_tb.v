`timescale 1ns / 1ps
module PWM_tb;
 reg clk;
 reg Button1;
 reg Button2;
 wire pwm;
 PWM_PushButton PWM_TB(.clk(clk), .Button1(Button1), .Button2(Button2), .pwm(pwm));
 
 initial 
 begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 
 initial 
 begin
  Button1 = 0;
  Button2 = 0;
  #100; 
    Button1 = 1; 
  #100;
    Button1 = 0;
  #100; 
    Button1 = 1;
  #100;
    Button1 = 0;
	#100; 
    Button1 = 1; 
  #100;
    Button1 = 0;
	#100; 
    Button1 = 1; 
  #100;
    Button1 = 0;
	#100; 
    Button1 = 1; 
  #100;
    Button1 = 0;
	 
  #100;
    Button2 = 1; 
  #100;
    Button2 = 0;
  #100; 
    Button2 = 1;
  #100;
    Button2 = 0;
	#100;
    Button2 = 1; 
  #100;
    Button2 = 0;
	#100;
    Button2 = 1; 
  #100;
    Button2 = 0;
 #100;
    Button2 = 1; 
  #100;
    Button2 = 0;
#3000 $finish;
  
 end
endmodule
