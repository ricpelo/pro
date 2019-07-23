#!/bin/sh

SOURCE="source"

cat << EOT
---
title: Diapositivas y apuntes
---

Los materiales de las diferentes unidades didácticas se organizan de la siguiente manera:

- **HTML**: Diapositivas para su visualización *online* desde un navegador, por lo que requiere conexión a Internet. Estructura las diapositivas en una matriz de filas y columnas para facilitar la navegación.

- **PDF**: Diapositivas en formato \`PDF\` para su visualización *offline* desde cualquier visor de este tipo de archivos. Por tanto, no requiere conexión a Internet.

- **Apuntes**: El mismo contenido que las diapositivas anteriores en formato \`PDF\` pero de manera continua, formando unos apuntes al estilo tradicional. Más apropiado para imprimir en papel o como guía de estudio.

EOT

FILES=$(grep -Po "@auto $SOURCE/\K.*?(?=<)" index.leo)

echo "| Título | HTML | PDF | Apuntes |"
echo "| ------ |:----:|:---:|:-------:|"

for f in $FILES; do
    FECHA=$(date +'%Y-%m-%d %H:%M:%S %z' --date @$(stat -c %Y $SOURCE/$f))
    HTML="slides/${f%.md}.html"
    PDF="pdf/${f%.md}.pdf"
    APUNTES="apuntes/${f%.md}-apuntes.pdf"
    TITLE=$(grep -Po "^title: \K.*" $SOURCE/$f)
    echo "| <strong>$TITLE</strong><br><small class=\"fecha\">$FECHA</small> | [HTML]($HTML){:target=\"_blank\"} | [PDF]($PDF){:target=\"_blank\"} | [Apuntes]($APUNTES){:target=\"_blank\"}"
done
echo "{:.stretch-table}"
