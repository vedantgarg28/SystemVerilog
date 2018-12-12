module alu(A,B,sel,R,carry);
  
  input [3:0] A,B;
  input [2:0] sel;
  output reg [3:0] R;
  output reg [1:0] carry;
  
  
  reg [5:0] total;
  
  always @ (A,B,sel)
    begin
  
      case(sel)
        0	: 	begin 
          		total = A + B; 
          		R = total[3:0]; 
          		carry = total[5:4] ;
        		end
        
        1	: 	begin 
          		total = A - B; 
          		R = total[3:0]; 
          		carry = total[5:4]; 
        		end
        
        10	: 	begin 
          		total = A + 1; 
          		R = total[3:0]; 
          		carry = total[5:4]; 
        		end
        
        11	: 	begin 
          		total = B + 1; 
          		R = total[3:0]; 
          		carry = total[5:4]; 
        		end
        
        100	: 	R = A & B;
        
        101 : 	R = A | B;    
        
        // according to the spec, I was not supposed to write the other cases.
      endcase
      
    end
  
  
  
endmodule



// Testbench 

class packet;
  
  rand bit [2:0] sel1;
  rand bit [3:0] a;
  rand bit [3:0] b;

  
endclass



module alu_tb(A,B,sel,R,carry);
  
  output reg [3:0] A,B;
  output reg [2:0] sel;
  input [3:0] R;
  input [1:0] carry;
  
  alu A1 (A,B,sel,R,carry);
  
  packet p = new();
  
  initial begin
    repeat(1000) begin
      p.randomize();
      
      #1 sel = p.sel1;
      #1 A = p.a;
      #1 B = p.b;
      
      $display($time, "Values of A %b, B %b and sel %b", A,B,sel);
      
    end
    
  end
  
  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars;
    $monitor($time, "Out value R %b and carry %b", R, carry);
    
    #1000 $finish;
    
      
  end
  
  
  
endmodule
