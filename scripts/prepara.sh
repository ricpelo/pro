#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f "$0")")
SOURCE_DIR=$BASE_DIR/../source

for p in "$SOURCE_DIR"/*.md; do
    if grep -qs '^# .* #$' $p; then
        echo "# Preparando archivo $p..."
        TITULO=$(grep -oP '^## \K.*(?=#)' $p | grep -oP '\*\*\K.*(?=\*\*)')
        TEMP=$(mktemp)
        echo "---\ntitle: $TITULO\nauthor: Ricardo Pérez López\ndate: IES Doñana, curso 2018-19\n---" > $TEMP
        cat $p | sed '/^# .* #$/d' | sed '/^##[^#].*$/d' | sed 's/^##//' >> $TEMP
        mv $TEMP $p
    fi
done
