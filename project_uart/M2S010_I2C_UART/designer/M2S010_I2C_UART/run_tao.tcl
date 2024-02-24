set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\component\work\M2S010_I2C_UART\FCCC_0\M2S010_I2C_UART_FCCC_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\component\work\M2S010_I2C_UART_MSS\M2S010_I2C_UART_MSS.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\component\work\M2S010_I2C_UART\OSC_0\M2S010_I2C_UART_OSC_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\component\work\M2S010_I2C_UART\M2S010_I2C_UART.vhd}
set_top_level {M2S010_I2C_UART}
map_netlist
check_constraints {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\synthesis.fdc}
