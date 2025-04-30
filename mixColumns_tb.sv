// Code your testbench here
// or browse Examples

module mixColumns_sim();
  reg [15:0] x;
  wire [15:0] y;
  	
 mixColumns mc(.x(x), .y(y));
  
  initial begin
    $display ("mixColumns testbench");
    #10;
    x = 16'ha7e9;
    #10;
    $display("y= %h", y);
    #10;
    $finish;
  end
endmodule