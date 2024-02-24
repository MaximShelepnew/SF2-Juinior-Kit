set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\component\work\M2S010_USB_vcp_MSS\M2S010_USB_vcp_MSS.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\component\work\M2S010_USB_vcp\OSC_0\M2S010_USB_vcp_OSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\component\work\M2S010_USB_vcp\M2S010_USB_vcp.vhd}
set_top_level {M2S010_USB_vcp}
map_netlist
check_constraints {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\designer\M2S010_USB_vcp\synthesis.fdc}
