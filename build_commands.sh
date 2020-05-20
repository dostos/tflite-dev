# tf lite + debug (fission, gsplit-dwarf for symbol generation)
bazel build -c dbg --copt=-g --jobs=9 --fission=yes --cxxopt=-gsplit-dwarf --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \
  --host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
  //tensorflow/lite/java:tensorflow-lite-gpu //tensorflow/lite/java:tensorflow-lite

# tf lite + release (opt)
bazel build -c opt --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \                                         
--host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
//tensorflow/lite/java:tensorflow-lite-gpu //tensorflow/lite/java:tensorflow-lite

# binary
bazel build -c opt tensorflow/lite/tools/benchmark:benchmark_model




