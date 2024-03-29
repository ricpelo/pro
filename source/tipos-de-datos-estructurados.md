---
title: Tipos de datos estructurados
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate
---

# Introducción

## Composición

- Hasta ahora, hemos aprendido que:

  - Un programa está compuesto por _instrucciones_.

  - Las instrucciones de un programa son las _expresiones_ y las _sentencias_.

- Además, hemos visto que podemos crear instrucciones más complejas a partir de
  otras más simples. Es decir:

  - Podemos crear _expresiones más complejas_ combinando entre sí expresiones
    más simples.

  - Podemos crear _sentencias compuestas_ (estructuras de control, como
    bloques, condicionales, bucles, etc.) combinando entre sí otras sentencias.

- La propiedad que tienen los lenguajes de programación de crear elementos más
  complejos combinando otros más simples se denomina **composición**.

---

- La **abstracción** y la **composición** son dos conceptos relacionados:

  - _Componer_ consiste en combinar elementos entre sí para formar otros más
    complejos.

  - _Abstraer_ consiste en coger un elemento (normalmente complejo), darle un
    nombre y ocultar sus detalles internos (es decir, los elementos que lo
    componen) dentro de una caja negra.

- Lo interesante es que la combinación y la abstracción son dos mecanismos
  _recursivos_:

  - Podemos crear elementos complejos a partir de otros elementos complejos.

  - Podemos crear abstracciones a partir de otras abstracciones.

- Además, por supuesto, podemos crear abstracciones a partir de composiciones y
  composiciones a partir de abstracciones.

---

- Por ahora, esos conceptos (_composición_ y _abstracción_) sólo los hemos
  aplicado a las **instrucciones** del programa:

  - La **composición de instrucciones** da lugar a las **expresiones
    compuestas** y a las **sentencias compuestas** (también llamadas
    **estructuras de control**: _secuencia_, _selección_ e _iteración_).

  - La **abstracción de instrucciones** da lugar a las **abstracciones
    funcionales**.

- Pero también se pueden aplicar a los **datos**:

  - La **composición de datos** da lugar a los **datos compuestos** (también
    llamados **datos estructurados**) y, en consecuencia, a los **tipos de
    datos compuestos** (también llamados **tipos de datos estructurados**).

  - La **abstracción de datos** da lugar a los **datos abstractos** y, en
    consecuencia, a los **tipos abstractos de datos**.

- En esta unidad hablaremos de la composición de datos y dejaremos la
  abstracción de datos para una unidad posterior.

## Conceptos básicos

- Un **dato estructurado** (también llamado **dato compuesto**, **colección** o
  **contenedor**) es un dato formado, a su vez, por otros datos llamados
  **componentes** o **elementos**, los cuales representan su **contenido**.

- Por contra, los datos no estructurados se denominan **datos elementales**,
  **escalares** o **atómicos**.

- Un **tipo de dato estructurado**, también llamado **tipo compuesto**, es
  aquel cuyos valores son datos estructurados.

- Normalmente, se puede **acceder** de manera individual a los elementos que
  componen un dato estructurado y, a veces, también se pueden **modificar**
  esos elementos de manera individual.

- El término **estructura de datos** se suele usar como sinónimo de **tipo de
  dato estructurado**, aunque nosotros haremos una distinción:

  - Usaremos **tipo de dato estructurado** cuando usemos un dato sin conocer
    sus detalles internos de implementación.

  - Usaremos **estructura de datos** cuando nos interesen esos detalles.

## Clasificación

- Los **datos estructurados** se pueden clasificar atendiendo a su
  _secuencialidad_ y a su _mutabilidad_.

- Según su **secuencialidad**:

  - **Secuenciales:** Son aquellos en los que se puede acceder directamente y
    de forma eficiente a cada uno de sus elementos indicando la posición que
    ocupan dentro de la secuencia.

    Por tanto, son colecciones _ordenadas_, ya que sus elementos están
    ordenados dentro de la secuencia según la posición en la que se encuentran
    situados dentro de la misma.

  - **No secuenciales:** Son aquellos en los que **NO** se puede acceder
    directamente y de forma eficiente a cada uno de sus elementos indicando la
    posición que ocupan dentro de la colección.

    En general, las estructuras no secuenciales son colecciones _desordenadas_,
    en las que no se puede afirmar que sus elementos se encuentran en una
    posición determinada dentro de la colección.

---

- Según su **mutabilidad**:

  - **Inmutables:** el dato estructurado no puede cambiar nunca su estado
    interno a lo largo de su vida.

  - **Mutables:** el dato estructurado puede cambiar su estado interno a lo
    largo de su vida sin cambiar su identidad.

- El **contenido** de un dato estructurado forma parte del **estado interno**
  de ese dato estructurado, por lo que cambiar el contenido de un dato
  estructurado supone cambiar también su estado interno.

- Por ejemplo, si en la lista !PYTHON([7, 8, 9]) sustituimos su segundo
  elemento (el !PYTHON(8)) por un !PYTHON(5) para obtener la lista !PYTHON([7,
  5, 9]), estamos cambiando el contenido de la lista y, por consiguiente, su
  estado interno.

  Su identidad no ha cambiado, pero su estado interno sí.

---

$$\text{Tipos} \begin{cases}
\text{Escalares} \\ \\
    \text{Estructurados} \begin{cases}
        \text{Secuencias} \begin{cases}
            \text{Inmutables} \begin{cases}
                \text{Cadenas (\texttt{str})} \\
                \text{Tuplas (\texttt{tuple})} \\
                \text{Rangos (\texttt{range})}
            \end{cases} \\
            \\
            \text{Mutables} \begin{cases}
                \text{Listas (\texttt{list})}
            \end{cases}
        \end{cases} \\
        \\
        \text{No secuencias} \begin{cases}
            \text{Inmutables} \begin{cases}
                \text{Conjuntos (\texttt{frozenset})}
            \end{cases} \\
            \\
            \text{Mutables} \begin{cases}
                \text{Conjuntos (\texttt{set})} \\
                \text{Diccionarios (\texttt{dict})}
            \end {cases}
        \end{cases}
    \end{cases}
\end{cases}$$

## *Hashables*

- Un dato es *hashable* si cumple las siguientes dos condiciones:

  #. Puede compararse con otros datos usando el operador `==`.

  #. Tiene asociado un número entero llamado **_hash_** que nunca cambia
     durante toda la vida del dato.

     Para obtener el _hash_ de un dato, se usa la función !PYTHON(hash):

     - Si un dato $d$ es _hashable_, `hash(`$d$`)` devolverá el _hash_ de $d$.

     - En caso contrario, lanzará una excepción de tipo !PYTHON(TypeError).

- Si dos datos *hashables* son iguales, entonces deben tener el mismo _hash_:

  !CAJACENTRADA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $x$ `==` $y$, entonces debe cumplirse que !PYTHON(hash)`(`$x$`)` `==`
  !PYTHON(hash)`(`$y$`)`.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  En cambio, si dos datos son distintos, sus _hash_ no tienen por qué serlo.

---

- Ejemplos:

  ```python
  >>> hash('hola')
  6290906884732116299
  >>> hash('hola')
  6290906884732116299
  >>> hash(5)
  5
  >>> hash((1, 2, 3))
  529344067295497451
  >>> hash([1, 2, 3])
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: unhashable type: 'list'
  ```

---

- El concepto de *hashable* es importante en Python ya que existen tipos de
  datos estructurados que sólo pueden contener elementos *hashables*.

- Por ejemplo, los elementos de un conjunto y las claves de un diccionario
  deben ser *hashables*.

- La mayoría de los datos inmutables predefinidos en Python son *hashables*.

- Las **colecciones inmutables** (como las tuplas o los !PYTHON(frozenset)s)
  sólo son *hashables* si sus elementos también lo son.

- Las **coleccion mutables** (como las listas o los diccionarios) **NO** son
  *hashables*.

---

- **El _hash_ de un dato depende del estado interno del dato**, ya que se
  calcula a partir de dicho estado interno usando un algoritmo que no nos debe
  preocupar por ahora.

  Como el estado interno de una colección viene determinado principalmente por
  los elementos que contiene, el _hash_ de una colección dependerá también del
  contenido de la colección.

  Y por esta razón, las colecciones mutables no son _hashables_: si una
  colección es mutable, su contenido puede cambiar y, por tanto, su _hash_
  también cambiaría, pero esto está prohibido.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
El _hash_ de un dato **se calcula** en función del **estado interno** del dato
y, en caso de ser una colección, también en función de su **contenido**.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El _hash_ de un dato es un número que **representa al dato y a todo su
  contenido**.

- En cierto modo, ese número **_resume_ el estado del dato** en un simple
  número entero.

---

- El _hash_ de un dato se utiliza internamente para acceder al dato dentro de
  una colección de forma directa y eficiente.

- Para ello, el intérprete utiliza ciertas técnicas que permiten localizar
  directamente a un dato dentro de una colección, de forma casi inmediata y sin
  importar el tamaño de la colección (pero recordemos que para ello es
  necesario que el _hash_ del dato nunca cambie).

- De no usar estas técnicas, el intérprete tendría que buscar el dato
  secuencialmente dentro de la colección, recorriéndola desde el principio
  hasta el final, lo que sería mucho más lento y consumiría un tiempo que sería
  mayor cuanto más grande fuese la colección.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Los _hash_ **permiten el acceso _directo_ a un dato** dentro de una colección.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Muy en resumen, las técnicas se basan en dividir el espacio de memoria que
  ocupa la colección en una serie de _contenedores_ llamados **_buckets_**.

- Cada _bucket_ va numerado por un posible valor de _hash_, de forma que el
  _bucket_ número $n$ contendrá todos los elementos cuyo _hash_ valga $n$.

- Por tanto, el algoritmo que usa el intérprete para encontrar un elemento
  _hashable_ dentro de una colección es:

  #. Calcular el _hash_ del elemento a localizar.

  #. Irse directamente al _bucket_ numerado con ese valor de _hash_ (esta es
     una operación inmediata, con coste $O(1)$).

  #. Localizar dentro del _bucket_ el elemento que se está buscando usando el
     `==`, lo cual consumirá un tiempo que, en general, no será mucho, ya que
     los elementos están repartidos entre todos los _buckets_ y, por tanto,
     normalmente no habrá muchos elementos en cada _bucket_.

- Al final, se consigue encontrar al elemento (si está) de forma muy rápida,
  con un coste que es casi constante, independientemente de la cantidad de
  elementos que haya en la colección.

---

No se debe confundir el !PYTHON(id) de un dato con el !PYTHON(hash) de un dato:

+-----------------------------------------------------------------------+----------------------------------------------------------------------------+
| Función `id`                                                          | Función `hash`                                                             |
+:=====================================================================:+:==========================================================================:+
| - Devuelve la identidad de un dato.                                   | - Devuelve el _hash_ de un dato, si es _hashable_.                         |
+-----------------------------------------------------------------------+----------------------------------------------------------------------------+
| - Todos los datos tienen identidad.                                   | - No todos los datos son _hashables_.                                      |
+-----------------------------------------------------------------------+----------------------------------------------------------------------------+
| - Puede haber datos iguales pero no idénticos.                        | - Si dos datos son iguales, sus _hash_ también deben serlo.                |
+-----------------------------------------------------------------------+----------------------------------------------------------------------------+
| - Su valor no depende del estado interno del dato y,                  | - Su valor se obtiene a partir del estado interno del dato (y, por tanto,  |
|   por tanto, tampoco de su contenido.                                 |   de su contenido), usando una fórmula matemática.                         |
+-----------------------------------------------------------------------+----------------------------------------------------------------------------+
| - Por tanto, no cambia si se modifica el dato.                        | - Por tanto, un dato mutable no puede ser _hashable_, ya que su _hash_     |
|                                                                       |   cambiaría al cambiar su contenido o estado interno.                      |
+-----------------------------------------------------------------------+----------------------------------------------------------------------------+

## Iterables

- Se dice que un dato compuesto es **iterable** cuando se puede acceder a todos
  sus elementos de uno en uno, operación que se denomina **recorrer** el
  iterable.

- Gracias a esto, se dice que un iterable nos permite _visitar_ sus elementos
  o, también, _iterar_ sobre sus elementos.

- Como iterables tenemos:

  - Todas las secuencias: listas, cadenas, tuplas y rangos.

  - Estructuras no secuenciales: diccionarios y conjuntos.

- Los iterables no representan un tipo concreto, sino más bien una _familia_ de
  tipos que comparten la misma propiedad.

- Muchas funciones, como !PYTHON(map) y !PYTHON(filter), actúan sobre iterables
  en general, en lugar de hacerlo sobre un tipo concreto (lista, tupla, ...).

---

- Por ejemplo, las listas son iterables ya que nos permite acceder a todos sus
  elementos de uno en uno y, por tanto, podemos recorrerla.

- Para _visitar_ sus elementos podemos usar la _indexación_, y para _recorrer_
  toda la lista podemos usar un _bucle_:

  ```python
  def recorrer_lista(l):
      i = 0
      while i < len(l):
          print(l[i])
          i += 1
  ```

## Iteradores

- La forma básica de recorrer un dato iterable es usando un **iterador**.

  De hecho, técnicamente, un _iterable_ **se define** como aquel dato al que le
  podemos asociar, al menos, un **_iterador_**.

- Un **iterador** es un objeto que sabe cómo **recorrer** un iterable.

- Para ello, el iterador crea un flujo de datos _perezoso_ que va entregando
  los elementos del iterable de uno en uno.

- Los sucesivos elementos del flujo de datos se van obteniendo al llamar
  repetidamente a la función !PYTHON(next) aplicada al iterador.

- Cuando ya no hay más elementos disponibles, la función !PYTHON(next) lanza
  una excepción de tipo !PYTHON(StopIteration), lo que indica que el iterador
  **se ha agotado** (se han consumido todos sus elementos), por lo que si se
  sigue llamando a la función !PYTHON(next) se seguirá lanzando esa excepción.

---

- Se puede obtener un iterador a partir de cualquier dato iterable aplicando la
  función !PYTHON(iter) al iterable.

  (Recordemos que todo iterable debe tener asociado un iterador.)

- Ejemplo de uso de !PYTHON(iter) y !PYTHON(next):

  ```python
  >>> lista = [1, 2, 3]
  >>> it = iter(lista)
  >>> next(it)
  1
  >>> next(it)
  2
  >>> next(it)
  3
  >>> next(it)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  StopIteration
  ```

- Si se le pasa un dato no iterable, !PYTHON(iter) lanza una excepción
  !PYTHON(TypeError):

  ```python
  >>> it = iter(9)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: 'int' object is not iterable
  ```

---

- Los iteradores son **iterables perezosos de un solo uso**:

  - Son **perezosos** porque van generando sus elementos a medida que los va
    entregando, en lugar de generarlos todos a la vez primero.

  - Son **de un solo uso** porque cada elemento sólo se entrega una vez.

- Además, los iteradores son **iterables que actúan como sus propios
  iteradores**:

  - Por tanto, cuando llamamos a !PYTHON(iter) pasándole un iterador, se
    devuelve el mismo iterador:

    ```python
    >>> lista = [1, 2, 3, 4]
    >>> it = iter(lista)
    >>> it
    <list_iterator object at 0x7f3c49aa9080>
    >>> it2 = iter(it)
    >>> it2
    <list_iterator object at 0x7f3c49aa9080>
    >>> it == it2
    True
    ```

  - En consecuencia, podemos usar un iterador en cualquier sitio donde se
    espere un iterable.

---

- Funciones como !PYTHON(map) y !PYTHON(filter) devuelven iteradores porque, al
  ser perezosos, son más eficientes en memoria que si devolvieran toda una
  lista o tupla.

  Por ejemplo: ¿qué ocurre si sólo necesitamos los primeros elementos del
  resultado de un !PYTHON(map)?

- Los iteradores se pueden convertir en listas o tuplas usando las funciones
  !PYTHON(list) y !PYTHON(tuple):

  ```python
  >>> l = [1, 2, 3]
  >>> iterador = iter(l)
  >>> t = tuple(iterador)
  >>> t
  (1, 2, 3)
  ```

---

- Las **expresiones generadoras**, ya conocidas por nosotros, también son
  expresiones que **devuelven un iterador**:

  !ALGO                                                                            
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expr_gen) ::= !T{(}!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])+!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Ejemplo:

  ```python
  >>> cuadrados = (x ** 2 for x in range(1, 10))
  >>> cuadrados
  <generator object <genexpr> at 0x7f6a0fc7db48>
  >>> next(cuadrados)
  1
  >>> next(cuadrados)
  4
  >>> next(cuadrados)
  9
  ```

### El bucle !PYTHON(for)

- Probablemente, la mejor forma de recorrer los elementos que devuelve un
  iterador es mediante una **estructura de control** llamada **bucle
  !PYTHON(for)**.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(for) !NT{variable}(!T{,} !NT{variable})\* !T(in) !NT(iterable)!T(:)
        !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  que no es más que azúcar sintáctico para el siguiente código equivalente:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON{iterador = iter(}!NT(iterable)!PYTHON{)}
!PYTHON(while True:)
        !PYTHON(try:)
                !NT{variable}(`,` !NT{variable})\*\  !PYTHON(= next(iterador))
        !PYTHON(except StopIteration:)
                !PYTHON(break)
        !PYTHON(else:)
                !NT(sentencia)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ejemplos:

:::: columns

::: column

  ```python
  for i in range(0, 4):
      print(i)
  ```

  devuelve:

  ```
  0
  1
  2
  3
  ```

:::

::: column

  ```python
  for x in ['hola', 23.5, 10, [1, 2]]:
      print(x * 2)
  ```

  devuelve:

  ```
  'holahola'
  47.0
  20
  [1, 2, 1, 2]
  ```

:::

::::

---

- Al recorrer el iterable, la variable va almacenando en cada iteración del
  bucle el valor del elemento que en ese momento se está visitando.

- Si estamos recorriendo una secuencia y necesitamos recuperar tanto el valor
  como el **índice** de cada elemento, podemos usar la función
  !PYTHON(enumerate).

- Esta función devuelve un iterador que va generando tuplas que contienen,
  además del elemento, el valor correspondiente de un contador numérico.

- Las tuplas que devuelve el iterador llevan el contador en la primera posición
  y el elemento de la secuencia en la segunda posición.

- Por defecto, el contador empieza desde !PYTHON(0) y se va incrementando de
  uno en uno, por lo que coincide con el índice del elemento en la secuencia:

  ```python
  >>> for i, e in enumerate(['a', 'b', 'c']):
  ...     print('El elemento en la posición ' + str(i) + ' es ' + str(e))
  ...
  El elemento en la posición 0 es a
  El elemento en la posición 1 es b
  El elemento en la posición 2 es c

  ```

---

- Existen iterables e iteradores incluso donde uno menos se lo podría esperar.

- Por ejemplo, **los archivos abiertos también son iterables**, ya que se
  pueden recorrer línea a línea usando un iterador:

  ```python
  with open('archivo.txt') as f:
      for linea in f:
          print(linea)
  ```

- Esta forma de recorrer los archivos, además de resultar simple y elegante,
  también resulta muy eficiente, ya que se va recuperando cada línea de una en
  una en lugar de todas a la vez.

### El módulo !PYTHON(itertools)

- El módulo !PYTHON(itertools) contiene una variedad de iteradores de uso
  frecuente, así como funciones que combinan varios iteradores.

- Algunos de esos iteradores son muy especiales porque pueden devolver flujos
  infinitos o valores que se repiten continuamente, lo cual contradice en
  cierta manera lo que dijimos cuando definimos los iteradores como «_iterables
  de un solo uso_».

- !PYTHON{itertools.count}`(`[!NT(inicio)[`,` !NT(paso)]]`)` devuelve un flujo
  infinito de valores separados uniformemente. Se puede indicar opcionalmente
  un valor de comienzo (que por defecto es !PYTHON(0)) y el intervalo entre
  números (que por defecto es !PYTHON(1)):

  !PYTHON(itertools.count()) $\Rightarrow$ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ...

  !PYTHON(itertools.count(10)) $\Rightarrow$ 10, 11, 12, 13, 14, 15, 16, 17,
  18, 19, ...

  !PYTHON(itertools.count(10, 5)) $\Rightarrow$ 10, 15, 20, 25, 30, 35, 40, 45,
  ...

---

- !PYTHON(itertools.cycle)`(`!NT(iterador)`)` devuelve un nuevo iterador que va
  generando sus elementos del primero al último, repitiéndolos indefinidamente:

  !PYTHON(itertools.cycle([1, 2, 3, 4])) $\Rightarrow$ 1, 2, 3, 4, 1, 2, 3, 4,
  ...

- !PYTHON(itertools.repeat)`(`!NT(elem)[`,` !NT(n)]`)` devuelve !NT(n) veces el
  elemento !NT(elem), o lo devuelve indefinidamente si no se indica !NT(n):

  !PYTHON(itertools.repeat('abc')) $\Rightarrow$ abc, abc, abc, abc, abc, abc,
  abc, ...

  !PYTHON(itertools.repeat('abc', 5)) $\Rightarrow$ abc, abc, abc, abc, abc

# Secuencias

## Concepto de secuencia

- Una **secuencia** $\underline{s}$ es un dato estructurado _iterable_ que
  cumple lo siguiente:

  #. Se le puede calcular su longitud (la cantidad de elementos que contiene)
     mediante la función !PYTHON(len).

  #. Cada elemento que contiene lleva asociado un número entero llamado
     **índice**, comprendido entre !PYTHON(0) y !PYTHON(len)`(`$s$`)`
     !PYTHON(- 1).

  #. Permite el acceso eficiente a cada uno de sus elementos mediante
     indexación $s$`[`$i$`]`, siendo $i$ el índice del elemento.

- Las secuencias se dividen en:

  - **Inmutables**: cadenas (!PYTHON(str)), tuplas (!PYTHON(tuple)) y rangos
    (!PYTHON(range)).

  - **Mutables**: listas (!PYTHON(list))

## Operaciones comunes

- Todas las secuencias (ya sean cadenas, listas, tuplas o rangos) comparten un
  conjunto de **operaciones comunes**.

- Los rangos son una excepción, ya que sus elementos se crean a partir de una
  fórmula y, por eso, no admiten ni la concatenación ni la repetición.

- La siguiente tabla recoge las operaciones comunes sobre secuencias,
  ordenadas por prioridad ascendente. $\underline{s}$ y $\underline{t}$ son
  secuencias del mismo tipo, $\underline{n}$, $\underline{i}$, $\underline{j}$
  y $\underline{k}$ son enteros y $\underline{x}$ es un dato cualquiera que
  cumple con las restricciones que impone $\underline{s}$.

---

--------------------------------------------------------------------------------------------------------------------------
Operación                                 Resultado
----------------------------------------- --------------------------------------------------------------------------------
$x\ $ !PYTHON(in) $\ s$                   !PYTHON(True) si algún elemento de $\underline{s}$ es igual a $\underline{x}$

$x\ $ !PYTHON(not)\  !PYTHON(in) $\ s$    !PYTHON(False) si algún elemento de $\underline{s}$ es igual a $\underline{x}$

$s$ `+` $t$                               La concatenación de $\underline{s}$ y $\underline{t}$ (no va con rangos)
                                        
$s$ `*` $n$ \                             (_Repetición_) Equivale a concatenar $\underline{s}$ consigo misma $\underline{n}$ veces
$n$ `*` $s$                               (no va con rangos)

$s$`[`$i$`]`                              El $\underline{i}$-ésimo elemento de $\underline{s}$, empezando por 0

$s$`[`$i$`:`$j$`]`                        Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$

$s$`[`$i$`:`$j$`:`$k$`]`                  Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$ con paso $\underline{k}$

!PYTHON(len)`(`$s$`)`                     Longitud de $\underline{s}$

!PYTHON(min)`(`$s$`)`                     El elemento más pequeño de $\underline{s}$

!PYTHON(max)`(`$s$`)`                     El elemento más grande de $\underline{s}$

$s$!PYTHON(.index)`(`$x$                  El índice de la primera aparición de $\underline{x}$ en $\underline{s}$
[`, ` $i$ [`, ` $j$ ] ]`)`                (desde el índice $\underline{i}$ inclusive y antes del $\underline{j}$)

$s$!PYTHON(.count)`(`$x$`)`               Número total de apariciones de $\underline{x}$ en $\underline{s}$
--------------------------------------------------------------------------------------------------------------------------

---

- Además de estas operaciones, las secuencias admiten **comparaciones** con los
  operadores `==`, `!=`, `<`, `<=`, `>` y `>=`.

- Dos secuencias $\underline{s}$ y $\underline{t}$ son iguales ($\underline{s}$
  `==` $\underline{t}$) si:

  - Son del mismo tipo (!PYTHON(type)`(`$s$`)` `==` !PYTHON(type)`(`$t$`)`).

  - Tienen la misma longitud (!PYTHON(len)`(`$s$`)` `==`
    !PYTHON(len)`(`$t$`)`).

  - Contienen los mismos elementos en el mismo orden \
    ($s$!PYTHON([0]) `==` $t$!PYTHON([0]), $s$!PYTHON([1]) `==`
    $t$!PYTHON([1]), etcétera).

- Por supuesto, las dos secuencias son distintas ($\underline{s}$ `!=`
  $\underline{t}$) si no son iguales.

- Se pueden comparar dos secuencias con los operadores `<`, `<=`, `>` y `>=`
  para comprobar si una es menor (o igual) o mayor (o igual) que la otra si:

  - Son del mismo tipo (si no son del mismo tipo, lanza una excepción).

  - No son rangos.

---

- Las comparaciones `<`, `<=`, `>` y `>=` se hacen lexicográficamente elemento
  a elemento, como en un diccionario.

- Por ejemplo, !PYTHON('adios') `<` !PYTHON('hola') porque `adios` aparece
  antes que `hola` en el diccionario.

- Con el resto de las secuencias se actúa igual que con las cadenas.

  Dadas dos secuencias $\underline{s}$ y $\underline{t}$, para ver si
  $\underline{s}$ `<` $\underline{t}$ se procede así:

  - Se empieza comparando el primer elemento de $\underline{s}$ con el primero
    de $\underline{t}$.

  - Si son iguales, se pasa al siguiente hasta encontrar
    algún elemento de $\underline{s}$ que sea distinto a su correspondiente de
    $\underline{t}$.

  - Si llegamos al final de $\underline{s}$ sin haber encontrado ningún
    elemento distinto a su correspondiente en $\underline{t}$, es porque
    $\underline{s}$ `==` $\underline{t}$.

  - En cuanto se encuentre un elemento de $\underline{s}$ que no es igual a su
    correspondiente de $\underline{s}$, se comparan esos elementos y se
    devuelve el resultado de esa comparación.

- Los rangos no se pueden comparar con `<`, `<=`, `>` o `>=`.

---

- Ejemplos:

  ```python
  >>> (1, 2, 3) == (1, 2, 3)
  True
  >>> (1, 2, 3) != (1, 2, 3)
  False
  >>> (1, 2, 3) == (3, 2, 1)
  False
  >>> (1, 2, 3) < (3, 2, 1)
  True
  >>> (1, 2, 3) < (1, 2, 4)
  True
  >>> (1, 2, 3) < (1, 2, 4, 5)
  True
  >>> 'hola' < 'adios'
  False
  >>> range(0, 3) < range(3, 6)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: '<' not supported between instances of 'range' and 'range'
  ```

## Inmutables

### Cadenas (!PYTHON(str))

- Las **cadenas** son secuencias inmutables y *hashables* de caracteres.

- No olvidemos que en Python no existe el tipo *carácter*. En Python, un
  carácter es una cadena de longitud 1.

- Las cadenas literales se pueden crear:

  - Con comillas simples (!PYTHON(')) o dobles (!PYTHON(")):

    ```python
    >>> 'hola'
    'hola'
    >>> "hola"
    'hola'
    ```

  - Con triples comillas (!PYTHON(''') o !PYTHON(""")):

    ```python
    >>> """hola
    ... qué tal"""
    'hola\nqué tal'
    ```

- Las cadenas implementan todas las operaciones de las secuencias, además de
  los métodos que se pueden consultar en
  [https://docs.python.org/3/library/stdtypes.html#string-methods](https://docs.python.org/3/library/stdtypes.html#string-methods)

#### Formateado de cadenas

- Una **cadena formateada** (también llamada **_f-string_**) es una cadena
  literal que lleva un prefijo `f` o `F`.

- Estas cadenas contienen **campos de sustitución**, que son expresiones
  encerradas entre llaves.

- En realidad, las cadenas formateadas son expresiones evaluadas en tiempo de
  ejecución.

---

- Sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(f_string) ::= (!NT(carácter_literal) | !T({{) | !T(}}) | !NT{sustitución})\*
!NT(sustitución) ::= !T({)!NT(expresión) [!T(!)!NT(conversión)] [!T(:)!NT(especif)]!T(})
!NT(conversión) ::= !T(s) | !T(r) | !T(a)
!NT(especif) ::=  (!NT(carácter_literal) | !T(NULL) | !NT{sustitución})\*
!ifdef(HTML)
~~~~~~~~~~~~~~
!NT(carácter_literal) ::= !NT(cualquier carácter Unicode excepto !T({), !T(}) o !T{NULL})
~~~~~~~~~~~~~~
~~~~~~~~~~~~~~
!NT(carácter_literal) ::= !NT(cualquier carácter Unicode excepto \textbf{\texttt{\{}}, \textbf{\texttt{\}}} o \textbf{\texttt{NULL}})
~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Las partes de la cadena que van fuera de las llaves se tratan literalmente,
  excepto las dobles llaves `{{` y `}}`, que son sustituidas por una sola
  llave.

- Una `{` marca el comienzo de un **campo de sustitución** (!NT{sustitución}),
  que empieza con una expresión.

- Tras la expresión puede venir un **conversión** (!NT{conversión}),
  introducida por una exclamación `!`.

- También puede añadirse un **especificador de formato** (!NT{especif}) después
  de dos puntos `:`.

- El campo de sustitución termina con una `}`.

---

- Las expresiones en un literal de cadena formateada son tratadas como
  cualquier otra expresión Python encerrada entre paréntesis, con algunas
  excepciones:

  - No se permiten expresiones vacías.

  - Las expresiones lambda deben ir entre paréntesis.

- Los campos de sustitución pueden contener saltos de línea pero no
  comentarios.

- Si se indica una conversión, el resultado de evaluar la expresión se
  convierte antes de aplicar el formateado.

  La conversión `!s` llama a la función !PYTHON(str) sobre el resultado, `!r`
  llama a !PYTHON(repr) y `!a` llama a !PYTHON(ascii).

- A continuación, el resultado es formateado usando la función !PYTHON(format).

- Finalmente, el resultado del formateado es incluido en el valor final de la
  cadena completa.

---

- La sintaxis general de un especificador de formato es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(especif) ::= [[!NT{relleno}\]!NT{alig}][!NT{signo}][!T(#)][!T(0)][!NT(ancho)][!NT(grupos)][!T(.)!NT(precision)][!NT(tipo)]
!NT(relleno) ::= !NT(cualquier carácter)
!NT(alig) ::= !T(<) | !T(>) | !T(=) | !T(^)
!NT(signo) ::=  !T(+) | !T(-) | !NT(espacio)
!NT(ancho) ::= !NT(dígito)+
!NT(grupos) ::= !T(_)(_) | !T(,)
!NT(precision) ::= !NT(dígito)+
!NT(tipo) ::= !T(b) | !T(c) | !T(d) | !T(e) | !T(E) | !T(f) | !T(F) | !T(g) | !T(G) | !T(n) | !T(o) | !T(s) | !T(x) | !T(X) | !T(%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los especificadores de formato de nivel superior pueden incluir campos de
  sustitución anidados.

- Estos campos anidados pueden incluir, a su vez, sus propios campos de
  conversión y sus propios especificadores de formato, pero no pueden incluir
  más campos de sustitución anidados.

- Para más información, consultar [https://docs.python.org/3.7/library/string.html#format-specification-mini-language](https://docs.python.org/3.7/library/string.html#format-specification-mini-language)

---

- Ejemplos de cadenas formateadas:

  ```python
  >>> nombre = 'Pepe'
  >>> f'El nombre es: {nombre}'              # Se sustituye la variable por su valor
  'El nombre es: Pepe'
  >>> apellidos = 'Pérez'
  >>> f'El nombre es: {nombre} {apellidos}'  # Igual
  'El nombre es: Pepe Pérez'
  >>> f'El nombre es: {nombre + apellidos}'  # Se puede usar cualquier expresión
  'El nombre es: Pepe Pérez'
  >>> f'Formato con anchura: {nombre:10}'    # Las cadenas se alinean a la izquierda
  'Formato con anchura: Pepe      '
  >>> f'Formato con anchura: {nombre:<10}'   # Igual que lo anterior
  'Formato con anchura: Pepe      '
  >>> f'Formato con anchura: {nombre:>10}'   # Alinea a la derecha
  'Formato con anchura:       Pepe'
  >>> f'Formato con anchura: {nombre:^10}'   # Alinea al centro
  'Formato con anchura:    Pepe   '
  ```

---

- Ejemplos de cadenas formateadas con números positivos:

  ```python
  >>> x, y = 400, 300
  >>> f'La suma de {x} y {y} es {x + y}' # Se puede usar cualquier expresión
  'La suma de 400 y 300 es 700'
  >>> f'Formato con anchura: {x:10}'     # Los números se alinean a la derecha
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:>10}'    # Igual que lo anterior
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:2}'      # Ancho demasiado pequeño, se ignora
  'Formato con anchura: 400'
  >>> f'Formato con anchura: {x:<10}'    # Alinea a la izquierda
  'Formato con anchura: 400       '
  >>> f'Formato con anchura: {x:>10}'    # Alinea a la derecha
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:^10}'    # Alinea al centro
  'Formato con anchura:    400    '
  >>> f'Formato con anchura: {x:=10}'    # En positivos no hay diferencia con >
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:@<10}'   # Alinea a la izquierda, rellena con @
  'Formato con anchura: 400@@@@@@@'
  >>> f'Formato con anchura: {x:@>10}'   # Alinea a la derecha, rellena con @
  'Formato con anchura: @@@@@@@400'
  >>> f'Formato con anchura: {x:@^10}'   # Alinea al centro, rellena con @
  'Formato con anchura: @@@400@@@@'
  >>> f'Formato con anchura: {x:@=10}'   # En positivos no hay diferencia con >
  'Formato con anchura: @@@@@@@400'
  ```

---

- Ejemplos de cadenas formateadas con números negativos:

  ```python
  >>> z = -400
  >>> f'Formato con anchura: {z:10}'   # A la derecha, signo junto al nº
  'Formato con anchura:       -400'
  >>> f'Formato con anchura: {z:<10}'  # A la izquierda, signo junto al nº
  'Formato con anchura: -400      '
  >>> f'Formato con anchura: {z:>10}'  # A la derecha, signo junto al nº
  'Formato con anchura:       -400'
  >>> f'Formato con anchura: {z:^10}'  # Al centro, signo junto al nº
  'Formato con anchura:    -400   '
  >>> f'Formato con anchura: {z:=10}'  # A la derecha, signo junto al relleno
  'Formato con anchura: -      400'
  >>> f'Formato con anchura: {z:010}'  # A la derecha, signo junto al relleno
  'Formato con anchura: -000000400'
  >>> f'Formato con anchura: {z:0<10}' # A la izquierda, signo junto al nº
  'Formato con anchura: -400000000'
  >>> f'Formato con anchura: {z:0>10}' # A la derecha, signo junto al nº
  'Formato con anchura: 000000-400'
  >>> f'Formato con anchura: {z:0^10}' # Al centro, signo junto al nº
  'Formato con anchura: 000-400000'
  >>> f'Formato con anchura: {z:0=10}' # A la derecha, signo junto al relleno
  'Formato con anchura: -000000400'
  >>> f'Formato con anchura: {z:@<10}' # A la izquierda, signo junto al nº
  'Formato con anchura: -400@@@@@@'
  >>> f'Formato con anchura: {z:@>10}' # A la derecha, signo junto al nº
  'Formato con anchura: @@@@@@-400'
  >>> f'Formato con anchura: {z:@^10}' # Al centro, signo junto al nº
  'Formato con anchura: @@@-400@@@'
  >>> f'Formato con anchura: {z:@=10}' # A la derecha, signo junto al relleno
  'Formato con anchura: -@@@@@@400'
  ```

---

- Ejemplos de cadenas formateadas con números en coma flotante:

  ```python
  >>> from math import pi
  >>> f'El valor de pi es {pi:6.3}'     # Ancho 6, precisión 3
  'El valor de pi es   3.14'
  >>> f'El valor de pi es {pi:10.3}'    # Ancho 10, precisión 3
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:<10.3}'   # A la izquierda
  'El valor de pi es 3.14      '
  >>> f'El valor de pi es {pi:>10.3}'   # A la derecha
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:^10.3}'   # Al centro
  'El valor de pi es    3.14   '
  >>> f'El valor de pi es {pi:=10.3}'   # A la derecha
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:10.3f}'   # 3 dígitos en la parte fraccionaria
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {pi:<10.3f}'  # A la izquierda
  'El valor de pi es 3.142     '
  >>> f'El valor de pi es {pi:>10.3f}'  # A la derecha
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {pi:^10.3f}'  # Al centro
  'El valor de pi es   3.142   '
  >>> f'El valor de pi es {pi:=10.3f}'  # A la derecha
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {-pi:=10.3f}' # Los negativos, igual que los enteros
  'El valor de pi es -    3.142'
  ```

---

- Más ejemplos:

  ```python
  >>> nombre = "Fred"
  >>> f"Dice que su nombre es {nombre!r}."
  "Dice que su nombre es 'Fred'."
  >>> f"Dice que su nombre es {repr(nombre)}."  # repr es equivalente a !r
  "Dice que su nombre es 'Fred'."
  >>> ancho = 10
  >>> precision = 4
  >>> value = decimal.Decimal("12.34567")
  >>> f"result: {value:{ancho}.{precision}}"  # campos anidados
  'result:      12.35'
  >>> import datetime
  >>> hoy = datetime.datetime(year=2017, month=1, day=27)
  >>> f"{hoy:%B %d, %Y}"  # usando especificador de formato de fecha
  'January 27, 2017'
  >>> numero = 1024
  >>> f"{numero:#0x}"  # usando especificador de formato de enteros
  '0x400'
  ```

#### Expresiones regulares

- Las **expresiones regulares** (también llamados *regex*) constituyen
  un pequeño lenguaje muy especializado incrustado dentro de
  Python y disponible a través del módulo `re`.

- Usando este pequeño lenguaje es posible especificar **reglas sintácticas** de
  una forma distinta pero parecida a las _gramáticas EBNF_ (aunque con menos
  poder expresivo).

- Esas reglas sintácticas se pueden usar luego para **comprobar si una cadena
  _se ajusta_ a un patrón**.

- Este patrón puede ser frases en español, o direcciones de correo electrónico
  o cualquier otra cosa.

- A continuación, se pueden hacer preguntas del tipo: *«¿Esta cadena se ajusta
  al patrón?»* o *«¿Hay algo que se ajuste al patrón en alguna parte de esta
  cadena?»*.

- También se pueden usar las *regexes* para **modificar** una cadena o
  **dividirla en partes** según el patrón indicado.

---

- El lenguaje de las expresiones regulares es relativamente pequeño y
  restringido, por lo que no es posible usarlo para realizar cualquier tipo de
  procesamiento de cadenas.

- Además, hay procesamientos que se pueden realizar con *regexes* pero las
  expresiones que resultan se vuelven muy complicadas.

- En estos casos, es mejor escribir directamente código Python ya que, aunque
  el código resultante pueda resultar más lento, probablemente resulte más
  fácil de leer.

---

- Para más información sobre cómo crear y usar expresiones regulares,
  consultar:

  - Tutorial de introducción en [https://docs.python.org/3/howto/regex.html](https://docs.python.org/3/howto/regex.html)

  - Documentación del módulo `re` en [https://docs.python.org/3/library/re.html](https://docs.python.org/3/library/re.html)

### Tuplas

- Las **tuplas** (!PYTHON(tuple)) son secuencias inmutables, usadas
  frecuentemente para representar colecciones de datos heterogéneos (es decir,
  de tipos distintos).

- También se usan en aquellos casos en los que se necesita una secuencia
  inmutable de datos homogéneos (por ejemplo, para almacenar datos en un
  conjunto o un diccionario).

- Las tuplas se pueden crear así:

  - Si es una tupla vacía, con paréntesis vacíos: !PYTHON(())

  - Si sólo tiene un elemento, se pone una coma detrás:
    
    :::: columns

    ::: column

    $a$`,`

    :::

    ::: column

    `(`$a$`,)`

    :::

    ::::

  - Si tiene más de un elemento, se separan con comas:

    :::: columns

    ::: column

    $a$`,` $b$`,` $c$

    :::

    ::: column

    `(`$a$`,` $b$`,` $c$`)`

    :::

    ::::

  - Usando la función !PYTHON(tuple)`(`!NT{iterable}`)`.

---

- Observar que lo que construye la tupla es realmente la coma, no los
  paréntesis.

- Los paréntesis son opcionales, excepto en dos casos:

  - La tupla vacía: !PYTHON(())

  - Cuando son necesarios para evitar ambigüedad.

    Por ejemplo, `f(`$a$`,` $b$`,` $c$`)` es una llamada a una función con tres
    argumentos, mientras que `f((`$a$`,` $b$`,` $c$`))` es una llamada a una
    función con un único argumento que es una tupla de tres elementos.

- Las tuplas implementan todas las operaciones comunes de las secuencias.

- En general, las tuplas se pueden considerar como la versión inmutable de las
  listas.

- Además, las tuplas son *hashables* si sus elementos también lo son.

---

- En memoria, las tuplas se almacenan mediante una estructura de datos donde
  sus elementos se identifican mediante un índice, que es un número entero que
  indica la posición que ocupa el elemento dentro de la tupla.

- Por ejemplo, la siguiente tupla:

  ```python
  t = (1, 2, 3)
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(tupla_en_pythontutor.png)(Tupla almacenada en memoria)(width=50%)(width=50%)

### Rangos

- Los **rangos** (!PYTHON(range)) representan secuencias inmutables y
  *hashables* de números enteros y se usan frecuentemente para hacer bucles que
  se repitan un determinado número de veces.

- Los rangos se crean con la función !PYTHON(range):

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  $\texttt{range(!VAR([)!VAR(start):\,int,!VAR(])\;!VAR(stop):\,int\;!VAR([),\;!VAR(step):\,int!VAR(]))\;->\;range}$
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Cuando se omite _start_, se entiende que es !PYTHON(0).

- Cuando se omite _step_, se entiende que es !PYTHON(1).

- El valor de _stop_ no se alcanza nunca.

- Cuando _start_ y _stop_ son iguales, representa el *rango vacío*.

- _step_ debe ser siempre distinto de cero.

- Cuando _start_ es mayor que _stop_, el valor de _step_ debería ser negativo.
  En caso contrario, también representaría el rango vacío.

---

- El **contenido** de un rango $r$ vendrá determinado por la fórmula: $$r[i] =
  start + step \cdot i$$ donde $i \geq 0$. Además:

  - Si $step > 0$, se impone también la restricción $r[i] <
    \text{\textit{stop}}$.

  - Si $step < 0$, se impone también la restricción $r[i] >
    \text{\textit{stop}}$.

- Un rango es **vacío** cuando $r[0]$ no satisface las restricciones anteriores.

- Los rangos admiten **índices negativos**, pero se interpretan como si se
  indexara desde el final de la secuencia usando índices positivos.

- Los rangos implementan **todas las operaciones de las secuencias, *excepto*
  la concatenación y la repetición**.

  Esto es debido a que los rangos sólo pueden representar secuencias que siguen
  un patrón muy estricto, y las repeticiones y las concatenaciones a menudo
  violan ese patrón.

- **Los rangos son perezosos** y además ocupan mucha menos memoria que las
  listas o las tuplas (sólo hay que almacenar *start*, *stop* y *step*).

---

- La **forma normal** de un rango es una expresión en la que se llama a la
  función !PYTHON(range) con los argumentos necesarios para construir el rango:

  :::: columns

  ::: {.column width=48%}

  ```python
  >>> range(10)
  range(0, 10)
  >>> range(0, 10)
  range(0, 10)
  >>> range(0, 10, 1)
  range(0, 10)
  ```

  :::

  ::: {.column width=4%}
  :::

  ::: {.column width=48%}

  ```python
  >>> range(0, 30, 5)
  range(0, 30, 5)
  >>> range(0, -10, -1)
  range(0, -10, -1)
  >>> range(4, -5, -2)
  range(4, -5, -2)
  ```

  :::

  ::::

- Para ver con claridad todos los elementos de un rango, podemos convertirlo en
  una tupla o una lista. Por ejemplo:

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

- Dos rangos son considerados **iguales** si representan la misma secuencia de
  valores, sin importar si tienen distintos valores de _start_, _stop_ o
  _step_.

- Por ejemplo:

  ```python
  >>> range(20) == range(0, 20)
  True
  >>> range(0, 20) == range(0, 20, 2)
  False
  >>> range(0, 3, 2) == range(0, 4, 2)
  True
  >>> range(0) == range(2, 1, 3)
  True
  ```

---

- El **rango vacío** es un valor que no tiene expresión canónica, ya que
  cualquiera de las siguientes expresiones representan al rango vacío tan bien
  como cualquier otra:

  - !PYTHON(range(0)).

  - !PYTHON(range)`(`$a$`, `$\;a$`)`, donde _a_ es cualquier entero.

  - !PYTHON(range)`(`$a$`, `$\;b$`, `$\;c$`)`, donde $a \geq b$ y $c > 0$.

  - !PYTHON(range)`(`$a$`, `$\;b$`, `$\;c$`)`, donde $a \leq b$ y $c < 0$.

```python
>>> range(3, 3) == range(4, 4)
True
>>> range(4, 3) == range(3, 4, -1)
True
```

## Mutables

### Listas

- Las **listas** son secuencias *mutables*, usadas frecuentemente para
  representar colecciones de elementos heterogéneos.

- Al ser mutables, las listas **no** son *hashables*.

- Se pueden construir de varias maneras:

  - Usando corchetes vacíos para representar la lista vacía: !PYTHON([]).

  - Usando corchetes y separando los elementos con comas:
  
    `[`$a$`]`
    
    `[`$a$`,` $b$`,` $c$`]`

  - Usando la función !PYTHON(list) con las sintaxis !PYTHON(list()) o
    !PYTHON(list)`(`!NT{iterable}`)`.

---

- La función !PYTHON(list) construye una lista cuyos elementos son los mismos
  (y están en el mismo orden) que los elementos de !NT(iterable).

- !NT(iterable) puede ser:

  - una secuencia,

  - un contenedor sobre el que se pueda iterar, o

  - un iterador.

- Si se llama sin argumentos, devuelve una lista vacía.

- Por ejemplo:

  ```python
  >>> list('hola')
  ['h', 'o', 'l', 'a']
  >>> list((1, 2, 3))
  [1, 2, 3]
  ```

---

- En memoria, las listas se almacenan mediante una estructura de datos donde
  sus elementos se identifican mediante un índice, que es un número entero que
  indica la posición que ocupa el elemento dentro de la lista.

- Por ejemplo, la siguiente lista:

  ```python
  lst = [1, 2, 3]
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(lista_en_pythontutor.png)(Lista almacenada en memoria)(width=50%)(width=50%)

#### Listas por comprensión

- También se pueden crear **listas por comprensión** usando la misma sintaxis
  de las **expresiones generadoras** pero encerrando la expresión entre
  corchetes en lugar de entre paréntesis.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(lista_comp) ::= !T{[}!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])!MAS!T{]}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> [x ** 2 for x in [1, 2, 3]]
  [1, 4, 9]
  ```

- Como se ve, el resultado es directamente una lista, no un iterador.

- Por tanto, a diferencia de lo que pasa con las expresiones generadoras, **el
  resultado de una lista por comprensión no es perezoso**, cosa que habrá que
  tener en cuenta para evitar consumir más memoria de la necesaria o generar
  elementos que al final no sean necesarios.

---

- Por ejemplo, la siguiente expresión generadora:

  ```python
  res_gen = (x ** 2 for x in range(0, 10000000000000))
  ```

  es mucho más eficiente en tiempo y espacio que la lista por comprensión:

  ```python
  res_list = [x ** 2 for x in range(0, 10000000000000)]
  ```

  ya que la expresión generadora devuelve un **iterador** que irá generando los
  valores de uno en uno a medida que los vayamos recorriendo con
  !PYTHON(next(res_gen)).

  En cambio, la lista por comprensión genera todos los valores de la lista a la
  vez y los almacena todos juntos en la memoria.

- A cambio, la ventaja de tener una lista frente a tener un iterador es que
  podemos acceder directamente a cualquier elemento de la lista mediante la
  indexación.

---

- Las listas por comprensión, al igual que las expresiones generadoras,
  **determinan su propio _ámbito_**.

- Ese ámbito abarca toda la lista por comprensión, de principio a fin.

- Los identificadores que aparecen en la cláusula !PYTHON(for) se consideran
  _variables ligadas_ en la lista por comprensión.

- Esos identificadores se van ligando, uno a uno, a cada elemento de la
  secuencia indicada en la cláusula !PYTHON(in).

---

- Como son variables ligadas, cumplen estas dos propiedades:

  #. Se pueden renombrar (siempre de forma consistente) sin que la lista por
     comprensión cambie su significado.

     Por ejemplo, las dos listas por comprensión siguientes son equivalentes,
     puesto que producen el mismo resultado:

     ```python
     [x for x in (1, 2, 3)]
     ```

     ```python
     [y for y in (1, 2, 3)]
     ```

  #. No se pueden usar fuera de la lista por comprensión, ya que estarían fuera
     de su ámbito y no serían visibles.

     Por ejemplo, lo siguiente daría un error de nombre:
  
     ```python
     >>> e = [x for x in (1, 2, 3)]
     >>> x       # Intento acceder a la 'x' de la lista por comprensión
     Traceback (most recent call last):
       File "<stdin>", line 1, in <module>
     NameError: name 'x' is not defined
     ```
 
### Operaciones mutadoras

- En la siguiente tabla, $\underline{s}$ es una instancia de un tipo de
  secuencia mutable (por ejemplo, una lista), $\underline{t}$ es cualquier dato
  iterable y $\underline{x}$ es un dato cualquiera que cumple con las
  restricciones que impone $\underline{s}$:

!SALTO

-------------------------------------------------------------------------------------------
Operación                     Resultado
----------------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$          El elemento $i$-ésimo de $\underline{s}$ se sustituye
                              por $\underline{x}$

$s$`[`$i$`:`$j$`]`            La rodaja de $\underline{s}$ desde $\underline{i}$ hasta
`=` $t$                       $\underline{j}$ se sustituye por $\underline{t}$

$s$`[`$i$`:`$j$`:             Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$               por $\underline{t}$

!PYTHON(del) $\ s$`[`$i$`]`   Elimina el elemento $i$-ésimo de $\underline{s}$

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`]` \
`$j$`]`                       Equivale a hacer $s$`[`$i$`:`$j$`]` `=` `[]`

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`:`$k$`]`
`$j$`:`$k$`]`
-------------------------------------------------------------------------------------------

---

-----------------------------------------------------------------------------------------------------------------------------------
Operación                         Resultado
--------------------------------- -------------------------------------------------------------------------------------------------
$s$!PYTHON(.append)`(`$x$`)`      Añade $\underline{x}$ al final de $\underline{s}$; es igual que \
                                  $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` `[`$x$`]`

$s$!PYTHON(.clear())              Elimina todos los elementos de $\underline{s}$; es igual que \
                                  !PYTHON(del) $\ s$!PYTHON([:])

$s$!PYTHON(.copy())               Crea una copia *superficial* de $\underline{s}$; es igual que $s$!PYTHON([:])

$s$!PYTHON(.extend)`(`$t$`)` \    Extiende $\underline{s}$ con el contenido de $\underline{t}$; es igual que \
$s$ `+=` $t$                      $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` $t$ 

$s$ `*=` $n$                      Modifica $\underline{s}$ repitiendo su contenido $\underline{n}$ veces

$s$!PYTHON(.insert)`(`$i$`, `     Inserta $\underline{x}$ en $\underline{s}$ en el índice $\underline{i}$; es igual que
$x$`)`                            $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$!PYTHON(.pop)`(`[ $i$ ]`)`     Extrae el elemento $\underline{i}$ de $\underline{s}$ y lo devuelve\
                                  (por defecto, $i$ vale !PYTHON(-1))

$s$!PYTHON(.remove)`(`$x$`)`      Quita el primer elemento de $\underline{s}$ que sea igual a $\underline{x}$

$s$!PYTHON(.reverse())            Invierte los elementos de $\underline{s}$

$s$!PYTHON(.sort())               Ordena los elementos de $\underline{s}$
-----------------------------------------------------------------------------------------------------------------------------------

---

- La **copia superficial** (a diferencia de la **_copia profunda_**) significa
  que sólo se copia el objeto sobre el que se aplica la copia, **no sus
  elementos**.

- Por tanto, al crear la copia superficial, se crea sólo un nuevo objeto, donde
  se copiarán las referencias de los elementos del objeto original.

- Esto influye, sobre todo, cuando los elementos de una colección mutable
  también son objetos mutables.

- Por ejemplo, si tenemos listas dentro de otra lista, y copiamos ésta última
  con !PYTHON(.copy()), la nueva lista compartirá elementos con la lista
  original:

  ```python
  >>> x = [[1, 2], [3, 4]]   # los elementos de «x» también son listas
  >>> y = x.copy()           # «y» es una copia de «x»
  >>> x is y
  False                      # no son la misma lista
  >>> x[0] is y[0]
  True                       # sus elementos no se han copiado,
  >>> x[0].append(9)         # sino que están compartidos por «x» e «y»
  >>> x
  [[1, 2, 99], [3, 4]]
  >>> y
  [[1, 2, 99], [3, 4]]
  ```

---

- El método !PYTHON(sort) permite ordenar los elementos de la secuencia de
  forma ascendente o descendente:

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

## Conjuntos (!PYTHON(set) y !PYTHON(frozenset))

- Un conjunto es una colección **no ordenada** de elementos *hashables*.

- Se usan frecuentemente para comprobar si un elemento pertenece a un grupo,
  para eliminar duplicados en una secuencia y para realizar operaciones
  matemáticas como la _unión_, la _intersección_ y la _diferencia simétrica_.

- Como cualquier otra colección, los conjuntos permiten el uso de:

  - $x\ $ !PYTHON(in) $\ c$

  - !PYTHON(len)`(`$c$`)`

  - !PYTHON(for) $\ x\ $ !PYTHON(in) $\ c$

- Como son colecciones no ordenadas, los conjuntos **no almacenan la posición**
  de los elementos o el **orden** en el que se insertaron.
  
- Por tanto, tampoco admiten la indexación, las rodajas ni cualquier otro
  comportamiento propio de las secuencias.

---

- Cuando decimos que **un conjunto no está ordenado**, queremos decir que los
  elementos que contiene no se encuentran situados en una posición concreta.

  Es lo contrario de lo que ocurre con las sencuencias, donde cada elemento se
  encuentra en una posición indicada por su *índice* y podemos acceder a él
  usando la indexación.

- Además, en un conjunto **no puede haber elementos repetidos** (un elemento
  concreto sólo puede estar *una vez* dentro de un conjunto, es decir, o está
  una vez o no está).

- En resumen:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **En un conjunto:**

  Un elemento concreto, o está una vez, o no está.

  Si está, no podemos saber en qué posición (no tiene sentido preguntárselo).
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Existen dos tipos predefinidos de conjuntos: !PYTHON(set) y
  !PYTHON(frozenset).

- El tipo !PYTHON(set) es **mutable**, es decir, que su contenido puede cambiar
  usando métodos como !PYTHON(add) y !PYTHON(remove).

  Como es mutable, **no es _hashable_** y, por tanto, no puede usarse como
  clave de un diccionario o como elemento de otro conjunto.

- El tipo !PYTHON(frozenset) es **inmutable** y *hashable*. Por tanto, su
  contenido no se puede cambiar una vez creado y puede usarse como clave de un
  diccionario o como elemento de otro conjunto.

---

- Los dos tipos de conjuntos se crean con las funciones
  !PYTHON(set)`(`[!NT(iterable)]`)` y !PYTHON(frozenset)`(`[!NT(iterable)]`)`:

  - Si se llaman *sin argumentos*, devuelven un conjunto **vacío**:
  
    - !PYTHON(set()) devuelve un conjunto vacío de tipo !PYTHON(set).

    - !PYTHON(frozenset()) devuelve un conjunto vacío de tipo
      !PYTHON(frozenset).

    ```python
    >>> set()
    set()
    >>> frozenset()
    frozenset()
    ```

    Como se ve, esas son, precisamente, las **formas normales** de un conjunto
    vacío de tipo !PYTHON(set) y !PYTHON(frozenset).

  - Si se les pasa un *iterable* (como por ejemplo, una lista), devuelve un
    conjunto formado por los elementos del iterable:

    ```python
    >>> set([4, 3, 2, 2, 4])
    {2, 3, 4}
    >>> frozenset([4, 3, 2, 2, 4])
    frozenset({2, 3, 4})
    ```

---

- Además, existe una *sintaxis especial* para escribir **literales de conjuntos
  no vacíos de tipo !PYTHON(set)**, que consiste en encerrar sus elementos
  entre llaves y separados por comas: !PYTHON({'pepe', 'juan'}).

  ```python
  >>> x = {'pepe', 'juan'}  # un literal de tipo set, como set(['pepe', 'juan'])
  >>> x
  {'pepe', 'juan'}
  >>> type(x)
  <class 'set'>
  ```

  Esa es, precisamente, la **forma normal** de un conjunto no vacío y, por
  tanto, la que se usa cuando se visualiza desde el intérprete o se imprime con
  !PYTHON(print).

- Por tanto, para crear conjuntos congelados usando !PYTHON(frozenset) podemos
  usar esa sintaxis en lugar de usar listas como hicimos antes:

    ```python
    >>> frozenset({4, 3, 2, 2, 4})
    frozenset({2, 3, 4})
    ```

---

- También podría usarse con la función !PYTHON(set), pero entonces estaríamos
  creando un nuevo conjunto igual que el anterior, aunque no idéntico (es
  decir, sería una _copia_ del original):

  ```python
  >>> s = {4, 3, 2, 2, 4}
  >>> s
  {2, 3, 4}
  >>> t = set(s)
  >>> t
  {2, 3, 4}
  >>> s == t
  True
  >>> s is t
  False
  ```

---

- En memoria, los conjuntos se almacenan mediante una estructura de datos donde
  sus elementos no se identifican mediante ningún índice o clave especial.

- Por ejemplo, el siguiente conjunto:

  ```python
  d = {1, 2, 3}
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(conjunto_en_pythontutor.png)(Conjunto almacenado en memoria)(width=50%)(width=50%)

### Conjuntos por comprensión

- También se pueden crear **conjuntos por comprensión** usando la misma
  sintaxis de las **expresiones generadoras** y las **listas por comprensión**,
  pero esta vez encerrando la expresión entre llaves.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(conj_comp) ::= !T[{]!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])!MAS!T[}]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> {x ** 2 for x in [1, 2, 3]}
  {1, 4, 9}
  ```

- El resultado es directamente un valor de tipo !PYTHON(set), no un iterador.

---

- Los conjuntos por comprensión, al igual que las expresiones generadoras y las
  listas por comprensión, **determinan su propio _ámbito_**.

- Ese ámbito abarca todo el conjunto por comprensión, de principio a fin.

- Los identificadores que aparecen en la cláusula !PYTHON(for) se consideran
  _variables ligadas_ en el conjunto por comprensión.

- Esos identificadores se van ligando, uno a uno, a cada elemento de la
  secuencia indicada en la cláusula !PYTHON(in).

---

- Como son variables ligadas, cumplen estas dos propiedades:

  #. Se pueden renombrar (siempre de forma consistente) sin que el conjunto por
     comprensión cambie su significado.

     Por ejemplo, los dos conjuntos por comprensión siguientes son equivalentes,
     puesto que producen el mismo resultado:

     ```python
     {x for x in (1, 2, 3)}
     ```

     ```python
     {y for y in (1, 2, 3)}
     ```

  #. No se pueden usar fuera del conjunto por comprensión, ya que estarían
     fuera de su ámbito y no serían visibles.

     Por ejemplo, lo siguiente daría un error de nombre:

     ```python
     >>> e = {x for x in (1, 2, 3)}
     >>> x       # Intento acceder a la 'x' del conjunto por comprensión
     Traceback (most recent call last):
       File "<stdin>", line 1, in <module>
     NameError: name 'x' is not defined
     ```

### Operaciones

- $\underline{s}$ y $\underline{o}$ son conjuntos, y $\underline{x}$ es un
  valor cualquiera:

  --------------------------------------------------------------------------------------------------------------
  Operación                                 Resultado
  ----------------------------------------- --------------------------------------------------------------------
  !PYTHON(len)`(`$s$`)`                     Número de elementos de $\underline{s}$ (su cardinalidad)
                                           
  $x\ $ !PYTHON(in) $\ s$                   !PYTHON(True) si $\underline{x}$ pertenece a $\underline{s}$
                                           
  $x\ $ !PYTHON(not)\  !PYTHON(in) $\ s$    !PYTHON(True) si $\underline{x}$ no pertenece a $\underline{s}$
                                           
  $s$!PYTHON(.isdisjoint)`(`$o$`)`          !PYTHON(True) si $\underline{s}$ no tiene ningún elemento en común con $\underline{o}$
                                           
  $s$!PYTHON(.issubset)`(`$o$`)` \          !PYTHON(True) si $\underline{s}$ es un subconjunto de $\underline{o}$
  $s$ `<=` $o$                             
                                           
  $s$ `<` $o$                               !PYTHON(True) si $\underline{s}$ es un subconjunto propio de $\underline{o}$
                                           
  $s$!PYTHON(.issuperset)`(`$o$`)` \        !PYTHON(True) si $\underline{s}$ es un superconjunto de $\underline{o}$
  $s$ `>=` $o$                             
                                           
  $s$ `>` $o$                               !PYTHON(True) si $\underline{s}$ es un superconjunto propio de $\underline{o}$
  --------------------------------------------------------------------------------------------------------------

---

-----------------------------------------------------------------------------------------------------------
Operación                                          Resultado
-------------------------------------------------- --------------------------------------------------------
$s$!PYTHON(.union)`(`$o$`)` \                      Unión de $\underline{s}$ y $\underline{o}$ ($s \cup o$)
$s$ `|` $o$

$s$!PYTHON(.intersection)`(`$o$`)` \               Intersección de $\underline{s}$ y $\underline{o}$ ($s \cap o$)
$s$ `&` $o$

$s$!PYTHON(.difference)`(`$o$`)` \                 Diferencia de $\underline{s}$ y $\underline{o}$ ($s \setminus o$)
$s$ `-` $o$

$s$!PYTHON(.symmetric_difference)`(`$o$`)` \       Diferencia simétrica de $\underline{s}$ y $\underline{o}$ ($s \vartriangle o$)
$s$ `^` $o$

$s$!PYTHON(.copy())                                Devuelve una copia superficial de $\underline{s}$
-----------------------------------------------------------------------------------------------------------

---

- Tanto !PYTHON(set) como !PYTHON(frozenset) admiten **comparaciones entre conjuntos**.

- Suponiendo que `a` y `b` son conjuntos:

  - `a == b` si y sólo si cada elemento de `a` pertenece también a `b`, y
    viceversa; es decir, si cada uno es un subconjunto del otro.

  - `a <= b` si y sólo si `a` es un *subconjunto* de `b` (es decir, si cada
    elemento de `a` está también en `b`).

  - `a < b` si y sólo si `a` es un *subconjunto propio* de `b` (es decir, si
    `a` es un subconjunto de `b`, pero no es igual a `b`).

  - `a >= b` si y sólo si `a` es un *superconjunto* de `b` (es decir, si cada
    elemento de `b` está también en `a`).

  - `a > b` si y sólo si `a` es un *superconjunto propio* de `b` (es decir, si
    `a` es un superconjunto de `b`, pero no es igual a `b`).

### Operaciones sobre conjuntos mutables

- Estas tablas sólo se aplica a conjuntos mutables (o sea, al tipo !PYTHON(set)
  y no al !PYTHON(frozenset)):

-------------------------------------------------------------------------------------------------------------------------------------------
Operación                                                                          Resultado
---------------------------------------------------------------------------------- --------------------------------------------------------
$s$!PYTHON(.update)`(`$o$`)` \                                                     Actualiza $\underline{s}$ añadiendo los elementos de
$s$ `|=` $o$                                                                       $\underline{o}$

$s$!PYTHON(.intersection_update)`(`$o$`)` \                                        Actualiza $\underline{s}$ manteniendo sólo los elementos
$s$ `&=` $o$                                                                       que están en $\underline{s}$ y $\underline{o}$

$s$!PYTHON(.difference_update)`(`$o$`)` \                                          Actualiza $\underline{s}$ eliminando los elementos que
$s$ `-=` $o$                                                                       están en $\underline{o}$

$s$!PYTHON(.symmetric_difference_update)`(`$o$`)` \                                Actualiza $\underline{s}$ manteniendo sólo los elementos
$s$ `^=` $o$                                                                       que están en $\underline{s}$ y $\underline{o}$ pero no
                                                                                   en ambos
-------------------------------------------------------------------------------------------------------------------------------------------

---

-----------------------------------------------------------------------------------------------------------------------------
Operación                        Resultado
-------------------------------- --------------------------------------------------------------------------------------------
$s$!PYTHON(.add)`(`$x$`)`        Añade $\underline{x}$ a $\underline{s}$

$s$!PYTHON(.remove)`(`$x$`)`     Elimina $\underline{x}$ de $\underline{s}$ (produce !PYTHON(KeyError) si $\underline{x}$ no está en $\underline{s}$)

$s$!PYTHON(.discard)`(`$x$`)`    Elimina $\underline{x}$ de $\underline{s}$ si está en $\underline{s}$

$s$!PYTHON(.pop())               Elimina y devuelve un valor cualquiera de $\underline{s}$ (produce !PYTHON(KeyError) si $\underline{s}$ está vacío)

$s$!PYTHON(.clear())             Elimina todos los elementos de $\underline{s}$
-----------------------------------------------------------------------------------------------------------------------------

### Recorrido de conjuntos

- Como cualquier otro dato iterable, los conjuntos se pueden recorrer usando
  **iteradores**.

- El **orden** en el que se recorren los elementos del conjunto **no está
  determinado de antemano**, es decir, que el iterador puede entregar los
  elementos del conjunto **en cualquier orden**:

:::: columns

::: column

- Con un iterador:

  ```python
  >>> s = {3, 1, 2}
  >>> it = iter(s)
  >>> next(it)
  1
  >>> next(it)
  2
  >>> next(it)
  3
  ```

:::

::: column

- Con un bucle !PYTHON(for):

  ```python
  >>> s = {3, 1, 2}
  >>> for e in s:
  ...     print(e)
  ...
  1
  2
  3
  ```

:::

::::

- Aunque, a la vista de este ejemplo, pudiera parecer que el conjunto siempre
  se va a recorrer como si estuviese ordenado, **no hay que confiar nunca** en
  que eso se vaya a cumplir siempre.

## Diccionarios (!PYTHON(dict))

- Un **diccionario** es una colección que almacena _correspondencias_ (o
  _asociaciones_) entre valores.

- Por tanto, **los elementos de un diccionario son parejas de valores llamados
  _clave_ y _valor_**, y lo que hace el diccionario es almacenar las
  _claves_ y el _valor_ que le corresponde a cada clave.

- Además, los elementos de un diccionario son datos mutables y, por tanto, los
  diccionarios también son **mutables**. 

- En consecuencia, los diccionarios **NO** son _hashables_.

---

- Los diccionarios se pueden crear:

  - Con una pareja de llaves:

    ```python
    {}
    ```

    que representan el **diccionario vacío**.

  - Encerrando entre llaves una lista de parejas !NT(clave)!T(:)!NT(valor)
    separadas por comas:

    ```python
    {'juan': 4098, 'pepe': 4127}
    ```

    Esa es precisamente la **forma normal** de un diccionario y, por tanto, la
    que se usa cuando se visualiza desde el intérprete o se imprime con
    !PYTHON(print).

  - Usando la función !PYTHON(dict).

---

- Por ejemplo:

  ```python
  >>> v1 = {}                                          # diccionario vacío
  >>> v2 = dict()                                      # también diccionario vacío
  >>> v1 == v2
  True                                                 # son iguales
  >>> a = {'uno': 1, 'dos': 2, 'tres': 3}              # literal
  >>> b = dict(uno=1, dos=2, tres=3)                   # argumentos con nombre
  >>> c = dict([('dos', 2), ('uno', 1), ('tres', 3)])  # lista de tuplas
  >>> d = dict({'tres': 3, 'uno': 1, 'dos': 2})        # crea una copia
  >>> e = dict(zip(['uno', 'dos', 'tres'], [1, 2, 3])) # con dos iterables
  >>> a == b and b == c and c == d and d == e          # todos son iguales
  True
  ```

---

- En memoria, los diccionarios se almacenan como **tablas** de dos columnas, la
  clave y el valor.

- Por ejemplo, el siguiente diccionario:

  ```python
  d = {'a': 1, 'b': 2, 'c': 3}
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(diccionario_en_pythontutor.png)(Diccionario almacenado en memoria)(width=50%)(width=50%)

---

- Las **claves** de un diccionario deben cumplir dos **restricciones**:

  #. Deben ser **únicas** en ese diccionario.

  #. Deben ser **_hashables_**.

#### Claves únicas

- En un diccionario dado, **cada clave sólo puede asociarse con un único
  valor**.

- Por tanto, **en un diccionario no puede haber claves repetidas**, es decir,
  que no puede haber dos elementos distintos con la misma clave.

- Esto es así porque los elementos de un diccionario se identifican mediante su
  clave.

  Así que, para acceder a un elemento dentro de un diccionario, debemos indicar
  la clave del elemento.

- Los tipos numéricos que se usen como claves obedecen las reglas normales de
  comparación numérica.

- Por tanto, si dos números son considerados iguales (como !PYTHON(1) y
  !PYTHON(1.0)) entonces se consideran la misma clave dentro del diccionario.

---

- Si se intenta crear un diccionario con claves repetidas, sólo se almacenará
  uno de los elementos que tengan la misma clave (los demás se ignoran):

  ```python
  >>> a = {'perro': 'dog', 'gato': 'cat', 'perro': 'doggy'}
  >>> a
  {'perro': 'doggy', 'gato': 'cat'}
  ```

  Como se ve, la clave !PYTHON('perro') está repetida y, por tanto, sólo se
  almacena uno de los dos elementos con clave repetida, que siempre es el
  último que se va a insertar en el diccionario.

  En este caso, se almacena el elemento !PYTHON('perro': 'doggy') y se ignora
  el !PYTHON('perro': 'dog').

#### Claves *hashables*

- Por otra parte, las **claves** de un diccionario deben ser datos
  **_hashables_**.

- Por tanto, no se pueden usar como clave una lista, un conjunto !PYTHON(set),
  otro diccionario o cualquier otro dato mutable.

- Si se intenta crear un diccionario con una clave no _hashable_, se produce un
  error !PYTHON(TypeError):

  ```python
  >>> {[1, 2]: 'a', [3, 4]: 'b'}         # Las listas no son hashables
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: unhashable type: 'list'
  >>> {{1, 2}: 'a', {3, 4}: 'b'}         # Los conjuntos set tampoco
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: unhashable type: 'set'
  ```

- En cambio, sí se puede usar un !PYTHON(frozenset), al ser _hashable_:

  ```python
  >>> {frozenset({1, 2}): 'a', frozenset({3, 4}): 'b'}
  {frozenset({1, 2}): 'a', frozenset({3, 4}): 'b'}
  ```

---

- Desde la versión 3.7 de Python, los elementos dentro de un diccionario se
  almacenan en **el orden en el que se van _insertando_ dentro del
  diccionario**, aunque ese orden sólo tiene importancia en determinadas
  situaciones concretas.

- Dos diccionarios se consideran **iguales** si ambos contienen los mismos
  elementos, es decir, si tienen las mismas parejas !NT(clave)!T(:)!NT(valor),
  sin importar el orden en el que aparezcan los elementos en el diccionario:

  ```python
  >>> {'a': 1, 'b': 2} == {'b': 2, 'a': 1}
  True
  ```

---

- Para **acceder a un elemento** del diccionario se usa una sintaxis idéntica a
  la de la **indexación**, salvo que, en este caso, en lugar de usar el índice
  o posición del elemento, se usa la clave:

  ```python
  >>> a = {'perro': 'dog', 'gato': 'cat'}
  >>> a['perro']
  'dog'
  ```

- Si se intenta acceder a un elemento usando una clave que no existe, se lanza
  una excepción de tipo !PYTHON(KeyError):

  ```python
  >>> a['caballo']
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  KeyError: 'caballo'
  ```

### Diccionarios por comprensión

- También se pueden crear **diccionarios por comprensión** usando una sintaxis
  análoga a la de los **conjuntos por comprensión** (encerrando la expresión
  entre llaves), pero de forma que los elementos estén formados por parejas de
  clave y valor separados por `:`.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(dicc_comp) ::= !T[{]!NT[clave]!T[:]!NT[valor] (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])!MAS!T[}]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde !NT(clave) debe ser una expresión que devuelva valores _hashables_, y
  !NT(valor) puede ser una expresión cualquiera.

- Por ejemplo:

  ```python
  >>> {x: x ** 2 for x in [1, 2, 3]}
  {1: 1, 2: 4, 3: 9}
  ```

  devuelve el diccionario que asocia a cada número 1, 2 y 3 con su
  correspondiente cuadrado.

- El resultado es directamente un valor de tipo !PYTHON(dict), no un iterador.

---

- Los diccionarios por comprensión, al igual que los conjuntos por comprensión,
  las expresiones generadoras y las listas por comprensión, **determinan su
  propio _ámbito_**.

- Ese ámbito abarca todo el diccionario por comprensión, de principio a fin.

- Los identificadores que aparecen en la cláusula !PYTHON(for) se consideran
  _variables ligadas_ en el diccionario por comprensión.

- Esos identificadores se van ligando, uno a uno, a cada elemento de la
  secuencia indicada en la cláusula !PYTHON(in).

---

- Como son variables ligadas, cumplen estas dos propiedades:

  #. Se pueden renombrar (siempre de forma consistente) sin que el diccionario
  por comprensión cambie su significado.

     Por ejemplo, los dos diccionarios por comprensión siguientes son
     equivalentes, puesto que producen el mismo resultado:

     ```python
     {x: x ** 2 for x in (1, 2, 3)}
     ```

     ```python
     {y: y ** 2 for y in (1, 2, 3)}
     ```

  #. No se pueden usar fuera del diccionario por comprensión, ya que estarían
     fuera de su ámbito y no serían visibles.

     Por ejemplo, lo siguiente daría un error de nombre:

     ```python
     >>> e = {x: x ** 2 for x in (1, 2, 3)}
     >>> x       # Intento acceder a la 'x' del diccinario por comprensión
     Traceback (most recent call last):
       File "<stdin>", line 1, in <module>
     NameError: name 'x' is not defined
     ```

### Operaciones

- $\underline{d}$ y $\underline{o}$ son diccionarios, $\underline{c}$ es una
  clave válida y $\underline{v}$ es un valor cualquiera:

  -----------------------------------------------------------------------------------------------------------------------------------------------
  Operación                               Resultado                                                                                         
  --------------------------------------- -------------------------------------------------------------------------------------------------------
  $d$`[`$c$`]`                            Devuelve el valor asociado a $\underline{c}$ en $\underline{d}$ (lanza !PYTHON(KeyError) si
                                          $\underline{c}$ no está en $\underline{d}$)
                                         
  $d$`[`$c$`]` `=` $v$                    Asocia a la clave $\underline{c}$ el valor $\underline{v}$ en $\underline{d}$ (crea el elemento
                                          dentro de $\underline{d}$ si la clave $\underline{c}$ no estaba ya en $\underline{d}$)
                                         
  !PYTHON(del) $\ d$`[`$c$`]`             Borra de $\underline{d}$ el elemento cuya clave es $\underline{c}$ (lanza !PYTHON(KeyError) si
                                          $\underline{c}$ no está en $\underline{d}$)
                                         
  !PYTHON(len)`(`$d$`)`                   Número de elementos de $\underline{d}$
                                           
  $c\ $ !PYTHON(in) $\ d$                 !PYTHON(True) si $\underline{d}$ contiene un elemento con clave $\underline{c}$
                                         
  $c\ $ !PYTHON(not)\  !PYTHON(in)        !PYTHON(True) si $\underline{d}$ no contiene un elemento con clave $\underline{c}$
  $\ d$
                                         
  $d$!PYTHON(.clear())                    Elimina todos los elementos de $\underline{d}$
                                         
  $d$!PYTHON(.copy())                     Devuelve una copia superficial de $\underline{d}$
  -----------------------------------------------------------------------------------------------------------------------------------------------

---

------------------------------------------------------------------------------------------------------------------------------------
Operación                                          Resultado
-------------------------------------------------- ---------------------------------------------------------------------------------
$d$!PYTHON(.get)`(`$c$[`,` $def$]`)`               Si la clave $\underline{c}$ está en $\underline{d}$, devuelve $d$`[`$c$`]`; si
                                                   no está, devuelve $\underline{def}$, que por defecto es !PYTHON(None)
                                     
$d$!PYTHON(.pop)`(`$c$[`,` $def$]`)`               Si la clave $\underline{c}$ está en $\underline{d}$, devuelve $d$`[`$c$`]` y
                                                   elimina de $\underline{d}$ el elemento con clave $\underline{c}$; si no está,
                                                   devuelve $\underline{def}$ (si no se pasa $\underline{def}$ y la clave
                                                   $\underline{c}$ no está en $\underline{d}$, lanza un !PYTHON(KeyError))

$d$!PYTHON(.popitem())                             Selecciona un elemento de $\underline{d}$ siguiendo un orden LIFO, lo elimina de
                                                   $\underline{d}$ y lo devuelve en forma de tupla `(`$clave$`, `$valor$`)` (lanza
                                                   un !PYTHON(KeyError) si $\underline{d}$ está vacío)
                                                  
$d$!PYTHON(.setdefault)`(`$c$[`,` $def$]`)`        Si la clave $\underline{c}$ está en $\underline{d}$, devuelve $d$`[`$c$`]`; si
                                                   no está, inserta en $\underline{d}$ un elemento con clave $\underline{c}$ y
                                                   valor $\underline{def}$, y devuelve $\underline{def}$ (que por defecto es
                                                   !PYTHON(None))
                                                  
$d$!PYTHON(.update)`(`$o$`)`                       Actualiza $\underline{d}$ con las parejas ($clave$, $valor$) de $\underline{o}$,
                                                   sobreescribiendo las claves ya existentes en $\underline{d}$, y devuelve 
                                                   !PYTHON(None)
------------------------------------------------------------------------------------------------------------------------------------

### Recorrido de diccionarios

- Como cualquier otro dato iterable, los diccionarios se pueden recorrer usando
  iteradores.

- El orden en el que se recorren los elementos del diccionario es el orden en
  el que están almacenados los elementos dentro del diccionario que, como ya
  sabemos, desde la versión 3.7 de Python coincide con el orden en el que se
  han ido insertando los elementos en el diccionario.

- Los iteradores creados sobre un diccionario, en realidad, recorren sus
  **claves**:

:::: columns

::: column

- Con un iterador:

  ```python
  >>> d = {'a': 1, 'b': 2}
  >>> it = iter(d)
  >>> next(it)
  'a'
  >>> next(it)
  'b'
  ```

:::

::: column

- Con un bucle !PYTHON(for):

  ```python
  >>> d = {'a': 1, 'b': 2}
  >>> for k in d:
  ...     print(k)
  ...
  a
  b
  ```

:::

::::

---

- Si, además de acceder a las **claves**, necesitamos también acceder a los
  **valores** del diccionario mientras lo recorremos, podemos:

  - Acceder al valor a partir de la clave usando **indexación**:

    ```python
    >>> for k in d:
    ...     print(k, d[k])
    ...
    a 1
    b 2
    ```

  - Usar el método !PYTHON(items) sobre el diccionario (el cual devuelve un
    objeto que, al iterar sobre él, genera una secuencia de tuplas
    !T{(}!NT(clave)!T(,) !NT(valor)!T{)}), y combinarlo con el **desempaquetado
    de tuplas**:

    ```python
    >>> d.items()
    dict_items([('a', 1), ('b', 2)]
    >>> for k, v in d.items():
    ...     print(k, v)
    ...
    a 1
    b 2
    ```

---

- Otros métodos útiles para recorrer un diccionario son !PYTHON(keys) y
  !PYTHON(values).

  !SALTOBEAMER

:::: columns

::: column

- !PYTHON(keys) devuelve un objeto que, al iterar sobre él, va generando las
  **claves** del diccionario sobre el que se invoca:


  ```python
  >>> d.keys()
  dict_keys(['a', 'b'])
  >>> for k in d.keys():
  ...     print(k)
  ...
  a
  b
  ```

:::

::: column

!ifdef(LATEX)(\vspace{0.3em})

- !PYTHON(values) devuelve un objeto que, al iterar sobre él, va generando los
  **valores** del diccionario sobre el que se invoca:

  ```python
  >>> d.values()
  dict_values([1, 2])
  >>> for v in d.values():
  ...     print(v)
  ...
  1
  2
  ```

:::

::::

!SALTOBEAMER
!ifdef(LATEX)(\vspace{0.3em})

- En la práctica, no resulta muy útil usar !PYTHON(keys), ya que se puede hacer
  lo mismo recorriendo directamente el propio diccionario, como ya sabemos:

  ```python
  >>> for k in d:
  ...     print(k)
  ...
  a
  b
  ```

<!--

---

- ¿En qué orden se almacenan los elementos de un diccionario? Y, lo más
  importante: ¿en qué orden se van visitando los elementos de un diccionario
  cuando se recorre con un iterador?

  - Antes de la versión 3.7 de Python, no estaba determinado en qué orden se
    almacenaban los elementos en un diccionario. Por tanto, al recorrer un
    diccionario con un iterador, no se sabía de antemano en qué orden se iban a
    visitar sus elementos.

  - A partir de la versión 3.7, se decidió que los elementos se almacenarían en
    el orden en el que se van insertando dentro del diccionario.

- Por tanto:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  A partir de Python 3.7, al recorrer un diccionario, un iterador devolverá
  siempre sus elementos **en el orden en el que se han ido insertando** dentro
  del diccionario.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-->



## Documentos XML

:::: columns

::: {.column width=30%}

- Los documentos XML se pueden considerar **datos estructurados en forma de
  _árbol_** (es decir, con una estructura **jerárquica** y, por tanto, **no
  secuencial**).

- Por ejemplo, supongamos el siguiente documento XML:

:::

::: {.column width=70%}

```xml
<?xml version="1.0"?>
<raiz>
    <alumno numero="111">
        <dni>12312312A</dni>
        <nombre>
            <propio>Juan</propio>
            <apellidos>García González</apellidos>
        </nombre>
        <telefono>666555444</telefono>
        <nota>7</nota>
    </alumno>
    <alumno numero="222">
        <dni>44455566B</dni>
        <nombre>
            <propio>María</propio>
            <apellidos>Pérez Rodríguez</apellidos>
        </nombre>
        <telefono>696969696</telefono>
        <nota>9</nota>
    </alumno>
    <madre>
        <dni>22222222C</dni>
    </madre>
</raiz>
```

:::

::::

---

- Podemos encontrarnos lo siguiente:

  - Lo que hay entre ángulos (como `<raiz>`) es una _etiqueta_.

  - Lo que hay entre dos etiquetas (como el `7` en `<nota>7</nota>`) es el
    _texto_ de la etiqueta.

  - Lo que hay dentro de la etiqueta (como `numero="111"`) es un _atributo_ de
    la etiqueta.

    `numero="111"` es un atributo de la primera etiqueta `<alumno>`.

    `numero` es el _nombre_ del atributo.

    `111` es el _valor_ del atributo `numero`.

  - Puede haber etiquetas con uno o varios atributos y etiquetas sin atributos.

---

- Ese documento representaría la siguiente estructura jerárquica:

  !DOT(documento-xml.svg)()(width=100%)(width=70%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [shape = plaintext, fillcolor = transparent, fixedsize = shape, height = 0.3, width = 0.4]
  edge [arrowhead = none]
  rankdir = TB
  alumno1[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=111)</font>>, fixedsize = false]
  dni1[label = <dni<br/><font face="monospace" color="blue" point-size="10">(123123123A)</font>>]
  nombre1[label = "nombre"]
  telefono1[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(666555444)</font>>, height = 0.4]
  nota1[label = <nota<br/><font face="monospace" color="blue" point-size="10">(7)</font>>]
  propio1[label = <propio<br/><font face="monospace" color="blue" point-size="10">(Juan)</font>>]
  apellidos1[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(García González)</font>>]
  alumno2[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=222)</font>>, fixedsize = false]
  dni2[label = <dni<br/><font face="monospace" color="blue" point-size="10">(44455566B)</font>>]
  nombre2[label = "nombre"]
  telefono2[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(696969696)</font>>, height = 0.4]
  nota2[label = <nota<br/><font face="monospace" color="blue" point-size="10">(9)</font>>]
  propio2[label = <propio<br/><font face="monospace" color="blue" point-size="10">(María)</font>>]
  apellidos2[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(Pérez Rodríguez)</font>>]
  dni3[label = <dni<br/><font face="monospace" color="blue" point-size="10">(22222222C)</font>>]
  raiz -> alumno1, alumno2, madre
  alumno1 -> dni1, nombre1, telefono1, nota1
  nombre1 -> propio1, apellidos1
  alumno2 -> dni2, nombre2, telefono2, nota2
  nombre2 -> propio2, apellidos2
  madre -> dni3
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Se observa que:

  - **Cada nodo representa una etiqueta** del documento XML.

  - Si una etiqueta contiene a otra, su correspondiente nodo en el árbol tendrá
    un hijo que representa a la etiqueta que contiene.

  - Los hijos de un nodo están ordenados por la posición que ocupan dentro de
    su etiqueta padre.

### Acceso

- El módulo `xml.etree.ElementTree` (documentado en
  <https://docs.python.org/3/library/xml.etree.elementtree.html>) implementa
  una interfaz sencilla y eficiente para interpretar y crear datos XML.

- Para importar los datos de un archivo XML, podemos hacer:

  ```python
  import xml.etree.ElementTree as ET
  arbol = ET.parse('archivo.xml')
  raiz = arbol.getroot()
  ```

- Si los datos XML se encuentran ya en una cadena, se puede hacer directamente:

  ```python
  raiz = ET.fromstring(datos_en_una_cadena)
  ```

---

- Los nodos del árbol se representan internamente mediante objetos de tipo
  `Element`, los cuales disponen de ciertos atributos y responden a ciertos
  métodos.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **¡Cuidado!** Aquí, cuando hablamos de _atributos_, nos referimos a
  información que contiene el objeto (una cualidad del objeto según el
  _paradigma orientado a objetos_) y a la cual se puede acceder usando el
  operador punto (`.`), no a los atributos que pueda tener una etiqueta según
  consten en el documento XML.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los objetos de tipo `Element` disponen de los siguientes atributos:

  - `tag`: una cadena que representa a la etiqueta del nodo (por ejemplo: si la
    etiqueta es `<alumno>`, entonces `tag` contendrá !PYTHON('alumno')).

  - `attrib`: un diccionario que representa a los atributos de esa etiqueta en
    el documento XML.

  - `text`: una cadena que representa el contenido del nodo, es decir, el texto
    que hay entre **`<`_etiqueta_`>`** y **`</`_etiqueta_`>`**.

---

- Por ejemplo, si tenemos la siguiente etiqueta en el documento XML:

  ```xml
  <telefono tipo="movil">666555444</telefono>
  ```

  y la variable `nodo` contiene el nodo (es decir, el objeto `Element`) que
  representa a dicha etiqueta en el árbol, entonces:

  - !PYTHON(nodo.tag) valdrá !PYTHON('telefono').

  - !PYTHON(nodo.attrib) valdrá !PYTHON({'tipo': 'movil'}).

  - !PYTHON(nodo.text) valdrá !PYTHON('666555444').

---

- En nuestro caso, `raiz` es un objeto de tipo `Element` que, además,
  representa al nodo raíz del árbol XML.

- Por tanto, tendríamos lo siguiente:

  ```python
  >>> raiz.tag
  'raiz'
  >>> raiz.attrib
  {}
  >>> raiz.text
  '\n    '              # ¿Por qué?
  ```

- Los objetos `Element` son **iterables**. Por ejemplo, el nodo raíz tiene
  **nodos hijos** (nodos que «cuelgan» directamente del nodo raíz) sobre los
  cuales se puede iterar desde el objeto `raiz`:

  ```python
  >>> for hijo in raiz:
  ...     print(hijo.tag, hijo.attrib)
  ...
  alumno {'numero': '111'}
  alumno {'numero': '222'}
  madre {}
  ```

---

- Los hijos están anidados, y podemos acceder a nodos concretos a través de su
  índice (es decir, que los objetos `Element` son **indexables**):

  ```python
  >>> raiz[0]       # el primer hijo directo de raiz
  <Element 'alumno' at 0x7f929c29cf90>
  >>> raiz[0][2]    # el tercer hijo directo del primer hijo directo de raiz
  <Element 'telefono' at 0x7f929c29d180>
  >>> raiz[0][2].text
  '666555444'
  ```

---

- Los objetos de tipo `Element` disponen de métodos útiles para iterar
  recursivamente sobre todos los subárboles situados debajo de él (sus hijos,
  los hijos de sus hijos, y así sucesivamente).

- Por ejemplo, el método `iter` devuelve un **iterador** que recorre todos los
  nodos del árbol desde el nodo actual (el nodo sobre el que se invoca al
  método) en un orden _primero en profundidad_.

- Eso quiere decir que va visitando los nodos en el mismo orden en el que se
  encuentran escritos en el documento XML, incluyendo el propio nodo sobre el
  que se invoca.

---

:::: columns

::: column

- Por ejemplo:

  ```python
  >>> for nodo in raiz.iter():
  ...     print(nodo.tag)
  ...
  raiz
  alumno
  dni
  nombre
  propio
  apellidos
  telefono
  nota
  alumno
  dni
  nombre
  propio
  apellidos
  telefono
  nota
  madre
  dni
  ```

:::

::: column

- Si se le pasa una etiqueta como argumento, devolverá únicamente los nodos que
  tengan esa etiqueta:

  ```python
  >>> for dni in raiz.iter('dni'):
  ...     print(dni.text)
  ...
  12312312A
  44455566B
  22222222C
  ```

:::

::::

---

- El método `findall` devuelve una lista con los nodos que tengan una cierta
  etiqueta y que sean hijos directos del nodo sobre el que se invoca.

  Puede devolver una lista vacía si no hay nodos que cumplan la condición.

- El método `find` devuelve el primer hijo directo del nodo sobre el que se
  invoca, siempre que tenga una cierta etiqueta indicada como argumento.

  Puede devolver !PYTHON(None) si el nodo no tiene ningún hijo con esa
  etiqueta.

- El método `get` devuelve el valor de algún atributo de la etiqueta asociada a
  ese nodo:

  ```python
  >>> for alumno in raiz.findall('alumno'):
  ...     numero = alumno.get('numero')
  ...     dni = alumno.find('dni').text
  ...     print(numero, dni)
  ...
  111 12312312A
  222 44455566B
  ```

---

- Si la etiqueta no tiene el atributo indicado en el argumento de `get`, éste
  devuelve !PYTHON(None) o el valor que se haya indicado en el segundo
  argumento:

  ```python
  >>> alumno = raiz[0]
  >>> alumno.get('numero')
  111
  >>> alumno.get('altura')
  None
  >>> alumno.get('altura', 0)
  0
  >>> alumno.get('numero', 0)
  111
  ```

- También disponemos de la función `dump` que devuelve la cadena
  correspondiente al nodo que se le pase como argumento:

  ```python
  >>> ET.dump(raiz[0][2])
  <telefono>666555444</telefono>
  ```

---

- Para una especificación más sofisticada de los elementos a encontrar, se
  pueden usar las expresiones `XPath` con los métodos `find` y `findall`:

  ----------------------------------------------------------------------------------------------------------------------------
  Sintaxis             Significado                                                                                         
  -------------------- ----------------------------------------------------------------------------------------------------------
  **_etiqueta_**       Selecciona todos los nodos hijo con la etiqueta **_etiqueta_**. Por ejemplo, `pepe` selecciona todos
                       los nodos hijo llamados `pepe`, y `pepe/juan` selecciona todos los nietos llamados `juan` en todos los
                       hijos llamados `pepe`.

  `*`                  Selecciona todos los nodos hijo inmediatos. Por ejemplo, `*/pepe` selecciona todos los nietos llamados
                       `pepe`.

  `.`                  Selecciona el nodo actual. Se usa, sobre todo, al principio de la ruta para indicar que es una ruta
                       relativa.

  `//`                 Selecciona todos los subnodos en cualquier nivel por debajo de un nodo. Por ejemplo,
                       `.//pepe` selecciona todos los nodos `pepe` que haya en todo el árbol.

  `..`                 Selecciona el nodo padre. Devuelve !PYTHON(None) si se intenta acceder a un ancestro del nodo de
                       inicio (aquel sobre el que se ha llamado al método `find`).
  -------------------------------------------------------------------------------------------------------------------------------

---

- Continuación de las expresiones `XPath`:

  -------------------------------------------------------------------------------------------------------------------------------------------
  Sintaxis                            Significado                                                                                         
  ----------------------------------- -------------------------------------------------------------------------------------------------------
  `[@`**_atrib_**`]`                  Selecciona todos los nodos que tienen el atributo **_atrib_**.

  `[@`**_atrib_**`='`**_valor_**`']`  Selecciona todos los nodos que tienen el valor **_valor_** en el atributo **_atrib_**. El valor no
                                      puede contener apóstrofes.

  `[@`**_atrib_**`!='`**_valor_**`']` Selecciona todos los nodos que tienen el valor **_valor_** en el atributo **_atrib_**. El valor no
                                      puede contener apóstrofes.


  `[`**_etiqueta_**`]`                Selecciona todos los nodos que tienen un hijo inmediato llamado **_etiqueta_**.

  `[`**_posición_**`]`                Selecciona todos los nodos situados en cierta **_posición_**. Ésta puede ser un entero (`1 ` es la
                                      primera posición), la expresión `last()` (la última posición) o una posición relativa a la
                                      última posición (por ejemplo, `last() - 1`).
  ----------------------------------------------------------------------------------------------------------------------------

!EJEMPLOS

```python
# Los nodos de nivel más alto:
>>> raiz.findall(".")
[<Element 'raiz' at 0x7f929c29cf40>]

# Los nietos 'dni' de los hijos 'alumno' de los nodos de nivel más alto:
>>> raiz.findall("./alumno/dni")
[<Element 'dni' at 0x7f929c29d040>,
 <Element 'dni' at 0x7f929c29d270>]

# Lo de antes equivale a hacer (porque el nodo actual es el raíz):
>>> raiz.findall("alumno/dni")
[<Element 'dni' at 0x7f929c29d040>,
 <Element 'dni' at 0x7f929c29d270>]

# Los nodos con numero='111' que tienen un hijo 'dni':
>>> raiz.findall(".//dni/..[@numero='111']")
[<Element 'alumno' at 0x7f929c29cf90>]

# Antes de // hay que poner algo que indique el nodo debajo del
# cual se va a buscar:
>>> raiz.findall("//dni/..[@numero='111']")
SyntaxError: cannot use absolute path on element
```

!EJEMPLOS

```python
# Todos los nodos 'dni' del árbol completo:
>>> raiz.findall('.//dni')
[<Element 'dni' at 0x7f547a0e9950>,
 <Element 'dni' at 0x7f547a0e9b80>,
 <Element 'dni' at 0x7f547a0e9e00>]

# Sólo los DNIs que estén por debajo de un nodo 'madre'
# en cualquier nivel:
>>> raiz.findall('madre//dni')
[<Element 'dni' at 0x7f547a0e9e00>]

# Los nodos 'dni' que son hijos de los nodos con numero='111':
>>> raiz.findall(".//*[@numero='111']/dni")
[<Element 'dni' at 0x7f929c29d040>]

# Los nodos 'alumno' que son hijos segundos de sus padres:
>>> raiz.findall(".//alumno[2]")
[<Element 'alumno' at 0x7f929c29d220>]

# Los nodos 'alumno' hijos directos del actual que tienen un hijo 'nota':
>>> raiz.findall("./alumno[nota]")
[<Element 'alumno' at 0x7f929c29cf90>,
 <Element 'alumno' at 0x7f929c29d220>]

# Lo de antes equivale a hacer (porque el nodo actual es el raíz):
>>> raiz.findall("alumno[nota]")
[<Element 'alumno' at 0x7f929c29cf90>,
 <Element 'alumno' at 0x7f929c29d220>]
```

### Modificación

- `ElementTree` proporciona una forma sencilla de crear documentos XML y
  escribirlos en archivos.

- Para ello, usamos el método `write`.

- Una vez creado, un objeto `Element` puede manipularse directamente:

  - Cambiando los atributos del objeto, como `text` o `attrib`.

  - Cambiando los atributos de la etiqueta a la que representa el objeto, con
    el método `set`.

  - Añadiendo nuevos hijos con los métodos `append` o `insert`.

  - Eliminando hijos con el método `remove`.

---

- Por ejemplo, supongamos que queremos sumarle 1 a la `nota` de cada alumno y
  añadir un atributo `modificado` a la etiqueta `nota`:

  ```python
  >>> for nota in raiz.iter('nota'):
  ...     nueva_nota = int(nota.text) + 1
  ...     nota.text = str(nueva_nota)
  ...     nota.set('modificado', 'si')
  ...
  >>> arbol.write('salida.xml')
  ```

---

- Nuestro XML tendría ahora el siguiente aspecto:

  ```xml
  <?xml version="1.0"?>
  <raiz>
      <alumno numero="111">
          <dni>12312312A</dni>
          <nombre>
              <propio>Juan</propio>
              <apellidos>García González</apellidos>
          </nombre>
          <telefono>666555444</telefono>
          <nota modificado="si">8</nota>
      </alumno>
      <alumno numero="222">
          <dni>44455566B</dni>
          <nombre>
              <propio>María</propio>
              <apellidos>Pérez Rodríguez</apellidos>
          </nombre>
          <telefono>696969696</telefono>
          <nota modificado="si">10</nota>
      </alumno>
      <madre>
          <dni>22222222C</dni>
      </madre>
  </raiz>
  ```

---

- Podemos insertar nuevos nodos hijos de un determinado nodo con los métodos
  `append` o `insert`, como si el nodo fuese una lista.

- Para ello, primero normalmente crearemos el nodo que vamos a insertar usando
  **`Element(`_etiqueta_`)`**.

- Por ejemplo, añadimos el teléfono a la única madre que tenemos en el
  documento XML:

  ```python
  telefono = ET.Element('telefono')
  telefono.text = '956366666'
  madre = raiz.find('madre')
  madre.append(telefono)
  ```

---

- Tras estas operaciones, ahora tendríamos:

!DOT(documento-xml-tras-append.svg)()(width=100%)(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [shape = plaintext, fillcolor = transparent, fixedsize = shape, height = 0.3, width = 0.4]
edge [arrowhead = none]
rankdir = TB
alumno1[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=111)</font>>, fixedsize = false]
dni1[label = <dni<br/><font face="monospace" color="blue" point-size="10">(123123123A)</font>>]
nombre1[label = "nombre"]
telefono1[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(666555444)</font>>, height = 0.4]
nota1[label = <nota<br/><font face="monospace" color="blue" point-size="10">(7)</font>>]
propio1[label = <propio<br/><font face="monospace" color="blue" point-size="10">(Juan)</font>>]
apellidos1[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(García González)</font>>]
alumno2[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=222)</font>>, fixedsize = false]
dni2[label = <dni<br/><font face="monospace" color="blue" point-size="10">(44455566B)</font>>]
nombre2[label = "nombre"]
telefono2[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(696969696)</font>>, height = 0.4]
nota2[label = <nota<br/><font face="monospace" color="blue" point-size="10">(9)</font>>]
propio2[label = <propio<br/><font face="monospace" color="blue" point-size="10">(María)</font>>]
apellidos2[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(Pérez Rodríguez)</font>>]
dni3[label = <dni<br/><font face="monospace" color="blue" point-size="10">(22222222C)</font>>]
telefono3[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(956366666)</font>>, height = 0.4]
raiz -> alumno1, alumno2, madre
alumno1 -> dni1, nombre1, telefono1, nota1
nombre1 -> propio1, apellidos1
alumno2 -> dni2, nombre2, telefono2, nota2
nombre2 -> propio2, apellidos2
madre -> dni3, telefono3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Podríamos haber usado `insert` en lugar de `append` para cambiar la posición
  donde situar el nodo hijo.

- Por ejemplo, si queremos situar el teléfono antes que el DNI, podríamos
  hacer:

  ```python
  telefono = ET.Element('telefono')
  telefono.text = '956366666'
  madre = raiz.find('madre')
  madre.insert(0, telefono)
  ```

---

- Tras estas operaciones, ahora tendríamos:

!DOT(documento-xml-tras-insert.svg)()(width=100%)(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [shape = plaintext, fillcolor = transparent, fixedsize = shape, height = 0.3, width = 0.4]
edge [arrowhead = none]
rankdir = TB
alumno1[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=111)</font>>, fixedsize = false]
dni1[label = <dni<br/><font face="monospace" color="blue" point-size="10">(123123123A)</font>>]
nombre1[label = "nombre"]
telefono1[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(666555444)</font>>, height = 0.4]
nota1[label = <nota<br/><font face="monospace" color="blue" point-size="10">(7)</font>>]
propio1[label = <propio<br/><font face="monospace" color="blue" point-size="10">(Juan)</font>>]
apellidos1[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(García González)</font>>]
alumno2[label = <alumno<br/><font face="monospace" color="blue" point-size="10">(numero=222)</font>>, fixedsize = false]
dni2[label = <dni<br/><font face="monospace" color="blue" point-size="10">(44455566B)</font>>]
nombre2[label = "nombre"]
telefono2[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(696969696)</font>>, height = 0.4]
nota2[label = <nota<br/><font face="monospace" color="blue" point-size="10">(9)</font>>]
propio2[label = <propio<br/><font face="monospace" color="blue" point-size="10">(María)</font>>]
apellidos2[label = <apellidos<br/><font face="monospace" color="blue" point-size="10">(Pérez Rodríguez)</font>>]
telefono3[label = <telefono<br/><font face="monospace" color="blue" point-size="10">(956366666)</font>>, height = 0.4]
dni3[label = <dni<br/><font face="monospace" color="blue" point-size="10">(22222222C)</font>>]
raiz -> alumno1, alumno2, madre
alumno1 -> dni1, nombre1, telefono1, nota1
nombre1 -> propio1, apellidos1
alumno2 -> dni2, nombre2, telefono2, nota2
nombre2 -> propio2, apellidos2
madre -> telefono3, dni3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Podemos eliminar elementos con el método `remove`. Por ejemplo, supongamos
  que queremos eliminar todos los alumnos con una `nota` inferior a 9:

  ```python
  >>> for alumno in raiz.findall('alumno'):
  ...     # se usa findall para que no afecte el borrado durante el recorrido
  ...     nota = int(alumno.find('nota').text)
  ...     if nota < 9:
  ...         raiz.remove(alumno)
  ...
  >>> arbol.write('salida.xml')
  ```

- Tener en cuenta que la modificación concurrente mientras se hace una
  iteración puede dar problemas, lo mismo que ocurre cuando se modifican listas
  o diccionarios mientras se itera sobre ellos.

- Por ello, el ejemplo primero recoge todos los elementos con `findall` y sólo
  entonces itera sobre la lista que devuelve.

- Si usáramos `iter` en lugar de `findall` se podrían dar problemas debido a
  que `iter` va devolviendo perezosamente los nodos (es un iterador) y el
  conjunto de nodos que devuelve podría verse afectado por los borrados.

---

- Nuestro XML tendría ahora el siguiente aspecto:

  ```xml
  <?xml version="1.0"?>
  <raiz>
      <alumno numero="222">
          <dni>44455566B</dni>
          <nombre>
              <propio>María</propio>
              <apellidos>Pérez Rodríguez</apellidos>
          </nombre>
          <telefono>696969696</telefono>
          <nota modificado="si">10</nota>
      </alumno>
      <madre>
          <dni>22222222C</dni>
      </madre>
  </raiz>
  ```

---

- Si lo que queremos es **mover** un nodo (es decir, cambiar un nodo de sitio),
  podemos combinar los efectos de `append` e `insert` con `remove`.

- Por ejemplo, si queremos mover la etiqueta `<madre>` dentro de la etiqueta
  `<alumno>`, podríamos hacer:

  ```python
  madre = raiz.find('madre')
  raiz.remove(madre)
  alumno = raiz.find('alumno')
  alumno.append(madre)
  ```

---

- Nuestro XML tendría ahora el siguiente aspecto:

  ```xml
  <?xml version="1.0"?>
  <raiz>
      <alumno numero="222">
          <dni>44455566B</dni>
          <nombre>
              <propio>María</propio>
              <apellidos>Pérez Rodríguez</apellidos>
          </nombre>
          <telefono>696969696</telefono>
          <nota modificado="si">10</nota>
          <madre>
              <dni>22222222C</dni>
          </madre>
      </alumno>
  </raiz>
  ```

---

- La función `SubElement` también proporciona una forma muy conveniente de
  crear sub-elementos de un elemento dado:

  ```python
  >>> a = ET.Element('a')
  >>> b = ET.SubElement(a, 'b')
  >>> c = ET.SubElement(a, 'c')
  >>> d = ET.SubElement(c, 'd')
  >>> ET.dump(a)
  <a><b /><c><d /></c></a>
  ```

!BIBLIOGRAFIA
