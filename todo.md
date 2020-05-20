install prerequisites (ci_build/install_deb_packages)
weird issue (python3.5m to /usr/include)

Tips : 
https://stackoverflow.com/questions/24357687/how-to-include-so-library-in-android-studio

Benchmark tools:
https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/tools/benchmark
# NDK 17.* build fails -> Use 18.1.5063045 


//BuiltinOpResolver : register TfLiteRegistration (built-in ops(math functions), custom ops)

// Initialization

InterpreterBuilder(Model , BuiltinOpResolver) -> interpreter

TfLiteGpuDelegateCreate(DelegateOptions) -> delegate 
// options => precision type, etc ...

interpreter->ModifyGraphWithDelegate(delegate) 
// loop through subgraphs

// Run time
    WriteToInputTensor(interpreter->typed_input_tensor<float>(0));

    interpreter->Invoke()

    ReadFromOutputTensor(interpreter->typed_output_tensor<float>(0));

// Clean up.
TfLiteGpuDelegateDelete(delegate);