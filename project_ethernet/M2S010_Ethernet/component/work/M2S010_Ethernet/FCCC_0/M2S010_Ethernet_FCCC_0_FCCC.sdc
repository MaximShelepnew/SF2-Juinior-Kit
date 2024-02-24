set_component M2S010_Ethernet_FCCC_0_FCCC
# Microsemi Corp.
# Date: 2017-Oct-24 12:27:47
#

create_clock -period 50 [ get_pins { CCC_INST/XTLOSC } ]
create_generated_clock -multiply_by 5 -divide_by 4 -source [ get_pins { CCC_INST/XTLOSC } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
create_generated_clock -multiply_by 5 -divide_by 2 -source [ get_pins { CCC_INST/XTLOSC } ] -phase 0 [ get_pins { CCC_INST/GL1 } ]
