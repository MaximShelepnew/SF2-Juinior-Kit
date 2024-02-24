set_family {SmartFusion2}
read_adl {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet.adl}
map_netlist
check_constraints {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\placer_coverage.log}
write_sdc -strict {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\place_route.sdc}
