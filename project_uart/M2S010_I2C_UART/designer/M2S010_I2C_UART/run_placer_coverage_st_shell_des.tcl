set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package tq144 \
    -speed   STD \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name M2S010_I2C_UART
set_workdir {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART}
set_log     {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\M2S010_I2C_UART_coverage_pr.log}
set_design_state pre_layout
