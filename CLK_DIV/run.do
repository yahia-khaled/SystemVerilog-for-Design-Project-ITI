vlib work
vmap work work
vlog *.sv
vsim -voptargs=+acc work.clk_div_tb
add wave *
run -all
quit