#!/bin/sh

SOURCE="source"

echo "---\ntitle: Diapositivas\n---\n"

FILES=$(grep -Po "@auto $SOURCE/\K.*?(?=<)" index.leo)

echo "| Título | HTML | PDF |"
echo "| ------ | ---- | --- |"

for f in $FILES; do
    HTML="slides/${f%.md}.html"
    PDF="pdf/${f%.md}.pdf"
    TITLE=$(grep -Po "^title: \K.*" $SOURCE/$f)
    echo "| $TITLE | [HTML]($HTML){:target=\"_blank\"} | [PDF]($PDF){:target=\"_blank\"} |"
done
