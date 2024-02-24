new_project \
         -name {M2S010_I2C_UART} \
         -location {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\M2S010_I2C_UART_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
