open_project -project {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\designer\M2S010_USB_vcp\M2S010_USB_vcp_fp\M2S010_USB_vcp.pro}
set_programming_file -name {M2S010} -file {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\designer\M2S010_USB_vcp\M2S010_USB_vcp.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
