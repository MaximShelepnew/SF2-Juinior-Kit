set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg tq144
set_input_cfg \
	-path {E:/Projects/Actel/ActelKit/RefDes/5/SoC/M2S010_I2C_UART/component/work/M2S010_I2C_UART_MSS/ENVM.cfg}
set_output_efc \
    -path {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\M2S010_I2C_UART.efc}
set_proj_dir \
    -path {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART}
gen_prg -use_init false
