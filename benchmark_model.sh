BASEPATH=//data/local/tmp #$//sdcard/tmp

if [[ `adb shell ls ${BASEPATH}/benchmark_model 2> /dev/null` ]]; then
    echo "benchmark_model exists"
else
    adb push bin/benchmark_model $BASEPATH
    adb shell chmod 777 $BASEPATH/benchmark_model
fi

if [[ `adb shell ls ${BASEPATH}/performance_profiling 2> /dev/null` ]]; then
    echo "performance_profiling exists"
else
    adb push bin/performance_profiling $BASEPATH
    adb shell chmod 777 $BASEPATH/performance_profiling
fi


if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` [somestuff]"
    exit
else
    mkdir -p results
    OUTPUT=results/$(date +%Y%m%d_%H%M%S)_$(basename $1)
    mkdir $OUTPUT
    echo $@ >> "${OUTPUT}/commands.txt"
    adb shell $BASEPATH/performance_profiling "${BASEPATH}/$1" | tee -a "${OUTPUT}/performance_profiling.txt"
    adb shell $BASEPATH/benchmark_model --graph="${BASEPATH}/$1" --profiling_output_csv_file="${OUTPUT}/benchmark_model.csv" ${@:2} | tee -a "${OUTPUT}/benchmark_model.txt"
fi