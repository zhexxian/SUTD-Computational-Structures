set projDir "C:/Users/surface/Desktop/ISTD 3D Final/work/planAhead"
set projName "ISTD 3D Final"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/mojo_top_0.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/reset_conditioner_1.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/edge_detector_2.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/counter_3.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/special_counter_4.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/wave_5.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/adder4bit_6.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/test_generator_7.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/compare_8.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/seven_seg_9.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/seven_seg_9.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/seven_seg_9.v" "C:/Users/surface/Desktop/ISTD 3D Final/work/verilog/decimal2_8bit_12.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/surface/Desktop/ISTD\ 3D\ Final/constraint/inout.ucf" "C:/Users/surface/Desktop/ISTD\ 3D\ Final/constraint/ioshield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
