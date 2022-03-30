#!/bin/bash
#ABI=armaebi-v7a
ABI=x86
#ABI=arm64-v8a
#ABI=x86_64
ANDROID_NDK=$HOME/AppData/Local/Android/Sdk/ndk/21.4.7075529
TOOL_CHAIN=${ANDROID_NDK}/build/cmake/android.toolchain.cmake
CMAKE=$HOME/AppData/Local/Android/Sdk/cmake/3.18.1/bin/cmake
mkdir -p ${ABI}
cd ${ABI}
${CMAKE} ../../spdlog -DCMAKE_SYSTEM_NAME=Android -DCMAKE_SYSTEM_VERSION=21 \
-DANDROID_ABI=${ABI} -DCMAKE_TOOLCHAIN_FILE=${TOOL_CHAIN} -DCMAKE_CXX_FLAGS=-D
${CMAKE} --build .