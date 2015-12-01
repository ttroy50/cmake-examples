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
./05-unit-testing/boost \
)

ROOT_DIR=`pwd`

for dir in ${dirs[*]}
do
    echo ""
    echo ""
    echo "Running test for $dir"
    cd $ROOT_DIR
    if [ -d "$ROOT_DIR/$dir/build" ]; then
        echo "deleting $dir/build"
        rm -r $dir/build
    fi

    if [ -f "$dir/pre_test.sh" ]; then
        echo "running pre test"
        $dir/pre_test.sh
    fi

    cd $dir && mkdir -p build && cd build && cmake .. && make
    if [ $? -ne 0 ]; then
        echo "Error running example $dir"
        exit 1
    fi

    if [ -f "$ROOT_DIR/$dir/post_test.sh" ]; then
        echo "running post test"
        $ROOT_DIR/$dir/post_test.sh
    fi
done
