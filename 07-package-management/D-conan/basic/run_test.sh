#!/bin/bash

conan_bin=`which conan`

if [ -z $conan_bin ]; then
    exit 0
fi

conan profile show default || {
    conan profile new default --detect
}
conan profile update settings.compiler.libcxx=libstdc++11 default

echo "correct version of cmake"
mkdir -p build && cd build && conan install .. && cmake .. && make
if [ $? -ne 0 ]; then
    echo "Error running example"
    exit 1
fi
