#!/bin/sh

SOURCE="source"

echo "---\ntitle: Transparencias\n---\n"

FILES=$(grep -Po "@auto $SOURCE/\K.*?(?=<)" index.leo)

for f in $FILES; do
    LINK="slides/${f%.md}.html"
    TITLE=$(grep -Po "^title: \K.*" $SOURCE/$f)
    echo "- [$TITLE]($LINK){:target=\"_blank\"}"
done
