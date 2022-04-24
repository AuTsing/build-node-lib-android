#!/bin/bash

workspace=$(realpath "$(dirname "$0")"/../)

cd "$workspace/node"
patches=$(find $workspace/patches -name \*.patch)
for patch in $patches; do
    echo "Applying patch: $(basename "$patch")"
    patch -p1 <"$patch"
done
