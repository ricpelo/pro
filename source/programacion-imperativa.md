---
title: Programación imperativa
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008
---

# Modelo de ejecución

## Máquina de estados

- La **programación imperativa** es un paradigma de programación basado en el
  concepto de **sentencia**.

- Un programa imperativo está formado por una sucesión de sentencias que se
  ejecutan **en orden**.

- Una sentencia es una instrucción del programa que lleva a cabo una de estas
  acciones:

  - **Cambiar el estado interno** del programa, normalmente mediante la llamada
    **sentencia de asignación**.

  - Cambiar el **flujo de control** del programa, haciendo que la ejecución se
    bifurque (*salte*) a otra parte del mismo.

- El modelo de ejecución de un programa imperativo es el de una **máquina de
  estados**, es decir, una máquina que va pasando por diferentes estados a
  medida que el programa va ejecutándose.

---

- En programación imperativa, el concepto de **tiempo** cobra mucha
  importancia: el programa actuará de una forma un otra según el estado en el
  que se encuentre, es decir, según el momento en el que estemos observando al
  programa.

  Eso significa que, ante los mismos datos de entrada, una función puede
  devolver **valores distintos en momentos distintos**.

- En programación funcional, en cambio, el comportamiento de una función no
  depende del momento en el que se ejecute, ya que siempre devolverá los mismos
  resultados ante los mismos datos de entrada.

- Eso significa que, para modelar el comportamiento de un programa imperativo,
  ya **no nos vale el modelo de sustitución**.

## Secuencia de instrucciones

- Un programa imperativo es una **secuencia de instrucciones**, y ejecutar un
  programa es provocar los **cambios de estado** que dictan las instrucciones
  en el **orden** definido por el programa.

- Las instrucciones del programa van provocando **transiciones** entre estados,
  haciendo que la máquina pase de un estado al siguiente.

- Para modelar el comportamiento de un programa imperativo tendremos que saber
  en qué estado se encuentra el programa, para lo cual tendremos que seguirle
  la pista desde su estado inicial al estado actual.

- Eso básicamente se logra «ejecutando» mentalmente el programa instrucción por
  instrucción y llevando la cuenta de los valores ligados a sus
  identificadores.

## Sentencias

- A las instrucciones de un programa imperativo también se las denomina
  **sentencias**.

- La principal diferencia entre una *sentencia* y una *expresión* es que las
  sentencias no denotan ningún valor, sino que son órdenes a ejecutar por el
  programa para cambiar el estado de éste.

  - Las *expresiones* se *evalúan*.

  - Las *sentencias* se *ejecutan*.

- En muchos lenguajes imperativos (como ocurre con Python y Java) es posible
  colocar una expresión donde se espera una sentencia (aunque no al revés), si
  bien no suele resultar útil ya que, en ese caso, la ejecución de tal
  «sentencia» consistiría en evaluar la expresión, pero el resultado de dicha
  evaluación se perdería.

- Sólo resultaría útil en caso de que la evaluación de la expresión provocara
  *efectos laterales* (cosa que estudiaremos en breve).

# Asignación destructiva

## Referencias al montículo

- Todos los valores se almacenan en una zona de la memoria conocida como el
  **montículo**.

- Cada vez que aparece un nuevo dato en el programa, el intérprete lo crea
  dentro del montículo a partir de una determinada dirección de la memoria y
  ocupando el espacio de memoria que se necesite en función del tamaño que
  tenga el dato.

- Esa dirección de comienzo de la zona que ocupa el dato dentro del montículo
  se denomina **referencia** y sirve para identificar al dato y acceder al
  mismo.

- En determinados casos, el intérprete puede no crear un nuevo dato sino
  aprovechar otro exactamente igual que ya haya en el montículo (lo
  estudiaremos más adelante cuando hablemos de los *alias*).

## Variables

- Una **variable** es un lugar en la **memoria** donde se puede **almacenar una
  referencia**.

- Cuando una variable contiene una referencia a un valor, decimos que la
  variable **apunta al valor**.

- Por abuso del lenguaje, también se suele decir que la variable **almacena o
  contiene el valor**, aunque eso no es estríctamente cierto.

- El valor de una variable (o mejor dicho, la referencia que contiene) **puede
  cambiar** durante la ejecución del programa, haciendo que la variable pueda
  *apuntar* a distintos valores durante la ejecución del programa.

---

- A partir de ahora, un identificador no se liga directamente con un valor,
  sino que tendremos:

  - Una **ligadura** entre un identificador y una **variable**.

  - La variable **apunta** al valor.

!DOT(identificador-variable-valor.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
identificador [shape = plaintext, fillcolor = transparent]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable -> valor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Estado

- La **ligadura** es la asociación que se establece entre un identificador y
  una variable.

- El **estado de una variable** es el valor al que apunta una variable en un
  momento dado.

  Por tanto, el estado es la asociación que se establece entre una variable y
  un valor (es decir, la referencia que contiene).

!DOT(identificador-ligadura-variable-estado-valor.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
identificador [shape = plaintext, fillcolor = transparent]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable [label = "ligadura"]
variable -> valor [label = "estado"]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Tanto las ligaduras como los estados pueden cambiar durante la ejecución de
  un programa imperativo.

- El **estado de un programa** es el conjunto de los estados de todas sus
  variables (más cierta información auxiliar gestionada por el intérprete).

## Marcos en programación imperativa

- Hasta ahora, los marcos contenían ligaduras entre identificadores y valores.

- A partir de ahora, un marco contendrá:

  - El conjunto de las **ligaduras entre identificadores y variables**, y

  - El **estado de cada variable**, es decir, el conjunto de las variables y
    las referencias que contienen en un momento dado.

!DOT(marcos-imperativa.svg)()(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
subgraph cluster0 {
    label = "Montículo"
    bgcolor = white
    style = rounded
    4 [shape = circle, width = 0.3, fixedsize = shape]
    5 [shape = circle, width = 0.3, fixedsize = shape]
}
subgraph cluster1 {
    label = "Marco global"
    bgcolor = white
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    x -> v1 -> 4
    y -> v2 -> 5
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Sentencia de asignación

- La forma más básica de cambiar el estado de una variable es usando la
  **sentencia de asignación**.

- Es la misma instrucción que hemos estado usando hasta ahora para ligar
  valores a identificadores, pero ahora, en el paradigma imperativo, tiene otro
  significado:

  ```python
  x = 4      # se lee: «asignar el valor 4 a la variable x»
  ```

  El efecto que produce es el de almacenar, en la variable ligada al
  identificador `x`, una referencia al valor `4` almacenado en el montículo.

  También se dice (pero mal dicho) que «la variable `x` pasa a valer `4`».

- La asignación es **destructiva** porque al cambiarle el valor a una variable
  se destruye su valor anterior. Por ejemplo, si ahora hacemos:

  ```python
  x = 9
  ```

  El valor de la variable a la que está ligada el identificador `x` pasa ahora
  a ser `9`, perdiéndose el valor `4` anterior.

---

- Por abuso del lenguaje, se suele decir:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor `9` a la variable `x`»*
  ~~~~~~~~~~~~~~~~~~~~~~~

  o

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor `9` a la variable ligada al identificador `x`»*
  ~~~~~~~~~~~~~~~~~~~~~~~

  en lugar de la forma correcta:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna una referencia al valor `9` a la variable ligada al identificador
  `x`»*
  ~~~~~~~~~~~~~~~~~~~~~~~

- Aunque esto simplifica las cosas a la hora de hablar, hay que tener cuidado,
  porque llegará el momento en que podremos tener:

  - Varios identificadores distintos ligados a la misma variable.

  - Un mismo identificador ligado a distintas variables en diferentes puntos
    del programa.

  - Varias variables apuntando al mismo valor.

---

- Cada nueva asignación provoca un cambio de estado en el programa.

- En el ejemplo anterior, el programa pasa de estar en un estado en el que la
  variable `x` vale 4 a otro en el que la variable vale `9`.

- Al final, un programa imperativo se puede reducir a una **secuencia de
  asignaciones** realizadas en el orden dictado por el programa.

- Este modelo de funcionamiento está estrechamente ligado a la arquitectura de
  un ordenador: hay una memoria formada por celdas que contienen datos que
  pueden cambiar a lo largo del tiempo según dicten las instrucciones del
  programa que controla al ordenador.

### Un ejemplo completo

- Cuando se ejecuta la siguiente instrucción en el ámbito global:

  ```python
  x = 2500
  ```

  ocurre lo siguiente:

  1. Se crea el valor `2500` en el montículo y el intérprete devuelve una
     referencia al mismo.

  2. El intérprete identifica a qué variable está ligado el identificador `x`
     consultando el marco global (si no existía dicha variable, la crea en ese
     momento y la liga a `x`).

  3. Almacena en la variable la referencia creada en el paso 1.

## Evaluación de expresiones con variables

- Al evaluar expresiones, las variables actúan de modo similar a las ligaduras
  de la programación funcional, pero ahora los valores de las variables pueden
  cambiar a lo largo del tiempo, por lo que deberemos *seguirle la pista* a las
  asignaciones que sufran dichas variables.

- Todo lo visto hasta ahora sobre marcos, ámbitos, sombreado, entornos, etc. se
  aplica igualmente a las variables.

## Constantes

- En programación funcional no existen las variables y un identificador sólo
  puede ligarse a un valor (un identificador ligado no puede re-ligarse a otro
  valor distinto).

  - En la práctica, eso significa que un identificador ligado actúa como un
    valor constante que no puede cambiar durante la ejecución del programa.

  - El valor de esa constante es el valor al que está ligado el identificador.

- En programación imperativa, los identificadores se ligan a variables, que son
  las que realmente apuntan a los valores.

- Una **constante** en programación imperativa sería el equivalente a una
  variable cuyo valor no puede cambiar durante la ejecución del programa.

---

- Muchos lenguajes de programación permiten definir constantes, pero **Python
  no es uno de ellos**.

- En Python, una constante **es una variable más**, pero **es responsabilidad
  del programador** no cambiar su valor durante todo el programa.

- Python no hace ninguna comprobación ni muestra mensajes de error si se cambia
  el valor de una constante.

- En Python, por **convenio**, los identificadores ligados a una variable con
  valor constante se escriben con todas las letras en **mayúscula**:

  ```python
  PI = 3.1415926
  ```

  El nombre en mayúsculas nos recuerda que `PI` es una constante.

- Aunque nada nos impide cambiar su valor (cosa que debemos evitar):

  ```python
  PI = 99
  ```

## Tipado estático vs. dinámico

- Cuando una variable tiene asignado un valor, al ser usada en una expresión
  actúa como si fuera ese valor.

- Como cada valor tiene un tipo de dato asociado, también podemos hablar del
  **tipo de una variable**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de una variable** es el tipo del dato al que hace referencia la
  variable.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si a una variable se le asigna otro valor de un tipo distinto al del valor
  anterior, el tipo de la variable cambia y pasa a ser el del nuevo valor que
  se le ha asignado.

---

- Eso quiere decir que **el tipo de una variable podría cambiar durante la
  ejecución del programa**.

- A este enfoque se le denomina **tipado dinámico**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado dinámico:**

  Son aquellos que **permiten** que el tipo de una variable **cambie** durante
  la ejecución del programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En contraste con los lenguajes de tipado dinámico, existen los llamados
  **lenguajes de tipado estático**.

- En un lenguaje de tipado estático, el tipo de una variable se define una sola
  vez (en la fase de compilación o justo al empezar a ejecutarse el programa),
  y **no puede cambiar** durante la ejecución del mismo.

---

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado estático:**

  Son aquellos que asocian forzosamente un tipo a cada variable del programa
  desde que comienza a ejecutarse y **prohíben** que dicho tipo **cambie**
  durante la ejecución del programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Estos lenguajes disponen de construcciones sintácticas que permiten declarar
  de qué tipo serán los datos a los que puede apuntar una variable.

  Por ejemplo, en Java podemos hacer:

  ```java
  int x;
  ```

  con lo que declaramos que a `x` sólo se le podrán asignar valores de tipo
  `int` desde el primer momento y a lo largo de toda la ejecución del programa.

---

- A veces, se pueden realizar al mismo tiempo la declaración del tipo y la
  asignación del valor:

  ```java
  int x = 24;
  ```

- Otros lenguajes disponen de un mecanismo conocido como **inferencia de
  tipos**, que permite *deducir* automáticamente el tipo de una variable.

- Por ejemplo, en Java podemos hacer:

  ```java
  var x = 24;
  ```

  El compilador de Java deduce que la variable `x` debe ser de tipo `int`
  porque se le está asignando un valor entero (el `24`).

---

- Normalmente, los lenguajes de tipado estático son también lenguajes
  compilados y también fuertemente tipados.

- Asimismo, los lenguajes de tipado dinámico suelen ser lenguajes interpretados
  y a veces también son lenguajes débilmente tipados.

- Pero nada impide que un lenguaje de tipado dinámico pueda ser compilado, por
  ejemplo.

- Los tres conceptos de:

  - Compilado vs. interpretado

  - Tipado fuerte vs. débil

  - Tipado estático vs. dinámico

  son diferentes aunque están estrechamente relacionados.

## Asignación compuesta

- Los operadores de **asignación compuesta** nos permiten realizar operaciones
  sobre una variable y luego asignar el resultado a la misma variable.

- Tienen la forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_compuesta) ::= !NT(identificador) !NT(op)!T(=) !NT(expresión)
!NT(op) ::= !T(+) | !T(-) | !T( * ) | !T(/) | !T(%) | !T(//) | !T( ** ) | !T(&) | !T(|) | !T(^) | !T(>>) | !T(<<)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

---------------------------------------------
 Operador  Ejemplo         Equivalente a
---------- --------------- ------------------
`=`        `x = 5`         `x = 5`
                        
`+=`       `x += 5`        `x = x + 5`
                        
`-=`       `x -= 5`        `x = x - 5`
                        
`*=`       `x *= 5`        `x = x * 5`
                        
`/=`       `x /= 5`        `x = x / 5`
                        
`%=`       `x %= 5`        `x = x % 5`
                        
`//=`      `x //= 5`       `x = x // 5`
                        
`**=`      `x **= 5`       `x = x ** 5`
                        
`&=`       `x &= 5`        `x = x & 5`
                        
`|=`       `x |= 5`        `x = x | 5`
                        
`^=`       `x ^= 5`        `x = x ^ 5`
                        
`>>=`      `x >>= 5`       `x = x >> 5`
                        
`<<=`      `x <<= 5`       `x = x << 5`
---------------------------------------------

## Asignación múltiple

- Con la **asignación múltiple** podemos asignar valores a varias variables
  **al mismo tiempo** en una sola sentencia.

- La sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_múltiple) ::= !NT(lista_identificadores) !T(=) !NT(lista_expresiones)
!NT(lista_identificadores) ::= !NT{identificador}(!T(,) !NT{identificador})\*
!NT(lista_expresiones) ::= !NT{expresión}(!T(,) !NT{expresión})\*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  con la condición de que tiene que haber tantos identificadores como
  expresiones.

- Por ejemplo:

  ```python
  x, y = 10, 20
  ```

  asigna el valor `10` a `x` y el valor `20` a `y`.

# Mutabilidad

## Estado de un dato

- Ya hemos visto que en programación imperativa es posible cambiar el estado de
  una variable asignándole un nuevo valor (un nuevo dato).

- Al hacerlo, no estamos cambiando el valor en sí, sino que estamos
  sustituyendo el valor de la variable por otro nuevo, mediante el uso de la
  asignación destructiva.

- Sin embargo, también existen valores que poseen su propio **estado interno**
  y es posible cambiar dicho estado, no asignando un nuevo valor a la variable
  que lo contiene, sino **modificando el contenido de dicho valor**.

- Es decir: no estaríamos **cambiando** el estado de la variable (haciendo que
  ahora contenga un nuevo valor) sino **el estado interno** del propio valor
  contenido dentro de la variable.

- Los valores que permiten cambiar su estado interno se denominan **mutables**.

## Tipos mutables e inmutables

- En Python existen tipos cuyos valores son *inmutables* y otros que son
  *mutables*.

- Un valor **inmutable** es aquel cuyo estado interno no puede cambiar durante
  la ejecución del programa.

  Los tipos inmutables en Python son los números (`int` y `float`), los
  booleanos (`bool`), las cadenas (`str`), las tuplas (`tuple`), los rangos
  (`range`) y los conjuntos congelados (`frozenset`).

- Un valor **mutable** es aquel cuyo estado interno (normalmente, su
  **contenido**) puede cambiar durante la ejecución del programa.

  El principal tipo mutable en Python es la lista (`list`), pero también están
  los conjuntos (`set`) y los diccionarios (`dict`).

### Inmutables

- Un valor de un tipo inmutable no puede cambiar su estado interno.

:::::: columns

:::: column

Por ejemplo, si tenemos:

```python
x = 4
y = 5
```

!DOT(inmutable1.svg)()(width=50%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = plaintext, fillcolor = transparent]
x [shape = plaintext, fillcolor = transparent]
4 [shape = circle, width = 0.3, fixedsize = shape]
5 [shape = circle, width = 0.3, fixedsize = shape]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> 4
y -> v2 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 7
```

quedaría:

!DOT(inmutable2.svg)()(width=50%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = plaintext, fillcolor = transparent]
x [shape = plaintext, fillcolor = transparent]
c2 [shape = circle, width = 0.3, fixedsize = shape, label = "5"]
c1 [shape = circle, width = 0.3, fixedsize = shape, label = "7"]
4 [shape = circle, width = 0.3, fixedsize = shape]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> c1
v1 -> 4 [style = dashed, color = grey]
y -> v2 -> c2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- Lo que hace la asignación `x = 7` no es cambiar el contenido del valor `4`,
  sino hacer que la variable `x` contenga otro valor distinto (el valor `4` en
  sí mismo no se cambia internamente en ningún momento).

---

- Con las cadenas sería exactamente igual.

- Si tenemos:

  ```python
  x = 'hola'
  ```

  !DOT(inmutable3.svg)()(width=40%)(width=30%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = plaintext, fillcolor = transparent]
  v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x -> v1 -> hola
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  y luego hacemos:

  ```python
  x = 'hola manolo'
  ```

  **se crea una nueva cadena** y se la asignamos a la variable `x`.
  
  Es decir: la cadena `'hola'` original **no se cambia** (p. ej., no se le
  añade `' manolo'` al final), sino que **se sustituye por una nueva**.

  !DOT(inmutable4.svg)()(width=50%)(width=40%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = plaintext, fillcolor = transparent]
  v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
  holamanolo [shape = ellipse, width = 1.8, label = "'hola manolo'", fixedsize = true] 
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x -> v1 -> holamanolo
  v1 -> hola [style = dashed, color = grey]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Aunque las cadenas son datos inmutables, también son datos compuestos y
  podemos acceder individualmente a sus elementos componentes y operar con
  ellos aunque no podamos cambiarlos.

- Para ello podemos usar las operaciones comunes a toda secuencia de elementos
  (una cadena también es una **secuencia de caracteres**):

--------------------------------------------------------------------------------
Operación                Resultado
------------------------ -------------------------------------------------------
$x\ $ `in` $\ s$         `True` si $x$ está en $s$
                     
$x\ $ `not` `in` $\ s$   `True` si $x$ **no** está en $s$
                     
$s$`[`$i$`]`             (*Indexación*) El $i$-ésimo elemento de $s$, empezando
                         por 0
                      
$s$`[`$i$`:`$j$`]`       (*Slicing*) Rodaja de $s$ desde $i$ hasta $j$

$s$`[`$i$`:`$j$`:`$k$`]` Rodaja de $s$ desde $i$ hasta $j$ con paso $k$

$s$`.index(`$x$`)`       Índice de la primera aparición de $x$ en $s$
                       
$s$`.count(`$x$`)`       Número de veces que aparece $x$ en $s$
--------------------------------------------------------------------------------

---

- El *operador* de **indexación** consiste en acceder al elemento situado en la
  posición indicada entre corchetes:

:::: columns

::: {.column width=60%}

```
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
    0   1   2   3   4   5
   -6  -5  -4  -3  -2  -1
```

:::

::: {.column width=40%}

```python
>>> s[2]
't'
>>> s[-2]
'o'
```

:::

::::

- El **slicing** (*hacer rodajas*) es una operación que consiste en obtener una
  subsecuencia a partir de una secuencia, indicando los índices de los
  elementos inicial y final de la misma:

:::: columns

::: column

```
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

### Mutables

- Los valores de tipos **mutables**, en cambio, pueden cambiar su estado
  interno durante la ejecución del programa.

- Hasta ahora, hemos visto un único tipo mutable: la **lista**.

- Una lista puede cambiar el valor de sus elementos, aumentar o disminuir de
  tamaño (cambia su contenido y, por tanto, su estado).

- Al cambiar el estado interno de una lista no se crea una nueva lista, sino
  que **se modifica la ya existente**:

  ```python
  >>> x = [24, 32, 15, 81]
  >>> x[0] = 99
  >>> x
  [99, 32, 15, 81]
  ```

:::: columns

::: column

!DOT(cambio-estado-lista-antes.svg)(La lista antes de cambiar `x[0]`)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
lista [shape = record, width = 1.5, fixedsize = true, label = "{24|32|15|81}"]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(cambio-estado-lista-despues.svg)(La lista después de cambiar `x[0]`)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
lista [shape = record, width = 1.5, fixedsize = true, label = <{<S>24</S><BR/>99|32|15|81}>]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las listas son secuencias mutables y, como tales, se pueden modificar usando
  ciertas operaciones:

  - Los *operadores* de **indexación** y **slicing** combinados con `=` y
    `del`: !ifdef(LATEX)(\newpage)

    ```
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

  - *Métodos* como `append`, `clear`, `insert`, `remove`, `reverse` o `sort`.

- Las siguientes tablas muestran todas las **operaciones** que nos permiten
  **modificar secuencias mutables**.

---

($\underline{s}$ y $\underline{t}$ son listas, y $\underline{x}$ es un valor
cualquiera)

------------------------------------------------------------------------------------
Operación              Resultado
---------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$   El elemento $i$-ésimo de $s$ se sustituye por $x$

$s$`[`$i$`:`$j$`]`     La rodaja de $s$ desde $i$ hasta $j$ se sustituye por $t$
`=` $t$

$s$`[`$i$`:`$j$`:      Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$        por $t$

`del` $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`]` \
`$j$`]`                Equivale a hacer $s$`[`$i$`:`$j$`]` `=` `[]`

`del` $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`:`$k$`]`
`$j$`:`$k$`]`
------------------------------------------------------------------------------------

---

------------------------------------------------------------------------------------
Operación              Resultado
---------------------  -------------------------------------------------------------
$s$`.append(`$x$`)`    Añade $x$ al final de $s$ \
                       Equivale a hacer $s$`[len(`$s$`):len(`$s$`)]` `=` `[`$x$`]`

$s$`.clear()`          Elimina todos los elementos de $s$ \
                       Equivale a hacer `del` $\ s$`[:]`

$s$`.extend(`$t$`)`    Amplía $s$ con el contenido de $t$ \
ó \                    Equivale a hacer $s$`[len(`$s$`):len(`$s$`)]` `=` $t$
$s$ `+=` $t$

$s$`.insert(`$i$`,`    Inserta $x$ en $s$ en el índice $i$ \
$x$`)`                 Equivale a hacer $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$`.pop(`[$i=-1$]`)`  Devuelve el elemento $i$-ésimo y lo elimina de $s$

$s$`.remove(`$x$`)`    Elimina el primer elemento de $s$ que sea igual a $x$

$s$`.reverse()`        Invierte los elementos de $s$
------------------------------------------------------------------------------------

---

Partiendo de `x = [8, 10, 7, 9]`:

-----------------------------------------
Ejemplo           Valor de `x` después 
----------------- -----------------------
`x.append(14)`    `[8, 10, 7, 9, 14]`

`x.clear()`       `[]`

`x.insert(3, 66)` `[8, 10, 7, 66, 9]`

`x.remove(7)`     `[8, 10, 9]`

`x.reverse()`     `[9, 7, 10, 8]`
-----------------------------------------

## Alias de variables

- Cuando una variable que tiene un valor se asigna a otra, ambas variables
  pasan a tener **el mismo valor (lo _comparten_)**, produciéndose un fenómeno
  conocido como **alias de variables**.

  ```python
  x = [66, 77, 88, 99]
  y = x  # x se asigna a y; ahora y tiene el mismo valor que x
  ```

  !DOT(alias1.svg)()(width=40%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = plaintext, fillcolor = transparent]
  y [shape = plaintext, fillcolor = transparent]
  lista [shape = record, width = 1.5, fixedsize = true, label = "{66|77|88|99}"]
  v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
  v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
  x -> v1 -> lista
  y -> v2 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si el valor es **mutable** y cambiamos su **contenido** desde `x`, también
  cambiará `y` (y viceversa), pues ambas variables **apuntan al mismo dato**:

  ```python
  >>> y[2] = 40
  >>> x
  [66, 77, 40, 99]
  ```

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

!DOT(alias2.svg)()(width=50%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
lista [shape = record, width = 1.5, fixedsize = true, label = <{66|77|<S>88</S><BR/>40|99}>]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> lista
y -> v2 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

!SALTOLARGOBEAMER

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

!DOT(alias3.svg)()(width=50%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
lista2 [shape = record, width = 1.5, fixedsize = true, label = "{1|2|3}"]
lista1 [shape = record, width = 1.5, fixedsize = true, label = "{66|77|88|99}"]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
y -> v2
x -> v1 -> lista1
v2 -> lista2
v2 -> lista1 [style = dashed, color = grey]
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- El intérprete puede crear alias de variables **implícitamente** para ahorrar
  memoria y sin que seamos conscientes de ello.

- No tiene mucha importancia práctica, aunque es interesante saberlo en ciertos
  casos.

- Por ejemplo, el intérprete de Python crea internamente todos los números
  enteros comprendidos entre $-5$ y $256$, por lo que todas las variables de
  nuestro programa que contengan el mismo valor dentro de ese intervalo
  compartirán el mismo valor (serán *alias*):

:::: columns

::: {.column width=50%}

```python
x = 5 # está entre -5 y 256
y = 5
```

!DOT(inmutable5a.svg)(Se comparte el valor)(width=50%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
5 [shape = circle, width = 0.3, fixedsize = shape]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> 5
y -> v2 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=50%}

```python
x = 480 # no está entre -5 y 256
y = 480
```

!DOT(inmutable5b.svg)(No se comparte el valor)(width=50%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
c1 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
c2 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> c1
y -> v2 -> c2
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

!DOT(inmutable6.svg)()(width=60%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = plaintext, fillcolor = transparent]
x [shape = plaintext, fillcolor = transparent]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> hola
y -> v2 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 'pepe'
```

quedaría:

!DOT(inmutable7.svg)()(width=60%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v1 -> hola [style = dashed, color = grey]
y -> v2 -> pepe
x -> v1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- El intérprete aprovecharía el dato ya creado y no crearía uno nuevo, para
  ahorrar memoria.

---

:::: columns

::: {.column width=40%}

- También se comparten valores si se usa el mismo dato varias veces.

- Por ejemplo, si hacemos:

```python
>>> x = [1, 2, 3]
>>> y = [x, x]
>>> y
[[1, 2, 3], [1, 2, 3]]
```

:::

::: {.column width=60%}

nos quedaría:

!DOT(alias4.svg)()(width=50%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = TB, splines = ortho]
node [fixedsize = shape, fontname = "monospace"]
y [shape = plaintext, fillcolor = transparent]
x [shape = plaintext, fillcolor = transparent]
lista1 [shape = record, fixedsize = false, label = "{1|2|3}", fontsize = 10]
lista2 [shape = record, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
{rank = same; lista1; v2}
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> lista1
y -> v2 -> lista2
{rank = same; lista2:f0 -> lista1; lista2:f1 -> lista1}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

:::: columns

::: {.column width=40%}

- Y si ahora hacemos:

```python
>>> y[0][0] = 99
>>> x[1] = 77
>>> y
[[99, 77, 3], [99, 77, 3]]
```

:::

::: {.column width=60%}

nos quedaría:

!DOT(alias5.svg)()(width=50%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = TB, splines = ortho]
node [fixedsize = shape, fontname = "monospace"]
y [shape = plaintext, fillcolor = transparent]
x [shape = plaintext, fillcolor = transparent]
lista1 [shape = record, fixedsize = false, label = "{99|77|3}", fontsize = 10]
lista2 [shape = record, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
{rank = same; lista1; v2}
v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
x -> v1 -> lista1
y -> v2 -> lista2
{rank = same; lista2:f0 -> lista1; lista2:f1 -> lista1}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### `id`

- Para saber si dos variables comparten **el mismo dato**, se puede usar la
  función `id`.

- La función `id` devuelve un **identificador único** para cada dato.

- Por tanto, si dos variables tienen el mismo `id`, significa que el valor que
  contienen es realmente el mismo valor.
  
- Normalmente, el `id` de un valor se corresponde con la dirección de memoria
  donde está almacenado dicho valor.

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

### `is`

- Otra forma de comprobar si dos datos son realmente el mismo dato en memoria
  (es decir, si son **idénticos**) es usar el operador `is`, que comprueba la
  **identidad** de un dato:

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is) ::= !NT(valor1) !T(is) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

- Es un operador relacional que devuelve `True` si !NT(valor1) y !NT(valor2)
  son **el mismo dato en memoria** (es decir, si se encuentran almacenados en
  la misma celda de la memoria y, por tanto, son **idénticos**) y `False` en
  caso contrario.

- Cuando se usa con variables, devuelve `True` si los datos que almacenan las
  variables son realmente el mismo dato, y `False` en caso contrario.

- En la práctica, equivale a hacer `id(`!NT(valor1)`) == id(`!NT(valor2)`)`

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

- Por contraste, una función se considera **impura**:

  - si su valor de retorno o su comportamiento dependen de algo más que de sus
    argumentos, o

  - si provoca cambios de estado observables en el exterior de la función.

    En éste último caso decimos que la función provoca **efectos laterales**.

- Toda función que provoca efectos laterales es impura, pero no todas las
  funciones impuras provocan efectos laterales (puede ser impura porque su
  comportamiento se vea afectado por los efectos laterales provocados por otras
  partes del programa).

## Efectos laterales

- Un **efecto lateral** es cualquier cambio de estado llevado a cabo por una
  parte del programa (normalmente, una función) que puede observarse desde
  otras partes del mismo, las cuales podrían verse afectadas por él de una
  manera poco evidente o impredecible.

- Una función puede provocar efectos laterales, o bien verse afectada por
  efectos laterales provocados por otras partes del programa.

- Los casos típicos de efectos laterales en una función son:

  - Cambiar el valor de una variable global.

  - Cambiar el estado de un argumento mutable.

  - Realizar una operación de entrada/salida.

  En cualquiera de estos casos, tendríamos una función **impura**.

## Transparencia referencial

- En un lenguaje imperativo **se pierde la transparencia referencial**, ya que
  ahora el valor de una función puede depender no sólo de los valores de sus
  argumentos, sino también además de los valores de las variables libres que
  ahora pueden cambiar durante la ejecución del programa:

  ```python
  >>> suma = lambda x, y: x + y + z
  >>> z = 2
  >>> suma(3, 4)
  9
  >>> z = 20
  >>> suma(3, 4)
  27
  ```

- Por tanto, cambiar el valor de una variable global es considerado un **efecto
  lateral**, ya que puede alterar el comportamiento de otras partes del
  programa de formas a menudo impredecibles.

---

- Cuando el efecto lateral lo produce la propia función también estamos
  perdiendo transparencia referencial, pues en tal caso no podemos sustituir
  libremente la llamada a la función por su valor de retorno, ya que ahora la
  función **hace algo más** que calcular dicho valor y que es observable fuera
  de la función.

- Por ejemplo, una función que imprime algo por la pantalla o escribe algo en
  un archivo del disco tampoco es una función pura y, por tanto, en ella no se
  cumple la transparencia referencial.

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

- Los efectos laterales hacen que sea muy difícil razonar sobre el
  funcionamiento del programa, puesto que las funciones impuras no pueden verse
  como simples correspondencias entre los datos de entrada y el resultado de
  salida, sino que además hay que tener en cuenta los **efectos ocultos** que
  producen en otras partes del programa.

- Por ello, se debe **evitar**, siempre que sea posible, escribir funciones
  impuras.

- Ahora bien: muchas veces, la función que se desea escribir tiene efectos
  laterales porque esos son, precisamente, los efectos deseados.

  - Por ejemplo, una función que actualice los salarios de los empleados en una
    base de datos, a partir del salario base y los complementos.

- En ese caso, es importante **documentar** adecuadamente la función para que,
  quien desee usarla, sepa perfectamente qué efectos produce más allá de
  devolver un resultado.

## Entrada y salida por consola

- Nuestro programa puede comunicarse con el exterior realizando **operaciones
  de entrada/salida**.

- Interpretamos la palabra *exterior* en un sentido amplio; por ejemplo:

  - El teclado
  - La pantalla
  - Un archivo del disco duro
  - Otro ordenador de la red

- La entrada/salida por consola se refiere a las operaciones de lectura de
  datos por el teclado y escritura por la pantalla.

- Las operaciones de entrada/salida se consideran **efectos laterales** porque
  producen cambios en el exterior o pueden hacer que el resultado de una
  función dependa de los datos leídos y, por tanto, no depender sólo de sus
  argumentos.

### `print`

- La función `print` imprime (*escribe*) por la salida (normalmente la
  pantalla) el valor de una o varias expresiones.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(print) ::= !T(print)!T{(}!NT{expresión}(!T(,) !NT{expresión})\*
                                [!T(, sep=)!NT(expresión)][!T(, end=)!NT(expresión)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El `sep` es el *separador* y su valor por defecto es `' '` (un espacio).

- El `end` es el *terminador* y su valor por defecto es `'\n'` (el carácter de
  nueva línea).

- Las expresiones se convierten en cadenas antes de imprimirse.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23)
  hola pepe 23
  ```

#### El valor `None`

- Es importante resaltar que la función `print` **no devuelve** el valor de
  las expresiones, sino que las **imprime** (provoca el efecto lateral de
  cambiar la pantalla haciendo que aparezcan nuevos caracteres).

- La función `print` como tal no devuelve ningún valor, pero como en Python
  todas las funciones devuelven *algún* valor, en realidad lo que ocurre es que
  **devuelve un valor `None`**.

- `None` es un valor especial que significa **ningún valor** y se utiliza
  principalmente para casos en los que no tiene sentido que una función
  devuelva un valor determinado, como es el caso de `print`.

- Pertenece a un tipo de datos especial llamado `NoneType` cuyo único valor
  posible es `None`, y para comprobar si un valor es `None` se usa !NT(valor)
  `is None`.
  
- Podemos comprobar que, efectivamente, `print` devuelve `None`:

  ```python
  >>> print('hola', 'pepe', 23) is None
  hola pepe 23  # ésto es lo que imprime print
  True          # ésto es el resultado de comprobar si el valor de print es None
  ```

### `input`

- La función `input` *lee* datos desde la entrada (normalmente el teclado) y
  devuelve el valor del dato introducido.

- Siempre devuelve una **cadena**.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(input) ::= !T(input)!T{(}[!NT(prompt)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> nombre = input('Introduce tu nombre: ')
  Introduce tu nombre: Ramón
  >>> print('Hola,', nombre)
  Hola, Ramón
  ```

- Provoca el *efecto lateral* de alterar el estado de la consola imprimiendo el
  *prompt* y esperando a que desde el exterior se introduzca el dato
  solicitado (que en cada ejecución podrá tener un valor distinto).

# Saltos

## Incondicionales

- Un **salto incondicional** es una ruptura abrupta del flujo de control del
  programa hacia otro punto del mismo.

- Se llama *incondicional* porque no depende de ninguna condición, es decir, se
  lleva a cabo **siempre** que se alcanza el punto del salto.

- Históricamente, a esa instrucción que realiza saltos incondicionales se la ha
  llamado **instrucción _GOTO_**.

- El uso de instrucciones _GOTO_ es considerado, en general, una mala práctica
  de programación ya que favorece la creación del llamado **código
  _espagueti_**: programas con una estructura de control tan complicada que
  resultan casi imposibles de mantener.

- En cambio, usados controladamente y de manera local, puede ayudar a escribir
  soluciones sencillas y claras.

---

- Python no incluye la instrucción *GOTO* pero se puede simular usando el
  módulo `with_goto` del paquete llamado `goto-statement`:

  ```console
  $ sudo apt install python3-pip
  $ python3 -m pip install goto-statement
  ```

!SALTO

:::: columns

::: {.column width=37%}

- Sintaxis:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(goto) ::= !T(goto) !NT(etiqueta)
!NT(label) ::= !T(label) !NT(etiqueta)
!NT(etiqueta) ::= !T(.)!NT(identificador)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=63%}

- Un ejemplo de uso:

```python
from goto import with_goto

CODIGO = """
print('Esto se hace')
goto .fin
print('Esto se salta')
label .fin
print('Aquí se acaba')
"""

exec(with_goto(compile(CODIGO, '', 'exec')))
```

:::

::::

## Condicionales

- Un **salto condicional** es un salto que se lleva a cabo sólo si se cumple
  una determinada condición.

- En Python, usando el módulo `with_goto`, podríamos implementarlo de la
  siguiente forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(salto_condicional) ::= !T(if) !NT(condición)!T(:) !T(goto) !NT(etiqueta)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ejemplo de uso:

  ```python
  from goto import with_goto

  CODIGO = """
  primero = 2
  ultimo = 25

  i = primero

  label .inicio
  if i == ultimo: goto .fin

  print(i, end=' ')
  i += 1
  goto .inicio

  label .fin
  """

  exec(with_goto(compile(CODIGO, '', 'exec')))
  ```

!BIBLIOGRAFIA
