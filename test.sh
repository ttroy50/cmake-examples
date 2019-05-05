#!/bin/bash

# print out cmake information to help with debugging.

cmake --version
cmake --help

# Find the directory this test script is in and then run them from there
EXAMPLES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "running examples in $EXAMPLES_DIR"

cd $EXAMPLES_DIR

dirs=(./01-basic/A-hello-cmake \
./01-basic/B-hello-headers \
./01-basic/C-static-library \
./01-basic/D-shared-library \
./01-basic/E-installing \
./01-basic/F-build-type \
./01-basic/G-compile-flags \
./01-basic/H-third-party-library \
./01-basic/I-compiling-with-clang \
./01-basic/J-building-with-ninja \
./01-basic/K-imported-targets \
./01-basic/L-cpp-standard/i-common-method \
./01-basic/L-cpp-standard/ii-cxx-standard \
./01-basic/L-cpp-standard/iii-compile-features \
./02-sub-projects/A-basic \
./03-code-generation/protobuf \
./03-code-generation/configure-files \
./04-static-analysis/cppcheck \
./04-static-analysis/cppcheck-compile-commands \
./04-static-analysis/clang-analyzer \
./04-static-analysis/clang-format \
./05-unit-testing/boost \
./05-unit-testing/google-test-download \
./05-unit-testing/catch2-vendored \
./06-installer/deb \
./07-package-management/D-conan/i-basic \
./07-package-management/D-conan/ii-basic-targets \
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
        $ROOT_DIR/$dir/pre_test.sh
        if [ $? -ne 0 ]; then
            echo "Error running pre_test for $dir"
            exit 1
        fi
    fi

    if [ -f "$dir/run_test.sh" ]; then
        echo "running run_test"
        cd $dir && $ROOT_DIR/$dir/run_test.sh
        if [ $? -ne 0 ]; then
            echo "Error running run_test for $dir"
            exit 1
        fi
    else
        cd $dir && mkdir -p build && cd build && cmake .. && make
        if [ $? -ne 0 ]; then
            echo "Error running example $dir"
            exit 1
        fi
    fi

    if [ -f "$ROOT_DIR/$dir/post_test.sh" ]; then
        echo "running post test"
        $ROOT_DIR/$dir/post_test.sh
        if [ $? -ne 0 ]; then
            echo "Error running post_test for $dir"
            exit 1
        fi
    fi
done

echo ""
echo ""
echo "All Tests Completed"
