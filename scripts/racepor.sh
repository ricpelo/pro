#!/bin/bash

exec < $1
read header

echo -E '\begin{center}'
echo -E '\small'
echo -E '\begin{longtable}{|c|c|c|}'
echo -E '\hline'
echo -E '\textbf{Resultado de aprendizaje} (\RA{$i$})& \textbf{Criterio de evaluación} (\CE{$i$}{$j$}) & \textbf{Porcentaje} $(p_{ij})$ \\'
echo -E '\hline'
echo -E '\hline'
echo -E '\endhead'

while IFS="," read -r col1 col2 col3 col4
do
    col3=$(echo $col3 | cut -d'"' -f2)
    col3=$(echo "$col3 * 100" | bc)
    col3=$(echo $col3 | cut -d. -f1)
    col3="$col3,0\%"
    if [ -n "$viejo" ]; then
        if [ "$viejo" != "$col1" ]; then
            echo -E ' \\ \hline'
        else
            echo -E ' \\ \cline{2-3}'
        fi
    fi
    if [ "$col1$col2" == "2a" -o "$col1$col2" == "6a" ]; then
        echo -nE '\pagebreak '
    fi
    echo -nE "\RA{$col1} \\ra$col1 & \CE{$col1}{$col2} \ce{$col1$col2} & $col3"
    viejo=$col1
done

echo -E ' \\ \hline'
echo -E '\end{longtable}'
echo -E '\par\end{center}'
