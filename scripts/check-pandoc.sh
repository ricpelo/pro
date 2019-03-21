#!/bin/sh

instalar()
{
    local FILE="pandoc-$1-1-amd64.deb"
    local TEMP_DEB="$(mktemp)"
    curl -sL -o $TEMP_DEB "https://github.com/jgm/pandoc/releases/download/$1/$FILE" && sudo dpkg -i $TEMP_DEB && sudo apt -f install
    rm -f $TEMP_DEB
}

VER=$(curl --silent "https://api.github.com/repos/jgm/pandoc/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

if ! dpkg -s pandoc > /dev/null 2>&1; then
    echo "Descargando e instalando Pandoc $VER..."
    instalar $VER
else
    ACTUAL=$(pandoc -v | grep -Po '^pandoc \K.*')
    if [ "$VER" != "$ACTUAL" ]; then
        echo "Actualizando Pandoc de $ACTUAL a $VER..."
        instalar $VER
    fi
fi
