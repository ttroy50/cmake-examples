#!/bin/bash
# https://github.com/jcbhmr/cmakebyexample.dev
set -e

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob
shopt -s extglob
shopt -s dotglob

repls='jcbhmr/cmakebyexampledev-executable
jcbhmr/cmakebyexampledev-static
jcbhmr/cmakebyexampledev-shared'
echo "$repls" | grep "$REPL_OWNER/$REPL_SLUG" || exit

# https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/
rm -rf !(.replit|replit.nix)

git clone https://github.com/jcbhmr/cmakebyexample.dev .git --bare
git config --local --bool core.bare false
# https://stackoverflow.com/a/15404733
git restore -s@ -SW -- "$1"

# Moves up everything from the example folder to the root and then deletes the
# temp stuff that we downloaded and extracted.
mv -f "$1"/* ./
rm -rf .git "$1"
