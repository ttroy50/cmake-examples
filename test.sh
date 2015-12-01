#!/bin/bash

dirs=( ./01-basic/A-hello-cmake \
./01-basic/B-hello-headers \
./01-basic/C-static-library \
./01-basic/D-shared-library \
./01-basic/E-installing \
./01-basic/F-build-type \
./01-basic/G-compile-flags \
./01-basic/H-third-party-library \
./02-sub-projects/A-basic \
./03-code-generation/protobuf \
./03-code-generation/configure-files \
./04-static-analysis/cppcheck \
)

ROOT_DIR=`pwd`

for dir in ${dirs[*]}
do
    echo ""
    echo ""
    echo "Running test for $dir"
    cd $ROOT_DIR
    if [ -d "$dir/build" ]; then
        echo "deleting $dir/build"
        rm -r $dir/build
    fi

    cd $dir && mkdir -p build && cd build && cmake .. && make
    if [ $? -ne 0 ]; then
        echo "Error running example $dir"
        exit 1
    fi
done
