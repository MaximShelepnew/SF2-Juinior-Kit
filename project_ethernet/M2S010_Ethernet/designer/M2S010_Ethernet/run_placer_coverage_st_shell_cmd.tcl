read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {D:/Demo/M2S/8/M2S010_Ethernet/designer/M2S010_Ethernet/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet_place_and_route_constraint_coverage.xml}]
set reportfile {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
