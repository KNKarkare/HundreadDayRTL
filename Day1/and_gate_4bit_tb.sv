`timescale 1ns / 1ps

module and_gate_4bit_tb();

//Parameters
parameter WIDTH = 4;

//Signals
logic [WIDTH-1:0] a, b;
logic [WIDTH-1:0] y;
logic [WIDTH-1:0] expected_y; //Reference value

//Instantiate DUT 
and_gate_4bit dut (
    .a(a),
    .b(b),
    .y(y)
);
 
//Test sequence
initial begin
//Initialise
    a=0;
    b=0;
    expected_y=0;
    
    //Test1: Exhaustive test 
    $display("Starting exhaustive test...");
    for (int i=0; i<(1<<WIDTH); i++) begin
        for (int j=0; j<(1<<WIDTH); j++) begin
            a=i;
            b=j;
            expected_y=a&b; //Reference Calculation
            #10; //Wait for combinational propogation
            check_result();
         end
     end
     
     //Test2: Random stimuli
     $display("Starting random test...");
     repeat(20) begin
        a = $urandom_range(0, (1<<WIDTH)-1);
        b = $urandom_range(0, (1<<WIDTH)-1);
        expected_y = a & b;
        #10;
        check_result();
      end
      
      //Test3: Corner cases
      $display("Testing corner cases...");
      test_corner_case(4'b0000, 4'b1111);
      test_corner_case(4'b1010, 4'b0101);
      test_corner_case(4'b1111, 4'b1111);
      
      $display("All tests passed!");
      $finish;
    end
    
    //Task to verify results
    task check_result();
        if (y !== expected_y) begin
            $error("Mismatch! a=%b, b=%b, y=%b (expected %b)",
                    a, b, y, expected_y);
            end
            else begin
                $display("Pass: a=%b, b=%b -> y=%b", a, b, y);
            end
            
     endtask
     
     //Task for corner cases
     task test_corner_case(input [WIDTH-1:0] ta, tb);
        a=ta;
        b=tb;
        expected_y = ta & tb;
        #10;
        check_result();
     endtask
       
endmodule
