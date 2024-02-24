new_project \
         -name {M2S010_Ethernet} \
         -location {D:\Demo\M2S\8\M2S010_Ethernet\designer\M2S010_Ethernet\M2S010_Ethernet_fp} \
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
