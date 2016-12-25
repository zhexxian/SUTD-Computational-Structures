set projDir "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/planAhead"
set projName "Toggle"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property source_mgmt_mode None [current_project]
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/mojo_top_0.v" "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/reset_conditioner_1.v" "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/switchbox_2.v" "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/edge_detector_3.v" "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/button_conditioner_4.v" "C:/Users/oka_kurniawan/Documents/mojo/Toggle/work/verilog/pipeline_5.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/oka_kurniawan/Documents/mojo/Toggle/constraint/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property top mojo_top [get_property srcset [current_run]]
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
