#!/bin/bash
mkdir -p build && cd build && cmake -DCPPCHECK_ERROR_EXITCODE_ARG="" .. && make cppcheck-analysis
