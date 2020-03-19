connect -url tcp:127.0.0.1:3121
source C:/Users/sungyeong/Desktop/class_experiments_v19/class_experiments_v19.sdk/soc_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764161"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248764161" && level==0} -index 1
fpga -file C:/Users/sungyeong/Desktop/class_experiments_v19/class_experiments_v19.sdk/soc_wrapper_hw_platform_0/soc_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764161"} -index 0
loadhw -hw C:/Users/sungyeong/Desktop/class_experiments_v19/class_experiments_v19.sdk/soc_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764161"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248764161"} -index 0
dow C:/Users/sungyeong/Desktop/class_experiments_v19/class_experiments_v19.sdk/csd_lab/Debug/csd_lab.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248764161"} -index 0
con
