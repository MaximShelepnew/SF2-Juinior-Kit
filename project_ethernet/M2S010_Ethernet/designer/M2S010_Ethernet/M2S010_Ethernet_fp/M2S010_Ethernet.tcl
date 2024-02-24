open_project -project {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet_fp\M2S010_Ethernet.pro}
set_programming_file -name {M2S010} -file {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
