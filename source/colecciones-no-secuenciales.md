---
title: Colecciones no secuenciales
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate
---

# Conjuntos (!PYTHON(set) y !PYTHON(frozenset))

## Definición

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

  - Un elemento concreto, o está una vez, o no está.

  - Si está, no podemos saber en qué posición (no tiene sentido preguntárselo).

  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Existen dos tipos predefinidos de conjuntos: !PYTHON(set) y
  !PYTHON(frozenset).

- El tipo !PYTHON(set)`[`$t$`]` representa el tipo de los conjuntos de tipo
  !PYTHON(set) cuyas elementos son todos de tipo $t$.

  Por ejemplo, el tipo !PYTHON(set[str]) representa el tipo de los conjuntos
  mutables cuyos elementos son todos cadenas.

- El tipo !PYTHON(set) es **mutable**, es decir, que su contenido puede cambiar
  usando métodos como !PYTHON(add) y !PYTHON(remove).

  Como es mutable, **no es _hashable_** y, por tanto, no puede usarse como
  clave de un diccionario o como elemento de otro conjunto.

---

- El tipo !PYTHON(frozenset) es **inmutable** y *hashable*. Por tanto, su
  contenido no se puede cambiar una vez creado y puede usarse como clave de un
  diccionario o como elemento de otro conjunto.

- El tipo !PYTHON(frozenset)`[`$t$`]` representa el tipo de los conjuntos de
  tipo !PYTHON(frozenset) cuyas elementos son todos de tipo $t$.

  Por ejemplo, el tipo !PYTHON(frozenset[str]) representa el tipo de los
  conjuntos inmutables cuyos elementos son todos cadenas.

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

    Como se ve, esas son, precisamente, las **expresiones canónicas** de un
    conjunto vacío de tipo !PYTHON(set) y !PYTHON(frozenset).

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

  Esa es, precisamente, la **expresión canónica** de un conjunto no vacío y,
  por tanto, la **forma normal** de cualquier expresión que evalúa a un
  conjunto vacío. Por eso es la expresión que se usa cuando se visualiza desde
  el intérprete o se imprime con !PYTHON(print).

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

## Conjuntos por comprensión

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

- Los conjuntos por comprensión, al igual que las expresiones generadoras y
  las listas por comprensión, **determinan su propio _ámbito_**.

- Ese ámbito abarca todo el conjunto por comprensión, de principio a fin.

- Al recorrer el iterable, las variables van almacenando en cada iteración del
  bucle el valor del elemento que en ese momento se está visitando.

- Debido a ello, podemos afirmar que las variables que aparecen en en cada
  cláusula `for` del conjunto por comprensión son **identificadores
  cuantificados**, ya que toman sus valores automáticamente y éstos están
  restringido a los valores que devuelva el iterable.

- Además, estos identificadores cuantificados son locales al conjunto por
  comprensión, y sólo existen dentro de él.

---

- Debido a lo anterior, esos identificadores cumplen estas dos propiedades:

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

## Operaciones

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

## Operaciones sobre conjuntos mutables

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

## Recorrido de conjuntos

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

---

- Como los conjuntos de tipo !PYTHON(set) son mutables, no se deberían añadir o
  eliminar elementos de un conjunto mientras se está recorriendo con un
  iterador.

- De hecho, Python genera un !PYTHON(RuntimeError) cuando se cambia el tamaño
  de un conjunto durante el recorrido del mismo:

  ```python
  >>> s = {'a', 'b', 'c', 'd', 'e'}
  >>> for e in s:
  ...     print(e)
  ...     s.remove('b')
  ...
  c
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  RuntimeError: Set changed size during iteration
  ```

  ```python
  >>> s = {'a', 'b', 'c', 'd', 'e'}
  >>> it = iter(s)
  >>> next(it)
  'c'
  >>> s.remove('a')
  >>> next(it)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  RuntimeError: Set changed size during iteration
  ```

# Diccionarios (!PYTHON(dict))

## Definición

- Un **diccionario** (valor de tipo !PYTHON(dict)) es una colección que
  almacena _correspondencias_ (o _asociaciones_) entre un conjunto de objetos
  llamados **_claves_** y un conjunto de objetos llamados **_valores_**.

- Por tanto, **los elementos de un diccionario son parejas formadas por una
  _clave_ y un _valor_**, de forma que el diccionario lo que hace es almacenar
  las claves y el valor que le corresponde a cada clave.

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

    Esa es precisamente la **expresión canónica** del diccionario y, por tanto,
    la que se usa cuando se visualiza desde el intérprete o se imprime con
    !PYTHON(print).

  - Usando la función !PYTHON(dict).

---

- Por ejemplo:

  ```python
  >>> v1 = {}                                          # diccionario vacío
  >>> v2 = dict()                                      # también diccionario vacío
  >>> v1 == v2                                         # ¿son iguales?
  True                                                 # sí, son iguales
  >>> a = {'uno': 1, 'dos': 2, 'tres': 3}              # literal de tipo dict
  >>> b = dict(uno=1, dos=2, tres=3)                   # paso de argumentos por palabra clave
  >>> c = dict([('dos', 2), ('uno', 1), ('tres', 3)])  # lista de tuplas
  >>> d = dict((('dos', 2), ('uno', 1), ('tres', 3)))  # tupla de tuplas
  >>> e = dict({('dos', 2), ('uno', 1), ('tres', 3)})  # conjunto de tuplas
  >>> f = dict(zip(['uno', 'dos', 'tres'], [1, 2, 3])) # iterable que devuelve tuplas
  >>> g = dict({'tres': 3, 'uno': 1, 'dos': 2})        # diccionario: crea una copia
  ```

- Todos son iguales:

  ```python
  >>> a == b and b == c and c == d and d == e and e == f and f == g
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

- El tipo !PYTHON(dict)`[`$k$`,`$v$`]` representa el tipo de los diccionarios
  cuyas claves son todos de tipo $k$ y cuyos valores son todos de tipo $v$.

  Por ejemplo, el tipo !PYTHON(dict[str, int]) representa el tipo de los
  diccionarios cuyas claves son todas cadenas y cuyos valores son todos números
  enteros.

- Las **claves** de un diccionario deben cumplir dos **restricciones**:

  #. Deben ser **únicas** en ese diccionario.

  #. Deben ser **_hashables_**.

!UNUN(Claves únicas)

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

!UNUN(Claves _hashables_)

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

## Diccionarios por comprensión

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

---

- Los diccionarios por comprensión, al igual que los conjuntos por comprensión,
  las expresiones generadoras y las listas por comprensión, **determinan su
  propio _ámbito_**.

- Ese ámbito abarca todo el diccionario por comprensión, de principio a fin.

- Al recorrer el iterable, las variables van almacenando en cada iteración del
  bucle el valor del elemento que en ese momento se está visitando.

- Debido a ello, podemos afirmar que las variables que aparecen en en cada
  cláusula `for` del diccionario por comprensión son **identificadores
  cuantificados**, ya que toman sus valores automáticamente y éstos están
  restringido a los valores que devuelva el iterable.

- Además, estos identificadores cuantificados son locales al diccionario por
  comprensión, y sólo existen dentro de él.

---

- Debido a lo anterior, esos identificadores cumplen estas dos propiedades:

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

## Operaciones

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

## Recorrido de diccionarios

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

- !PYTHON(keys) devuelve un iterador que va entregando las **claves** del
  diccionario sobre el que se invoca:


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

- !PYTHON(values) devuelve un iterador que va entregando los **valores** del
  diccionario sobre el que se invoca:

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

# Documentos XML

## Definición

- Un **lenguaje de intercambio de datos** es un formato para el intercambio de
  datos entre aplicaciones informáticas de manera que no necesitan estar
  codificados en el mismo lenguaje de programación o instalados en un mismo
  sistema operativo.

- Son formatos estandarizados que permiten la comunicación y transferencia de
  información entre diferentes sistemas, aplicaciones o plataformas,
  independientemente del lenguaje de programación en el que hayan sido
  desarrollados. 

- Los más utilizados en la actualidad son:

  - XML.

  - JSON.

  - YAML.

  - CSV.

---

:::: columns

::: {.column width=30%}

- Los **documentos XML** se pueden considerar **datos estructurados en forma de
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

    - `numero="111"` es un atributo de la primera etiqueta `<alumno>`.

    - `numero` es el _nombre_ del atributo.

    - `111` es el _valor_ del atributo `numero`.

  - Puede haber etiquetas con uno o varios atributos y etiquetas sin atributos.

---

- Ese documento representaría la siguiente estructura jerárquica:

  !DOT(documento-xml.svg)()(width=100%)(width=85%)
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

## Acceso

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

---

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

- Dos objetos `Element` son iguales sólo si son idénticos (usan **igualdad por
  identidad**).

- Por ello, aunque son mutables, también son **_hashables_**.

---

- Los hijos de un nodo están ordenados entre sí por la posición relativa que
  ocupan sus respectivas etiquetas en el documento XML, así que podemos
  decir «_el primer hijo del nodo_», «_el segundo hijo del nodo_», etc.

- Por ejemplo, supongamos que en un documento XML:

  - Hay una etiqueta `<R>`.

  - Hay dos etiquetas llamadas `<A>` y `<B>`, y son las únicas etiquetas que
    aparecen directamente dentro de la etiqueta `<R>`.

  - La etiqueta `<A>` aparece antes que la `<B>` en el documento XML.

  En ese caso:

  - El nodo de `A` será el primer hijo de `R` en el árbol (ocupa la _posición_
    !PYTHON(0)).

  - El nodo de `B` será el segundo hijo de `R` en el árbol (ocupa la _posición_
    !PYTHON(1)).

- Esa _posición_ representa el **índice** del nodo dentro de la secuencia de
  nodos hijos que tiene su nodo padre.

---

- Podemos acceder a nodos concretos a través de su índice usando
  **indexación** desde su nodo padre, por lo que podemos afirmar que los
  objetos `Element` son **indexables**:

  ```python
  >>> raiz[0]       # el primer hijo directo de raiz
  <Element 'alumno' at 0x7f929c29cf90>
  >>> raiz[1]       # el segundo hijo directo de raiz
  <Element 'alumno' at 0x7f16266d0310>
  ```

- Además, los nodos están anidados, por lo que podemos hacer esto:

  ```python
  >>> raiz[0]       # el primer hijo directo de raiz
  <Element 'alumno' at 0x7f929c29cf90>
  >>> raiz[0][2]    # el tercer hijo directo del primer hijo directo de raiz
  <Element 'telefono' at 0x7f929c29d180>
  >>> raiz[0][2].text
  '666555444'
  ```
- Con la función !PYTHON(len) podemos saber cuántos hijos tiene un nodo:

  ```python
  >>> len(raiz)
  3
  ```

---

- Un objeto `Element` representa un nodo de un árbol XML, pero sus hijos se
  exponen como una secuencia ordenada.

- Visto así, podemos decir que _se comportan parcialmente como **secuencias**_,
  pero no son secuencias _completas_ en el sentido en que pueden serlo
  !PYTHON(list) o !PYTHON(tuple).

- Un objeto `Element` soporta las siguientes operaciones de secuencias:

  - Indexación: `nodo[`$i$`]`

  - Iteración: !PYTHON(iter(nodo)), y de ahí: !PYTHON(for hijo in nodo)

  - Longitud: !PYTHON(len(nodo))

  - Rodajas: `nodo[`$i$`:`$j$`:`$k$`]`

  - Pertenencia: !PYTHON(hijo in nodo)

- Pero no soporta otras, como la concatenación, la repetición, la función
  !PYTHON(sorted) o la comparación con `<`. 

---

- Los objetos de tipo `Element` disponen de métodos útiles para iterar
  recursivamente sobre todos los subárboles situados debajo de él (sus hijos,
  los hijos de sus hijos, y así sucesivamente).

- Por ejemplo, el método `iter` devuelve un **iterador** que recorre todos los
  nodos del árbol desde el nodo actual (el nodo sobre el que se invoca al
  método) en un orden **_primero en profundidad_**.

- Eso quiere decir que va visitando los nodos en el mismo orden en el que se
  encuentran escritos en el documento XML, incluyendo el propio nodo sobre el
  que se invoca.

---

:::: columns

::: {.column width=46%}

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

::: {.column width=54%}

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

  Devuelve una lista vacía si no hay nodos que cumplan la condición.

- El método `iterfind` funciona de forma similar pero devuelve un iterador en
  lugar de una lista.

- El método `find` devuelve el primer hijo directo del nodo sobre el que se
  invoca, siempre que tenga una cierta etiqueta indicada como argumento.

  Devuelve !PYTHON(None) si el nodo no tiene ningún hijo con esa etiqueta.

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
  pueden usar las expresiones `XPath` con `find`, `findall` o `iterfind`:

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
                       inicio (aquel sobre el que se ha llamado a `find`, `findall` o `iterfind`).
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

## Modificación

- `ElementTree` proporciona una forma sencilla de crear documentos XML y
  escribirlos en archivos.

- Para ello, usamos el método `write`.

- Una vez creado, un objeto `Element` puede manipularse directamente:

  - Cambiando los atributos del objeto, como `text` o `attrib`.

  - Cambiando los atributos de la etiqueta a la que representa el objeto, con
    el método `set`.

  - Añadiendo nuevos hijos al nodo con los métodos `append` o `insert`.

  - Quitando hijos del nodo con el método `remove`.

---

- Por ejemplo, supongamos que queremos sumarle 1 a la `nota` de cada alumno y
  añadir un atributo `modificado` a la etiqueta `nota`:

  ```python
  >>> for nota in raiz.iterfind('alumno/nota'):
  ...     nueva_nota = int(nota.text) + 1
  ...     nota.text = str(nueva_nota)
  ...     nota.set('modificado', 'si')
  ...
  >>> arbol.write('salida.xml', encoding='utf-8', xml_declaration=True)
  ```

---

- Nuestro XML tendría ahora el siguiente aspecto:

  ```xml
  <?xml version='1.0' encoding='utf-8'?>
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

- Podemos sacar un elemento del árbol usando el método `remove` sobre el padre
  del nodo que deseamos sacar. Por ejemplo, supongamos que queremos eliminar
  todos los alumnos con una `nota` inferior a 9:

  ```python
  >>> for alumno in raiz.findall('alumno'):
  ...     # se usa findall para que no afecte el borrado durante el recorrido
  ...     nota = int(alumno.find('nota').text)
  ...     if nota < 9:
  ...         raiz.remove(alumno)
  ...
  >>> arbol.write('salida.xml', encoding='utf-8', xml_declaration=True)
  ```

- Es importante no olvidar que quitarle un hijo a un nodo usando `remove`
  simplemente lo saca del árbol pero no elimina el nodo hijo de la memoria, por
  lo que el objeto nodo sigue existiendo si aún existen referencias apuntando a
  él.

---

- Hay que tener en cuenta que es peligroso alterar la cantidad de nodos que se
  recorren usando un iterador, al igual que ocurre cuando se modifican listas o
  diccionarios mientras se itera sobre ellos.

- Por ello, el ejemplo primero recoge todos los elementos con `findall` y sólo
  entonces itera sobre la lista que devuelve.

- Si usáramos `iter` o `iterfind` en lugar de `findall` se podrían dar
  problemas debido a que el iterador va devolviendo perezosamente los nodos y
  el conjunto de nodos que devuelve podría verse afectado por los borrados e
  inserciones realizados durante el recorrido.

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
