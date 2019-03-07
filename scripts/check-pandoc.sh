#!/bin/sh

instalar()
{
    wget -q "https://github.com/jgm/pandoc/releases/download/$VER/$FILE"
    sudo dpkg -i $FILE
    rm -f $FILE
    sudo apt -f install
}

VER=$(curl --silent "https://api.github.com/repos/jgm/pandoc/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
FILE="pandoc-$VER-1-amd64.deb"

if ! dpkg -s pandoc > /dev/null 2>&1; then
    echo "Descargando e instalando Pandoc $VER..."
    instalar
else
    ACTUAL=$(pandoc -v | grep -Po '^pandoc \K.*')
    if [ "$VER" != "$ACTUAL" ]; then
        echo "Actualizando Pandoc de $ACTUAL a $VER..."
        instalar
    fi
fi
