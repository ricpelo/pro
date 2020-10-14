---
title: Programación funcional (I)
author: Ricardo Pérez López
!DATE
nocite: |
  @blanco_calculo_2009, @abelson_structure_1996, @van-roy_concepts_2004
---

# Modelo de ejecución

## Concepto

- Cuando escribimos programas (y algoritmos) nos interesa abstraernos del
  funcionamiento detallado de la máquina que va a ejecutar esos programas.

- Nos interesa buscar una *metáfora*, un símil de lo que significa ejecutar el
  programa.

- De la misma forma que un arquitecto crea modelos de los edificios que se
  pretenden construir, los programadores podemos usar modelos que *simulan* en
  esencia el comportamiento de nuestros programas.

- Esos modelos se denominan **modelos de ejecución**.

- Los modelos de ejecución nos permiten **razonar** sobre los programas sin
  tener que ejecutarlos.

---

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Modelo de ejecución:**

  Es una herramienta conceptual que permite a los programadores razonar sobre
  el funcionamiento de un programa sin tener que ejecutarlo directamente en el
  ordenador. 
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Podemos definir diferentes modelos de ejecución dependiendo, principalmente,
  de:

  - El paradigma de programación utilizado (ésto sobre todo).

  - El lenguaje de programación con el que escribamos el programa.

  - Los aspectos que queramos estudiar de nuestro programa.

## Modelo de sustitución

- En programación funcional, **un programa es una expresión** y lo que hacemos
  al ejecutarlo es **evaluar dicha expresión**, usando para ello las
  definiciones de operadores y funciones predefinidas por el lenguaje, así
  como las definidas por el programador en el código fuente del programa.

- Recordemos que la **evaluación de una expresión**, en esencia, es el proceso
  de **sustituir**, dentro de ella, unas *sub-expresiones* por otras que, de
  alguna manera, estén *más cerca* del valor a calcular, y así hasta calcular
  el valor de la expresión al completo.

- Por ello, la ejecución de un programa funcional se puede modelar como un
  **sistema de reescritura** al que llamaremos **modelo de sustitución**.

---

- La ventaja de este modelo es que no necesitamos recurrir a pensar que debajo
  de todo esto hay un ordenador con una determinada arquitectura *hardware*,
  que almacena los datos en celdas de la memoria principal, que ejecuta ciclos
  de instrucción en la CPU, que las instrucciones modifican los datos de la
  memoria, etc.
  
- Todo resulta mucho más fácil que eso, ya que **todo se reduce a evaluar
  expresiones**.

---

- Ya estudiamos que evaluar una expresión consiste en encontrar su forma normal.

- En programación funcional:

  - Los intérpretes alcanzan este objetivo a través de múltiples pasos de
    reducción de las expresiones para obtener otra equivalente más simple.

  - **Toda expresión posee un valor definido**, y ese valor no depende del
    orden en el que se evalúe.

  - El significado de una expresión es su valor, y no puede ocurrir ningún
    otro efecto, ya sea oculto o no, en ninguna operación que se utilice para
    calcularlo.

## Transparencia referencial

- En programación funcional, el valor de una expresión depende, exclusivamente,
  de los valores de sus sub-expresiones constituyentes.

- Dichas sub-expresiones, además, pueden ser sustituidas libremente por otras
  que tengan el mismo valor.

- A esta propiedad se la denomina **transparencia referencial**.

- En la práctica, eso significa que la evaluación de una expresión no puede
  provocar **efectos laterales**.

- Formalmente, se puede definir así:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~
  **Transparencia referencial:**

  Si $p = q$, entonces $f(p) = f(q)$.
  ~~~~~~~~~~~~~~~~~~~~~~~~

# Tipos de datos

## Concepto

- Los datos que comparten características y propiedades se agrupan en
  **conjuntos**.

- Asimismo, sobre cada conjunto de valores se definen una serie de
  **operaciones**, que son aquellas que tiene sentido realizar con esos
  valores.

- Un **tipo de datos** define un conjunto de **valores** y el conjunto de
  **operaciones** válidas que se pueden realizar sobre dichos valores.

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Tipo de un dato:**

  Es una característica del dato que indica el conjunto de *valores* al que
  pertenece y las *operaciones* que se pueden realizar sobre él.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El **tipo de una expresión** es el tipo del valor resultante de evaluar dicha
  expresión.

---

- Los tipos de un lenguaje de programación tienen un nombre (un
  _identificador_) que los representa.

- Ejemplos en Python:

  - El tipo `int` define el conjunto de los **números enteros**, sobre los que
    se pueden realizar, entre otras, las operaciones aritméticas.

    Se corresponde *más o menos* con el símbolo matemático $\mathbb{Z}$, que ya
    hemos usado antes y que representa el conjunto de los números enteros en
    Matemáticas. (¿Por qué «*más o menos*»?)

  - El tipo `float` define el conjunto de los **números reales**, sobre los que
    se pueden realizar también operaciones aritméticas.

    Se corresponde *más o menos* con el símbolo matemático $\mathbb{R}$, que
    representa el conjunto de los números reales en Matemáticas.

  - El tipo `str` define el conjunto de las **cadenas**, sobre las que se
    pueden realizar otras operaciones (la *concatenación*, la *repetición*,
    etc.).

¿Por qué decimos «*más o menos*»?

## `type`

- La función `type` devuelve el tipo de un valor:

  ```python
  >>> type(3)
  <class 'int'>
  >>> type(3.0)
  <class 'float'>
  >>> type('hola')
  <class 'str'>
  ```

- Es muy útil para saber el tipo de una expresión compleja:

  ```python
  >>> type(3 + 4.5 ** 2)
  <class 'float'>
  ```

## Sistema de tipos

- El **sistema de tipos** de un lenguaje es el conjunto de reglas que asigna un
  tipo a cada elemento del programa.

- Exceptuando a los lenguajes **no tipados** (Ensamblador, código máquina,
  Forth...) todos los lenguajes tienen su propio sistema de tipos, con sus
  características.

- El sistema de tipos de un lenguaje depende también del paradigma de
  programación que soporte el lenguaje. Por ejemplo, en los lenguajes
  **orientados a objetos**, el sistema de tipos se construye a partir de los
  conceptos propios de la orientación a objetos (*clases*, *interfaces*...).

### Errores de tipos

- Cuando se intenta realizar una operación sobre un dato cuyo tipo no admite
  esa operación, se produce un **error de tipos**.
  
- Ese error puede ocurrir cuando:

  - Los operandos de un operador no pertenecen al tipo que el operador necesita
    (ese operador no está definido sobre datos de ese tipo).

  - Los argumentos de una función o método no son del tipo esperado.

- Por ejemplo:

  ```python
  4 + "hola"
  ```

  es incorrecto porque el operador `+` no está definido sobre un entero y una
  cadena (no se pueden sumar un número y una cadena).

---

- En caso de que exista un error de tipos, lo que ocurre dependerá de si
  estamos usando un lenguaje interpretado o compilado:

  - Si el lenguaje es **interpretado** (Python):
  
    El error se localizará **durante la ejecución** del programa y el
    intérprete mostrará un mensaje de error advirtiendo del mismo en el momento
    justo en que la ejecución alcance la línea de código errónea, para acto
    seguido finalizar la ejecución del programa.

  - Si el lenguaje es **compilado** (Java):

    Es muy probable que el comprobador de tipos del compilador detecte el error
    de tipos **durante la compilación** del programa, es decir, antes incluso
    de ejecutarlo. En tal caso, se abortará la compilación para impedir la
    generación de código objeto erróneo.

### Tipado fuerte vs. débil

- Un lenguaje de programación es **fuertemente tipado** (o de **tipado
  fuerte**) si no se permiten violaciones de los tipos de datos.

- Es decir, un valor de un tipo concreto no se puede usar como si fuera de otro
  tipo distinto a menos que se haga una *conversión explícita*.

- Un lenguaje es **débilmente tipado** (o de **tipado débil**) si no es de
  tipado fuerte.

- En los lenguajes de tipado débil se pueden hacer operaciones entre datos cuyo
  tipos no son los que espera la operación, gracias al mecanismo de *conversión
  implícita*.

---

- Existen dos mecanismos de conversión de tipos:

  - **Conversión implícita o _coerción_**: cuando el intérprete convierte un
    valor de un tipo a otro sin que el programador lo haya solicitado
    expresamente.

  - **Conversión explícita o _casting_**: cuando el programador solicita
    expresamente la conversión de un valor de un tipo a otro usando alguna
    construcción u operación del lenguaje.

- Los lenguajes de tipado fuerte no realizan conversiones implícitas de tipos
  salvo excepciones muy concretas (por ejemplo, conversiones entre enteros y
  reales en expresiones aritméticas).

- Los lenguajes de tipado débil se caracterizan, precisamente, por realizar
  conversiones implícitas cuando, en una expresión, el tipo de un valor no se
  corresponde con el tipo necesario.

---

- Ejemplo:

  - Python es un lenguaje **fuertemente tipado**, por lo que no podemos hacer
    lo siguiente (da un error de tipos):

    ```python
    2 + "3"
    ```

  - En cambio, PHP es un lenguaje **débilmente tipado** y la expresión anterior
    en PHP es perfectamente válida (y vale **5**).

    El motivo es que el sistema de tipos de PHP convierte *implícitamente* la
    cadena `"3"` en el entero `3` cuando se usa en una operación de suma (`+`).

## Tipos de datos básicos

### Números

- Hay dos tipos numéricos básicos en Python: los enteros y los reales.

  - Los **enteros** se representan con el tipo `int`.

    Sólo contienen parte entera, y sus literales se escriben con dígitos sin
    punto decimal (ej: `13`).

  - Los **reales** se representan con el tipo `float`.

    Contienen parte entera y parte fraccionaria, y sus literales se escriben
    con dígitos y con punto decimal separando ambas partes (ej: `4.87`). Los
    números en notación exponencial (`2e3`) también son reales ($2e3 =
    2.0\times10^3$).

- Las **operaciones** que se pueden realizar con los números son los que cabría
  esperar (aritméticas, trigonométricas, matemáticas en general).

---

- Los enteros y los reales generalmente se pueden combinar en una misma
  expresión aritmética y suele resultar en un valor real, ya que se considera
  que los reales *contienen* a los enteros.

  - Ejemplo: `4 + 3.5` devuelve `7.5`.

- Por ello, y aunque el lenguaje sea de tipado fuerte, se permite la conversión
  implícita entre datos de tipo `int` y `float` dentro de una misma expresión
  para realizar las operaciones correspondientes.

- En el ejemplo anterior, el valor entero `4` se convierte implícitamente en el
  real `4.0` debido a que el otro operando de la suma es un valor real (`3.5`).
  Finalmente, se obtiene un valor real (`7.5`).

### Cadenas

- Las **cadenas** son secuencias de cero o más caracteres codificados en
  Unicode.

- En Python se representan con el tipo `str`.

  - No existe el tipo *carácter* en Python. Un carácter en Python es
    simplemente una cadena que contiene un solo carácter.

- Un literal de tipo cadena se escribe encerrando sus caracteres entre comillas
  simples (`'`) o dobles (`"`).

  - No hay ninguna diferencia entre usar unas comillas u otras, pero si una
    cadena comienza con comillas simples, debe acabar también con comillas
    simples (y viceversa).

- Ejemplos:

  `"hola"`

  `'Manolo'`

  `"27"`

---

- También se pueden escribir literales de tipo cadena encerrándolos entre
  triples comillas (`'''` o `"""`).

  Estos literales se usan para escribir cadenas formadas por varias líneas.
  La sintaxis de las triples comillas respeta los saltos de línea. Por ejemplo:

  ```python
  >>> """Bienvenido
  ... a
  ... Python"""
  'Bienvenido\na\nPython'  # el carácter \n representa un salto de línea
  ```

- No es lo mismo `27` que `"27"`.

  - `27` es un número entero (un literal de tipo `int`).

  - `"27"` es una cadena (un literal de tipo `str`).

- Una **cadena vacía** es aquella que no contiene ningún carácter. Se
  representa con los literales `''`, `""`, `''''''` o `""""""`.

### Funciones

- En programación funcional, **las funciones también son datos**:

  ```python
  >>> type(max)
  <class 'builtin_function_or_method'>
  ```

- La **única operación** que se puede realizar sobre una función es
  **llamarla**, que sintácticamente se representa poniendo paréntesis `(` `)`
  justo a continuación de la función.

  Dentro de los paréntesis se ponen los argumentos que se aplican a la función
  en esa llamada.

- Por tanto, `max` es la función en sí (un **valor** de tipo _función_) , y
  `max(3, 4)` es una llamada a la función `max` con los argumentos `3` y `4`
  (una **operación** realizada sobre la función).

  ```python
  >>> max                   # la función max
  <built-in function max>
  >>> max(3, 4)             # la llamada a max con los argumentos 3 y 4
  4
  ```

- Recordemos que **las funciones no tienen expresión canónica**, por lo que el
  intérprete no intentará nunca visualizar un valor de tipo función.

## Conversión de tipos

- Hemos visto que en Python las conversiones de tipos deben ser **explícitas**,
  es decir, que debemos indicar en todo momento qué dato queremos convertir a
  qué tipo.

- Para ello existen funciones cuyo nombre coincide con el tipo al que queremos
  convertir el dato: `str`, `int` y `float`, entre otras.

  ```python
  >>> 4 + '24'
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  TypeError: unsupported operand type(s) for +: 'int' and 'str'
  >>> 4 + int('24')
  28
  ```

- Convertir un dato a cadena suele funcionar siempre, pero convertir una cadena
  a otro tipo de dato puede fallar dependiendo del contenido de la cadena:

  ```python
  >>> int('hola')
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  ValueError: invalid literal for int() with base 10: 'hola'
  ```

# Álgebra de Boole

## El tipo de dato *booleano*

- Un dato **lógico** o *booleano* es aquel que puede tomar uno de dos posibles
  valores, que se denotan normalmente como **verdadero** y **falso**.

- Esos dos valores tratan de representar los dos valores de verdad de la
  **lógica** y el **álgebra _booleana_**.

- Su nombre proviene de **George Boole**, matemático que definió por primera
  vez un sistema algebraico para la lógica a mediados del S. XIX.

- En Python, el tipo de dato lógico se representa como `bool` y sus posibles
  valores son `False` y `True` (con la inicial en mayúscula).

- Esos dos valores son *formas especiales* para los enteros `0` y `1`,
  respectivamente.

## Operadores relacionales

- Los **operadores relacionales** son operadores que toman dos operandos (que
  usualmente deben ser del mismo tipo) y devuelven un valor *booleano*.

- Los más conocidos son los **operadores de comparación**, que sirven para
  comprobar si un dato es menor, mayor o igual que otro, según un orden
  preestablecido.

- Los operadores de comparación que existen en Python son:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  `<   >   <=   >=   ==   !=`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

:::: columns

::: column

```python
>>> 4 == 3
False
>>> 5 == 5
True
>>> 3 < 9
True
```

:::

::: column

```python
>>> 9 != 7
True
>>> False == True
False
>>> 8 <= 8
True
```

:::

::::

## Operadores lógicos

- Las **operaciones lógicas** se representan mediante **operadores lógicos**,
  que son aquellos que toman uno o dos operandos *booleanos* y devuelven un
  valor *booleano*.

- Las operaciones básicas del álgebra de Boole se llaman **suma**, **producto**
  y **complemento**.

- En **lógica proposicional** (un tipo de lógica matemática que tiene
  estructura de álgebra de Boole), se llaman:
  
    Operación      Operador
  --------------- ----------
    Disyunción     $\lor$
    Conjunción     $\land$
    Negación       $\neg$

- En Python se representan como `or`, `and` y `not`, respectivamente.

### Tablas de verdad

- Una **tabla de verdad** es una tabla que muestra el valor lógico de una
  expresión compuesta, para cada uno de los valores lógicos que puedan tomar
  sus componentes.

- Se usan para definir el significado de las operaciones lógicas y también para
  verificar que se cumplen determinadas propiedades.

- Las tablas de verdad de los operadores lógicos son:

:::: columns

::: {.column width=33%}

\begingroup
\setlength{\extrarowheight}{0pt}

 $A$   $B$   $A\lor{}B$
----- ----- ------------
 $F$   $F$      $F$
 $F$   $V$      $V$
 $V$   $F$      $V$
 $V$   $V$      $V$

\endgroup

:::

::: {.column width=33%}

\begingroup
\setlength{\extrarowheight}{0pt}

 $A$   $B$   $A\land{}B$
----- ----- -------------
 $F$   $F$      $F$
 $F$   $V$      $F$
 $V$   $F$      $F$
 $V$   $V$      $V$

\endgroup

:::

::: {.column width=33%}

\begingroup
\setlength{\extrarowheight}{0pt}

 $A$   $\neg{}A$
----- -----------
 $F$      $V$
 $V$      $F$

\endgroup

:::

::::

---

- Que traducido a Python sería:

  !SALTO

:::: columns

::: column

\begingroup
\setlength{\extrarowheight}{0pt}

|   `A`   |   `B`   |  `A or B`  |
|:-------:|:-------:|:----------:|
| `False` | `False` |   `False`  |
| `False` |  `True` |    `True`  |
|  `True` | `False` |    `True`  |
|  `True` |  `True` |    `True`  |

\endgroup

:::

::: column

\begingroup
\setlength{\extrarowheight}{0pt}

|   `A`   |   `B`   |  `A and B`  |
|:-------:|:-------:|:-----------:|
| `False` | `False` |   `False`   |
| `False` |  `True` |   `False`   |
|  `True` | `False` |   `False`   |
|  `True` |  `True` |    `True`   |

\endgroup

:::

::::

!SALTOLARGO

\begingroup
\setlength{\extrarowheight}{0pt}

|   `A`   |  `not A`  |
|:-------:|:---------:|
| `False` |   `True`  |
|  `True` |  `False`  |

\endgroup

## Axiomas

1. Ley asociativa:
   $\begin{cases}
    \forall a,b,c \in \mathfrak{B}: (a \lor b) \lor c = a \lor (b \lor c) \\
    \forall a,b,c \in \mathfrak{B}: (a \land b) \land c = a \land (b \land c)
    \end{cases}$

2. Ley conmutativa:
   $\begin{cases}
    \forall a,b \in \mathfrak{B}: a \lor b = b \lor a \\
    \forall a,b \in \mathfrak{B}: a \land b = b \land a
    \end{cases}$

3. Ley distributiva:
   $\begin{cases}
    \forall a,b,c \in \mathfrak{B}: a \lor (b \land c) = (a \lor b) \land (a \lor c) \\
    \forall a,b,c \in \mathfrak{B}: a \land (b \lor c) = (a \land b) \lor (a \land c)
    \end{cases}$

4. Elemento neutro:
   $\begin{cases}
    \forall a \in \mathfrak{B}: a \lor F = a \\
    \forall a \in \mathfrak{B}: a \land V = a
    \end{cases}$

5. Elemento complementario:
   $\begin{cases}
    \forall a \in \mathfrak{B}; \exists \lnot a \in \mathfrak{B}: a \lor \lnot a = V \\
    \forall a \in \mathfrak{B}; \exists \lnot a \in \mathfrak{B}: a \land \lnot a = F
    \end{cases}$

Luego $(\mathfrak{B},\lnot,\lor,\land)$ es un álgebra de Boole.

### Traducción a Python

:::: columns

::: {.column width=60%}

1. Ley asociativa:
   ```python
   (a or b) or c == a or (b or c)
   (a and b) and c == a and (b and c)
   ```

2. Ley conmutativa:
   ```python
   a or b == b or a
   a and b == b and a
   ```

3. Ley distributiva:
   ```python
   a or (b and c) == (a or b) and (a or c)
   a and (b or c) == (a and b) or (a and c)
   ```

:::

::: {.column width=40%}

4. Elemento neutro:
   ```python
   a or False == a
   a and True == a
   ```

5. Elemento complementario:
   ```python
   a or (not a) == True
   a and (not a) == False
   ```

:::

::::

## Teoremas fundamentales

6. Ley de idempotencia:
   $\begin{cases}
    \forall a \in \mathfrak{B}: a \lor a = a \\
    \forall a \in \mathfrak{B}: a \land a = a
    \end{cases}$

7. Ley de absorción:
   $\begin{cases}
    \forall a \in \mathfrak{B}: a \lor V = V \\
    \forall a \in \mathfrak{B}: a \land F = F
    \end{cases}$

8. Ley de identidad:
   $\begin{cases}
    \forall a \in \mathfrak{B}: a \lor F = a \\
    \forall a \in \mathfrak{B}: a \land V = a
    \end{cases}$

9. Ley de involución:
   $\begin{cases}
    \forall a \in \mathfrak{B}: \lnot \lnot a = a \\
    \lnot V = F \\
    \lnot F = V
    \end{cases}$

10. Leyes de De Morgan:
    $\begin{cases}
     \forall a,b \in \mathfrak{B}: \lnot ({a \lor b}) = \lnot a \land \lnot b \\
     \forall a,b \in \mathfrak{B}: \lnot ({a \land b}) = \lnot a \lor \lnot b
     \end{cases}$

### Traducción a Python

:::: columns

::: column

6. Ley de idempotencia:
   ```python
   a or a == a
   a and a == a
   ```
7. Ley de absorción:
   ```python
   a or True == True
   a and False == False
   ```
8. Ley de identidad:
   ```python
   a or False == a
   a and True == a
   ```

:::

::: column

9. Ley de involución:
   ```python
   not (not a) == a
   not True == False
   not False == True
   ```
#. Leyes de De Morgan:
   ```python
   not (a or b) == (not a) and (not b)
   not (a and b) == (not a) or (not b)
   ```

:::

::::

## El operador ternario

- Las expresiones lógicas (o *booleanas*) se pueden usar para comprobar si se
  cumple una determinada **condición**.

- Las condiciones en un lenguaje de programación se representan mediante
  expresiones lógicas cuyo valor (*verdadero* o *falso*) indica si la condición
  se cumple o no se cumple.

- Con el **operador ternario** podemos hacer que el resultado de una expresión
  varíe entre dos posibles opciones dependiendo de si se cumple o no una
  condición.

- El operador ternario se llama así porque es el único operador en Python que
  actúa sobre tres operandos.

---

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expr_condicional) ::= !NT(valor_si_cierto) !T(if) !NT(condición) !T(else) !NT(valor_si_falso)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde:

  - !NT(condición) debe ser una expresión lógica

  - !NT(valor_si_cierto) y !NT(valor_si_falso) pueden ser expresiones de
    cualquier tipo

- El valor de la expresión completa será !NT(valor_si_cierto) si la
  !NT(condición) es cierta; en caso contrario, su valor será
  !NT(valor_si_falso).

- Ejemplo:

  ```python
  25 if 3 > 2 else 17
  ```

  evalúa a `25`.

!EJERCICIO

@. ¿Cuál es la asociatividad del operador ternario? Demostrarlo.

# Definiciones

## Introducción

- Introduciremos ahora en nuestro lenguaje una nueva instrucción (técnicamente
  es una **sentencia**) con la que vamos a poder hacer **definiciones**.

- A esa sentencia la llamaremos **definición**, y expresa el hecho de que **un
  _nombre_ representa un _valor_**.

- Las definiciones tienen la siguiente sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(definición) ::= !NT(identificador) !T(=) !NT(expresión)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  x = 25
  ```

  A partir de ese momento, el identificador `x` representa el valor `25`.

  Y si `x` vale `25`, la expresión `2 + x * 3` vale `77`.

## Identificadores y ligaduras (*binding*)

- Los **identificadores** son los nombres o símbolos que representan a los
  elementos del lenguaje.

- Cuando hacemos una definición, lo que hacemos es asociar un identificador con
  un valor.

- Esa asociación se denomina **ligadura** (o **_binding_**).

- Por esa razón, también se dice que una definición es una ligadura.

- También decimos que el identificador está **ligado** (**_bound_**).

!DOT(ligadura.svg)()(width=30%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
25 [shape = circle]
x [shape = plaintext, fillcolor = transparent]
x -> 25
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- En un **lenguaje funcional puro**, un identificador ya ligado no se puede
  ligar a otro valor. Por ejemplo, lo siguiente daría un error:

  ```python
  x = 4  # ligamos el identificador x al valor 4
  x = 7  # intentamos ligar x al valor 7, pero ya está ligado al valor 4
  ```

!DOT(rebinding.svg)()(width=25%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
4 [shape = circle]
7 [shape = circle]
x [shape = plaintext, fillcolor = transparent]
x -> 4 [style = dashed, color = grey]
x -> 7
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Python no es un lenguaje funcional puro, por lo que sí se permite volver a
  ligar el mismo identificador a otro valor distinto (situación que se denomina
  **_rebinding_**).

  - Eso hace que se pierda el valor anterior.

  - Por ahora, **no lo hagamos**.

---

- Podemos hacer:

  ```python
  x = 25
  y = x
  ```

- En este caso estamos ligando a `y` el mismo valor que tiene `x`.

- Lo que hace el intérprete en este caso no es crear dos valores `25` en
  memoria (sería un gasto inútil), sino que `x` e `y` _comparten_ el único
  valor `25` que existe:

  !DOT(ligadura-compartida.svg)()(width=25%)(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  25 [shape = circle]
  x [shape = plaintext, fillcolor = transparent]
  y [shape = plaintext, fillcolor = transparent]
  x -> 25
  y -> 25
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto:

  ```python
  >>> x = 25
  >>> y = x
  >>> y
  25
  ```

---

- El **nombre** de una **función** es un identificador que está ligado a la
  función correspondiente (que en programación funcional es un valor como
  cualquier otro).

- Por ejemplo, `max` es un identificador ligado a la función que devuelve el
  máximo de dos números (que representaremos aquí como **λ**):

  !DOT(ligadura-funcion-max.svg)()(width=25%)(width=15%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  lambda [shape = circle, label = "λ"]
  max [shape = plaintext, fillcolor = transparent]
  max -> lambda
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Ese valor se puede ligar a otro identificador y, de esta forma, ambos
  identificadores compartirían el mismo valor y, por tanto, representarían a la
  misma función. Por ejemplo:

:::: columns

::: column

```python
>>> maximo = max
>>> maximo(3, 4)
4
```

:::

::: column

!DOT(ligadura-funcion-max-maximo.svg)()(width=55%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
lambda [shape = circle, label = "λ"]
max [shape = plaintext, fillcolor = transparent]
maximo [shape = plaintext, fillcolor = transparent]
max -> lambda
maximo -> lambda
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Reglas léxicas

- Cuando hacemos una definición debemos tener en cuenta ciertas cuestiones
  relativas al identificador:

  - ¿Cuál es la **longitud máxima** de un identificador?

  - ¿Qué **caracteres** se pueden usar?

  - ¿Se distinguen **mayúsculas** de **minúsculas**?

  - ¿Coincide con una palabra clave o reservada?

    - **Palabra clave**: palabra que forma parte de la sintaxis del lenguaje.

    - **Palabra reservada**: palabra que no puede emplearse como identificador.

### Tipo de un identificador

- Cuando un identificador está ligado a un valor, a efectos prácticos el
  identificador actúa como si fuera el valor.

- Como cada valor tiene un tipo de dato asociado, también podemos hablar del
  **tipo de un identificador**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de un identificador** es el tipo del dato con el que está ligado.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si un identificador no está ligado, no tiene sentido preguntarse qué tipo de
  dato tiene.

## Evaluación de expresiones con ligaduras

- Podemos usar un identificador ligado dentro de una expresión (siempre que la
  expresión sea una expresión válida según las reglas del lenguaje, claro
  está).

- El identificador representa a su valor ligado y se evalúa a dicho valor en
  cualquier expresión donde aparezca el identificador:

  ```python
  >>> x = 25
  >>> 2 + x * 3
  77
  ```

- Intentar usar en una expresión un identificador no ligado provoca un error
  (*nombre no definido*):

  ```python
  >>> y
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'y' is not defined
  ```

## Marcos (*frames*)

- Un **marco** (del inglés *frame*) es un **conjunto de ligaduras**.

- Las ligaduras se almacenan en marcos.

- En un marco, un identificador sólo puede tener como máximo una ligadura. En
  cambio, **el mismo identificador puede estar ligado a diferentes valores en
  diferentes marcos**.

- Los marcos son conceptos **_dinámicos_**:

  - Se crean en memoria cuando la ejecución del programa entra en ciertas
    partes del mismo y se destruyen cuando sale.

  - Van incorporando nuevas ligaduras a medida que se van ejecutando nuevas
    instrucciones.

- El **marco global** es un marco que siempre existe en cualquier punto del
  programa y contiene las ligaduras definidas fuera de cualquier construcción o
  estructura del mismo.

  - Por ahora es el único marco que existe para nosotros.

---

- En un momento dado, un marco contendrá las ligaduras que se hayan definido
  hasta ese momento en el *ámbito* asociado a ese marco:

  ```{.python .number-lines}
  >>> x
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  >>> x = 25
  >>> x
  25
  ```

  - Aquí estamos trabajando con el *marco global* (el único que existe hasta
    ahora para nosotros).

  - En la línea 1, el identificador `x` aún no está ligado, por lo que su uso
    genera un error (el marco global no contiene hasta ahora ninguna ligadura
    para `x`).

  - En la línea 6, en cambio, el identificador puede usarse sin error ya que ha
    sido ligado previamente en la línea 5 (el marco global ahora contiene una
    ligadura para `x` con el valor 25).

---

- Los marcos se van creando y destruyendo durante la ejecución del programa, y
  su contenido (las ligaduras) también va cambiando con el tiempo, a medida que
  se van ejecutando sus instrucciones.

:::: columns

::: column

- Si tenemos:

  ```{.python .number-lines}
  >>> x = 4
  >>> y = 3
  >>> z = y
  ```

  Según la línea hasta donde hayamos ejecutado, el marco global contendrá lo
  siguiente:

&nbsp; 

!DOT(marco-linea1.svg)(Marco global en la línea 1)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
}
x -> 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(marco-linea2.svg)(Marco global en la línea 2)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 [shape = circle]
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
}
x -> 4
y -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

&nbsp; 

!DOT(marco-linea3.svg)(Marco global en la línea 3)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 [shape = circle]
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
    z [shape = plaintext, fillcolor = transparent]
}
x -> 4
y -> 3
z -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Hemos visto que una ligadura es una asociación entre un identificador y un
  valor.

- **Los marcos almacenan ligaduras, pero _NO_ almacenan los valores** a los que
  están asociados los identificadores de esas ligaduras.

- Por eso hemos dibujado a los valores fuera de los marcos en los diagramas
  anteriores.

- Los valores se almacenan en una zona de la memoria del intérprete conocida
  como el **montículo**.

- Asimismo, los marcos se almacenan en otra zona de la memoria conocida como
  la **pila de control**, la cual estudiaremos mejor más adelante.

## Entorno (*environment*)

- El entorno es una extensión del concepto de *marco*.

- Un **entorno** (del inglés, *environment*) es una **secuencia o cadena de
  marcos** que contienen todas las ligaduras válidas en un momento concreto de
  la ejecución del programa.

- Es decir, el entorno nos dice **qué identificadores son _accesibles_ en un
  momento dado, y con qué valores están ligados**.

- El entorno, por tanto, es un concepto **_dinámico_** que depende del momento
  en el que se calcule, es decir, de por dónde va la ejecución del programa o,
  lo que es lo mismo, de qué instrucciones se han ejecutado hasta ahora.

---

- Ya hemos visto que, durante la ejecución del programa, se van creando y
  destruyendo marcos a medida que la ejecución va entrando y saliendo de
  ciertas partes del programa.

- **Según se van creando en memoria, esos marcos van enlazándose unos con
  otros** creando la secuencia de marcos que forman el entorno.

- Por tanto, en un momento dado, el entorno contendrá más o menos marcos
  dependiendo de por dónde haya pasado la ejecución del programa hasta ese
  momento.

- El entorno **siempre contendrá**, al menos, un marco: el *marco global*.

- **El marco global siempre será el último de la cadena de marcos** que forman
  el entorno.

- Como por ahora sólo tenemos ese marco, nuestro entorno sólo contendrá un
  único marco. Por tanto, el entorno coincidirá con el marco global.

- La cosa cambiará en cuanto empecemos a crear funciones.

## *Scripts*

- Cuando tenemos varias definiciones o muy largas resulta tedioso tener que
  introducirlas una y otra vez en el intérprete interactivo.

- Lo más cómodo es teclearlas juntas dentro un archivo que luego cargaremos
  desde dentro del intérprete.

- Ese archivo se llama **_script_** y, por ahora, contendrá una lista de las
  definiciones que nos interese usar en nuestras sesiones interactivas con el
  intérprete.

- Los nombres de archivo de los *scripts* en Python llevan extensión `.py`.

- Para cargar un *script* en nuestra sesión usamos la orden `from`. Por
  ejemplo, para cargar un *script* llamado `definiciones.py`, usaremos:

  ```python
  from definiciones import *
  ```

## Ámbitos

- Existen ciertas construcciones sintácticas que, cuando se ejecutan, provocan
  la creación de nuevos marcos.

- Cuando eso ocurre, decimos que la construcción sintáctica define un
  **ámbito**, y que el ámbito viene definido por la porción de texto que ocupa
  esa construcción sintáctica dentro del programa.

- Durante la ejecución del programa, se creará un nuevo marco cuando se entre
  en el ámbito (es decir, cuando se entre en su construcción sintática
  correspondiente) y se destruirá cuando se salga del ámbito.

- Los ámbitos **se anidan recursivamente**, o sea, que están contenidos unos
  dentro de otros.

- El **ámbito actual** es el ámbito más interno en el que se encuentra la
  porción de código que se está ejecutando actualmente.

---

- El concepto de *ámbito* es un concepto nada trivial y, a medida que vayamos
  incorporando nuevos elementos al lenguaje, tendremos que ir adaptándolo para
  tener en cuenta más condicionantes.

- Por ahora sólo tenemos un ámbito que abarca todo el *script* que se está
  ejecutando (o la sesión actual si estamos en el intérprete interactivo).

- A ese ámbito se le llama **ámbito global** y es el que crea el **marco
  global**.

- Es decir: el intérprete crea el marco global cuando empieza a ejecutar el
  *script* (o cuando inicia una nueva sesión con el intérprete interactivo) y
  lo asocia al ámbito global.

### Ámbito de una ligadura

- El **ámbito de una ligadura** es el ámbito en el que dicha ligadura tiene
  validez.

- Hasta ahora, todas las ligaduras las hemos definido en el ámbito global, por
  lo que se almacenan en el marco global.

- Por eso también decimos que esas ligaduras tienen ámbito global, o que
  pertenecen al ámbito global, o que están definidas en el ámbito global, o que
  son **globales**.

# Documentación interna

## Identificadores significativos

- Se recomienda usar identificadores descriptivos.

  Es mejor usar:

  ```python
  ancho = 640
  alto = 400
  superficie = ancho * alto
  ```

  que

  ```python
  x = 640
  y = 400
  z = x * y
  ```

  aunque ambos programas sean equivalentes en cuanto al efecto que producen y
  el resultado que generan.

- Si el identificador representa varias palabras, se puede usar el carácter de
  guión bajo (`_`) para separarlas y formar un único identificador:

  ```python
  altura_triangulo = 34.2
  ```

## Comentarios

- Los comentarios en Python empiezan con el carácter `#` y se extienden hasta
  el final de la línea.

- Los comentarios pueden aparecer al comienzo de la línea o a continuación de
  un espacio en blanco o una porción de código.

- Los comentarios no pueden ir dentro de un literal de tipo cadena.

  Un carácter `#` dentro de un literal cadena es sólo un carácter más.

  ```python
  # este es el primer comentario
  spam = 1  # y este es el segundo comentario
            # ... y este es el tercero
  texto = "# Esto no es un comentario porque va entre comillas."
  ```

---

- Cuando un comentario ocupa varias líneas, se puede usar el «truco» de poner
  una cadena con triples comillas:

  ```python
  x = 1
  """
  Esta es una cadena
  que ocupa varias líneas
  y que actúa como comentario.
  """
  y = 2
  ```

- Python evaluará la cadena pero, al no usarse dentro de ninguna expresión ni
  ligarse a ningún identificador, simplementa la ignorará (como un comentario).

!BIBLIOGRAFIA
