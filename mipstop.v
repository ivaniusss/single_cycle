//------------------------------------------------
// top.v
// Updated to SystemVerilog - Harris Harris version
// Top level system including MIPS and memories
//------------------------------------------------

`include "mipsmem.v"
`include "mips.v"

module top(input         clk, reset, 
           output [31:0] writedata, dataadr, 
           output        memwrite);

  wire [31:0] pc, instr, readdata;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule
