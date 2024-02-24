set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg tq144
set_input_cfg \
	-path {E:/Projects/Actel/ActelKit/M2S/RefDes/3/115200/MyFirstProject/component/work/MyFirstProject_MSS/ENVM.cfg}
set_output_efc \
    -path {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject\designer\MyFirstProject\MyFirstProject.efc}
set_proj_dir \
    -path {E:\Projects\Actel\ActelKit\M2S\RefDes\3\115200\MyFirstProject}
gen_prg -use_init false
