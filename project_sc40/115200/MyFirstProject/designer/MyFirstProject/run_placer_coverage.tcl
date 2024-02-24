set_family {SmartFusion2}
read_adl {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\MyFirstProject.adl}
map_netlist
check_constraints {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\placer_coverage.log}
write_sdc -strict {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\place_route.sdc}
