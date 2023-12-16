// Code your testbench here
// or browse Examples

module testbench;
  reg [7:0] A_test, B_test;
  reg [2:0] opcode_test;
  wire [8:0] Y_result;
  wire co_result;
  wire reset;
  reg clk;
  integer vals, fd; //file descriptor e vals per la lettura da file
  
  
  topModule #(.nbits(7), .pipe(1)) dut(
    .A(A_test),
    .B(B_test),
    .opcode(opcode_test),
    .Y(Y_result),
    .co(co_result),
    .clk(clk),
    .rst(rst),
    .arst(reset)
  );
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, testbench);
   
    
    //Lettura da file
    
    fd = $fopen("input.txt", "r");
    
    if(fd==0)
      begin 
        $display("Non posso aprire il file!");
        $finish;
      end
    
    //while di lettura 
    
    while(!$feof(fd))
    	begin
      //Lettura da file

          vals = $fscanf(fd, "%d %d %d\n", A_test, B_test, opcode_test);
          $display("Operazione %b, con valori %b e %b", opcode_test, A_test, B_test);
      // Aggiungi ulteriori combinazioni di input per testare più casi
          #20;
          
        end 
    #10;
    $fclose(fd);
    $finish; // Termina la simulazione
  end
  
  
  
 //generazione del clock!
 always 
   begin 
     clk<= 0;
     #5;
     clk <= 1;
     #5;
   end

//ricorda, l'ordine non deve interessare in questi casi!
endmodule
