#!/bin/sh

SOURCE="source"

echo "---\ntitle: Diapositivas\n---\n"

FILES=$(grep -Po "@auto $SOURCE/\K.*?(?=<)" index.leo)

echo "| Título | HTML | PDF | Apuntes |"
echo "| ------ |:----:|:---:|:-------:|"

for f in $FILES; do
    HTML="slides/${f%.md}.html"
    PDF="pdf/${f%.md}.pdf"
    APUNTES="pdf/${f%.md}-apuntes.pdf"
    TITLE=$(grep -Po "^title: \K.*" $SOURCE/$f)
    echo "| $TITLE | [HTML]($HTML){:target=\"_blank\"} | [PDF]($PDF){:target=\"_blank\"} | [Apuntes]($APUNTES){:target=\"_blank\"}"
done
