vlib work
vlog -work work {multiplier.v}
vlog -work work {tb_multiplier.v}
vsim work.tb_multiplier -voptargs=+acc
radix dec
add wave *
run 200 ps

