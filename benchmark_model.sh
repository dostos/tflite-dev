if [[ `adb shell ls //data/local/tmp/benchmark_model 2> /dev/null` ]]; then
    echo "benchmark_model exists"
else
    adb push //bin/benchmark_model //data/local/tmp
    adb shell chmod +x //data/local/tmp/benchmark_model
fi

if [[ `adb shell ls //data/local/tmp/performance_profiling 2> /dev/null` ]]; then
    echo "performance_profiling exists"
else
    adb push //bin/performance_profiling //data/local/tmp
    adb shell chmod +x //data/local/tmp/performance_profiling
fi


if [ $# -eq 0 ]; then
    echo "No model provided."
    exit
else
    mkdir -p results
    OUTPUT=results/$(date +%Y%m%d_%H%M%S)_$(basename $1)
    mkdir $OUTPUT
    echo $@ >> "${OUTPUT}/commands.txt"
    adb shell //data/local/tmp/performance_profiling "//data/local/tmp/$1" | tee -a "${OUTPUT}/performance_profiling.txt"
    adb shell //data/local/tmp/benchmark_model --graph="//data/local/tmp/$1" --profiling_output_csv_file="${OUTPUT}/benchmark_model.csv" ${@:2} | tee -a "${OUTPUT}/benchmark_model.txt"
fi