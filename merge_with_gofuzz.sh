#!/bin/bash

GOFUZZ="../../dvyukov/go-fuzz-corpus"


# List directories in ../foo/
foo_dirs=$(find ${GOFUZZ} -maxdepth 1 -type d -not \( -path ${GOFUZZ}/.git -o -path ${GOFUZZ} \) |  sed 's|../../dvyukov/go-fuzz-corpus/||')


for dir in $foo_dirs; do
    echo "Working on $dir"
    mkdir -p $dir/go-fuzz
    find ${GOFUZZ}/$dir -type f -print0 | xargs -0  -I{} cp {} $dir/go-fuzz
done

