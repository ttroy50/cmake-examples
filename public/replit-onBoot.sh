#!/bin/bash
# https://github.com/jcbhmr/cmakebyexample.dev
set -ex

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob
shopt -s extglob
shopt -s dotglob

rsync_-av_--delete() {
  cp -avf "$1"/* "$2"
  find "$2" -type d -not -exec test -e "$1/{}" \; -exec rm -rf {} \; -print
  find "$2" -type f -not -exec test -e "$1/{}" \; -exec rm -f {} \; -print
  find "$2" -type d -empty -delete -print
}

declare -A repls=(
  ["@jcbhmr/cmakebyexampledev-executable"]="executable"
  ["@jcbhmr/cmakebyexampledev-static"]="static"
  ["@jcbhmr/cmakebyexampledev-shared"]="shared"
  ["@jcbhmr/cmakebyexampledev-message"]="message"
)
example=${repls["@$REPL_OWNER/$REPL_SLUG"]}
[[ -n $example ]] || exit

temp_dir=$(mktemp -d)
git clone https://github.com/jcbhmr/cmakebyexample.dev "$temp_dir"
rsync_-av_--delete "$temp_dir/$example/" ./
