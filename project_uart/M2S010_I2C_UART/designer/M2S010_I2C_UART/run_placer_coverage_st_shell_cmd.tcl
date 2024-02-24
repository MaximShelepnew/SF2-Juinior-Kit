read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {E:/Projects/Actel/ActelKit/RefDes/5/SoC/M2S010_I2C_UART/designer/M2S010_I2C_UART/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\M2S010_I2C_UART_place_and_route_constraint_coverage.xml}]
set reportfile {E:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\designer\M2S010_I2C_UART\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
