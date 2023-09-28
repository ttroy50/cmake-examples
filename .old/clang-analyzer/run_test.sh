#!/bin/bash
mkdir -p build \
	&& cd build \
	&& scan-build-3.6 -o scanbuildout cmake .. \
	&& scan-build-3.6 -o scanbuildout make
