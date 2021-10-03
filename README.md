# Learning Verilog Notes

Good exercises to model IC logic into verilog from a datasheet

### Setup
`apt install iverilog verilator gtkwave`

### Running & testing
`iverilog -o tb module_testbench.v && vvp tb`