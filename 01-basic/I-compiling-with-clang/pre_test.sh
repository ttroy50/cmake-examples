#!/bin/bash

ROOT_DIR=`pwd`
dir="01-basic/I-compiling-with-clang"

if [ -d "$ROOT_DIR/$dir/build.clang" ]; then
    echo "deleting $dir/build.clang"
    rm -r $dir/build.clang
fi
