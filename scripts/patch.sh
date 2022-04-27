#!/bin/bash -e

workspace=$(realpath "$(dirname "$0")"/../)

cd "$workspace/node"
patches=$(find $workspace/patches/$NODE_VERSION -name \*.patch)
for patch in $patches; do
    echo "Applying patch: $patch"
    patch -p1 <"$patch"
done
