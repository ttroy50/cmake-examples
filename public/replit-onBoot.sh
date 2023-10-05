#!/bin/bash
set -e
shopt -s nullglob
temp_dir=$(mktemp -d)
git clone https://github.com/jcbhmr/cmakebyexample.dev "$temp_dir"
rm -rf * .*
mv -f "$temp_dir/$1"/* "$temp_dir/$1"/.* ./
