transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/altera/13.0sp1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {c:/altera/13.0sp1/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {verilog_yunfang_8_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+D:/program/d\ amplifier/verilog_yunfang/simulation/modelsim {D:/program/d amplifier/verilog_yunfang/simulation/modelsim/verilog_yunfang.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  verilog_yunfang_vlg_tst

add wave *
view structure
view signals
run -all
