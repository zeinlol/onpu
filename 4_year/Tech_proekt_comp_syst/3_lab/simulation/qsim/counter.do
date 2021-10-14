onerror {quit -f}
vlib work
vlog -work work counter_16_ent.vo
vlog -work work counter.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.main_vlg_vec_tst
vcd file -direction counter.msim.vcd
vcd add -internal main_vlg_vec_tst/*
vcd add -internal main_vlg_vec_tst/i1/*
add wave /*
run -all
