adb -d forward --remove-all     
adb -d shell rm //data\\local\\tmp\\model_profile_subgraph.json
adb -d shell su -c //data\\local\\tmp\\gdbserver --once localhost:5555 //data\\local\\tmp\\benchmark_model --json_path=//data\\local\\tmp\\plan.json ${@:1}
adb -d pull //data\\local\\tmp\\model_execution_log.csv