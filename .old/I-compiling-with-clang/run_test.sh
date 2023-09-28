#!/bin/bash
# Ubuntu supports multiple versions of clang to be installed at the same time.
# The tests need to determine the clang binary before calling cmake
clang_bin=`which clang`
clang_xx_bin=`which clang++`

if [ -z $clang_bin ]; then
    clang_ver=`dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f1 | cut -d '-' -f2`
    clang_bin="clang-$clang_ver"
    clang_xx_bin="clang++-$clang_ver"
fi

echo "Will use clang [$clang_bin] and clang++ [$clang_xx_bin]"


mkdir -p build.clang && cd build.clang && \
    cmake .. -DCMAKE_C_COMPILER=$clang_bin -DCMAKE_CXX_COMPILER=$clang_xx_bin && make
