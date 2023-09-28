#!/bin/bash
mkdir -p build && cd build && cmake .. && make format-check
RET=$?
echo "return code was ${RET}"
if [ ${RET} == "0" ]; then
	echo "test failed. Expected format-check to fail"
	exit 1
else
	echo "test success"
	exit 0
fi
