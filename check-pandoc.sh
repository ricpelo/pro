#!/bin/sh

VER="2.1"
FILE="pandoc-$VER-1-amd64.deb"

if ! dpkg -s pandoc > /dev/null 2>&1
then
    echo "Descargando e instalando Pandoc $VER..."
    wget -q "https://github.com/jgm/pandoc/releases/download/$VER/$FILE"
    sudo dpkg -i $FILE
    rm -f $FILE
    sudo apt -f install
fi
