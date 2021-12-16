adb shell rm //data\\local\\tmp\\model_profile_subgraph.json
adb shell //data\\local\\tmp\\benchmark_model --json_path=//data\\local\\tmp\\plan.json ${@:1}
adb pull //data\\local\\tmp\\log.csv