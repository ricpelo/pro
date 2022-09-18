#!/bin/sh

SOURCE="source"
EJERCICIOS="ejercicios"
PRACTICAS="practicas"

cat << EOT
---
title: Diapositivas y apuntes
---

Los materiales de las diferentes unidades didácticas se organizan de la siguiente manera:

- **HTML**: Diapositivas para su visualización *online* desde un navegador, por lo que requiere conexión a Internet. Estructura las diapositivas en una matriz de filas y columnas para facilitar la navegación (**opción recomendada**).

- **PDF**: Diapositivas en formato \`PDF\` para su visualización *offline* desde cualquier visor de este tipo de archivos. Por tanto, no requiere conexión a Internet.

- **Apuntes**: El mismo contenido que las diapositivas anteriores en formato \`PDF\` pero de manera continua, formando unos apuntes al estilo tradicional. Más apropiado para imprimir en papel o como guía de estudio.

Si detectas algún error o algo que corregir o mejorar en los materiales, por favor, no dudes en [abrir una incidencia en GitHub](https://github.com/ricpelo/pro/issues/new){:target="_blank"}.

EOT

FILES=$(grep -Po "@auto $SOURCE/\K.*?(?=<)" index.leo)
FILES="fundamentos.md $FILES"

echo "| Título | HTML | PDF | Apuntes | Ejercicios | Prácticas |"
echo "| ------ |:----:|:---:|:-------:|:----------:|:---------:|"

for f in $FILES; do
    FECHA=$(date +'%Y-%m-%d %H:%M:%S%:z' --date @$(stat -c %Y $SOURCE/$f))
    HTML="slides/${f%.md}.html"
    PDF="pdf/${f%.md}.pdf"
    APUNTES="apuntes/${f%.md}-apuntes.pdf"
    TITLE=$(grep -Po "^title: \K.*" $SOURCE/$f)
    ULTACT="Última actualización"
    echo -n  "| <strong>$TITLE</strong><br><small class=\"fecha\" title=\"$ULTACT\">$FECHA</small>"
    echo -n " | [HTML]($HTML){:target=\"_blank\"}"
    echo -n " | [PDF]($PDF){:target=\"_blank\"}"
    echo -n " | [Apuntes]($APUNTES){:target=\"_blank\"}"
    if [ -f "$EJERCICIOS/$f" ]; then
        EJER="$EJERCICIOS/${f%.md}-ejercicios.pdf"
        FECHA=$(date +'%Y-%m-%d %H:%M:%S%:z' --date @$(stat -c %Y $EJERCICIOS/$f))
        echo -n " | [Ejercicios]($EJER){:target=\"_blank\"}<br>"
        echo -n    "<small class=\"fecha\" title=\"$ULTACT\">$FECHA</small>"
    fi
    if [ -f "$PRACTICAS/$f" ]; then
        PRAC="$PRACTICAS/${f%.md}-practicas.pdf"
        FECHA=$(date +'%Y-%m-%d %H:%M:%S%:z' --date @$(stat -c %Y $PRACTICAS/$f))
        echo -n " | [Prácticas]($PRAC){:target=\"_blank\"}<br>"
        echo -n    "<small class=\"fecha\" title=\"$ULTACT\">$FECHA</small>"
    fi
    echo
done
echo "{:.stretch-table}"
