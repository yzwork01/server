#!/bin/bash


# python3 ../build.py -v --enable-logging --enable-stats --endpoint=http --verbose --target-platform=linux --target-machine=x86_64 --backend=python --backend=onnxruntime  --enable-cpu-metrics --enable-metrics --backend=ensemble --no-force-clone \
#     --extra-core-cmake-arg="TRITON_ENABLE_GPU=OFF" \
#     --extra-core-cmake-arg="TRITON_ENABLE_METRICS=ON" \
#     --extra-backend-cmake-arg="python:TRITON_ENABLE_GPU=OFF" \
#     --extra-backend-cmake-arg="python:TRITON_ENABLE_METRICS=ON" \
#     --extra-backend-cmake-arg="ensemble:TRITON_ENABLE_METRICS=ON" \
#     --extra-backend-cmake-arg="onnxruntime:TRITON_ENABLE_GPU=OFF" \
#     --extra-backend-cmake-arg="onnxruntime:TRITON_ENABLE_METRICS=ON"

# python3 ../build.py --enable-logging -j 1 --enable-stats --endpoint=http --endpoint=grpc --verbose --target-platform=linux --backend=python --enable-cpu-metrics --enable-metrics --backend=ensemble --no-force-clone \
#     --extra-core-cmake-arg="TRITON_ENABLE_GPU=OFF" \
#     --extra-core-cmake-arg="TRITON_ENABLE_METRICS=ON" \
#     --extra-backend-cmake-arg="python:TRITON_ENABLE_GPU=OFF" \
#     --extra-backend-cmake-arg="python:TRITON_ENABLE_METRICS=ON" \
#     --extra-backend-cmake-arg="ensemble:TRITON_ENABLE_METRICS=ON" 

# "base,ghcr.io/easybuilders/rockylinux-8.10:2024-11-25-12010010537.117"
# "base,rockylinux:8"
# jurajama/rocky8-python3.11:latest
#nohup 
python3 ../build.py -j 1 --enable-logging --enable-stats --endpoint=http --endpoint=grpc --verbose --target-platform=rhel --image "base,rockylinux:8" --target-machine=x86_64 --backend=python --enable-cpu-metrics --enable-metrics --backend=ensemble --backend=onnxruntime --no-force-clone \
    --extra-core-cmake-arg="TRITON_ENABLE_GPU=OFF" \
    --extra-core-cmake-arg="TRITON_ENABLE_METRICS=ON" \
    --extra-backend-cmake-arg="python:TRITON_ENABLE_GPU=OFF" \
    --extra-backend-cmake-arg="python:TRITON_ENABLE_METRICS=ON" \
    --extra-backend-cmake-arg="onnxruntime:TRITON_ENABLE_GPU=OFF" \
    --extra-backend-cmake-arg="onnxruntime:TRITON_ENABLE_METRICS=ON" \
    --extra-backend-cmake-arg="ensemble:TRITON_ENABLE_METRICS=ON" \
    --extra-core-cmake-arg="-DRapidJSON_DIR=/usr/local/lib/cmake/RapidJSON" \
    --extra-core-cmake-arg="-DCMAKE_EXE_LINKER_FLAGS='-lutil'" \
    --extra-backend-cmake-arg="python:CMAKE_EXE_LINKER_FLAGS='-lutil -lpthread -ldl'" \
    --extra-backend-cmake-arg="python:Python3_LIBRARY=/usr/local/lib/libpython3.11.so" \
    --extra-core-cmake-arg="-DCMAKE_CXX_FLAGS='-I/usr/include'" 
    #> log.txt 2>&1 &


    # --extra-core-cmake-arg="CMAKE_C_COMPILER=/opt/rh/gcc-toolset-9/root/usr/bin/gcc" \
    # --extra-core-cmake-arg="CMAKE_CXX_COMPILER=/opt/rh/gcc-toolset-9/root/usr/bin/g++" \
    # --extra-core-cmake-arg="CMAKE_EXE_LINKER_FLAGS=-lstdc++fs" \
    # --extra-core-cmake-arg="CMAKE_CXX_STANDARD=17" \
    # --extra-core-cmake-arg="CMAKE_CXX_STANDARD_REQUIRED=ON" \



#tail -f log.txt