adb -d push benchmark_model //data\\local\\tmp
adb -d push plan.json //data\\local\\tmp
adb -d push ../gdbserver //data\\local\\tmp

adb -d shell chmod 777 //data\\local\\tmp\\benchmark_model
adb -d shell chmod 777 //data\\local\\tmp\\gdbserver