#!/bin/sh

for p in $1/*; do
    grep -q "$(basename $p)" $2/*.md || echo $p
done
