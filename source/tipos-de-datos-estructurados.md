---
title: Tipos de datos estructurados
author: Ricardo Pérez López
!DATE
---

# Introducción

## Conceptos

- Un **dato estructurado** o **dato compuesto** es un dato formado, a su vez,
  por otros datos llamados **componentes** o **elementos**.

- Un **tipo de dato estructurado**, también llamado **tipo compuesto**, es
  aquel cuyos valores son datos estructurados.

- Frecuentemente se puede acceder de manera individual a los elementos que
  componen un dato estructurado y a veces, también, se pueden modificar de
  manera individual.

- El término **estructura de datos** se suele usar como sinónimo de **tipo de
  dato estructurado**, aunque nosotros haremos una distinción:

  - Usaremos **tipo de dato estructurado** cuando usemos un dato sin conocer
    sus detalles internos de implementación.

  - Usaremos **estructura de datos** cuando nos interesen esos detalles
    internos.

# Secuencias

## Concepto de secuencia

- Una secuencia es una estructura de datos que:

  - permite el acceso eficiente a sus elementos usando índices enteros, y

  - se le puede calcular su longitud mediante la función `len`.

- Las secuencias se dividen en:

  - **Inmutables**: cadenas (`str`), tuplas (`tuple`), rangos (`range`).

  - **Mutables**: listas (`list`), principalmente.

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

$x$ `not` `in` $s$        `False` si algún elemento de $s$ es igual a $x$

$s$ `+` $t$               La concatenación de $s$ y $t$

$s$ `*` $n$ \             Equivale a añadir $s$ a sí mismo $n$ veces
$n$ `*` $s$
                         
$s$`[`$i$`]`              El $i$-ésimo elemento de $s$, empezando por 0
                         
$s$`[`$i$`:`$j$`]`        Rodaja de $s$ desde $i$ hasta $j$
                         
$s$`[`$i$`:`$j$`:`$k$`]`  Rodaja de $s$ desde $i$ hasta $j$ con paso $k$

`len(`$s$`)`              Longitud de $s$
                         
`min(`$s$`)`              El elemento más pequeño de $s$
                         
`max(`$s$`)`              El elemento más grande de $s$

$s$`.index(`$x$ [`, `     El índice de la primera aparición de $x$ en $s$
$i$ [`, `$j$ ] ]`)`       (desde el índice $i$ inclusive y antes del $j$)

$s$`.count(`$x$`)`        Número total de apariciones de $x$ en $s$
------------------------------------------------------------------------

## Inmutables

### Cadenas (`str`)

#### Funciones

#### Métodos

#### Expresiones regulares

### Tuplas

- Las tuplas son secuencias inmutables, usadas frecuentemente para almacenar
  colecciones de datos heterogéneos (de tipos distintos).

- También se usan en aquellos casos en los que se necesita una secuencia
  inmutable de datos homogéneos (por ejemplo, para almacenar datos en un
  conjunto o un diccionario).

- Las tuplas se pueden crear:

  - Con paréntesis vacíos, para representar la tupla vacía: `()`

  - Usando una coma detrás de un único elemento:
    
    `a,`

    `(a,)`

  - Separando los elementos con comas:

    `a, b, c`

    `(a, b, c)`

  - Usando la función `tuple()`

---

- Observar que lo que construye la tupla es realmente la coma, no los
  paréntesis.

- Los paréntesis son opcionales, excepto en dos casos:

  - La tupla vacía: `()`

  - Cuando son necesarios para evitar ambigüedad.

    Por ejemplo, `f(a, b, c)` es una llamada a función con tres argumentos,
    mientras que `f((a, b, c))` es una llamada a función con un único argumento
    que es una tupla de tres elementos.

- Las tuplas implementan todas las operaciones comunes de las secuencias.

### Rangos

- Los **rangos** representan secuencias inmutables de números y se usan
  frecuentemente para hacer bucles que se repitan un determinado número de
  veces.

- Los rangos se crean con la función `range()`:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(rangos) ::= !T{range(}!NT(fin)!T{)}
                  | !T{range(}!NT(inicio)!T(,) !NT(fin)[!T(,) !NT(paso)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde !NT(inicio), !NT(fin) y !NT(paso) son números enteros.

  - Si se omite !NT(inicio), su valor por defecto es 0.

  - Si se omite !NT(paso), su valor por defecto es 1.

---

- El contenido de un rango $r$ vendrá determinado por la fórmula $r[i] = inicio
  + fin \cdot i$, donde $i \geq 0$. Además:

  - Si el paso es positivo, se impone también la restricción $r[i] < fin$.

  - Si el paso es negativo, se impone también la restricción $r[i] > fin$.

- Un rango es vacío cuando $r[0]$ no satisface las restricciones anteriores.

- Los rangos admiten índices negativos, pero se interpretan como si se indexara
  desde el final de la secuencia usando índices positivos.

- Los rangos implementan todas las operaciones de las secuencias, *excepto* la
  concatenación y la repetición.

  Esto es debido a que los rangos sólo pueden representar secuencias que siguen
  un patrón muy estricto, y las repeticiones y las concatenaciones a menudo
  violan ese patrón.

- Los rangos ocupan mucha menos memoria que las listas o las tuplas.

---

- Ejemplos:

  ```python
  >>> list(range(10))
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  >>> list(range(1, 11))
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  >>> list(range(0, 30, 5))
  [0, 5, 10, 15, 20, 25]
  >>> list(range(0, 10, 3))
  [0, 3, 6, 9]
  >>> list(range(0, -10, -1))
  [0, -1, -2, -3, -4, -5, -6, -7, -8, -9]
  >>> list(range(0))
  []
  >>> list(range(1, 0))
  []
  ```

---

- Dos rangos son considerados iguales si representan la misma secuencia de
  valores, sin importar si tienen distintos valores de !NT(inicio), !NT(fin) o
  !NT(paso).

- Por ejemplo:

  ```python
  >>> range(0) == range(2, 1, 3)
  True
  >>> range(0, 3, 2) == range(0, 4, 2)
  True
  ```

## Mutables

### Listas

- Las **listas** son secuencias *mutables*, usadas frecuentemente para
  almacenar colecciones de elementos heterogéneos.

- Se pueden construir de varias maneras:

  - Usando corchetes vacíos para representar la lista vacía: `[]`

  - Usando corchetes y separando los elementos con comas:
  
    `[a]`
    
    `[a, b, c]`

  - Usando una lista por comprensión: `[`$x$ `for` $x$ `in` !NT(iterable)`]`

  - Usando la función `list`: `list()` o `list(`!NT{iterable}`)`

---

- La función `list` construye una lista cuyos elementos son los mismos (y están
  en el mismo orden) que los elementos de !NT(iterable).

- !NT(iterable) puede ser:

  - una secuencia,

  - un contenedor sobre el que se pueda iterar, o

  - un iterador.

- Si se llama sin argumentos, devuelve una lista vacía.

- Por ejemplo:

  ```python
  >>> list('abc')
  ['a', 'b', 'c']
  >>> list( (1, 2, 3) )
  [1, 2, 3]
  ```

---

- En la siguiente tabla, `s` es una instancia de un tipo de secuencia mutable
  (en nuestro caso, una lista), `t` es cualquier dato iterable y `x` es un dato
  cualquiera que cumple con las restricciones que impone `s`:

<br>
\vspace{1em}

------------------------------------------------------------------------
Operación                 Resultado
------------------------- ----------------------------------------------
$s$`[`$i$`]` `=` $x$      El elemento $i$ de $s$ se sustituye por $x$

$s$`[`$i$`:`$j$`]`        La rodaja de $s$ desde $i$ hasta $j$ se sustituye por
`=` $t$                   el contenido del iterable $t$

`del` $s$`[`$i$`:`$j$`]`  Igual que $s$`[`$i$`:`$j$`]` `=` `[]`

$s$`[`$i$`:`$j$`:`$k$`]`  Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se
`=` $t$                   sustituyen por los de $t$

`del`                     Elimina de la secuencia los elementos de
$s$`[`$i$`:`$j$`:`$k$`]`  $s$`[`$i$`:`$j$`:`$k$`]`
                         
------------------------------------------------------------------------

---

-------------------------------------------------------------------------------------------
Operación              Resultado
---------------------- --------------------------------------------------------------------
$s$`.append(`$x$`)`    Añade $x$ al final de la secuencia; es igual que \
                       $s$`[len(`$s$`):len(`$s$`)]` `=` `[`$x$`]`
                      
$s$`.clear()`          Elimina todos los elementos de $s$; es igual que \
                       `del` $s$`[:]`
                      
$s$`.copy()`           Crea una copia *superficial* de $s$; es igual que $s$`[:]`

$s$`.extend(`$t$`)` \  Extiende $s$ con el contenido de $t$; es como hacer \
$s$ `+=` $t$           $s$`[len(`$s$`):len(`$s$`)]` `=` $t$ 
                      
$s$ `*=` $n$           Modifica $s$ repitiendo su contenido $n$ veces
                      
`max(`$s$`)`           El elemento más grande de $s$

$s$`.insert(`$i$`,     Inserta $x$ en $s$ en el índice $i$; es igual que
`$x$`)`                $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$`.pop(`[ $i$ ]`)`   Extrae el elemento $i$ de $s$ y lo devuelve (por
                       defecto, $i$ vale $-1$)

$s$`.remove(`$x$`)`    Quita el primer elemento de $s$ que sea igual a $x$

$s$`.reverse()`        Invierte los elementos de $s$
-------------------------------------------------------------------------------------------

---

- Las listas, además, admiten el método `sort()`:

  ```python
  >>> x = [3, 6, 2, 9, 1, 4]
  >>> x.sort()
  >>> x
  [1, 2, 3, 4, 6, 9]
  >>> x.sort(reverse=True)
  >>> x
  [9, 6, 4, 3, 2, 1]
  ```

# Estructuras no secuenciales

## Conjuntos (`set` y `frozenset`)

- Un conjunto es una colección no ordenada de elementos *hashables*. Se usan
  frecuentemente para comprobar si un elemento pertenece a un grupo, para
  eliminar duplicados en una secuencia y para realizar operaciones matemáticas
  como la unión, la intersección y la diferencia simétrica.

- Como cualquier otra colección, los conjuntos permiten el uso de:

  - $x$ `in` $c$
  - `len(`$c$`)`
  - `for` $x$ `in` $c$

- Como son colecciones no ordenadas, los conjuntos no almacenan la posición de
  los elementos o el orden en el que se insertaron.
  
- Además, tampoco admite la indexación, las rodajas ni cualquier otro
  comportamiento propio de las secuencias.

---

- Existen dos tipos predefinidos de conjuntos: `set` y `frozenset`.

- El tipo `set` es mutable, es decir, que su contenido puede cambiar usando
  métodos como `add()` y `remove()`.

  - Como es mutable, no tiene valor *hash* y, por tanto, no puede usarse como
    clave de un diccionario o como elemento de otro conjunto.

- El tipo `frozenset` es inmutable y *hashable*. Por tanto, su contenido no se
  puede cambiar una vez creado y puede usarse como clave de un diccionario o
  como elemento de otro conjunto.

- Los conjuntos se crean con las funciones `set()` y `frozenset()`.

- Además, los conjuntos `set` no vacíos se pueden crear encerrando entre llaves
  una lista de elementos separados por comas: `{'pepe', 'juan'}`.

### Operaciones

- `s` y `o` son conjuntos, y `x` es un valor cualquiera:

---------------------------------------------------------------------------------------------
Operación                Resultado
------------------------ --------------------------------------------------------------------
`len(`$s$`)`             Número de elementos de $s$ (su cardinalidad)
                       
$x$ `in` $s$             `True` si $x$ pertenece a $s$
                       
$x$ `not` `in` $s$       `True` si $x$ no pertenece a $s$

$s$`.isdisjoint(`$o$`)`  `True` si $s$ no tiene ningún elemento en común con $o$

$s$`.issubset(`$o$`)` \  `True` si $s$ es un subconjunto de $o$
$s$ `<=` $o$
                      
$s$ `<` $o$              `True` si $s$ es un subconjunto propio de $o$
                      
$s$`.isuperset(`$o$`)` \ `True` si $s$ es un superconjunto de $o$
$s$ `>=` $o$
                      
$s$ `<` $o$              `True` si $s$ es un superconjunto propio de $o$
---------------------------------------------------------------------------------------------

---

------------------------------------------------------------------------------------------------
Operación                           Resultado
---------------------------         ------------------------------------------------------------
$s$`.union(`$o$`)` \                Unión de $s$ y $o$ ($s \cup o$)
$s$ | $o$                           
                                    
$s$`.intersection(`$o$`)` \         Intersección de $s$ y $o$ ($s \cap o$)
$s$ & $o$                           
                                    
$s$`.difference(`$o$`)` \           Diferencia entre $s$ y $o$ ($s \setminus o$)
$s$ - $o$

$s$`.symmetric_difference(`$o$`)` \ Diferencia simétrica entre $s$ y $o$ ($s \triangle o$)
$s$ ^ $o$

$s$`.copy()`                        Devuelve una copia superficial de $s$
------------------------------------------------------------------------------------------------

---

- Tanto `set` como `frozenset` admiten comparaciones entre conjuntos.

- Dos conjuntos son iguales si y sólo si cada elemento de un conjunto pertenece
  también al otro conjunto, y viceversa; es decir, si cada uno es un
  subconjunto del otro.

- Un conjunto es menor que otro si y sólo si el primer conjunto está contenido
  en el otro; es decir, si el primero es un subconjunto propio del segundo (es
  un subconjunto, pero no es igual).

- Un conjunto es mayor que otro si y sólo si el primero es un superconjunto
  propio del segundo (es un superconjunto, pero no es igual).

### Operaciones sobre conjuntos mutables

- Estas tablas sólo se aplica a conjuntos mutables (o sea, al tipo `set` y no
  al `frozenset`):

-------------------------------------------------------------------------------------------------------
Operación                                  Resultado
---------------------------                ------------------------------------------------------------
$s$`.update(`$o$`)` \                      Actualiza $s$ añadiendo los elementos de $o$
$s$ |= $o$                           
                                    
$s$`.intersection_update(`$o$`)` \         Actualiza $s$ manteniendo sólo los elementos que están en $s$ y $o$
$s$ &= $o$                           
                                    
$s$`.difference_update(`$o$`)` \           Actualiza $s$ eliminando los elementos que están en $o$
$s$ -= $o$

$s$`.symmetric_difference_update(`$o$`)` \ Actualiza $s$ manteniendo sólo los elementos que están en $s$ y $o$
$s$ ^= $o$                                 pero no en ambos
-------------------------------------------------------------------------------------------------------

---

----------------------------------------------------------------------------------
Operación             Resultado
--------------------- ------------------------------------------------------------
$s$`.add(`$x$`)`      Añade $x$ a $s$

$s$`.remove(`$x$`)`   Elimina $x$ de $s$ (devuelve `KeyError` si $x$ no está en $s$)

$s$`.discard(`$x$`)`  Elimina $x$ de $s$ si está en $s$

$s$`.pop()`           Elimina y devuelve un valor cualquiera de $s$ (devuelve
                      `KeyError` si $s$ está vacío)

$s$`.clear()`         Elimina todos los elementos de $s$
-----------------------------------------------------------------------------------

## Diccionarios (`dict`)

### *Hashables*

# Iterables

## Iteradores

