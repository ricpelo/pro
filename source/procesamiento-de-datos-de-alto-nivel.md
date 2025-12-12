---
title: Procesamiento de datos de alto nivel
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate
---

# Colecciones

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

- La **composición** y la **abstracción** son dos conceptos relacionados:

  - _Componer_ consiste en combinar elementos entre sí para formar otros más
    complejos.

  - _Abstraer_ consiste en coger un elemento (normalmente complejo), darle un
    nombre y ocultar sus detalles internos (es decir, los elementos que lo
    componen) dentro de una caja negra.

- Lo interesante es que la composición y la abstracción son dos mecanismos
  _recursivos_:

  - Podemos aplicar la composición para crear nuevos elementos complejos a
    partir de otros elementos complejos.

  - Podemos aplicar la abstracción para crear nuevas abstracciones a partir de
    otras abstracciones.

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

---

- En Python, el término más utilizado es el de **_colección_**.

- Una **colección** en Python es un objeto que **almacena o genera múltiples
  elementos en memoria** y provee una **interfaz estandarizada** para acceder,
  recorrer y consultar sus elementos.

- Entre otras operaciones, una colección admite la función !PYTHON(len) para
  consultar el número de elementos que contiene.

- Además, dispone de otras operaciones dependiendo del tipo concreto de
  colección que se trate.

## Clasificación

- Los **datos estructurados** se pueden clasificar atendiendo a su
  _secuencialidad_ y a su _mutabilidad_.

- Según su **secuencialidad**:

  - **Secuencias:** Son aquellos en los que se puede acceder directamente y de
    forma eficiente a cada uno de sus elementos indicando la posición que
    ocupan dentro de la secuencia.

    Por tanto, son colecciones _ordenadas_ por posición, ya que sus elementos
    están ordenados dentro de la secuencia según la posición en la que se
    encuentran situados dentro de la misma.

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
  de ese dato, por lo que cambiar el contenido de un dato estructurado supone
cambiar también su estado interno.

- Por ejemplo, si en la lista !PYTHON([7, 8, 9]) sustituimos su segundo
  elemento (el !PYTHON(8)) por un !PYTHON(5) para obtener la lista
  !PYTHON([7, 5, 9]), estamos cambiando el contenido de la lista y, por
  consiguiente, su estado interno.

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

- La mayoría de los datos inmutables predefinidos en Python son *hashables*,
  incluyendo los valores de tipo `int`, `float`, `str`, `range` y `bool`, así
  como las funciones y el valor `None`.

- Las **colecciones inmutables** (como las tuplas o los !PYTHON(frozenset)s)
  sólo son *hashables* si sus elementos también lo son.

- Las **colecciones mutables** (como las listas o los diccionarios) **NO** son
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

- El _hash_ de un dato se utiliza internamente para acceder a ese dato dentro
  de una colección de forma directa y eficiente.

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

- Muy en resumen, esas técnicas se basan en dividir el espacio de memoria que
  ocupa la colección en una serie de _almacenes_ llamados **_buckets_**.

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

# Flujos perezosos

## Iterables e iteradores

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

- Muchas funciones actúan sobre iterables en general, en lugar de hacerlo sobre
  un tipo estructurado concreto (lista, tupla, ...).

---

- Por ejemplo, las listas nos permiten acceder a todos sus elementos de uno en
  uno y, por tanto, podemos recorrerla.

- Para _visitar_ sus elementos podemos usar la _indexación_, y para _recorrer_
  toda la lista podemos usar un _bucle_:

  ```python
  def recorrer_lista(l):
      i = 0
      while i < len(l):
          print(l[i])
          i += 1
  ```

- Pero hay que hacerlo bien para asegurarse de que no se visita el mismo
  elemento dos veces, o se quedan elementos sin visitar, o se intenta acceder a
  un elemento inexistente a través de un índice que está fuera del rango
  permitido por la lista.

---

- La manera general de recorrer un dato iterable es usando un **iterador**.

  De hecho, técnicamente, **un _iterable_ se define** como aquel dato al que le
  podemos asociar, al menos, un **_iterador_**.

- Un **iterador** es un objeto que sabe cómo **recorrer** un iterable concreto.

- Para ello, el iterador crea un **flujo de datos _perezoso_** que va
  entregando los elementos de ese iterable de uno en uno a medida que se los
  vamos solicitando.

- Los sucesivos elementos del flujo de datos se van obteniendo al llamar
  repetidamente a la función !PYTHON(next) aplicada al iterador.

- Cuando ya no hay más elementos disponibles, la función !PYTHON(next) lanza
  una excepción de tipo !PYTHON(StopIteration), lo que indica que el iterador
  **se ha agotado** (se han consumido todos sus elementos), por lo que si se
  sigue llamando a la función !PYTHON(next) se seguirá lanzando esa excepción.

---

- Se puede obtener un iterador a partir de cualquier dato iterable aplicando la
  función !PYTHON(iter) al iterable.

  (Recordemos que todo iterable puede tener asociado un iterador.)

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

- Además, **los iteradores son iterables que actúan como sus propios
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
    >>> it is it2
    True
    ```

  - En consecuencia, podemos usar un iterador en cualquier sitio donde se
    espere un iterable.

---

- Muchas funciones devuelven iteradores en lugar de colecciones porque, al ser
  perezosos, los iteradores son más eficientes en memoria que si se devolviera
  toda una lista o tupla.

- El flujo de datos que entrega un iterador se puede convertir en una lista o
  tupla usando las funciones !PYTHON(list) y !PYTHON(tuple):

  ```python
  >>> l = [1, 2, 3]
  >>> iterador = iter(l)
  >>> t = tuple(iterador)
  >>> t
  (1, 2, 3)
  ```

## El bucle !PYTHON(for)

- Probablemente, la mejor forma de recorrer los elementos que entrega un
  iterador es mediante una **estructura de control** llamada **bucle
  !PYTHON(for)**.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(for) !NT{variable}(!T{,} !NT{variable})\* !T(in) !NT(iterable)!T(:)
  !SPC(6) !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  que no es más que azúcar sintáctico para el siguiente código equivalente:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON{iterador = iter(}!NT(iterable)!PYTHON{)}
  !PYTHON(while True:)
  !SPC(6)        !PYTHON(try:)
  !SPC(12)                !NT{variable}(`,` !NT{variable})\*\  !PYTHON(= next(iterador))
  !SPC(6)        !PYTHON(except StopIteration:)
  !SPC(12)                !PYTHON(break)
  !SPC(6)        !PYTHON(else:)
  !SPC(12)                !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ejemplo:

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

## `range`

- Los **rangos** (valores de tipo !PYTHON(range)) representan **secuencias
  perezosas, inmutables y *hashables* de números enteros** situados dentro de
  un intervalo.

- Los rangos se crean con la función !PYTHON(range), cuya signatura es:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  $\texttt{range(!VAR([)!VAR(start):\,int,!VAR(])\;!VAR(stop):\,int\;!VAR([),\;!VAR(step):\,int!VAR(]))\;->\;range}$
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  - Cuando se omite _start_, se entiende que es !PYTHON(0).

  - Cuando se omite _step_, se entiende que es !PYTHON(1).

  - El valor de _stop_ no se alcanza nunca.

  - Cuando _start_ y _stop_ son iguales, representa el *rango vacío*.

  - _step_ debe ser siempre distinto de cero.

  - Cuando _start_ es mayor que _stop_, el valor de _step_ debería ser
    negativo. En caso contrario, también representaría el rango vacío.

---

- Por ejemplo:

  - !PYTHON(range(2, 7)) representa la secuencia de números enteros
    comprendidos entre 2 y 6, es decir, la secuencia 2, 3, 4, 5, 6.

  - !PYTHON(range(2, 7, 2)) representa la misma secuencia pero saltándose uno
    cada vez, es decir, la secuencia 2, 4, 6.

  - !PYTHON(range(3)) representa la secuencia 0, 1, 2 (se empieza por 0 si no
    se indica otra cosa).

  - !PYTHON(range(4, 0, -1)) representa la secuencia 4, 3, 2, 1.

---

- Como ocurre en toda secuencia, podemos usar **_indexación_** para acceder al
  contenido de un rango, es decir, a cada uno de sus elementos.

- El **contenido** de un rango $r$ vendrá determinado por la fórmula: $$r[i] =
  start + step \cdot i$$ donde $i \geq 0$. Además:

  - Si $step > 0$, se impone también la restricción $r[i] <
    \text{\textit{stop}}$.

  - Si $step < 0$, se impone también la restricción $r[i] >
    \text{\textit{stop}}$.

- Un rango es **vacío** cuando $r[0]$ no satisface las restricciones
  anteriores.

- Los rangos admiten **índices negativos**, pero se interpretan como si se
  indexara desde el final de la secuencia usando índices positivos.

---

- **Los rangos son perezosos** ya que no hay que reservar espacio en memoria
  para almacenar todos sus elementos simultáneamente, sino que tan sólo
  necesita recordar los valores de _start_, _stop_ y _step_.

- Esto hace que ocupen mucho menos espacio en memoria que las listas o las
  tuplas, por ejemplo.

- Los rangos, además, son iterables, por lo que se pueden usar iteradores para
  recorrer sus elementos.

---

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

---

- Los rangos se usan frecuentemente para hacer bucles que se repitan un
  determinado número de veces.

- Por ejemplo, el cuerpo del siguiente bucle se ejecuta 5 veces:

  ```python
  for i in range(5):
      print(i)
  ```

  y produce la siguiente salida:

  ```
  0
  1
  2
  3
  4
  ```

## Funciones que devuelven iteradores

### El módulo !PYTHON(itertools)

- El módulo !PYTHON(itertools) contiene una variedad de iteradores de uso
  frecuente, así como funciones que combinan varios iteradores.

- Algunos de esos iteradores son muy especiales porque pueden entregar flujos
  infinitos o valores que se repiten continuamente, lo cual contradice en
  cierta manera lo que dijimos cuando definimos los iteradores como «_iterables
  de un solo uso_».

- !PYTHON{itertools.count}`(`[!NT(inicio)[`,` !NT(paso)]]`)` entrega un flujo
  infinito de valores separados uniformemente. Se puede indicar opcionalmente
  un valor de comienzo (!NT(inicio), que por defecto es !PYTHON(0)) y el
  intervalo entre números (!NT(paso), que por defecto es !PYTHON(1)):

  !PYTHON(itertools.count()) $\Rightarrow$ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ...

  !PYTHON(itertools.count(10)) $\Rightarrow$ 10, 11, 12, 13, 14, 15, 16, 17,
  18, 19, ...

  !PYTHON(itertools.count(10, 5)) $\Rightarrow$ 10, 15, 20, 25, 30, 35, 40, 45,
  ...

---

- !PYTHON(itertools.cycle)`(`!NT(iterable)`)` devuelve un iterador que va
  entregando los elementos del iterable del primero al último, repitiéndolos
  indefinidamente:

  !PYTHON(itertools.cycle([1, 2, 3, 4])) $\Rightarrow$ 1, 2, 3, 4, 1, 2, 3, 4,
  ...

- !PYTHON(itertools.repeat)`(`!NT(elem)[`,` !NT(n)]`)` entrega !NT(n) veces el
  elemento !NT(elem), o lo entrega indefinidamente si no se indica !NT(n):

  !PYTHON(itertools.repeat('abc')) $\Rightarrow$ abc, abc, abc, abc, abc, abc,
  abc, ...

  !PYTHON(itertools.repeat('abc', 5)) $\Rightarrow$ abc, abc, abc, abc, abc

### `enumerate`

- Si estamos recorriendo una secuencia y necesitamos recuperar tanto el valor
  como el **índice** de cada elemento, podemos usar la función
  !PYTHON(enumerate).

- Esta función devuelve un iterador que va entregando tuplas que contienen,
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

### `zip`

- La función !PYTHON(zip) en Python devuelve un iterador de tuplas, donde cada
  tupla contiene un elemento de cada uno de los iterables que se le pasen como
  argumentos, agrupados por su posición.

- En otras palabras:

  - Toma los elementos en posición 0 de cada iterable y forma la primera tupla.

  - Luego toma los elementos en posición 1 de cada iterable y forma la segunda
    tupla.

  - Y así sucesivamente, hasta que el iterable más corto se quede sin
    elementos.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(zip)!T{(}!NT(iterable$_1$) [, ... !NT(iterable$_n$)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJEMPLOS

- El siguiente código:

  ```python
  a = [1, 2, 3]
  b = ['x', 'y', 'z']
  c = zip(a, b)

  print(list(c))
  ```

  produce la siguiente salida:

  ```python
  [(1, 'x'), (2, 'y'), (3, 'z')]
  ```

- Si los iterables tienen distinta longitud, la función `zip` se detiene en el
  más corto. Por ejemplo, el siguiente código:

  ```python
  a = [1, 2]
  b = ['x', 'y', 'z']
  print(list(zip(a, b)))
  ```

  produce la siguiente salida:

  ```python
  [(1, 'x'), (2, 'y')]
  ```

### `reversed`

- La función !PYTHON(reversed) en Python devuelve un iterador que entrega los
  elementos de un iterable en orden inverso a como se entregarían
  habitualmente.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(reversed)!T{(}!NT(iterable)!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo, el siguiente código:

  ```python
  l = [1, 2, 3]
  it = reversed(l)

  print(list(it))
  ```

  produce la siguiente salida:

  ```python
  [3, 2, 1]
  ```

# Funciones de orden superior

## Concepto

- Sabemos que, en programación funcional, **las _funciones_ también son
  _valores_**.

  Por tanto, como pasa con cualquier otro valor, las funciones también tienen
  un tipo, se pueden ligar a identificadores, etcétera.

- Pero si las funciones son valores, eso significa que también se pueden pasar
  como argumentos a otras funciones o se pueden devolver como resultado de
  otras funciones.

- Una **función de orden superior** es una función que recibe funciones como
  argumentos o devuelve funciones como resultado.

---

- Por ejemplo, la siguiente función **recibe otra función como argumento** y
  devuelve el resultado de aplicar dicha función al número 5:

  ```python
  >>> aplica5 = lambda f: f(5)
  >>> cuadrado = lambda x: x ** 2
  >>> cubo = lambda x: x ** 3
  >>> aplica5(cuadrado)
  25
  >>> aplica5(cubo)
  125
  ```

- No hace falta crear las funciones !PYTHON(cuadrado) y !PYTHON(cubo) para
  pasárselas a la función !PYTHON(aplica5) como argumento. Se pueden pasar
  directamente las expresiones lambda, que también son funciones:

  ```python
  >>> aplica5(lambda x: x ** 2)
  25
  >>> aplica5(lambda x: x ** 3)
  125
  ```

- Naturalmente, la función que se pasa a !PYTHON(aplica5) debe recibir un único
  argumento de tipo numérico.

---

- Lo mismo se puede hacer con funciones imperativas, o combinando funciones
  imperativas con expresiones lambda:

  ```python
  >>> def aplica5(f):
  ...     return f(5)
  >>> def cuadrado(x):
  ...     return x ** 2
  >>> cubo = lambda x: x ** 3
  >>> aplica5(cuadrado)
  25
  >>> aplica5(cubo)
  125
  ```

---

- También se puede **devolver una función como resultado**.

- Por ejemplo, la siguiente función !PYTHON(suma_o_resta) recibe una cadena y
  devuelve una función que suma si la cadena es !PYTHON('suma'); en caso
  contrario, devuelve una función que resta:

  ```python
  >>> suma_o_resta = lambda s: (lambda x, y: x + y) if s == 'suma' else \
                               (lambda x, y: x - y)
  >>> suma_o_resta('suma')
  <function <lambda>.<locals>.<lambda> at 0x7f526ab4a790>
  >>> suma = suma_o_resta('suma')
  >>> suma(2, 3)
  5
  >>> resta = suma_o_resta('resta')
  >>> resta(4, 3)
  1
  >>> suma_o_resta('suma')(6, 4)
  10
  ```

- Tanto !PYTHON(aplica5) como !PYTHON(suma_o_resta) son **funciones de orden
  superior**.

---

- Y con funciones imperativas:

  ```python
  >>> def suma_o_resta(s):
  ...    def sumar(x, y):
  ...        return x + y
  ...    def restar(x, y):
  ...        return x - y
  ...    if s == 'suma':
  ...        return sumar
  ...    else:
  ...        return restar
  >>> suma_o_resta('suma')
  <function <lambda>.<locals>.sumar at 0x7f3ab30de200>
  >>> suma = suma_o_resta('suma')
  >>> suma(2, 3)
  5
  >>> resta = suma_o_resta('resta')
  >>> resta(4, 3)
  1
  >>> suma_o_resta('suma')(6, 4)
  10
  ```

---

- Una función es una abstracción porque agrupa lo que tienen en común
  determinados casos particulares que siguen el mismo patrón.

- El mismo concepto se puede aplicar a casos particulares de funciones, y al
  hacerlo damos un paso más en nuestro camino hacia un mayor grado de
  abstracción.

- Es decir: muchas veces observamos el mismo patrón en funciones diferentes.

- Para poder abstraer, de nuevo, lo que tienen en común dichas funciones,
  deberíamos ser capaces de manejar funciones que acepten a otras funciones
  como argumentos o que devuelvan otra función como resultado (es decir,
  funciones de orden superior).

---

- Supongamos las dos funciones siguientes:

  ```python
  def suma_enteros(a, b):
      """Suma los enteros comprendidos entre a y b."""
      suma = 0
      for i in range(a, b + 1):
          suma += i
      return suma

  def suma_enteros(a, b):
      """Suma los cubos de los enteros comprendidos entre a y b."""
      suma = 0
      for i in range(a, b + 1):
          suma += cubo(i)
      return suma
  ```

- Estas dos funciones comparten claramente un patrón común. Se diferencian
  solamente en:

  - El _nombre_ de la función.

  - La función que se aplica a !PYTHON(a) para calcular cada _término_ de la
    suma.

---

- Podríamos haber escrito las funciones anteriores rellenando los «casilleros»
  !NT(nombre) y !NT(término) del siguiente *patrón general*:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !PYTHON{def} !NT(nombre)!PYTHON{(a, b):}
  !SPC(6)        !PYTHON(suma = 0)
  !SPC(6)        !PYTHON(for i in range(a, b + 1):)
  !SPC(12)                !PYTHON(suma +=)\ \ !NT(término)!PYTHON((i))
  !SPC(6)        !PYTHON(return suma)
  ~~~~~~~~~~~~~~~~~~~~

---

- La existencia de este patrón común nos demuestra que hay una abstracción
  esperando que la saquemos a la superficie.

- De hecho, los matemáticos han identificado hace mucho tiempo esta abstracción
  llamándola **sumatorio de una serie**, y la expresan así:
  $$ \sum _ {n=a}^b f(n)$$

  La ventaja que tiene usar la notación anterior es que podemos trabajar
  directamente con el concepto de sumatorio en vez de trabajar con sumas
  concretas, y podemos sacar conclusiones generales sobre los sumatorios
  independientemente de la serie particular con la que estemos trabajando.

- Igualmente, como programadores estamos interesados en que nuestro lenguaje
  tenga la suficiente potencia como para describir directamente el concepto de
  sumatorio, en vez de funciones particulares que calculen sumas concretas.

---

- En programación lo conseguimos creando funciones que conviertan los
  «casilleros» en parámetros que recibirían funciones:

  ```python
  def suma(term, a, b):
      suma = 0
      for i in range(a, b + 1):
          suma += term(i)
      return suma
  ```

- De esta forma, las dos funciones !PYTHON(suma_enteros) y !PYTHON(suma_cubos)
  anteriores se podrían definir en términos de esta !PYTHON(suma):

  ```python
  def suma_enteros(a, b):
      return suma(lambda x: x, a, b)
  def suma_cubos(a, b):
      return suma(lambda x: x * x * x, a, b)  # o suma(cubo, a, b)
  ```

- `suma` es una abstracción que captura el patrón común que comparten
  `suma_enteros` y `suma_cubos`, las cuales también son abstracciones que
  capturan sus respectivos patrones comunes.

---

!DOT(de-particular-a-funciones-de-orden-superior.svg)(El camino de subida hacia una abstracción cada vez mayor)(width=90%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
node [shape = plaintext, fillcolor = transparent]
suma_cubos [fontname = "monospace", fontcolor = "blue"]
suma_enteros [fontname = "monospace", fontcolor = "blue"]
suma [fontname = "monospace", fontcolor = "blue"]
rankdir = BT
s1 [label = "1 + 2 + 3"]
s2 [label = "7 + 8 + 9 + 10"]
s3 [label = "9³ + 10³ + 11³ + 12³"]
s4 [label = "22³ + 23³ + 24³"]
s1 -> suma_enteros [minlen = 2]
s2 -> suma_enteros [minlen = 2]
s3 -> suma_cubos [minlen = 2]
s4 -> suma_cubos [minlen = 2]
suma_enteros -> suma [minlen = 2]
suma_cubos -> suma [minlen = 2]
m1 [label = "(menos abstracción)", fontcolor = teal]
m2 [label = "(más abstracción)", fontcolor = teal]
m3 [label = "(aún más abstracción)", fontcolor = teal]
m1 -> m2 [arrowhead = open, color = teal, minlen = 2]
m2 -> m3 [arrowhead = open, color = teal, minlen = 2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJERCICIO

@. ¿Se podría generalizar aún más la función !PYTHON(suma)?

## `map`

- Supongamos que queremos escribir una función que, dada una lista de números,
  nos devuelva otra lista con los mismos números elevados al cubo.

!EJERCICIO

@. Inténtalo.

---

- Una forma de hacerlo sería:

  ```python
  def elevar_cubo(l):
      res = []
      for e in l:
          res.append(e ** 3)
      return res
  ```

- ¿Y elevar a la cuarta potencia?

  ```python
  def elevar_cuarta(l):
      res = []
      for e in l:
          res.append(e ** 4)
      return res
  ```

- Es evidente que hay un patrón subyacente que se podría abstraer creando una
  función de orden superior que aplique una función !PYTHON(f) a los elementos
  de una tupla y devuelva la tupla resultante.

---

- Esa función se llama !PYTHON(map), y viene definida en Python con la
  siguiente signatura:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  $\texttt{map(!VAR(func),\;!VAR(iterable))\;->\;Iterator}$
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde:

  - _func_ debe ser una función de un solo argumento.

  - _iterable_ puede ser cualquier iterable.

---

- Podemos usarla así:

  ```python
  >>> map(cubo, (1, 2, 3, 4))
  <map object at 0x7f22b25e9d68>
  ```

- Lo que devuelve es un iterador que luego podemos recorrer o, por ejemplo,
  convertir en una lista usando la función !PYTHON(list):

  ```python
  >>> list(map(cubo, (1, 2, 3, 4)))
  [1, 8, 27, 64]
  ```

- Podemos usar cualquier iterable como argumento para !PYTHON(map), como por
  ejemplo un rango:

  ```python
  >>> for e in map(cubo, range(1, 5)):
  ...     print(e, end=' ')
  1 8 27 64
  ```

- ¿Cómo definirías la función !PYTHON(map) de forma que devolviera una lista?

!EJERCICIO

@. Inténtalo.

---

- Podríamos definirla así:

  ```python
  def map(f, l):
      res = []
      for e in l:
          res.append(f(e))
      return res
  ```

## `filter`

- !PYTHON(filter) es una **función de orden superior** que devuelve aquellos
  elementos de un *iterable* que cumplen una determinada condición.

- Su signatura es:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~
  $\texttt{filter(!VAR(function),\;!VAR(iterable))\;->\;Iterator}$
  ~~~~~~~~~~~~~~~~~~~~~

  donde _function_ debe ser una función de un solo argumento que devuelva un
  _booleano_.

- Como !PYTHON(map), también devuelve un _iterador_.

- Por ejemplo:

  ```python
  >>> for e in filter(lambda x: x > 0, (-4, 3, 5, -2, 8, -3, 9)):
  ...     print(e, end=' ')
  3 5 8 9
  ```

## `reduce`

- !PYTHON(reduce) es una **función de orden superior** que aplica, de forma
  _acumulativa_, una función a todos los elementos de un *iterable*.

- Captura un **patrón muy frecuente** de recursión sobre secuencias.

- Por ejemplo, para calcular la suma y el producto de todos los elementos de
  una lista, haríamos:

  :::: columns

  ::: {.column width=48%}

  ```python
  def suma(l):
      res = 0
      for e in l:
          res += e
      return res
  ```

  ```python
  >>> suma([1, 2, 3, 4])
  10
  ```

  :::

  ::: {.column width=4%}

  :::

  ::: {.column width=48%}

  ```python
  def producto(l):
      res = 1
      for e in l:
          res *= e
      return res
  ```

  ```python
  >>> producto([1, 2, 3, 4])
  24
  ```

  :::

  ::::

- Como podemos observar, la estrategia de cálculo es esencialmente la misma;
  sólo se diferencian en la _operación_ a realizar (`+` o `*`) y en el _valor
  inicial_ o *elemento neutro* (!PYTHON(0) o !PYTHON(1)).

---

- Si abstraemos ese patrón común, podemos crear una función de orden superior
  que capture la idea de **reducir todos los elementos de un iterable a un
  único valor**.

- Eso es lo que hace la función !PYTHON(reduce).

- Su signatura es:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~
  $\texttt{reduce(!VAR(function),\;!VAR(sequence)\;!VAR([),\;!VAR(initial)!VAR(]))\;->\;Any}$
  ~~~~~~~~~~~~~~~~~~~~~

  donde:

  - _function_ debe ser una función que reciba dos argumentos.

  - _sequence_ debe ser cualquier objeto iterable (normalmente, una secuencia
    como una cadena, una tupla o un rango).

  - _initial_, si se indica, se usará como primer elemento sobre el que
    realizar el cálculo y servirá como valor por defecto cuando la secuencia
    esté vacía (si no se indica y la secuencia está vacía, generará un error).

---

- Para usarla, primero tenemos que _importarla_ del _módulo_
  !PYTHON(functools):

  ```python
  from functools import reduce
  ```

- No es la primera vez que importamos un módulo. Ya lo hicimos con el módulo
  !PYTHON(math).

- En su momento estudiaremos con detalle qué son los módulos. Por ahora nos
  basta con lo que ya sabemos: que contienen definiciones que podemos
  incorporar a nuestros _scripts_.

---

- Por ejemplo, para calcular la suma y el producto de !PYTHON((1, 2, 3, 4)),
  podemos definir las funciones `suma_de_numeros` y `producto_de_numeros` a
  partir de `reduce`:

  ```python
  from functools import reduce

  tupla = (1, 2, 3, 4)

  def suma_de_numeros(tupla):
      return reduce(lambda x, y: x + y, tupla, 0)

  def producto_de_numeros(tupla):
      return reduce(lambda x, y: x * y, tupla, 1)
  ```

---

- También podemos importar y usar las funciones `add` y `mul` del módulo
  `operator`, las cuales actúan, respectivamente, como el operador `+` y `*`:

  ```python
  from functools import reduce
  from operator import add, mul

  tupla = (1, 2, 3, 4)

  def suma_de_numeros(tupla):
      return reduce(add, tupla, 0)

  def producto_de_numeros(tupla):
      return reduce(mul, tupla, 1)
  ```

  De esta forma, usamos `add` y `mul` en lugar de las expresiones lambda
  !PYTHON((lambda x, y: x + y)) y !PYTHON((lambda x, y: x * y)),
  respectivamente.

---

- En general, si $iterable$ representa un objeto iterable que contiene los
  elementos $e_1, e_2, \ldots, e_n$ (en este orden), entonces tenemos que:
  $$\texttt{reduce(!VAR(f),\;!VAR(iterable),\;!VAR(ini))} = f(\ldots{}f(f(f(ini, e_1), e_2), e_3), \ldots, e_n)$$

- Por ejemplo, la siguiente llamada a `reduce`:

  ```python
  reduce(add, (1, 2, 3, 4), 0)
  ```

  realiza y devuelve el resultado del siguiente cálculo:

  ```python
  add(add(add(add(0, 1), 2), 3), 4)
  ```

  lo que, en la práctica, equivale a:

  ```python
  ((((0 + 1) + 2) + 3) + 4)
  ```

---

- Si $iterable$ representa un **iterable vacío**, entonces:

  $$\texttt{reduce(!VAR(f),\;!VAR(iterable),\;!VAR(ini))} = ini$$

- Por ejemplo:

  ```python
  reduce(add, (), 0)
  ```

  devuelve directamente !PYTHON(0).

---

- Si **no se indica un valor inicial**, tenemos que:
  $$\texttt{reduce(!VAR(f),\;!VAR((e_1, e_2, \ldots, e_n)))} = f(\ldots{}f(f(e_1, e_2), e_3), \ldots, e_n)$$

  Es decir: se usará el primer elemento del iterable como valor inicial.

- Por ejemplo, la siguiente llamada a `reduce`:

  ```python
  reduce(add, (1, 2, 3, 4))
  ```

  realiza y devuelve el resultado del siguiente cálculo:

  ```python
  add(add(add(1, 2), 3), 4)
  ```

  lo que, en la práctica, equivale a:

  ```python
  (((1 + 2) + 3) + 4)
  ```

- Pero si el iterable es **vacío**, dará un error:

  ```python
  >>> reduce(add, ())
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: reduce() of empty iterable with no initial value
  ```

---

- Con lo que acabamos de ver, se demuestra que la implementación de la función
  `reduce` en Python va reduciendo **de izquierda a derecha** y que, por tanto,
  las operaciones se hacen agrupándose **por la izquierda**.

- Esto es algo que debemos tener muy en cuenta a la hora de diseñar la función
  que se le pasa a `reduce`.

- Se denomina **iteración** a cada paso que da la función `reduce`, es decir,
  cada vez que `reduce` visita un nuevo elemento del iterable (la tupla, cadena
  o lo que sea) y aplica la función para calcular el resultado parcial.

- Esa función, como ya dijimos antes, debe tener dos parámetros, pero de forma
  que, en cada iteración:

  #. Su primer parámetro va a contener siempre el valor parcial acumulado hasta
  ahora (por tanto, es un _acumulador_).

  #. Su segundo parámetro va a contener el valor del elemento que en este
     momento está visitando `reduce`.

---

- Por tanto, es frecuente que el primer parámetro de esa función se llame `acc`
  o algo similar, para expresar el hecho de que ahí se va recibiendo el valor
  acumulado hasta el momento.

- Por ejemplo, en la siguiente llamada:

  ```python
  reduce(lambda acc, e: acc + e, (1, 2, 3, 4), 0)
  ```

  - `acc` va a contener la suma parcial acumulada hasta ahora.

  - `e` va a contener el elemento que en este momento se está visitando.

  Así, durante la ejecución del `reduce`, ésta provocará las siguientes
  llamadas a la expresión lambda:

  ```python
  (lambda acc, e: acc + e)(0, 1)   # acc = 0, e = 1
  (lambda acc, e: acc + e)(1, 2)   # acc = 1, e = 2
  (lambda acc, e: acc + e)(3, 3)   # acc = 3, e = 3
  (lambda acc, e: acc + e)(6, 4)   # acc = 6, e = 4
  ```

---

- ¿Cómo podríamos definir la función !PYTHON(reduce) si recibiera una tupla y
  no cualquier iterable?

!EJERCICIO

@. Inténtalo.

---

- Una forma (con valor inicial obligatorio) podría ser así:

  ```python
  def reduce(fun, tupla, ini):
      if len(tupla) == 0:
          return ini
      return reduce(fun, tupla[1:], fun(ini, tupla[0]))
  ```

- O bien, de forma iterativa y no recursiva:

  ```python
  def reduce(fun, tupla, ini):
      res = ini
      for e in tupla:
          res = fun(res, e)
      return res
  ```

## Expresiones generadoras

- Dos operaciones que se realizan con frecuencia sobre un iterable son:

  - Realizar alguna operación sobre cada elemento (!PYTHON(map)).

  - Seleccionar un subconjunto de elementos que cumplan alguna condición
    (!PYTHON(filter)).

- Las **expresiones generadoras** son una notación copiada del lenguaje Haskell
  que nos permite realizar ambas operaciones de una forma muy concisa.

- El resultado que devuelve es un iterador.

---

- Por ejemplo:

  ```python
  >>> tuple(x ** 3 for x in (1, 2, 3, 4))
  (1, 8, 27, 64)
  # equivale a:
  >>> tuple(map(lambda x: x ** 3, (1, 2, 3, 4)))
  (1, 8, 27, 64)
  ```

  ```python
  >>> tuple(x for x in (-4, 3, 5, -2, 8, -3, 9) if x > 0)
  (3, 5, 8, 9)
  # equivale a:
  >>> tuple(filter(lambda x: x > 0, (-4, 3, 5, -2, 8, -3, 9)))
  (3, 5, 8, 9)
  ```

---

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expr_gen) ::= !T{(}!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(iterador) [!T(if) !NT{condición}])!MAS!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los elementos de la salida generada serán los sucesivos valores de
  !NT(expresión).

- Las cláusulas !T(if) son opcionales. Si están, la !NT(expresión) sólo se
  evaluará y añadirá al resultado cuando se cumpla la !NT(condición).

- Los paréntesis `(` y `)` alrededor de la expresión generadora se pueden
  quitar si la expresión se usa como único argumento de una función.

- Por ejemplo:

  ```python
  >>> sec1 = 'abc'
  >>> sec2 = (1, 2, 3)
  >>> tuple((x, y) for x in sec1 for y in sec2)
  (('a', 1), ('a', 2), ('a', 3),
   ('b', 1), ('b', 2), ('b', 3),
   ('c', 1), ('c', 2), ('c', 3))
  ```

---

- Las expresiones generadoras, al igual que las expresiones lambda,
  **determinan su propio _ámbito_**.

- Ese ámbito abarca toda la expresión generadora, de principio a fin.

- Los identificadores que aparecen en la cláusula !PYTHON(for) se se van
  ligando automáticamente, uno a uno, a cada elemento del iterable indicada en
  la cláusula !PYTHON(in).

---

- Al recorrer el iterable, las variables van almacenando en cada iteración del
  bucle el valor del elemento que en ese momento se está visitando.

- Debido a ello, podemos afirmar que las variables que aparecen en en cada
  cláusula `for` de la expresión generadora son **identificadores
  cuantificados**, ya que toman sus valores automáticamente y éstos están
  restringido a los valores que devuelva el iterable.

- Además, estos identificadores cuantificados son locales a la expresión
  generadora, y sólo existen dentro de ella.

---

- Debido a lo anterior, esos identificadores cumplen estas dos propiedades:

  - Se pueden renombrar (siempre de forma consistente) sin que la expresión
    cambie su significado.

    Por ejemplo, las dos expresiones generadoras siguientes son equivalentes,
    puesto que producen el mismo resultado:

    ```python
    (x for x in (1, 2, 3))
    ```

    ```python
    (y for y in (1, 2, 3))
    ```

  - No se pueden usar fuera de la expresión generadora, ya que estarían fuera
    de su ámbito y no serían visibles.

    Por ejemplo, lo siguiente daría un error de nombre:

    ```python
    >>> e = (x for x in (1, 2, 3))
    >>> x       # Intento acceder a la 'x' de la expresión generadora
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'x' is not defined
    ```

## Procesamiento de flujos

- El **procesamiento de flujos** es una técnica de diseño de programas que se
  basa en estudiar cómo se transforman los datos de entrada en datos de salida
  y descomponer dicha transformación en una secuencia de etapas intermedias
  donde la salida de una etapa es la entrada de la siguiente, como en una
  cadena de montaje.

- El esquema general es el siguiente, con posibles ligeras variaciones:

!DOT(procesamiento-flujos)()(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Generación -> Filtrado -> Mapeado -> Acumulación
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Este esquema se puede trasladar al uso de funciones ya conocidas, de la
  siguiente forma:

!DOT(procesamiento-flujos-funciones)(Procesamiento de flujos con funciones)(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
range -> filter -> map -> reduce
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por ejemplo, supongamos el siguiente problema:

  «_Dada una lista con los $n$ primeros números naturales, obtener la suma de
  los cuadrados de los números impares que haya en la lista._»

- Este problema se podría resolver de la siguiente forma:

!DOT(problema-procesamiento-flujos)(Solución mediante procesamiento de flujos)(width=100%)(width=100%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
"range(n + 1)" -> "filter(lambda x: x % 2 == 0)" -> "map(lambda x: x ** 2)" -> "reduce(add)"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Funciones genéricas

## Definición y uso

- Esquemáticamente, las **funciones genéricas** tienen la siguiente forma:

  ```python
  def func[T](arg: T): ...
  ```

- En esta definición, `T` es una **variable de tipo**, es decir, un
  identificador que representa a un _tipo_ cualquiera que en este momento no
  está determinado.

- Al usar la sintaxis `[T]`, decimos que `T` representa un **parámetro de
  tipo** para la función, y sirve para expresar el hecho de que la función que
  estamos definiendo es genérica y funciona con valores de muchos tipos
  distintos (uno por cada posible valor de `T`).

- Esta forma de definir funciones caracteriza un cierto tipo de polimorfismo
  llamado **polimorfismo paramétrico**, donde una misma función puede actuar
  sobre valores de tipos muy diversos. Por eso, a esas funciones las podemos
  llamar **funciones polimórficas**.

---

- Por ejemplo, la función que devuelve el máximo elemento de una lista donde
  todos sus elementos son del mismo tipo, se puede anotar de la siguiente
  forma:

  ```python
  def maximo[T](l: list[T]) -> T:
      ...
  ```

  y podríamos llamarla pasándole cualquier tipo de lista, siempre que todos los
  elementos de la lista sean del mismo tipo:

  ```python
  >>> maximo([1, 2, 3, 4])
  4
  >>> maximo(['a', 'b', 'c', 'd'])
  'd'
  ```

- Según la signatura de la función, no sería correcto pasarle una lista con
  elementos de diferentes tipos, pero el intérprete no detectaría el error ya
  que no hace comprobación de tipos. De todas formas, la función probablemente
  no funcionaría bien en ese caso, ya que es una violación de su
  especificación:

  ```python
  >>> maximo([1, 'a', True, 2.5])  # Incorrecto si se comprueban los tipos
  ???                              # No se sabe cómo se comportará la función en este caso
  ```

---

- Una función genérica puede tener **más de un parámetro de tipo** en caso
  necesario.

- Por ejemplo:

  ```python
  def crear_tupla[T, U](elem1: T, elem2: U) -> tuple[T, U]:
      """Crea una tupla con dos elementos."""
      return (elem1, elem2)
  ```

- Un ejemplo de uso:

  ```python
  >>> crear_tupla(1, 'a')
  (1, 'a')
  ```

  Aquí, mandamos a la función un elemento de tipo !PYTHON(int) y otro de tipo
  !PYTHON(str), y la función produce como resultado una tupla de tipo
  !PYTHON(tuple[int, str]).

!BIBLIOGRAFIA
