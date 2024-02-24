read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {E:/Projects/Actel/ActelKit/M2S/RefDes/3/115200/MyFirstProject/designer/MyFirstProject/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\MyFirstProject_place_and_route_constraint_coverage.xml}]
set reportfile {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp
