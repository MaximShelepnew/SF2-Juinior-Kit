new_project \
         -name {M2S010_USB_vcp} \
         -location {E:\Projects\Actel\ActelKit\RefDes\7\SoC\M2S010_USB_vcp\designer\M2S010_USB_vcp\M2S010_USB_vcp_fp} \
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
