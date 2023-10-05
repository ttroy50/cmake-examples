#!/bin/bash
set -e
shopt -s nullglob
shopt -s extglob
[[ $REPL_OWNER != jcbhmr || $REPL_SLUG != "cmakebyexampledev-$1" ]] && exit
rm -rf $(ls | grep -v replit)
git clone https://github.com/jcbhmr/cmakebyexample.dev .git --bare
git config --local --bool core.bare false
git restore -s@ -SW -- "$1"
mv -fv "$1"/* "$1"/.* ./
