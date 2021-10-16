#!/bin/bash

exec < $1
read header

echo -E '\begin{center}'
echo -E '\small'
echo -E '\begin{longtable}{|c|c|c|}'
echo -E '\hline'
echo -E '\textbf{Resultado de aprendizaje} & \textbf{Criterio de evaluación} & \textbf{Porcentaje}\tabularnewline'
echo -E '\hline'
echo -E '\hline'
echo -E '\endhead'

while IFS="," read -r col1 col2 col3 col4
do
    col3=$(echo $col3 | cut -d'"' -f2)
    col3=$(echo "$col3 * 100" | bc)
    col3=$(echo $col3 | cut -d. -f1)
    col3="$col3,0\%"
    if [ -n "$viejo" -a "$viejo" != "$col1" ]; then
        echo -E '\hline'
    fi
    echo -nE "RA$col1 \\ra$col1 & CE$col1.$col2 \ce{$col1$col2} & $col3"
    echo -E ' \tabularnewline'
    echo -E '\hline'
    viejo=$col1
done

echo -E '\end{longtable}'
echo -E '\par\end{center}'
