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

#. Escribir una función `eliminar_negativos(numeros)` que reciba una lista de
   enteros y elimine todos los números menores que cero modificando la lista
   original (sin crear ni devolver una lista nueva).

#. Escribir la función `ordenar_burbuja(lista)` que ordene una lista de números
   de menor a mayor mediante el algoritmo de la burbuja.

#. Escribir una función `eliminar_duplicados(lista)` que reciba una lista de
   elementos y la modifique eliminando los elementos repetidos, de forma que
   sólo aparezcan una vez, en el mismo orden en el que aparecen en la lista.

   Ejemplo:

   ```python
   >>> datos = [1, 2, 4, 3, 2, 4, 5, 6, 2]
   >>> eliminar_duplicados(datos)
   >>> print(datos)
   [1, 2, 4, 3, 5, 6]
   ```

#. Escribir una función `eliminar_duplicados_consecutivos(lista)` que reciba
   una lista de elementos y la modifique eliminando los elementos repetidos que
   aparezcan de forma consecutiva, de forma que sólo aparezcan una vez, en el
   mismo orden en el que aparecen en la lista.

   Ejemplo:

   ```python
   >>> datos = [1, 1, 2, 2, 2, 3, 1, 1]
   >>> eliminados = eliminar_duplicados_consecutivos(datos)
   >>> print(eliminados)
   4
   >>> print(datos)
   [1, 2, 3, 1]
   ```

   (Nota: El último `1` no se elimina porque no es consecutivo a los primeros).

#. Escribir una función `analizar_diagonales(matriz)` que reciba una lista de
   listas de números, de forma que:

   - Si la matriz está vacía o no es cuadrada (es decir, alguna fila no tiene
     la misma longitud que el número total de filas), debe devolver `None`.

   - Si es cuadrada, debe devolver una tupla (_suma principal_, _suma
     secundaria_) con la suma de su diagonal principal y su diagonal
     secundaria.

#. Escribir una función `disparar(tablero, fila, columna)` que reciba una
   matriz 2D (lista de listas) que representa un tablero de _Hundir la Flota_,
   donde:

   - `"~"` es agua.

   - `"B"` es un barco.

   - `"X"` es barco tocado y `"O"` es un disparo fallido (agua en la que se ha
     disparado previamente).

   La función debe comprobar las coordenadas, de forma que:

   - Si están fuera de los límites del tablero, imprime `"Coordenada
     incorrecta"`.

   - Si hay `"B"`, lo cambia a `"X"` e imprime `"¡Tocado!"`.

   - Si hay `"~"`, lo cambia a `"O"` e imprime `"Agua"`. Si ya se había
     disparado ahí (`"X"` o `"O"`), imprime `"Ya disparaste aquí"`.

#. Escribir una función `calcular_nota_final(peso_examen, *notas_practicas,
   penalizacion=0)` que reciba:

   - `peso_examen`: un `float` entre `0.0` y `1.0` (por ejemplo, `0.6`
     representa el 60 % de la nota).

   - `*notas_practicas`: una cantidad variable de notas numéricas (entre `0` y
     `10`). La última nota recibida en `*notas_practicas` corresponde siempre a
     la nota del examen, y las anteriores a las prácticas.

   - `penalizacion`: parámetro opcional por palabra clave (por defecto vale
     `0`) que se resta directamente a la nota calculada.

   Condiciones de evaluación:

   - Si no se pasa al menos una práctica y un examen (es decir, menos de 2
     notas en total), debe lanzar un `ValueError` con el mensaje de error
     `"Faltan notas para calcular"`.

   - La nota final nunca puede ser menor que `0.0` ni mayor que `10.0`,
     redondeada a 2 decimales.

