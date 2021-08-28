
//Test Bench for 12 bit adder

module tb_dvsd_adder_12bit;
//reg clk;
reg CE;
reg [11:0] A,B;
reg Cin;
wire [11:0] S;
wire Cout;

dvsd_adder_12bit uut(
    //  .clk(clk),
      .CE(CE),
      .A(A),
      .B(B),
      .Cin(Cin),
      .S(S),
      .Cout(Cout)
      );

initial begin
$dumpfile("tb_CLA12bit_newway.vcd");
$dumpvars(0,tb_CLA12bit_newway);
// Initialize Inputs
//clk = 0;
CE = 0;
A = 16'd0; B = 16'd0; Cin = 1'd0;

//  Inputs
#25 CE = 1;
#50 A=12'd4; B=12'd2; Cin=1'd1;
#50 A=12'd999; B=12'd2550; Cin=1'd1;
#50 A=12'd9; B=12'd9; Cin=1'd0;
#50 A=12'd122222; B=12'd8888; Cin=1'd1;
#50 A=12'd2; B=12'd9; Cin=1'd0;
#150 $finish;
end

//always #30 clk = ~clk;
endmodule
