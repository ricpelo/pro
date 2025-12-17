---
title: Programación imperativa (II)
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008,@python_software_foundation_sitio_nodate
---

# Mutabilidad

## Estado de un dato

- Ya hemos visto que en programación imperativa es posible cambiar el estado de
  una variable asignándole un nuevo valor (un nuevo dato).

- Al hacerlo, no estamos cambiando el valor en sí, sino que estamos
  sustituyendo el valor de la variable por otro nuevo, mediante el uso de la
  asignación destructiva.

- Sin embargo, también existen valores que poseen su propio **estado interno**
  y es posible cambiar dicho estado, no asignando un nuevo valor a la variable
  que lo contiene, sino **modificando el interior de dicho valor**.

- Es decir: no estaríamos cambiando el contenido de la variable (haciendo que
  ahora contenga una referencia a un nuevo valor) sino **el estado interno del
  valor** al que hace referencia la variable.

- Los valores que permiten cambiar su estado interno se denominan **mutables**.

## Tipos mutables e inmutables

- En Python existen tipos cuyos valores son *inmutables* y otros que son
  *mutables*.

- Un valor **inmutable** es aquel cuyo **estado interno NO puede cambiar**
  durante la ejecución del programa.

- Los tipos inmutables en Python son los números (!PYTHON(int) y
  !PYTHON(float)), los booleanos (!PYTHON(bool)), las cadenas (!PYTHON(str)),
  las tuplas (!PYTHON(tuple)), los rangos (!PYTHON(range)) y los conjuntos
  congelados (!PYTHON(frozenset)).

- Un valor **mutable** es aquel cuyo **estado interno puede cambiar** durante
  la ejecución del programa **sin cambiar su identidad**.

  Muchos valores mutables son **colecciones de elementos** (datos _compuestos_
  o **contenedores**) y cambiar su estado interno es cambiar su **contenido**,
  es decir, los elementos que contiene.

- Los principales tipos mutables predefinidos en Python son las listas
  (!PYTHON(list)), los conjuntos (!PYTHON(set)) y los diccionarios
  (!PYTHON(dict)).

### Valores inmutables

- Un valor de un tipo inmutable no puede cambiar su estado interno durante la
  ejecución del programa.

:::: columns

::: column

Si tenemos:

```python
x = 4
y = 5
```

!DOT(inmutable1.svg)()(width=35%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
4 [shape = circle, width = 0.3]
5 [shape = circle, width = 0.3]
x:f1 -> 4
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

y hacemos:

```python
x = 7
```

quedaría:

!DOT(inmutable2.svg)()(width=34%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
5 [shape = circle, width = 0.3]
4 [shape = circle, width = 0.3]
7 [shape = circle, width = 0.3]
x:f1 -> 7
x:f1 -> 4 [style = dashed, color = grey]
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

- Lo que hace la asignación !PYTHON(x = 7) **no es transformar el valor
  !PYTHON(4)** convirtiéndolo en el !PYTHON(7) como si fuera una metamorfosis, sino que la variable !PYTHON(x)
  **apunte a otro valor distinto**. El valor !PYTHON(4) en sí mismo no cambia
  en ningún momento.

---

- Las **cadenas** también son _datos inmutables_ y, por tanto, con ellas ocurre
  exactamente igual.

- Si tenemos:

  ```python
  x = 'hola'
  ```

  !DOT(inmutable3.svg)()(width=20%)(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x:f1 -> hola
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  y luego hacemos:

  ```python
  x = 'hola manolo'
  ```

  **se crea una nueva cadena** y se la asignamos a la variable !PYTHON(x).
 
:::: columns

::: column

- Es decir: la cadena !PYTHON('hola') original **no se modifica** (no se le
  añade !PYTHON(' manolo') detrás), sino que la nueva **sustituye** a la
  anterior en la variable:

:::

::: column

!DOT(inmutable4.svg)()(width=65%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
holamanolo [shape = ellipse, width = 1.8, label = "'hola manolo'", fixedsize = true] 
x:f1 -> hola [style = dashed, color = grey]
x:f1 -> holamanolo
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las **tuplas** también son _datos inmutables_, por lo que, una vez creadas,
  no se puede cambiar su contenido.

- Por ejemplo, si tenemos una tupla !PYTHON((1, 2, 3)) y le concatenamos otra
  tupla !PYTHON((4, 5, 6)), el resultado es una nueva tupla creada a partir de
  las otras dos (que permanecen inalteradas):

:::: columns

::: column

```python
>>> x = (1, 2, 3)
>>> y = (4, 5, 6)
>>> z = x + y
>>> z
(1, 2, 3, 4, 5, 6)
>>> x
(1, 2, 3)
>>> y
(4, 5, 6)
```

:::

::: column

!DOT(inmutable5.svg)()(width=65%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
z [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>z|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
t1 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3}"]
t2 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>4|<f1>5|<f2>6}"]
t3 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3|<f3>4|<f4>5|<f5>6}"]
x:f1 -> t1
y:f1 -> t2
z:f1 -> t3
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

- Si ahora le asignamos otra tupla a !PYTHON(z), ésta pasa a apuntar a la nueva
  tupla, sin modificar a la anterior:

:::: columns

::: column

```python
z = (7, 8, 9)
```

:::

::: column

!DOT(inmutable6.svg)()(width=65%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
z [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>z|<f1>⬤}"]
t3 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3|<f3>4|<f4>5|<f5>6}"]
t4 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>7|<f1>8|<f2>9}"]
z:f1 -> t3:w [style = dashed, color = grey]
z:f1 -> t4
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

#### Secuencias

- Las **cadenas** y las **tuplas**, entre otros, son _datos inmutables_, así
  que no podemos modificarlos.

- Pero también son **datos compuestos** de otros datos (sus _elementos_ o
  _componentes_) a los que podemos acceder y con los que podemos operar
  individualmente, aunque no podamos cambiarlos ni sustituirlos por otros, ya
  que forman parte de datos compuestos inmutables.

- De hecho, las cadenas y las tuplas pertenecen a la familia de las
  **secuencias**, que son colecciones de elementos ordenados según la posición
  que ocupan dentro de la secuencia.

- Por tanto, con las cadenas y las tuplas podemos usar las **operaciones
  comunes a cualquier secuencia** de elementos.

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

$s$ `+` $t$                               La concatenación de $\underline{s}$ y $\underline{t}$
                                        
$s$ `*` $n$ \                             Concatenar $\underline{s}$ consigo misma $\underline{n}$ veces
$n$ `*` $s$

$s$`[`$i$`]`                              (_Indexación_) El $\underline{i}$-ésimo elemento de $\underline{s}$

$s$`[`$i$`:`$j$`]`                        Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$

$s$`[`$i$`:`$j$`:`$k$`]`                  Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$ con paso $\underline{k}$

!PYTHON(len)`(`$s$`)`                     Longitud de $\underline{s}$

!PYTHON(min)`(`$s$`)`                     El elemento más pequeño de $\underline{s}$

!PYTHON(max)`(`$s$`)`                     El elemento más grande de $\underline{s}$

!PYTHON(sorted)`(`$s$`)`                  Lista ordenada de los elementos de $\underline{s}$

$s$!PYTHON(.index)`(`$x$                  El índice de la primera aparición de $\underline{x}$ en $\underline{s}$
[`, ` $i$ [`, ` $j$ ] ]`)`                (desde el índice $\underline{i}$ inclusive y antes del $\underline{j}$)

$s$!PYTHON(.count)`(`$x$`)`               Número total de apariciones de $\underline{x}$ en $\underline{s}$
--------------------------------------------------------------------------------------------------------------------------

---

- El *operador* de **indexación** permite acceder al elemento situado en la
  posición (también llamada _índice_) indicada entre corchetes:

:::: columns

::: column

```python
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
    0   1   2   3   4   5
   -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[2]
't'
>>> s[-2]
'o'
```

:::

::::

- Los índices positivos (del !PYTHON(0) en adelante) empiezan a contar desde el
  comienzo de la secuencia (o sea, desde el primer elemento, el que está
  situado más a la izquierda).

- Los índices negativos (del !PYTHON(-1) hacia atrás) empieza a contar desde el
  final de la secuencia (o sea, desde el último elemento, el que está situado
  más a la derecha).

---

- El **_slicing_** (*hacer rodajas*) es una operación que consiste en obtener
  una **subsecuencia** a partir de una secuencia, indicando los _índices_ de
  los elementos _inicial_ y _final_ de la misma, así como un posible _paso_:

:::: columns

::: column

```python
     con paso positivo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
  0   1   2   3   4   5   6
 -6  -5  -4  -3  -2  -1

     con paso negativo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
      0   1   2   3   4   5
 -7  -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[0:2]
'Py'
>>> s[-5:-4]
'y'
>>> s[-4:-5]
''
>>> s[0:4:2]
'Pt'
>>> s[-3:-6]
''
>>> s[-3:-6:-1]
'hty'
```

:::

::::

- Es más fácil trabajar con las rodajas si suponemos que los índices se
  encuentran _entre_ los elementos.

- El elemento _final_ nunca se alcanza.

- Si el _paso_ es negativo, la rodaja se hará al revés (de derecha a
  izquierda).

---

- En la rodaja `s[`$i$`:`$j$`:`$k$`]`, los tres valores $i$, $j$ y $k$ son
  opcionales, así que se pueden omitir.

- Si se omite $k$, se entiende que es !PYTHON(1).

- Si se omite $i$, se entiende que queremos la rodaja desde el elemento más la
  izquierda de la secuencia (si $k$ es positivo) o más a la derecha (si $k$ es
  negativo).

- Si se omite $j$, se entiende que queremos la rodaja hasta el elemento más a
  la derecha de la secuencia (si $k$ es positivo) o más a la izquierda (si $k$
  es negativo).

- Si el índice $i$ está más a la izquierda que el índice $j$, $k$ debería ser
  positivo (de lo contrario, devolvería la secuencia vacía).

- Si el índice $i$ está más a la derecha que el índice $j$, $k$ debería ser
  negativo (de lo contrario, devolvería la secuencia vacía).

- Si $i = j$, devuelve la secuencia vacía.

---

- Casos particulares notables:

  - !PYTHON(s[:)$n$`]` es la rodaja desde el primer elemento de !PYTHON(s)
    hasta la posición $\underline{n}$.
  
  - !PYTHON(s[)$n$`:]` es la rodaja desde la posición $\underline{n}$ hasta el
    final de !PYTHON(s).

    Siempre se cumple que !PYTHON(s) `==` !PYTHON(s[:)$n$`]` `+`
    !PYTHON(s[)$n$`:]`.

  - !PYTHON(s[)$n$!PYTHON(::-1]) es la rodaja invertida desde la posición
    $\underline{n}$ hasta el primer elemento de !PYTHON(s), con los elementos
    al revés.

  - !PYTHON(s[:]) devuelve una _copia_ de !PYTHON(s).

  - !PYTHON(s[::-1]) devuelve una copia invertida de !PYTHON(s).

!EJERCICIO

@. Dada la siguiente tupla:

    ```python
    a = (0, 11, 22, 33, 44, 55, 66, 77, 88, 99)
    ```

    ¿Qué valor devuelven las siguientes expresiones?

    a. !PYTHON(a[0:7:1])
    b. !PYTHON(a[0:7:2])
    c. !PYTHON(a[0:7])
    d. !PYTHON(a[2:7:1])
    e. !PYTHON(a[7:2:1])
    f. !PYTHON(a[7:2:-1])
    g. !PYTHON(a[:7:1])
    h. !PYTHON(a[5::1])
    i. !PYTHON(a[:-5:-1])
    j. !PYTHON(a[-5::-1])
    k. !PYTHON(a[5:-1:1])
    l. !PYTHON(a[-1:5:-1])

### Valores mutables: listas

- Los valores de tipos **mutables**, en cambio, pueden cambiar su estado
  interno durante la ejecución del programa sin cambiar su identidad.

- El tipo mutable más frecuente es la **lista** (!PYTHON(list)).

- Una lista es como una tupla pero que puede cambiar sus elementos, aumentar o
  disminuir de tamaño.

- Eso significa que **una lista puede cambiar su _contenido_ y, por tanto, su
  _estado interno_**.

- Los literales de tipo !PYTHON(list) se crean separando sus elementos con
  comas y encerrándolos entre corchetes `[` y `]`:

  ```python
  >>> l = [124, 333, 'a', 3.2, 9, 53]
  >>> l
  [124, 333, 'a', 3.2, 9, 53]
  ```

---

- También se pueden crear listas a partir de otros datos compuestos
  (cadenas, tuplas, rangos, etcétera) usando la función !PYTHON(list):

  ```python
  >>> list((1, 2, 3))
  [1, 2, 3]
  >>> list('hola')
  ['h', 'o', 'l', 'a']
  >>> list(range(0, 6))
  [0, 1, 2, 3, 4, 5]
  ```

- No se puede crear una lista con !PYTHON(list) a partir de un dato no
  compuesto:

  ```python
  >>> list(1)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: 'int' object is not iterable
  ```

- Para ello, lo mejor sería encerrar directamente el valor entre corchetes:

  ```python
  >>> [1]
  [1]
  ```

---

- Las listas son secuencias mutables y, como tales, se pueden modificar usando
  ciertas operaciones:

  - Los *operadores* de **indexación** y **_slicing_** combinados con
    !PYTHON(=) y !PYTHON(del):

    ```python
      +-----+-----+-----+-----+-----+-----+
    l | 124 | 333 | 'a' | 3.2 |  9  |  53 |
      +-----+-----+-----+-----+-----+-----+
      0     1     2     3     4     5     6
     -6    -5    -4    -3    -2    -1
    ```

    ```python
    >>> l = [124, 333, 'a', 3.2, 9, 53]
    >>> l[3]
    3.2
    >>> l[3] = 99
    >>> l
    [124, 333, 'a', 99, 9, 53]
    >>> l[0:2] = [40]
    >>> l
    [40, 'a', 99, 9, 53]
    >>> del l[3]
    >>> l
    [40, 'a', 99, 53]
    ```

  - *Métodos* como !PYTHON(append), !PYTHON(clear), !PYTHON(insert),
    !PYTHON(remove), !PYTHON(reverse) o !PYTHON(sort).

---

- Al cambiar el estado interno de una lista no se crea una nueva lista, sino
  que **se modifica la ya existente**:

  ```python
  >>> x = [24, 32, 15, 81]
  >>> x[1] = 99
  >>> x
  [24, 99, 15, 81]
```

:::: columns

::: column

!DOT(cambio-estado-lista-antes.svg)(La lista antes de cambiar `x[`1`]`)(width=75%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
99 [style= invis, width = 0.6]
24 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
15 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6]
lista:f0 -> 24
lista:f1 -> 99 [style = invis]
lista:f1 -> 32
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(cambio-estado-lista-despues.svg)(La lista después de cambiar `x[`1`]`)(width=75%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
24 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
15 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6, style = dashed, color = grey, fontcolor = grey]
lista:f0 -> 24
lista:f1 -> 99
lista:f1 -> 32 [style = dashed, color = grey]
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las siguientes tablas muestran todas las **operaciones** que nos permiten
  **modificar listas**.

- En ellas, $\underline{s}$ y $\underline{t}$ son listas, y $\underline{x}$ es
  un valor cualquiera.

-------------------------------------------------------------------------------------------
Operación                     Resultado
----------------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$          El elemento $i$-ésimo de $\underline{s}$ se sustituye
                              por $\underline{x}$

$s$`[`$i$`:`$j$`]`            La rodaja de $\underline{s}$ desde $\underline{i}$ hasta
`=` $t$                       $\underline{j}$ se sustituye por $\underline{t}$

$s$`[`$i$`:`$j$`:             Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$               por $\underline{t}$

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

Partiendo de !PYTHON(x = [8, 10, 7, 9]):

--------------------------------------------------------
Ejemplo                    Valor de !PYTHON(x) después
-------------------------- -----------------------------
!PYTHON(x.append(14))      !PYTHON([8, 10, 7, 9, 14])

!PYTHON(x.clear())         !PYTHON([])

!PYTHON(x += [4, 5])       !PYTHON([8, 10, 7, 9, 4, 5])

!PYTHON(x *= 2)            !PYTHON([8, 10, 7, 9, 8, 10, 7, 9]) <!-- *= -->

!PYTHON(x.insert(3, 66))   !PYTHON([8, 10, 7, 66, 9])

!PYTHON(x.pop())           !PYTHON([8, 10, 7])

!PYTHON(x.remove(7))       !PYTHON([8, 10, 9])

!PYTHON(x.reverse())       !PYTHON([9, 7, 10, 8])

!PYTHON(x.sort())          !PYTHON([7, 8, 9, 10])
--------------------------------------------------------

<!-- \* -->

---

- Es importante tener en cuenta que, si $\underline{s}$ es una lista (o algún
  otro objeto mutable) no es lo mismo hacer:

  ```python
  s += t
  ```

  que hacer:

  ```python
  s = s + t
  ```

- En el primer caso, estamos _extendiendo_ la lista $\underline{s}$ y, por
  tanto, la estamos _mutando_. Es decir, estamos cambiando internamente la
  lista sin cambiar su identidad ni crear una lista nueva.

- En el segundo caso, no estamos mutando la lista $\underline{s}$, sino que
  estamos creando una lista nueva a partir de la concatenación de las dos
  listas originales, y luego hacemos que $\underline{s}$ apunte a la nueva
  lista, perdiéndose la referencia a la lista $\underline{s}$ original. Por
  tanto, la identidad del objeto almacenado en $\underline{s}$ sí ha cambiado.

- Lo mismo se puede decir de `s *= n` con respecto a `s = s * n`.

## Alias de variables y valores mutables

- Ya vimos que cuando una variable que tiene un valor se asigna a otra, ambas
  variables pasan a **_compartir_ el mismo valor**, produciéndose el fenómeno
  conocido como **alias de variables**:

  ```python
  x = [66, 77, 88, 99]
  y = x  # x se asigna a y; ahora y tiene el mismo valor que x
  ```

- Esto se debe a que las variables almacenan **referencias** a los valores, no
  los valores en sí mismos (éstos se almacenan en el montículo).

:::: columns

::: column

!DOT(alias1.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
40 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
lista:f0 -> 66
lista:f1 -> 77
lista:f2 -> 88 [style = dashed, color = grey]
lista:f2 -> 40
lista:f3 -> 99
x:f1 -> lista
y:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Si el valor es **mutable** y cambiamos su **contenido** desde !PYTHON(x),
  también cambiará !PYTHON(y) (y viceversa), pues ambas variables **apuntan al
  mismo dato**:

  ```python
  >>> y[2] = 40
  >>> x
  [66, 77, 40, 99]
  ```

:::

::::

---

- No es lo mismo cambiar el **valor** que cambiar el **contenido** del valor.

- Cambiar el **contenido** es algo que sólo se puede hacer si el valor es
  **mutable** (por ejemplo, cambiando un elemento de una lista):

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y[2] = 40
```

:::

::: {.column width=60%}

!IMGP(alias1.svg)()(width=60%)(width=40%)

:::

::::

---

- Cambiar el **valor** es algo que **siempre** se puede hacer (da igual la
  mutabilidad) simplemente **asignando** a la variable **un nuevo valor**:

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y = [1, 2, 3]
```

:::

::: {.column width=60%}

!DOT(alias2.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista1 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
lista2 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
1 [shape = circle, width = 0.6]
3 [shape = circle, width = 0.6]
2 [shape = circle, width = 0.6]
lista1:f0 -> 66
lista1:f1 -> 77
lista1:f2 -> 88
lista1:f3 -> 99
lista2:f0 -> 1
lista2:f1 -> 2
lista2:f2 -> 3
x:f1 -> lista1
y:f1 -> lista1 [style = dashed, color = grey]
y:f1:s -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Cuando los valores son inmutables, no importa si se comparten o no, ya que no
  se pueden modificar.

- De hecho, el intérprete a veces crea valores inmutables nuevos y otras veces
  comparte los valores inmutables ya existentes.

- Por ejemplo, el intérprete de Python crea internamente todos los números
  enteros comprendidos entre $-5$ y $256$, por lo que todas las variables de
  nuestro programa que contengan el mismo número dentro de ese intervalo
  compartirán el mismo valor (serán *alias*):

:::: columns

::: {.column width=50%}

```python
x = 5 # está entre -5 y 256
y = 5
```

!DOT(inmutable7.svg)(Se comparte el valor)(width=35%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
5 [shape = circle, width = 0.3, fixedsize = shape]
x:f1 -> 5
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=50%}

```python
x = 480 # no está entre -5 y 256
y = 480
```

!DOT(inmutable8.svg)(No se comparte el valor)(width=35%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
c1 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
c2 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
x:f1 -> c1
y:f1 -> c2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- También crea valores compartidos cuando contienen exactamente las mismas
  cadenas.

!SALTOLARGOBEAMER

:::::: columns

:::: column

Si tenemos:

```python
x = 'hola'
y = 'pepe'
```

!DOT(inmutable9.svg)()(width=45%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 'pepe'
```

quedaría:

!DOT(inmutable10.svg)()(width=45%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola [style = dashed, color = grey]
x:f1 -> pepe
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- El intérprete aprovecharía la cadena ya creada (buscándola primero en el
  montículo) y no crearía una nueva, para ahorrar memoria.

- Por tanto, ambas variables contendrían la misma referencia a la misma cadena
  (o dicho, como también suele decirse, las dos variables serían dos
  referencias a la misma cadena).

---

- También se comparten valores si se usa el mismo dato varias veces, aunque sea
  un dato mutable.

- De nuevo, esto se debe a que en todo caso estamos accediendo al dato mutable
  a través de la misma referencia.

- Por ejemplo, si hacemos:

  ```python
  >>> x = [1, 2, 3]
  >>> y = [x, x]
  >>> y
  [[1, 2, 3], [1, 2, 3]]
  ```

  se compartiría la lista `x`, por lo que nos quedaría:

!DOT(alias3.svg)()(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1
lista1:f1 -> 2
lista1:f2 -> 3
lista2:f0:n -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

Y si ahora hacemos:

```python
>>> y[0][0] = 99
>>> x[1] = 77
>>> y
[[99, 77, 3], [99, 77, 3]]
```

:::

::: column

nos quedaría:

!DOT(alias4.svg)()(width=90%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
77 [shape = circle, width = 0.3, fixedsize = shape]
99 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1 [style = dashed, color = grey]
lista1:f1 -> 2 [style = dashed, color = grey]
lista1:f0 -> 99
lista1:f1 -> 77
lista1:f2 -> 3
lista2:f0:n -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Identidad

- Se denomina **identidad del valor** a un número entero que va asociado
  siempre a ese valor, el cual es único y constante durante toda la existencia
  del valor.

- Ese número _identifica_ al valor de entre todos los valores almacenados en el
  montículo, y lo distingue de entre todos los demás valores, ya sean iguales o
  distintos a él.

- Dos valores distintos deben tener identidades distintas. 

- En cambio, dos valores iguales pueden o no tener la misma identidad.

- En caso de que dos valores tengan la misma identidad, querrá decir que esos
  dos valores son **idénticos**, es decir, que son realmente **el mismo
  valor** almacenado en una única zona del montículo y al que se está
  accediendo a través de la **misma referencia**.

  Dicho de otra forma: NO serían dos valores almacenados en dos zonas distintas
  del montículo y accesibles a través de dos referencias distintas.

---

- La identidad de un valor **nunca cambia** durante la ejecución del programa o
  durante la misma sesión con el intérprete interactivo, incluso aunque el
  dato sea mutable y cambie su contenido.

  En cambio, la identidad del valor sí que puede cambiar (y lo normal es que
  cambie) entre dos ejecuciones distintas del mismo programa, o entre dos
  sesiones distintas con el intérprete interactivo.

- En Python, la identidad de un valor se consulta usando la función
  !PYTHON(id):

  :::: columns

  ::: {.column width=45%}

  ```python
  >>> id('hola')
  140294723570672
  >>> id('adiós')
  140587522259616
  ```

  :::

  ::: {.column width=5%}

  :::

  ::: {.column width=45%}

  ```python
  >>> id(5)
  140666458866032
  >>> id(400)
  140635543277200
  ```

  :::

  ::::

---

- Si hacemos:

  ```python
  >>> id('prueba')
  139905258241392
  >>> id('prueba')
  139905255890928
  ```

  puede parecer que la identidad del valor !PYTHON('prueba') ha cambiado, ya
  que hemos consultado dos veces su identidad usando la función !PYTHON(id) y
  en cada caso nos ha devuelto resultados diferentes.

- Sin embargo, lo que ocurre es que esos dos !PYTHON('prueba') **no son _el
  mismo valor_**, sino dos _valores iguales_ que se han creado en momentos
  diferentes y que ocupan zonas diferentes en la memoria, por lo que tienen
  _identidades diferentes_ (aunque los valores sean iguales).

- En cambio, si hacemos:

  ```python
  >>> x = 'prueba'
  >>> id(x)
  139754569626160
  >>> id(x)
  139754569626160
  ```

  se obtiene el mismo resultado, ya que sólo hay un único valor
  !PYTHON('prueba') en la memoria y, por tanto, la identidad es la misma en
  ambos casos.

---

- Los conceptos de _identidad_ y de _referencia_ están relacionados.

- Para comprobar si dos valores son **idénticos** (es decir, si son realmente
  **_el mismo valor_**) podríamos hacer una de estas dos comprobaciones:

  - Comprobar si tienen la misma identidad.

  - Comprobar si se usan las mismas referencias para acceder a ellos (es decir,
    si apuntan al mismo lugar en el montículo).

- Así que, para saber si dos datos son **idénticos** (es decir, si ambos
  contienen **el mismo valor**, no simplemente **dos valores _iguales_**),
  podríamos intentar comparar sus referencias y ver su coinciden.

- Pero el lenguaje Python no nos permite comparar directamente dos referencias,
  ya que, cuando hacemos:

  ```python
  x == y
  ```

  en realidad estamos preguntando si son iguales sus _valores_, no sus
  _referencias_.

---

- Por tanto, para saber si dos datos son idénticos, debemos usar otro
  mecanismo que no sea el de comparar referencias.

- Una forma de saber si dos valores son **el mismo valor** (es decir, si son
  **_idénticos_**), es usar la función !PYTHON(id).

- Sabemos que la función !PYTHON(id) aplicada a un valor devuelve la
  **identidad** del valor, que es un número único para cada valor.

- Por esa razón, si dos variables tienen el mismo !PYTHON(id), significa que
  ambas apuntan al mismo valor en la memoria y que, por tanto, son
  **referencias al mismo valor**.

- En general, si dos datos tienen el mismo !PYTHON(id), decimos que son
  **idénticos**, porque en realidad son _el mismo dato_.

:::: columns

::: column

```python
>>> id('hola') == id('hola')
True
>>> x = 'hola'
>>> y = 'hola'
>>> id(x) == id(y)
True
```

:::

::: column

```python
>>> x = [1, 2, 3, 4]
>>> y = [1, 2, 3, 4]
>>> id(x) == id(y)
False
>>> y = x
>>> id(x) == id(y)
True
```

:::

::::

### !PYTHON(is)

- Otra forma más directa de comprobar si dos datos son realmente el mismo dato
  en memoria (es decir, si son **idénticos**) es usar el operador !PYTHON(is),
  que comprueba si los dos datos tienen la misma **identidad**:

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is) ::= !NT(valor1) !T(is) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

- Es un operador relacional que devuelve !PYTHON(True) si !NT(valor1) y
  !NT(valor2) tienen la misma **identidad** (es decir, si son **el mismo dato
  en memoria** y, por tanto, son **idénticos**) y !PYTHON(False) en caso
  contrario.

- En la práctica, equivale a hacer
  !PYTHON(id)`(`!NT(valor1)`)` `==` !PYTHON(id)`(`!NT(valor2)`)`.

---

- Lo normal es usar el !PYTHON(is) con variables y, en tal caso, devuelve
  !PYTHON(True) si los datos que almacenan las variables son realmente el mismo
  dato.

- No es correcto usarlo con literales inmutables (y el intérprete lo avisa con
  un !PYTHON(SyntaxWarning)), ya que, en tal caso, devuelve siempre
  !PYTHON(True).

  En cambio, con literales mutables (como !PYTHON([])) devuelve siempre
  !PYTHON(False).

- También existe el operador !PYTHON(is not), que es el contrario al
  !PYTHON(is) y cuya sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is_not) ::= !NT(valor1) !T(is) !T(not) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

  El operador !PYTHON(is not) es un operador relacional que, aplicado a dos
  valores, devolverá !PYTHON(True) si los valores **no** son idénticos.

---

```python
>>> x = 500
>>> y = 500
>>> x is y
False
>>> x is not y
True
>>> y = x
>>> x is y
True
>>> 500 is 500
<stdin>:1: SyntaxWarning: "is" with a literal. Did you mean "=="?
True
>>> x = 'hola'
>>> y = 'hola'
>>> x is y
True
>>> x is not y
False
```

# Cambios de estado ocultos

## Funciones puras

- Las **funciones puras** son aquellas que cumplen que:

  - su valor de retorno depende únicamente del valor de sus argumentos, y

  - calculan su valor de retorno sin provocar cambios de estado observables en
    el exterior de la función.

- Una llamada a una función pura se puede sustituir libremente por su valor de
  retorno sin afectar al resto del programa (es lo que se conoce como
  **transparencia referencial**).

- Las funciones *puras* son las únicas que existen en programación funcional.

## Funciones impuras

- Por contraste, una función se considera **impura** si:

  - su valor de retorno depende de algo más que de sus argumentos, o

  - provoca cambios de estado observables en el exterior de la función.

    En éste último caso decimos que la función provoca **efectos laterales**.

- Toda función que provoca efectos laterales es impura, pero no todas las
  funciones impuras provocan efectos laterales (puede ser impura porque su
  comportamiento se vea afectado por los efectos laterales provocados por otras
  partes del programa).

## Efectos laterales

- Un **efecto lateral** (_side effect_) es cualquier cambio de estado provocado
  por una parte del programa (por ejemplo, una función) que puede observarse
  desde otras partes del mismo, las cuales podrían verse afectadas por ese
  efecto de una manera poco evidente o impredecible.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Una función puede provocar efectos laterales, o verse afectada por efectos
  laterales provocados por otras partes del programa.

  En cualquiera de estos casos, tendríamos una función **impura**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los casos típicos de efectos laterales en una función son:

  - Cambiar el valor de una variable global.

  - Cambiar el estado de un argumento mutable.

  - Realizar una operación de entrada/salida.

---

- En un lenguaje imperativo **se pierde la transparencia referencial**, ya que
  el valor de una función puede depender no sólo de los valores de sus
  argumentos, sino también de los valores de las variables libres, los cuales
  pueden cambiar durante la ejecución del programa:

  ```python
  >>> suma = lambda x, y: x + y + z
  >>> z = 2
  >>> suma(3, 4)
  9
  >>> z = 20
  >>> suma(3, 4)
  27
  ```

- Por tanto, cambiar el valor de una variable global (en cualquier parte del
  programa) es considerado un **efecto lateral**, ya que puede alterar el
  comportamiento de otras partes del programa de formas a menudo impredecibles
  o poco evidentes.

---

- Cuando el efecto lateral lo produce la propia función también estamos
  perdiendo transparencia referencial, pues en tal caso no podemos sustituir
  libremente la llamada a la función por su valor de retorno, ya que ahora **la
  función hace _algo más_ que calcular dicho valor**, y ese _algo_ es un efecto
  observable fuera de la función.

- Por ejemplo, una función que imprime por la pantalla o escribe en un archivo
  del disco está provocando un efecto observable fuera de la función, por lo
  que tampoco es una función pura y, por tanto, no cumple la transparencia
  referencial.

- Lo mismo pasa con las funciones que modifican algún argumento mutable. Por
  ejemplo:

  ```python
  >>> ultimo = lambda x: x.pop()
  >>> lista = [1, 2, 3, 4]
  >>> ultimo(lista)
  4
  >>> ultimo(lista)
  3
  >>> lista
  [1, 2]
  ```

---

- Los efectos laterales hacen que sea más difícil razonar sobre el
  funcionamiento del programa, porque las funciones impuras no pueden verse
  como simples correspondencias entre los datos de entrada y el resultado de
  salida, sino que además hay que tener en cuenta los **efectos laterales** que
  producen en otras partes del programa.

- Por ello, se debe **evitar**, siempre que sea posible, escribir funciones
  impuras.

- Ahora bien: muchas veces, la función que se desea escribir tiene efectos
  laterales porque esos son, precisamente, los efectos deseados.

  Por ejemplo, una función que actualice los salarios de los empleados en una
  base de datos, a partir del salario base y los complementos.

- En ese caso, es importante **documentar** adecuadamente la función para que,
  quien desee usarla, sepa perfectamente qué efectos produce más allá de
  devolver un resultado.

# Entrada y salida

## Conceptos básicos

- En principio, el **exterior** de una función es el resto del programa del que
  forma parte.

- Visto así, una función (que es un _subprograma_) puede comunicarse con su
  exterior principalmente mediante:

  - el paso de argumentos y

  - la devolución de su valor de retorno,

  !DOT(exterior-funcion-funcional.svg)(Comunicación básica de una función con el exterior)(width=75%)(width=70%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Argumentos [shape = plaintext, fillcolor = transparent];
  Resultado [label = "Valor de retorno", shape = plaintext, fillcolor = transparent];

  Argumentos -> Función;
  Función -> Resultado;
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Aunque sabemos que también puede interactuar con su exterior mediante
  **efectos laterales** como el uso de variables no locales y la modificación
  de argumentos mutables.

  !DOT(exterior-funcion-sin-entrada-salida.svg)(Comunicación de una función con el exterior incluyendo efectos laterales)(width=75%)(width=70%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  VariablesNoLocales [shape = plaintext, fillcolor = transparent, label = "Variables no locales"];
  Argumentos [shape = plaintext, fillcolor = transparent];
  ArgumentosMutables [shape = plaintext, fillcolor = transparent, label = "Argumentos mutables"];
  Resultado [label = "Valor de retorno", shape = plaintext, fillcolor = transparent];

  Argumentos -> Función;
  Función -> Resultado;

  { rank = same; ArgumentosMutables; Argumentos; VariablesNoLocales }
  Función -> ArgumentosMutables [dir = both];
  VariablesNoLocales -> Función [dir = both];
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Pero además, una función puede interactuar con el exterior del programa
  realizando **operaciones de entrada/salida (E/S)**.

- El **exterior de un programa** puede ser, entre otros:

  - El teclado.
  - La pantalla.
  - Un archivo del disco duro.
  - Otro ordenador de la red.

  !DOT(exterior-funcion-completa.svg)(Comunicación de una función con el exterior)(width=75%)(width=70%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  VariablesNoLocales [shape = plaintext, fillcolor = transparent, label = "Variables no locales"];
  ArgumentosMutables [shape = plaintext, fillcolor = transparent, label = "Argumentos mutables"];
  Argumentos [shape = plaintext, fillcolor = transparent];
  Resultado [label = "Valor de retorno", shape = plaintext, fillcolor = transparent];

  Argumentos -> Función;
  Función -> Resultado;

  { rank = same; ArgumentosMutables; Argumentos; VariablesNoLocales }
  Función -> ArgumentosMutables [dir = both];
  VariablesNoLocales -> Función [dir = both];

  ExteriorE [label = "Entrada desde el exterior\n(Consola, archivos,\nlínea de órdenes, GUI...)", shape = plaintext, fillcolor = transparent];
  ExteriorS [label = "Salida al exterior\n(Consola, archivos, GUI...)", shape = plaintext, fillcolor = transparent];

  { rank = same; ExteriorE; Función; ExteriorS }

  // Flechas verticales
  ExteriorE -> Función;
  Función -> ExteriorS;
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Las operaciones de E/S se consideran **efectos laterales** porque:

  - pueden producir cambios en el exterior, o

  - pueden hacer que el resultado de una función dependa de los datos leídos
    del exterior y, por tanto, ya no sólo dependería de sus argumentos.

- Gracias a ello, un programa puede comunicarse con el exterior mediante
  operaciones de lectura en la entrada y operaciones de escritura en la salida,
  que son efectos laterales.

  !DOT(exterior-programa.svg)(Comunicación de un programa con el exterior)(width=75%)(width=70%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ExteriorE [label = "Entrada desde el exterior\n(Consola, archivos,\nlínea de órdenes, GUI...)", shape = plaintext, fillcolor = transparent];
  ExteriorS [label = "Salida al exterior\n(Consola, archivos, GUI...)", shape = plaintext, fillcolor = transparent];
  ExteriorE -> Programa -> ExteriorS
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!SALTOHTML

- De esta forma, el programa puede interactuar con el usuario, solicitarle
  datos y proporcionarle resultados.

---

- En Python (así como en otros lenguajes de programación), la E/S de
  información desde y hacia el exterior se realiza por medio de **flujos** (del
  inglés, _streams_), que son _secuencias_ de caracteres o de bytes:

  !DOT(flujos.svg)(Ejemplo de un programa que saluda)(width=80%)(width=80%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fontname = "monospace"]
  E [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{\\n|e|p|e|P}"]
  S [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{\\n|e|p|e|P| |a|l|o|H}"]
  E -> Programa -> S
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!SALTO

- Esos flujos actúan como «colas» de elementos (caracteres o bytes), de forma
  que:

  - En la entrada, los elementos están a la espera de ser consumidos por el
    programa.

  - En la salida, los elementos se van encolando a medida que el programa los
    va generando y volcando al exterior.

---

- Dependiendo de las características del **flujo de entrada**, hay dos
  posibilidades:

  a. _Lectura secuencial_: El programa sólo puede acceder al primer elemento de
     la cola, de manera que va leyéndolos de uno en uno y se van sacando de la
     cola a medida que se van leyendo.

  a. _Lectura directa_: El programa puede moverse libremente por el flujo y
     acceder a cualquier elemento del mismo, sin importar la posición en la que
     esté el elemento dentro del flujo.

- Asimismo, dependiendo de las características del **flujo de salida**, también
  hay dos posibilidades:

  a. _Escritura secuencial_: El programa sólo puede escribir al final de la
      cola de salida.

  a. _Escritura directa_: El programa puede escribir elementos libremente en
     cualquier posición dentro del flujo.

- Finalmente, algunos flujos pueden actuar como flujo de entrada y de salida al
  mismo tiempo y, en tal caso, el programa podría leer y escribir datos sobre
  el mismo flujo.

### Entrada y salida por consola

- Por _consola_ entendemos de forma genérica la pantalla y el teclado del
  ordenador.

- Por tanto, la E/S por consola se refiere a las operaciones de lectura de
  datos por el teclado y escritura a la pantalla.

- Mientras no se diga lo contrario, el sistema operativo conecta la consola a
  dos flujos llamados **_entrada estándar_** y **_salida estándar_**, de forma
  que el teclado está conectado a la entrada estándar y la pantalla a la salida
  estándar.

- Esos flujos se pueden _redireccionar_ a otros archivos o dispositivos
  usando las redirecciones de la _shell_: `<`, `>` o `|`:

  ```console
  $ python programa.py < entrada.txt
  $ python programa.py > salida.txt
  ```

---

- En Python, esos dos flujos se pueden manipular mediante los objetos
  !PYTHON(sys.stdin) y !PYTHON(sys.stdout), respectivamente.

- También existe el flujo !PYTHON(sys.stderr) que representa la **_salida
  estándar de errores_** del sistema operativo.

- El intérprete ya abre automáticamente los flujos !PYTHON(sys.stdin),
  !PYTHON(sys.stdout) y !PYTHON(sys.stderr) nada más arrancar y los conecta a
  la entrada estándar, la salida estándar y la salida estándar de errores,
  respectivamente.

### !PYTHON(print)

- La función !PYTHON(print) imprime (*escribe*) por la salida (normalmente la
  pantalla) el valor de una o varias expresiones.

- Produce un efecto lateral porque cambia el exterior del programa, afectando
  al estado de un dispositivo de salida.

- Su signatura (simplificada) puede describirse así en notación EBNF:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(print)`(`!NT{expresión}(`,` !NT{expresión})\* [`, ` `sep=`!NT(expresión)][`, ` `end=`!NT(expresión)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  - El `sep` es el *separador*, que por defecto es !PYTHON{' '} (un
    espacio).

  - El `end` es el *terminador*, que por defecto es !PYTHON{'\n'} (un salto de
    línea).

  - Las expresiones se convierten en cadenas antes de imprimirse.

---

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23)
  hola pepe 23
  ```

- Imprime por la salida las expresiones indicadas, separadas por el separador
  (en este caso, un espacio), y al final imprime el terminador (en este caso,
  un salto de línea).

- En detalle, la llamada anterior hace lo siguiente:

  #. Imprime `hola`.

  #. Imprime un espacio (!PYTHON(' ')).

  #. Imprime `pepe`.

  #. Imprime otro espacio (!PYTHON(' ')).

  #. Imprime `23`.

  #. Imprime un salto de línea (!PYTHON('\n')).

#### Paso de argumentos por palabras clave

- Normalmente, los argumentos se pasan a los parámetros posicionalmente (lo que
  se denomina **paso de argumentos posicional**).

- Según este método, los argumentos se asignan a los parámetros
  correspondientes según la posición que ocupan en la llamada a la función (el
  primer argumento se asigna al primer parámetro, el segundo al segundo
  parámetro y así sucesivamente).

- En Python también existe el **paso de argumentos por palabra clave**, donde
  cada argumento se asigna a su parámetro indicando en la llamada el nombre del
  parámetro y el valor de su argumento correspondiente separados por un `=`,
  como si fuera una asignación.

- Los argumentos así pasados a la función se pueden colocar en cualquier orden
  dentro de la lista de argumentos en la llamada a la función.

- Esta técnica se usa, por ejemplo, en la función !PYTHON(print) para indicar
  el separador o el terminador de la lista de expresiones a imprimir.

---

- Si se combinan ambas técnicas en una misma llamada, **los argumentos pasados
  por palabras clave se ponen al final**, detrás de los argumentos pasados por
  posición.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23, sep='*')
  hola*pepe*23
  >>> print('hola', 'pepe', 23, end='-')
  hola pepe 23-
  ```

- La _verdadera_ signatura de la función !PYTHON(print) es:

  ```python
  print(*args, sep=' ', end='\n', file=None, flush=False)
  ```

- La sintaxis «!PYTHON(*args)» significa que !PYTHON(print) admite un número
  variable de argumentos posicionales (es una función **_variádica_**).

- Los otros parámetros (`sep`, `end`, `file` y `flush`) se pasan
  obligatoriamente por palabras clave, no por posición.

---

- En la documentación de Python, la signatura de una función puede contener
  entre sus parámetros los símbolos «`/`» y/o «`*`» (uno o los dos).

- Por ejemplo:

  ```python
  exec(source, /, globals=None, locals=None, *, closure=None)
  ```

- Esos símbolos son separadores que indican lo siguiente:

  - Hasta `/`: Los argumentos sólo se pueden pasar por posición.

  - Entre `/` y `*`: Los argumentos se pueden pasar por posición o por palabras
    clave.

  - A partir de `*`: Los argumentos se pasan sólo por palabra clave.

- En el ejemplo anterior:

  - `source` sólo se puede pasar por posición.

  - `globals` y `locals` se pueden pasar por posición o por palabras clave.

  - `closure` sólo se puede pasar por palabra clave.

---

- Algunos o todos los separadores pueden omitirse:

  | Signatura de la función                            | Qué significa                                                                   |
  | -------------------------------------------------- | ------------------------------------------------------------------------------- |
  | !PYTHON(g(a, b, c))                                | Todos los parámetros son posicionales o por palabras clave.                     |
  | !PYTHON(g(a, b, /, c))                             | `a, b` sólo posicionales, `c` posicional o por palabra clave.                   |
  | !PYTHON(g(a, !POR, b))                             | `a` posicional, `b` sólo por palabra clave.                                     |
  | !PYTHON(g(a, /, b, !POR, c))                       | `a` posicional, `b` posicional o por palabra clave, `c` sólo por palabra clave. |
  | !PYTHON(g(!POR{}args, b, c))                       | Número variable de argumentos posicionales, `b` y `c` sólo por palabras clave (el `*` de «!PYTHON(!POR{}args)» actúa como el `*` de los ejemplos anteriores). |

---

- Diagrama visual:

  ```python
  def g(a, b, /, c, d, *, e, f):
           |  |     |  |     |
           |  |     |  |     +-- parámetros sólo por palabras clave (e, f)
           |  |     |  +-------- indica inicio de sólo palabras clave
           |  |     +----------- parámetros posicionales o por palabras clave (c, d)
           |  +----------------- indica fin de sólo posicionales
           +-------------------- parámetros sólo posicionales (a, b)
  ```

- Ejemplos de llamadas:

  ---------------------------------------------------------------------------------------------
  Llamada                                     ¿Válida?   Comentario
  -----------------------------------------  ----------  -------------------------------------- 
  !PYTHON{g(1, 2, 3, 4, e=5, f=6)}               Sí      `a`, `b`, `c`, `d`: posicionales \
                                                         `e`, `f`: por palabras clave
                                                             
  !PYTHON{g(1, 2, c=3,} \                        Sí      `a`, `b`: posicionales \
  \ \ \ \ \ \ !PYTHON{d=4, e=5, f=6)}                    `c`, `d`, `e`, `f`: por palabras clave
                                                             
  !PYTHON{g(a=1, b=2, c=3,} \                    No      `a`, `b`: son sólo posicionales
  \ \ \ \ \ \ !PYTHON{d=4, e=5, f=6)}
                                                             
  !PYTHON{g(1, 2, 3, 4, 5, 6)}                   No      `e`, `f`: deben ser por palabras clave
  ---------------------------------------------------------------------------------------------

#### Argumentos por defecto

- Un **parámetro con valor por defecto** es un parámetro de una función al que
  se le asigna un valor por defecto en la definición de la función,
  quedando recogido en la signatura de la misma.

- En tal caso, se dice que ese parámetro es **opcional**.

- Cuando se llama a la función, el argumento correspondiente a ese parámetro se
  puede omitir y, en tal caso, el parámetro tomaría su valor por defecto,
  también denominado **argumento por defecto** en esa llamada.

- Una función puede tener cero, uno o varios parámetros opcionales.

---

- Por ejemplo, la función !PYTHON(int) tiene un parámetro llamado `base` que
  tiene un valor por defecto !PYTHON{10} (y que, por tanto, es _opcional_). Su
  signatura es:

  ```python
  int(x, base=10)
  ```
 
- Ejemplos de uso:

  ```python
  int("101")           # 101 (el parámero base toma su valor por defecto, 10)
  int("101", 2)        # 5 (el parámetro base toma el valor del argumento 2)
  ```

- Tal como está definida la función, el parámetro `base` también se puede pasar
  por palabra clave:

  ```python
  int("102", base=2)   # 5
  ```

---

- Es habitual que los parámetros con valores por defecto también sean
  parámetros que sólo admitan argumentos pasados por palabra clave.

- En el ejemplo del !PYTHON(print):

  ```python
  print(*args, sep=' ', end='\n', file=None, flush=False)
  ```

  - Primero admite un número variable de argumentos posicionales.

  - Luego, si se desea pasar argumentos para los parámetros `sep`, `end`,
    `file` o `flush`, hay que hacerlo por palabra clave.

  - En caso de no hacerlo, tomarán sus valores por defecto, indicados en la
    signatura.
 
#### El valor !PYTHON(None)

- Es importante resaltar que la función !PYTHON(print) **no devuelve** el valor
  de las expresiones, sino que las **imprime** (provoca el efecto lateral de
  cambiar la pantalla haciendo que aparezcan nuevos caracteres).

- Por tanto, no es lo mismo hacer:

  ```python
  >>> 'Hola mundo'
  'Hola mundo'
  ```

  que hacer:

  ```python
  >>> print('Hola mundo')
  Hola mundo
  ```

- La función !PYTHON(print) como tal no devuelve ningún valor, pero como en
  Python todas las funciones deben devolver *algún* valor, en realidad lo que
  ocurre es que !PYTHON(print) **devuelve un valor !PYTHON(None)**.

- !PYTHON(None) es un valor especial que significa «**ningún valor**» y se
  utiliza principalmente para casos en los que no tiene sentido que una función
  devuelva un valor determinado, como es el caso de !PYTHON(print).

---

- Pertenece a un tipo de datos especial llamado !PYTHON(NoneType) cuyo único
  valor posible es !PYTHON(None).

- Para comprobar si un valor es !PYTHON(None) se usa
  !NT(valor)\  !PYTHON(is None).
 
- Sólo existe un único valor !PYTHON(None) en el montículo, que se crea justo
  al arrancar el intérprete.

- Podemos comprobar que, efectivamente, !PYTHON(print) devuelve !PYTHON(None):

  ```python
  >>> print('hola', 'pepe', 23) is None
  hola pepe 23  # ésto es lo que imprime print
  True          # ésto es el resultado de comprobar si el valor de print es None
  ```

- Otra forma, usando variables:

  ```python
  >>> x = print('hola', 'pepe', 23)
  hola pepe 23  # ésto es lo que imprime print
  >>> x is None
  True          # ésto es el resultado de comprobar si el valor de x es None
  ```

### !PYTHON(input)

- La función !PYTHON(input) *lee* datos introducidos desde la entrada
  (normalmente el teclado) y devuelve el valor del dato introducido, que
  siempre es una **cadena** a la cual se le ha eliminado el posible salto de
  línea final.

- Su signatura es:

  ```python
  input(prompt: str = '') -> str
  ```

- Por ejemplo:

  ```python
  >>> nombre = input('Introduce tu nombre: ')
  Introduce tu nombre: Ramón
  >>> print('Hola,', nombre)
  Hola, Ramón
  ```

---

- En primer lugar, provoca el *efecto lateral* de alterar el estado del
  dispositivo de salida imprimiendo el *prompt*.

- Además, provoca el *efecto lateral* de alterar el estado del dispositivo de
  entrada, ya que se espera a que desde el exterior se introduzca el dato
  solicitado consumiendo los caracteres que haya en la entrada hasta el salto
  de línea.

- Eso hace que sea *impura* por partida triple: provoca dos efectos laterales
  (dos operaciones de E/S) y puede devolver un resultado distinto cada vez que
  se la llama, incluso con los mismos argumentos.

## Ejecución de _scripts_!ifdef(HTML)(&nbsp;)() por lotes

- A partir de ahora, ya podemos escribir programas que se comuniquen
  directamente con el usuario mediante la entrada y salida por consola.

- Por tanto, ya no necesitamos ejecutar las sentencias dentro de una sesión en
  el intérprete interactivo y podemos pasarle nuestros programas a los usuarios
  para que lo ejecuten.

- En Python, los programas se almacenan en archivos llamados _scripts_.

- Los usuarios ejecutan los programas directamente desde el sistema operativo,
  llamando al intérprete por lotes y pasándole el nombre del _script_ que desea
  ejecutar.

- Por ejemplo, para ejecutar el _script_ `programa.py`, el usuario escribiría
  lo siguiente en un terminal del sistema operativo:

  ```console
  $ python programa.py
  ```

- Observar que no se usa ninguna opción en la orden; solamente el nombre del
  archivo.

---

- Nosotros, los programadores, durante el desarrollo del programa podemos
  ejecutarlo directamente dentro del entorno integrado de desarrollo (IDE).

- Por ejemplo, desde Visual Studio Code podemos ejecutar el _script_ actual sin
  salirnos del editor usando una de las siguientes opciones:

  - Pulsando en el icono del triángulo verde situado en la esquina superior
    derecha de la ventana del editor:

    !ifdef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(icono-ejecutar-vscode.png)()(width=8%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    !ifdef(BEAMER)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}\hspace{-3.2em}![](!IMAGES/icono-ejecutar-vscode.png){width=8%}\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    !ifdef(LATEX)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}\hspace{-2.2em}![](!IMAGES/icono-ejecutar-vscode.png){width=8%}\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  - Pulsando la tecla `F1` y escribiendo:

    `>Python: Run Python File in Terminal`

    en el panel de comandos que aparece.

- En cualquiera de los dos casos, Visual Studio Code abre un terminal integrado
  y ejecuta ahí dentro el comando `python programa.py` como si lo hubiéramos
  escrito nosotros desde el sistema operativo.

!EJERCICIO

@. Explicar las diferencias entre estas tres formas de ejecutar el intérprete.
   Indicar en qué casos es conveniente usar cada una:

    a. `$ python`{.console}

    b. `$ python script.py`{.console}

    c. `$ python -i script.py`{.console}

### Argumentos de la línea de órdenes

- El usuario del programa puede pasarle argumentos directamente desde la línea
  de órdenes del sistema operativo al arrancar el programa con el intérprete
  por lotes.

- Para acceder a esos argumentos desde el programa, puede usarse el atributo
  !PYTHON(argv) del módulo !PYTHON(sys).

- !PYTHON(sys.argv) es una lista que el intérprete rellena automáticamente con
  los argumentos usados por el usuario del _script_ al ejecutarlo desde la
  línea de órdenes.

- El primer elemento de la lista (es decir, !PYTHON(sys.argv[0])) siempre
  contiene el nombre del _script_.

- Los restantes elementos (!PYTHON(sys.argv[1]), !PYTHON(sys.argv[2]),
  etcétera) contendrán los argumentos pasados al _script_, en el orden en el
  que aparecen en la línea de órdenes.

---

- Por ejemplo, un programa puede saludar al usuario dirigiéndose a él por su
  nombre, el cual tendrá que pasarlo mediante la línea de órdenes de la
  siguiente forma:

  ```console
  $ python saluda.py Ricardo
  ```

- Al ejecutar el _script_ `saluda.py`, el nombre del _script_ aparecerá en
  !PYTHON(sys.argv[0]) y el primer argumento enviado al mismo (en este caso, el
  nombre del usuario `Ricardo`) aparecerá en !PYTHON(sys.argv[1]):

  ```python
  import sys
  print('¡Hola,', sys.argv[1])
  ```

- Si el usuario no le pasa ningún argumento en la línea de órdenes,
  !PYTHON(sys.argv[1]) no existirá y se producirá un error !PYTHON(IndexError)
  al intentar acceder a él:

  ```python
  $ python saluda.py
  Traceback (most recent call last):
    File "saluda.py", line 2, in <module>
      print('¡Hola,', sys.argv[1])
  IndexError: list index out of range
  ```

---

- El siguiente programa suma dos números indicados por el usuario mediante la
  línea de órdenes.

- En este caso, hay que tener en cuenta que los argumentos siempre se pasan
  como cadenas, así que habría que convertirlos previamente a números:

  ```python
  import sys
  x = float(sys.argv[1])
  y = float(sys.argv[2])
  print('La suma de', x, '+', y, 'es', x + y)
  ```

- Un ejemplo de ejecución de este programa sería:

  ```console
  $ python suma.py 4 3
  La suma de 4.0 + 3.0 es 7.0
  ```

!BIBLIOGRAFIA
