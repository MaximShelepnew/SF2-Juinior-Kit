set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\hdl\MyCounter.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\component\work\MyFirstProject_MSS\MyFirstProject_MSS.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\component\work\MyFirstProject\OSC_0\MyFirstProject_OSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\component\work\MyFirstProject\MyFirstProject.vhd}
set_top_level {MyFirstProject}
map_netlist
check_constraints {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\designer\MyFirstProject\synthesis.fdc}
