#!/bin/bash
set -e

pushd c-app-using-quickjs-via-cpm-cmake
cmake -Bbuild
cmake --build build
popd

pushd c-library-using-curl-via-fetchcontent
cmake -Bbuild
cmake --build build
popd

pushd cpp-app-using-ftxui-with-gtest-via-conan
conan install . -s build_type=Debug --build=missing
cmake --preset conan-debug
cmake --build --preset conan-debug
popd
