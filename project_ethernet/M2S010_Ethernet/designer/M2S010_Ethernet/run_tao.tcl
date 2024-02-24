set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {D:\Demo\M2S\8\M2S010_Ethernet\component\work\M2S010_Ethernet\FCCC_0\M2S010_Ethernet_FCCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {D:\Demo\M2S\8\M2S010_Ethernet\component\work\M2S010_Ethernet\OSC_0\M2S010_Ethernet_OSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 -lib CORERMII_LIB {D:\Demo\M2S\8\M2S010_Ethernet\component\Actel\DirectCore\CORERMII\2.0.102\rtl\vhdl\core\XHDL_misc.vhd}
read_vhdl -mode vhdl_2008 -lib CORERMII_LIB {D:\Demo\M2S\8\M2S010_Ethernet\component\Actel\DirectCore\CORERMII\2.0.102\rtl\vhdl\core\XHDL_std_logic.vhd}
read_vhdl -mode vhdl_2008 -lib CORERMII_LIB {D:\Demo\M2S\8\M2S010_Ethernet\component\Actel\DirectCore\CORERMII\2.0.102\rtl\vhdl\core\RMII_RX.vhd}
read_vhdl -mode vhdl_2008 -lib CORERMII_LIB {D:\Demo\M2S\8\M2S010_Ethernet\component\Actel\DirectCore\CORERMII\2.0.102\rtl\vhdl\core\RMII_TX.vhd}
read_vhdl -mode vhdl_2008 -lib CORERMII_LIB {D:\Demo\M2S\8\M2S010_Ethernet\component\work\M2S010_Ethernet\CORERMII_0\rtl\vhdl\core\CoreRMII.vhd}
read_vhdl -mode vhdl_2008 {D:\Demo\M2S\8\M2S010_Ethernet\component\work\M2S010_Ethernet_MSS\M2S010_Ethernet_MSS.vhd}
read_vhdl -mode vhdl_2008 {D:\Demo\M2S\8\M2S010_Ethernet\component\work\M2S010_Ethernet\M2S010_Ethernet.vhd}
set_top_level {M2S010_Ethernet}
map_netlist
check_constraints {D:\Demo\M2S\8\M2S010_Ethernet\constraint\synthesis_sdc_errors.log}
write_fdc {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\synthesis.fdc}
