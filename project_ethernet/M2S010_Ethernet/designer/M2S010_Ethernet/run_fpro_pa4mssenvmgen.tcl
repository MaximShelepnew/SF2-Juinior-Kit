set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg tq144
set_input_cfg \
	-path {D:/Demo/M2S/8/M2S010_Ethernet/component/work/M2S010_Ethernet_MSS/ENVM.cfg}
set_output_efc \
    -path {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet.efc}
set_proj_dir \
    -path {D:\Demo\M2S\8\M2S010_Ethernet}
gen_prg -use_init false
