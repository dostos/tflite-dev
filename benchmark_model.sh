BASEPATH="/data/local/tmp" #$//sdcard/tmp
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` [somestuff]"
    exit
else
    adb push bin/benchmark_model $BASEPATH
    adb shell chmod 777 $BASEPATH/benchmark_model
    
    adb shell $BASEPATH/benchmark_model --graph="${BASEPATH}/$1" ${@:2} 
fi