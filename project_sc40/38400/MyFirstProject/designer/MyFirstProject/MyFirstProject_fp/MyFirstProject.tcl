open_project -project {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\designer\MyFirstProject\MyFirstProject_fp\MyFirstProject.pro}
set_programming_file -name {M2S010} -file {E:\Projects\Actel\ActelKit\M2S\RefDes\3\38400\MyFirstProject\designer\MyFirstProject\MyFirstProject.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
