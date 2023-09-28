#!/bin/bash
set -e

pushd hello-world
cmake -B build
cmake --build build
popd
