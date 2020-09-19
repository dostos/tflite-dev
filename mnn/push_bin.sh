PATH=/data/local/tmp/mnn

adb shell rm -r /data/local/tmp/mnn/bin
adb push bin /data/local/tmp/mnn
adb shell chmod 777 /data/local/tmp/mnn/bin/benchmark.out
adb shell LD_LIBRARY_PATH=/data/local/tmp/mnn/bin /data/local/tmp/mnn/bin/benchmark.out model/ 3 3 3