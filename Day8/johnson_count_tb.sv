module johnson_count_tb;
  parameter WIDTH = 4;
  
  reg clk;
  reg rstn;
  wire [WIDTH-1:0] q;
  
  johnson_count 	u0 (.clk (clk),
                .rstn (rstn),
                .q (q));
  
  always #10 clk = ~clk;
  
  initial begin
    {clk, rstn} <= 0;

    $monitor ("T=%0t out=%b", $time, q);
    repeat (2) @(posedge clk);
    rstn <= 1;
    repeat (15) @(posedge clk);
    $finish;
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule