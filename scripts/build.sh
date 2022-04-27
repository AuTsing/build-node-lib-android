#!/bin/bash -e

workspace=$(realpath "$(dirname "$0")"/../)

arch="arm64"
sdk_ver="26"

cd "$workspace/node"
./android-configure "$NDK_PATH" "$arch" "$sdk_ver"
make -j$(nproc --all)

out_dir="build"

mkdir -p "$workspace/$out_dir/lib"
HEADERS_ONLY=1 python3 ./tools/install.py install "$workspace/$out_dir" /
cp -rpf "./out/Release/libnode.so" "$workspace/$out_dir/lib/libnode.so"
