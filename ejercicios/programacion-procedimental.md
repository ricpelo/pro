---
title:
- |
  Ejercicios de\
  Programación procedimental
author:
- |
  Ricardo Pérez López\
  IES Doñana
include-before:
- |
  \ifdefined\Highlighting
    \DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\},fontsize=\footnotesize}
  \fi
---

#. Considérese la siguiente fórmula (debida a Herón de Alejandría), que expresa
   el valor de la superficie S de un triángulo cualquiera en función de sus
   lados, a, b y c: $$S = \sqrt{\frac{a+b+c}{2}\left(\frac{a+b+c}{2}-a\right)\left(\frac{a+b+c}{2}-b\right)\left(\frac{a+b+c}{2}-c\right)}$$

    Escribir una función que obtenga el valor $S$ a partir de $a$, $b$ y $c$,
    evitando el cálculo repetido del semiperímetro, $sp = \frac{a+b+c}{2}$, y
    almacenando el resultado finalmente en la variable S.

#. Escribir tres funciones que impriman las siguientes salidas en función de la
   cantidad de líneas que se desean (`␣` es un espacio en blanco):

        *****     ␣*         ␣␣␣␣*␣␣␣␣
        *****     ␣␣*        ␣␣␣***␣␣␣
        *****     ␣␣␣*       ␣␣*****␣␣
        *****     ␣␣␣␣*      ␣*******␣
        *****     ␣␣␣␣␣*     ␣␣␣␣*␣␣␣␣

#. Escribir una función para hallar $\binom{n}{k}$, donde $n$ y $k$ son datos
   enteros positivos,

    a. mediante la fórmula $\frac{n!}{(n-k)!k!}$

    b. mediante la fórmula $\frac{n(n-1)\cdots(k+1)}{(n-k)!}$

    ¿Qué ventajas presenta la segunda con respecto a la primera?
