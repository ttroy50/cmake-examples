#!/bin/bash
set -e
shopt -s nullglob
shopt -s extglob
shopt -s dotglob
[[ $REPL_OWNER != jcbhmr || $REPL_SLUG != "cmakebyexampledev-$1" ]] && exit
rm -rf !(.replit|replit.nix)
git clone https://github.com/jcbhmr/cmakebyexample.dev .git --bare
git config --local --bool core.bare false
git restore -s@ -SW -- "$1"
mv -f "$1"/* ./
rm -rf .git "$1"
