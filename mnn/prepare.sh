adb -d shell rm -r //data\\local\\tmp\\mnn\\bin
adb -d shell rm -r //data\\local\\tmp\\gdbserver

adb -d push ../gdbserver //data\\local\\tmp

adb -d shell chmod 777 //data\\local\\tmp\\gdbserver
 
adb -d push bin //data\\local\\tmp\\mnn
adb -d shell chmod 777 //data\\local\\tmp\\mnn\\bin\\benchmark.out