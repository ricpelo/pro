---
title: Tipos de datos estructurados
author: Ricardo Pérez López
!DATE
---

# Secuencias

## Concepto de secuencia

- Una secuencia es una estructura de datos que:

  - soporta el acceso eficiente a sus elementos usando índices enteros y,

  - se le puede calcular su longitud mediante la función `len`.

- Las secuencias más importantes son las cadenas, las listas, las tuplas y los
  rangos.

## Operaciones comunes

- Todas las secuencias (ya sean cadenas, listas, tuplas o rangos) comparten un
  conjunto de operaciones comunes.

- Además de estas operaciones, las secuencias del mismo tipo admiten
  comparaciones. Las tuplas y las listas se comparan lexicográficamente
  elemento a elemento.

  - Eso significa que dos secuencias son iguales si cada elemento es igual y
    las dos secuencias son del mismo tipo y tienen la misma longitud.

- La siguiente tabla enumera las operaciones sobre secuencias, ordenadas por
  prioridad ascendente. `s` y `t` son secuencias del mismo tipo, `n`, `i`, `j`
  y `k` son enteros y `x` es un dato cualquiera que cumple con las
  restricciones que impone `s`.

---

------------------------------------------------------------------------
Operación                 Resultado
------------------------- ----------------------------------------------
$x$ `in` $s$              `True` si algún elemento de $s$ es igual a $x$

$x$ `not in` $s$          `False` si algún elemento de $s$ es igual a $x$

$s$ `+` $t$               La concatenación de $s$ y $t$

$s$ `*` $n$ \             Equivale a añadir $s$ a sí mismo $n$ veces
$n$ `*` $s$
                         
$s$`[`$i$`]`              El $i$-ésimo elemento de $s$, empezando por 0
                         
$s$`[`$i$`:`$j$`]`        Rodaja de $s$ desde $i$ hasta $j$
                         
$s$`[`$i$`:`$j$`:`$k$`]`  Rodaja de $s$ desde $i$ hasta $j$ con paso $k$

`len(`$s$`)`              Longitud de $s$
                         
`min(`$s$`)`              El elemento más pequeño de $s$
                         
`max(`$s$`)`              El elemento más grande de $s$

$s$`.index(`$x$[`, `      El índice de la primera aparición de $x$ en $s$
$i$[`, `$j$]]`)`          (desde el índice $i$ inclusive y antes del $j$)

$s$`.count(`$x$`)`        Número total de apariciones de $x$ en $s$
------------------------------------------------------------------------

## Cadenas (`str`)

### Operadores

#### Concatenación

#### Repetición

#### Indexación

#### *Slicing*

### Funciones

### Métodos

### Expresiones regulares

## Listas

## Tuplas

## Rangos

# Conjuntos (`set` y `frozenset`)

# Diccionarios (`dict`)

# Iterables

## Iteradores

