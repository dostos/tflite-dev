sh adb-all.sh push benchmark_model //data\\local\\tmp
sh adb-all.sh push plan.json //data\\local\\tmp
sh adb-all.sh push ../gdbserver //data\\local\\tmp
sh adb-all.sh shell chmod 777 //data\\local\\tmp\\benchmark_model
sh adb-all.sh shell chmod 777 //data\\local\\tmp\\gdbserver