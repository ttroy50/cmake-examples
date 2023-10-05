#!/bin/bash
# https://github.com/jcbhmr/cmakebyexample.dev
set -e

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob
shopt -s extglob
shopt -s dotglob

declare -A repls=(
  ["@jcbhmr/cmakebyexampledev-executable"]="executable"
  ["@jcbhmr/cmakebyexampledev-static"]="static"
  ["@jcbhmr/cmakebyexampledev-shared"]="shared"
)
example=${repls["@$REPL_OWNER/$REPL_SLUG"]}
[[ -n $example ]] || exit

# https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/
rm -rf !(.replit|replit.nix)

git clone https://github.com/jcbhmr/cmakebyexample.dev .git --bare
git config --local --bool core.bare false

# https://stackoverflow.com/a/15404733
git restore -s@ -SW -- "$example"

mv -f "$example"/* ./
rm -rf .git "$example"
