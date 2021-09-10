IMAGE_NAME=$(docker ps | grep vsc-tflite | awk 'NF>1{print $NF}')
docker cp $IMAGE_NAME://workspaces/tflite/benchmark_model benchmark_model

