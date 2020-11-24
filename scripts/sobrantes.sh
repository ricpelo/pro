#!/bin/sh

a="[[({]"
z="[])}]"

for archivo in $1/*; do
    archivo=$(basename -- "$archivo")
    if ! grep -q "$a$archivo$z" $2/*.md; then
        nombre="${archivo%.*}"
        extension="${archivo##*.}"
        if [ "$extension" = "svg" ] || [ "$extension" = "pdf" ]; then
            if ! grep -q "$a$nombre.!EXT$z" $2/*.md; then
                echo $archivo
            else
                for ext in svg pdf; do
                    if [ ! -f "$1/$nombre.$ext" ]; then
                        echo "*** Falta: $nombre.$ext ***"
                    fi
                done
            fi
        else
            echo $archivo
        fi
    fi
done
