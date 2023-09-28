#!/bin/bash
set -e

pushd hello-world
cmake -B build
cmake --build build
popd

pushd two-executables
cmake -B build
cmake --build build
popd
