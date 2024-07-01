// Code your design here
module decoder(din,en,d0,d1,d2,d3,d4,d5,d6,d7);
  input [2:0]din;
  input en;
  output reg d0,d1,d2,d3,d4,d5,d6,d7;
  always @(*)
    begin
      if(en)
        begin
          {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0;
        case(din)
          3'b000: d0=1'b1;
          3'b001: d1=1'b1;
          3'b010: d2=1'b1;
          3'b011: d3=1'b1;
          3'b100: d4=1'b1;
          3'b101: d5=1'b1;
          3'b110: d6=1'b1;
          3'b111: d7=1'b1;
        endcase
    end
      else
      {d0,d1,d2,d3,d4,d5,d6,d7}=8'b0;
    end
endmodule
