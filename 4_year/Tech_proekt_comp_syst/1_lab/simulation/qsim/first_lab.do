onerror {quit -f}
vlib work
vlog -work work first_lab_ent.vo
vlog -work work first_lab.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.first_lab_ent_vlg_vec_tst
vcd file -direction first_lab.msim.vcd
vcd add -internal first_lab_ent_vlg_vec_tst/*
vcd add -internal first_lab_ent_vlg_vec_tst/i1/*
add wave /*
run -all
