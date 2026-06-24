`timescale 1ns / 1ps

// Module:  Test Bench for Sequence 100 Recognizer
// Author:  Ranga Vemuri


module tb_recognizer(
    );

reg x, clk, reset;
wire y;

parameter T = 10;

recognizer r_tb(clk, reset, x, y);

always 
    begin
     # (T/2); 
     clk = ~clk;
    end

initial 
    begin
     clk = 0;
     reset = 0;
     x = 0;
     #(T);
     
     reset = 1;
     
     #(T);
     
     forever
        begin
            x = $random;
            #(T);
        end   
    end
    initial
   begin
   $sdf_annotate("/home/shivansa/CUSTOM-CIRCUIT-DESIGN/HW4_shivansa/Innovus/Run2_OutputFiles/Route/recognizer_withRC.sdf", r_tb,,"sdf_new.log","maximum",,);
   end
endmodule
