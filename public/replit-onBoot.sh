#!/bin/bash
set -e
shopt -s nullglob

repo_dir=$(mktemp -d)
git clone https://jcbhmr/cmakebyexample.dev.git "$repo_dir" --depth 1
cp -fv "$repo_dir/$1"/* "$repo_dir/$1"/.* ./
rm -rf "$repo_dir"
