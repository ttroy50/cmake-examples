#!/bin/bash
set -e

npm install -g prettier

pip install conan

git clone https://github.com/Microsoft/vcpkg.git ~/vcpkg
pushd ~/vcpkg
./bootstrap-vcpkg.sh
export PATH="$PATH:$HOME/vcpkg"
echo 'export PATH="$PATH:$HOME/vcpkg"' >> ~/.bashrc
export PATH="$PATH:$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake"
echo 'export PATH="$PATH:$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake"' >> ~/.bashrc
popd

pushd "$(mktemp -d)"
gh release download -R rust-lang/mdBook -p 'mdbook-v*-x86_64-unknown-linux-gnu.tar.gz'
tar -xzf mdbook-v*-x86_64-unknown-linux-gnu.tar.gz
sudo mv mdbook /usr/local/bin/
rm -rf "$PWD"
popd

pushd "$(mktemp -d)"
gh release download -R catppuccin/mdBook -p mdbook-catppuccin-x86_64-unknown-linux-gnu.tar.gz
tar -xzf mdbook-catppuccin-x86_64-unknown-linux-gnu.tar.gz
sudo mv mdbook-catppuccin-x86_64-unknown-linux-gnu/mdbook-catppuccin /usr/local/bin/
rm -rf "$PWD"
popd
