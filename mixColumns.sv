// Code your design here
module mulTwo(
    input [3:0] x1,
    output [3:0] y1
    );
    
  	assign y1 = (x1[3]) ? ({x1[2:0], 1'b0} ^ 4'b0011) : {x1[2:0], 1'b0};

endmodule

module mulThree(
    input [3:0] x2,
    output [3:0] y2
    );
  
    wire [3:0] mul2_result;
  	assign mul2_result = ((x2[3]) ? (({x2[2:0], 1'b0}) ^ 4'b0011) : {x2[2:0],1'b0});
  
  	assign y2= mul2_result ^ x2;
    
endmodule

module mixColumns(
  	input [15:0] x,
  output [15:0] y
    );
    
    wire [3:0] a0, a1, a2, a3;
  wire [3:0] w0, w1, w2,w3, w4, w5, w6, w7;
    
    assign a0 = x[15:12]; 
    assign a1 = x[11:8];
    assign a2 = x[7:4];
    assign a3 = x[3:0];
    
    mulTwo mul1(
        .x1(a0),
        .y1(w0)
        );
           
    mulThree mul2(
      	.x2(a1),
        .y2(w1)
        );
  
      mulTwo mul3(
        .x1(a1),
        .y1(w2)
        );
           
    mulThree mul4(
      .x2(a2),
      .y2(w3)
        );
        
  
        mulTwo mul5(
          .x1(a2),
          .y1(w4)
        );
           
    mulThree mul6(
      .x2(a3),
      .y2(w5)
        );
        
        mulTwo mul7(
          .x1(a3),
          .y1(w6)
        );
           
    mulThree mul8(
      .x2(a0),
      .y2(w7)
        );
        
  
  	assign y[15:12] = w0 ^ w1 ^ a2 ^ a3;
  assign y[11:8] = a0 ^ w2 ^ w3 ^ a3;
  assign y[7:4] = a0 ^ a1 ^ w4 ^ w5;
  assign y[3:0] = w7 ^ a1 ^ a2 ^ w6;
endmodule