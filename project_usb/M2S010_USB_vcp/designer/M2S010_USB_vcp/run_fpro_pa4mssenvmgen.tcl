set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg tq144
set_input_cfg \
	-path {E:/Projects/Actel/ActelKit/RefDes/7/SoC/M2S010_USB_vcp/component/work/M2S010_USB_vcp_MSS/ENVM.cfg}
set_output_efc \
    -path {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\designer\M2S010_USB_vcp\M2S010_USB_vcp.efc}
set_proj_dir \
    -path {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp}
gen_prg -use_init false
