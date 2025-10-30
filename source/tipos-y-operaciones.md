---
title: Tipos y operaciones
author: Ricardo Pérez López
!DATE
nocite: |
  @blanco_calculo_2009, @abelson_structure_1996, @van-roy_concepts_2004
---

# Sistemas de tipos

## Concepto

- Un **tipo (o tipo de datos)** es un conjunto de **valores** y de
  **operaciones** que se pueden realizar sobre esos valores.

- El **sistema de tipos** de un lenguaje es el conjunto de reglas que asigna un
  tipo a cada elemento del programa.

- Exceptuando a los lenguajes **no tipados** (Ensamblador, código máquina,
  Forth...) todos los lenguajes tienen su propio sistema de tipos, con sus
  características.

- El sistema de tipos de un lenguaje depende también del paradigma de
  programación que soporte el lenguaje. Por ejemplo, en los lenguajes
  **orientados a objetos**, el sistema de tipos se construye a partir de los
  conceptos propios de la orientación a objetos (*clases*, *interfaces*...).

## Errores de tipos

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

## Tipado fuerte vs. débil

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
    en PHP es perfectamente válida (y vale **cinco**).

    El motivo es que el sistema de tipos de PHP convierte *implícitamente* la
    cadena !PYTHON("3") en el entero !PYTHON(3) cuando se usa en una operación
    de suma (`+`).

- Es importante entender que **la conversión de tipos no modifica el dato
  original**, sino que devuelve un nuevo dato a partir del dato original pero
  con el tipo cambiado.

## La función `type`

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

---

- Recordando lo que dijimos anteriormente, la conversión de tipos no modifica
  el dato original, sino que devuelve un nuevo dato a partir del dato original
  pero con el tipo cambiado.

- Las funciones de conversión de tipos hacen precisamente eso: devuelven un
  nuevo dato con un determinado tipo a partir del dato original que reciben
  como argumento.

- Por tanto, la expresión !PYTHON(int('24')) devuelve el entero !PYTHON(24)
  pero no cambia en modo alguno la cadena !PYTHON('24') que ha recibido como
  argumento.

## Tipos de datos básicos

- Los tipos de datos básicos que empezaremos a estudiar en Python son:

!SALTO

  $$\text{Tipos básicos}\begin{cases}
    \text{Números}\begin{cases}
      \text{Enteros} \\
      \text{Reales}
    \end{cases} \\
    \text{Cadenas} \\
    \text{Funciones} \\
    \text{Lógicos (o \textit{booleanos})}
  \end{cases}$$

# Números

## Los tipos `int` y `float`

- Hay dos tipos numéricos básicos en Python: los enteros y los reales.

  - Los **enteros** se representan con el tipo `int`.

    Sólo contienen parte entera, y sus literales se escriben con dígitos sin
    punto decimal (ej: !PYTHON(13)).

  - Los **reales** se representan con el tipo `float`.

    Contienen parte entera y parte fraccionaria, y sus literales se escriben
    con dígitos y con punto decimal separando ambas partes (ej: !PYTHON(4.87)).
    Los números en notación exponencial (!PYTHON(2e3)) también son reales ($2e3
    = 2.0\times10^3$).

- Las **operaciones** que se pueden realizar con los números son los que cabría
  esperar (aritméticas, trigonométricas, matemáticas en general).

---

- Los enteros y los reales generalmente se pueden combinar en una misma
  expresión aritmética y suele resultar en un valor real, ya que se considera
  que los reales *contienen* a los enteros.

  - Ejemplo: !PYTHON(4 + 3.5) devuelve !PYTHON(7.5).

- Por ello, y aunque el lenguaje sea de tipado fuerte, se permite la conversión
  implícita entre datos de tipo `int` y `float` dentro de una misma expresión
  para realizar las operaciones correspondientes.

- En el ejemplo anterior, el valor entero !PYTHON(4) se convierte
  implícitamente en el real !PYTHON(4.0) debido a que el otro operando de la
  suma es un valor real (!PYTHON(3.5)). Finalmente, se obtiene un valor real
  (!PYTHON(7.5)).

### Operadores aritméticos

--------------------------------------------------------------------------------------------
 Operador  Descripción           Ejemplo           Resultado          Comentarios
---------- ------------------ ------------------- ------------------- ----------------------
   `+`     Suma                !PYTHON(3 + 4)      !PYTHON(7)

   `-`     Resta               !PYTHON(3 - 4)      !PYTHON(-1)

   `*`     Producto            !PYTHON(3 * 4)      !PYTHON(12)

   `/`     División            !PYTHON(3 / 4)      !PYTHON(0.75)      Devuelve un
                                                                      !PYTHON(float)

   `%`     Módulo              !PYTHON(4 % 3) \    !PYTHON(1) \       Resto de la división
                               !PYTHON(8 % 3)      !PYTHON(2)

   `**`    Exponente           !PYTHON(3 ** 4)     !PYTHON(81)        Devuelve $3^4$

   `//`    División entera     !PYTHON(4 // 3) \   !PYTHON(1) \       \hfill{} \
           hacia abajo         !PYTHON(-4 // 3)    !PYTHON(-2)        ??
--------------------------------------------------------------------------------------------

## Funciones numéricas predefinidas

------------------------------------------------------------------------------------------------------
Función                       Descripción           Ejemplo                            Resultado
----------------------------- --------------------- --------------------------------- ----------------
`abs(`$n$`)`                  Valor absoluto        !PYTHON(abs(-23))                  !PYTHON(23)

`max(`$n_1($`,` $n_2)^+$`)`   Valor máximo          !PYTHON(max(2, 5, 3))              !PYTHON(5)

`min(`$n_1($`,` $n_2)^+$`)`   Valor mínimo          !PYTHON(min(2, 5, 3))              !PYTHON(2)

`round(`$n$[`,` $p$]`)`       Redondeo              !PYTHON(round(23.493))  \          !PYTHON(23) \
                                                    !PYTHON(round(23.493, 1))          !PYTHON(23.5)
------------------------------------------------------------------------------------------------------

## Funciones matemáticas y módulos

- Python incluye una gran cantidad de funciones matemáticas agrupadas dentro
  del módulo !PYTHON(math).

- Los **módulos** en Python son conjuntos de funciones (y más cosas) que se
  pueden **importar** dentro de nuestra sesión o programa.

- Son la base de la **programación modular**, que ya estudiaremos.

- Para *importar* una función de un módulo se puede usar la orden
  !PYTHON(from). Por ejemplo, para importar la función !PYTHON(gcd) (que
  calcula el máximo común divisor de dos números) del módulo !PYTHON(math) se
  haría:

  ```python
  >>> from math import gcd  # importamos la función gcd que está en el módulo math
  >>> gcd(16, 6)            # la función se usa como cualquier otra
  2
  ```

- Una vez importada, la función ya se puede usar directamente como cualquier
  otra.

---

- También se puede **importar directamente el módulo en sí** usando la orden
  !PYTHON(import).

  ```python
  >>> import math      # importamos el módulo math
  ```

- Al importar el módulo, lo que se importan no son sus funciones, sino el
  propio módulo, el cual es un **objeto** (de tipo !PYTHON(module)) al que se
  accede a través de su nombre y cuyos **atributos** son (entre otras cosas)
  las funciones que están definidas dentro del módulo.

- Por eso, para poder llamar a una función del módulo usando esta técnica,
  debemos indicar el nombre del módulo, seguido de un punto (`.`) y el nombre
  de la función:

  ```python
  >>> import math      # importamos el módulo math
  >>> math.gcd(16, 6)  # la función gcd sigue estando dentro del módulo
  2
  ```

  ```python
  math.gcd(16, 6)
  ─┬── ─┬─
   │    └────── función
   └── módulo
  ```

---

- Eso significa que podríamos ampliar nuestra gramática para permitir que el
  nombre de una función en una llamada pudiera contener la parte del módulo:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(llamada_función) ::= !NT(función)!T{(}[!NT(lista_argumentos)]!T{)}
  !NT(función) ::= [!NT(módulo)!T(.)]!T(identificador)
  !NT(módulo) ::= !T(identificador)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Pero técnicamente no es necesario, ya que las funciones contenidas en un
  módulo se invocan como si fueran **métodos que se ejecutan sobre el _objeto
  módulo_**, por lo que la sintaxis es la misma que para los métodos y está ya
  recogida en nuestra gramática:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(llamada_método) ::= !NT(objeto)!T(.)!NT(método)!T{(}[!NT(lista_argumentos)]!T{)}
!NT(objeto) ::= !NT(expresión)
!NT(método) ::= !T(identificador)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Esto nos dice que hay una relación muy estrecha entre funciones y métodos (de
  hecho, los métodos son funciones que se invocan de una forma especial).

---

- De hecho, cuando el objeto es un módulo, no hablamos de métodos sino de
  funciones (los módulos no contienen métodos).

- No es lo mismo !PYTHON(math), que !PYTHON(math.gcd), que
  !PYTHON(math.gcd(16, 6)):

  - !PYTHON(math) es un _módulo_ (un objeto de tipo `module`).

  - !PYTHON(math.gcd) es una _función_ (no es un método porque `math` es un
    módulo).

  - !PYTHON(math.gcd(16, 6)) es una _llamada a función_.

  ```python
  >>> import math
  >>> math
  <module 'math' (built-in)>
  >>> math.gcd
  <built-in function gcd>
  >>> math.gcd(16, 6)
  2
  ```

- La lista completa de funciones que incluye el módulo !PYTHON(math) se puede
  consultar en su documentación:

  [https://docs.python.org/3/library/math.html](https://docs.python.org/3/library/math.html){target="\_blank"}

### El módulo `operator`

- El módulo !PYTHON(operator) contiene, en forma de funciones, las operaciones
  básicas que hasta ahora hemos utilizado en forma de operadores:

  --------------------------------------------------------
    Operador     Operación           Función en el \
                                     módulo `operator`
  ------------ ------------------- -----------------------
     `+`         Suma                  !PYTHON(add)

     `-`         Resta                 !PYTHON(sub)

     `-`         Cambio de signo       !PYTHON(neg)

     `*`         Multiplicación        !PYTHON(mul)

     `/`         División              !PYTHON(truediv)

     `%`         Módulo                !PYTHON(mod)

     `**`        Exponente             !PYTHON(pow)

     `//`        División entera       !PYTHON(floordiv)
                 hacia abajo
  --------------------------------------------------------

---

- Gracias al módulo !PYTHON(operator), podemos reescribir con funciones las
  expresiones que utilizan operadores.

- Por ejemplo, la expresión:

  ```python
  >>> 3 * (4 + 5) - 10
  17
  ```

  se puede reescribir como:

  ```python
  >>> from operator import add, mul, sub
  >>> sub(mul(3, add(4, 5)), 10)
  17
  ```

- Pasar los operadores de una expresión a funciones es un ejercicio muy
  interesante que ayuda a entender en qué orden se evalúan las subexpresiones y
  por qué.

- En Python, en una llamada a función, los argumentos se evalúan siempre antes
  que la propia llamada (y de izquierda a derecha).

---

- La expresión !PYTHON(3 * (4 + 5) - 10) se evalúa así:

  ```python
  3 * (4 + 5) - 10          # se evalúa 3 (devuelve 3)
  = 3 * (4 + 5) - 10        # se evalúa 4 (devuelve 4)
  = 3 * (4 + 5) - 10        # se evalúa 5 (devuelve 5)
  = 3 * (4 + 5) - 10        # se evalúa (4 + 5) (devuelve 9)
  = 3 * 9 - 10              # se evalúa 3 * 9 (devuelve 27)
  = 27 - 10                 # se evalúa 27 - 10 (devuelve 17)
  = 17
  ```

- Y la expresión !PYTHON(sub(mul(3, add(4, 5)), 10)) se evalúa así:

  ```python
  sub(mul(3, add(4, 5)), 10)    # se evalúa sub (devuelve la función resta)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa mul (devuelve la función multiplicación)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa 3 (devuelve 3)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa add (devuelve la función suma)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa 4 (devuelve 4)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa 5 (devuelve 5)
  = sub(mul(3, add(4, 5)), 10)  # se evalúa add(4, 5) (devuelve 9)
  = sub(mul(3, 9), 10)          # se evalúa mul(3, 9) (devuelve 27)
  = sub(27, 10)                 # se evalúa 10 (devuelve 10)
  = sub(27, 10)                 # se evalúa sub(27, 10) (devuelve 17)
  = 17
  ```

# Cadenas

## El tipo `str`

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

  :::: columns

  ::: column

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~
  !PYTHON("hola")
  ~~~~~~~~~~~~~~~~~~~~~

  :::

  ::: column

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~
  !PYTHON('Manolo')
  ~~~~~~~~~~~~~~~~~~~~~

  :::

  ::: column

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~
  !PYTHON("27")
  ~~~~~~~~~~~~~~~~~~~~~

  :::

  ::::

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

- No es lo mismo !PYTHON(27) que !PYTHON("27").

  - !PYTHON(27) es un número entero (un literal de tipo `int`).

  - !PYTHON("27") es una cadena (un literal de tipo `str`).

- Una **cadena vacía** es aquella que no contiene ningún carácter. Se
  representa con los literales `''`, `""`, `''''''` o `""""""`.

---

- Si necesitamos meter el carácter de la comilla simple (`'`) o doble (`"`) en
  un literal de tipo cadena, tenemos dos opciones:

  - Delimitar la cadena con el otro tipo de comillas. Por ejemplo:

    - !PYTHON('Pepe dijo: "Yo no voy.", así que no fuimos.')

    - !PYTHON("Bienvenido, Señor O'Halloran.")

  - «_Escapar_» la comilla, poniéndole delante una barra inclinada hacia la
    izquierda (`\`):

    - !PYTHON("Pepe dijo: \"Yo no voy.\", así que no fuimos.")

    - !PYTHON('Bienvenido, Señor O\'Halloran.')

## Operadores de cadenas

-----------------------------------------------------------------------------------
  Operador         Descripción           Ejemplo                Resultado
------------------ ------------------ ------------------------ --------------------
   `+`             Concatenación       !PYTHON('ab' + 'cd')     !PYTHON('abcd')
                                       !PYTHON('ab' 'cd')

   `*`             Repetición          !PYTHON('ab' * 3) \      !PYTHON('ababab') \
                                       !PYTHON(3 * 'ab')        !PYTHON('ababab')

   !PYTHON([0])    Primer carácter     !PYTHON('hola'[0])       !PYTHON('h')

   !PYTHON([1:])   Resto de cadena     !PYTHON('hola'[1:])      !PYTHON('ola')
-----------------------------------------------------------------------------------

## Funciones predefinidas de cadenas

-------------------------------------------------------------------------------------------------------------------
Función                       Descripción           Ejemplo                                       Resultado
----------------------------- --------------------- --------------------------------------------- -----------------
`len(`$cad$`)`                Longitud de la cadena !PYTHON(len('hola'))                          !PYTHON(4)

`max(`$s_1($`,` $s_2)^+$`)`   Valor máximo          !PYTHON(max('hola', 'pepe'))                  !PYTHON('pepe')

`min(`$s_1($`,` $s_2)^+$`)`   Valor mínimo          !PYTHON(min('hola', 'pepe'))                  !PYTHON('hola')
-------------------------------------------------------------------------------------------------------------------

## Métodos predefinidos de cadenas

- En la documentación podemos encontrar una lista de métodos interesantes que
  operan sobre cadenas:

  [https://docs.python.org/3/library/stdtypes.html#string-methods](https://docs.python.org/3/library/stdtypes.html#string-methods){target="\_blank"}

# Funciones

## El tipo *función*

- En programación funcional, **las funciones también son valores**:

  ```python
  >>> type(max)
  <class 'builtin_function_or_method'>
  ```

- La **única operación** que se puede realizar sobre una función es
  **llamarla**, que sintácticamente se representa poniendo paréntesis `(` `)`
  justo a continuación de la función.

- Dentro de los paréntesis se ponen los _argumentos_ que se aplican a la
  función en esa llamada (si es que los necesita), separados por comas.

- Si la función no tiene argumentos, se dejan los paréntesis vacíos: `()`.

---

- Por tanto, !PYTHON(max) es la función en sí (un **valor** de tipo _función_)
  , y \
  !PYTHON(max(3, 4)) es una llamada a la función !PYTHON(max) con los
  argumentos !PYTHON(3) y !PYTHON{4} (una **operación** realizada sobre la
  función).

  ```python
  >>> max                   # la función max
  <built-in function max>
  >>> max(3, 4)             # la llamada a max con los argumentos 3 y 4
  4
  ```

- Recordemos que **las funciones no tienen expresión canónica**, por lo que el
  intérprete no intentará nunca visualizar un valor de tipo función.

# Álgebra de Boole

## El tipo de dato *booleano*

- Un dato **lógico** o *booleano* es aquel que puede tomar uno de dos posibles
  valores, que se denotan normalmente como **verdadero** y **falso**.

- Esos dos valores tratan de representar los dos valores de verdad de la
  **lógica** y el **álgebra _booleana_**.

- Su nombre proviene de **George Boole**, matemático que definió por primera
  vez un sistema algebraico para la lógica a mediados del S. XIX.

- En Python, el tipo de dato lógico se representa como !PYTHON(bool) y sus
  posibles valores son !PYTHON(False) y !PYTHON(True) (con la inicial en
  mayúscula).

- Esos dos valores son *formas especiales* para los enteros !PYTHON(0) y
  !PYTHON(1), respectivamente.

## Operadores relacionales

- Los **operadores relacionales** son operadores que toman dos operandos (que
  usualmente deben ser del mismo tipo) y devuelven un valor *booleano*.

- Los más conocidos son los **operadores de comparación**, que sirven para
  comprobar si un dato es menor, mayor o igual que otro, según un orden
  preestablecido.

- Los operadores de comparación que existen en Python son:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  `<`\ \ \ \ \ \ `>`\ \ \ \ \ \ `<=`\ \ \ \ \ \ `>=`\ \ \ \ \ \ `==`\ \ \ \ \ \ `!=`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

- En Python se representan como !PYTHON(or), !PYTHON(and) y !PYTHON(not),
  respectivamente.

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
\renewcommand{\arraystretch}{1}

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
\renewcommand{\arraystretch}{1}

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
\renewcommand{\arraystretch}{1}

 $A$   $\neg{}A$
----- -----------
 $F$      $V$
 $V$      $F$

\endgroup

:::

::::

---

Que traducido a Python sería:

  !SALTO

:::: columns

::: column

\begingroup
\renewcommand{\arraystretch}{1}

|   !PYTHON(A)   |   !PYTHON(B)   |  !PYTHON(A or B)  |
|:--------------:|:--------------:|:-----------------:|
| !PYTHON(False) | !PYTHON(False) |   !PYTHON(False)  |
| !PYTHON(False) |  !PYTHON(True) |    !PYTHON(True)  |
|  !PYTHON(True) | !PYTHON(False) |    !PYTHON(True)  |
|  !PYTHON(True) |  !PYTHON(True) |    !PYTHON(True)  |

\endgroup

:::

::: column

\begingroup
\renewcommand{\arraystretch}{1}

|   !PYTHON(A)   |   !PYTHON(B)   |  !PYTHON(A and B)  |
|:--------------:|:--------------:|:------------------:|
| !PYTHON(False) | !PYTHON(False) |   !PYTHON(False)   |
| !PYTHON(False) |  !PYTHON(True) |   !PYTHON(False)   |
|  !PYTHON(True) | !PYTHON(False) |   !PYTHON(False)   |
|  !PYTHON(True) |  !PYTHON(True) |    !PYTHON(True)   |

\endgroup

:::

::::

!SALTOLARGO

\begingroup
\renewcommand{\arraystretch}{1}

|   !PYTHON(A)   |  !PYTHON(not A)  |
|:--------------:|:----------------:|
| !PYTHON(False) |   !PYTHON(True)  |
|  !PYTHON(True) |  !PYTHON(False)  |

\endgroup

## Axiomas

1. Ley asociativa:
   $\begin{cases}
    \forall a,b,c \in \mathbb{B}: (a \lor b) \lor c = a \lor (b \lor c) \\
    \forall a,b,c \in \mathbb{B}: (a \land b) \land c = a \land (b \land c)
    \end{cases}$

2. Ley conmutativa:
   $\begin{cases}
    \forall a,b \in \mathbb{B}: a \lor b = b \lor a \\
    \forall a,b \in \mathbb{B}: a \land b = b \land a
    \end{cases}$

3. Ley distributiva:
   $\begin{cases}
    \forall a,b,c \in \mathbb{B}: a \lor (b \land c) = (a \lor b) \land (a \lor c) \\
    \forall a,b,c \in \mathbb{B}: a \land (b \lor c) = (a \land b) \lor (a \land c)
    \end{cases}$

4. Elemento neutro:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor F = a \\
    \forall a \in \mathbb{B}: a \land V = a
    \end{cases}$

5. Elemento complementario:
   $\begin{cases}
    \forall a \in \mathbb{B}; \exists \lnot a \in \mathbb{B}: a \lor \lnot a = V \\
    \forall a \in \mathbb{B}; \exists \lnot a \in \mathbb{B}: a \land \lnot a = F
    \end{cases}$

Si $(\mathbb{B},\lnot,\lor,\land)$ cumple lo anterior, entonces es un álgebra
de Boole.

!UNUN(Traducción a Python)

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
4. Elemento neutro:
   ```python
   a or False == a  # False es el elemento neutro del or
   a and True == a  # False es el elemento neutro del and
   ```

5. Elemento complementario:
   ```python
   a or (not a) == True
   a and (not a) == False
   ```

## Teoremas fundamentales

1. Ley de idempotencia:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor a = a \\
    \forall a \in \mathbb{B}: a \land a = a
    \end{cases}$

2. Ley de dominación:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor V = V \\
    \forall a \in \mathbb{B}: a \land F = F
    \end{cases}$

3. Ley de identidad:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor F = a \\
    \forall a \in \mathbb{B}: a \land V = a
    \end{cases}$

4. Ley de absorción:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor (a \land b) = a \\
    \forall a \in \mathbb{B}: a \land (a \lor b) = a
    \end{cases}$

5. Ley de involución:
   $\forall a \in \mathbb{B}: \lnot \lnot a = a$

6. Ley del complemento:
   $\begin{cases}
    \forall a \in \mathbb{B}: a \lor \lnot a = V \\
    \forall a \in \mathbb{B}: a \land \lnot a = F \\
    \end{cases}$

7. Leyes de De Morgan:
   $\begin{cases}
    \forall a,b \in \mathbb{B}: \lnot ({a \lor b}) = \lnot a \land \lnot b \\
    \forall a,b \in \mathbb{B}: \lnot ({a \land b}) = \lnot a \lor \lnot b
    \end{cases}$

!UNUN(Traducción a Python)

:::: columns

::: {.column width=50%}

1. Ley de idempotencia:
   ```python
   a or a == a
   a and a == a
   ```

2. Ley de dominación:
   ```python
   a or True == True
   a and False == False
   ```
3. Ley de identidad:
   ```python
   a or False == a
   a and True == a
   ```

:::

::: {.column width=50%}

4. Ley de absorción:
   ```python
   a or (a and b) == a
   a and (a or b) == a
   ```

5. Ley de involución:
   ```python
   not (not a) == a
   ```

6. Ley del complemento:
   ```python
   a or (not a) == True
   a and (not a) == False
   ```

:::

::::

7. Leyes de De Morgan:
   ```python
   not (a or b) == (not a) and (not b)
   not (a and b) == (not a) or (not b)
   ```

## Notación algebraica

- Otra forma de representar los operadores y los valores del álgebra de Boole
  es mediante la **notación algebraica**.

- Según la notación algebraica, los diferentes valores y operaciones del
  álgebra de Boole se representan de la siguiente forma:

  ------------------------------------------------------
  Valor u operación                 Notación
  -------------------------------   --------------------
  Valor verdadero                   $1$

  Valor falso                       $0$

  Producto de $A$ y $B$             $A \cdot B$ \
                                    $AB$

  Suma de $A$ y $B$                 $A + B$

  Complemento de $A$                $\overline{A}$
  ------------------------------------------------------

---

- Por ejemplo, las leyes de DeMorgan, que en Python se escriben así:

  ```python
  not (a or b) == (not a) and (not b)
  not (a and b) == (not a) or (not b)
  ```

  se escribirían así según la notación de la lógica binaria:

  $$\overline{A + B} = \overline{A} \cdot \overline{B}$$
  $$\overline{AB} = \overline{A} + \overline{B}$$

- Esta notación se emplea mucho en el diseño de circuitos digitales.

## Equivalencia lógica

- Decimos que dos expresiones lógicas $P$ y $Q$ son **equivalentes** (y se
  representa como $P \equiv Q$, aunque nosotros lo representaremos simplemente
  como $P = Q$) si tienen las mismas tablas de verdad, es decir, si se cumple
  que $P$ vale $V$ cuando $Q$ también, y viceversa.

- Para demostrar que se cumple una equivalencia en el álgebra de Boole, se
  pueden usar dos técnicas:

  - Demostrar que la propiedad es un _teorema_ que se puede deducir de los
    axiomas y de otros teoremas ya demostrados.

  - Usar las _tablas de verdad_ para comprobar si los valores de verdad de $P$
    y $Q$ coinciden exactamente.

---

- Por ejemplo, supongamos que queremos demostrar la siguiente propiedad:
  $$A(A + B) = A$$

- Podemos demostrarlo siguiendo la siguiente secuencia de razonamientos:

  $$\begin{array}{ccl}
  & A(A + B) \\
  = & & \text{\{Ley distributiva\}} \\
  & AA + AB \\
  = & & \text{\{Ley de idempotencia\}} \\
  & A + AB \\
  = & & \text{\{Ley de absorción\}} \\
  & A
  \end{array}$$

---

- También podemos obtener sus tablas de verdad y comprobar que son idénticas:

  -----------------------------------
   $A$   $B$   $A + B$    $A(A + B)$
  ----- ----- --------- -------------
    0     0       0           0

    0     1       1           0

    1     0       1           1

    1     0       1           1
  -----------------------------------

- Como podemos observar, las columnas de $A$ y de $A(A + B)$ son idénticas, lo
  que significa que toman siempre los mismos valores de verdad y, por tanto,
  ambas expresiones son equivalentes.

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

- El uso del operador ternario permite crear lo que se denomina una **expresión
  condicional**.

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

  evalúa a !PYTHON(25).

---

- El operador ternario, así como los operadores lógicos !PYTHON(and) y
  !PYTHON(or), se evalúan siguiendo una estrategia según la cual **no siempre
  se evalúan todos sus operandos**.

- La expresión condicional:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~
  !NT(valor_si_cierto) !T(if) !NT(condición) !T(else) !NT(valor_si_falso)
  ~~~~~~~~~~~~~~~~~~~~~

  se evalúa de la siguiente forma:

  - Primero siempre se evalúa la !NT(condición).

  - Si es !PYTHON(True), evalúa !NT(valor_si_cierto).

  - Si es !PYTHON(False), evalúa !NT(valor_si_falso).

- Por tanto, en la expresión condicional nunca se evalúan todos sus operandos,
  sino sólo los estrictamente necesarios.

- Además, no se evalúan de izquierda a derecha, como es lo normal.

---

- La evaluación de los operadores !PYTHON(and) y !PYTHON(or) sigue un proceso
  similar:

  - Primero se evalúa el operando izquierdo.

  - El operando derecho sólo se evalúa si el izquierdo no proporciona la
    información suficiente para determinar el resultado de la operación.

- Esto es así porque:

  - !PYTHON(True or) \ $\;\underline{x}$

    siempre es igual a !PYTHON(True), valga lo que valga $\underline{x}$.

  - !PYTHON(False and) \ $\;\underline{x}$

    siempre es igual a !PYTHON(False), valga lo que valga $\underline{x}$.

  En ambos casos no es necesario evaluar $\underline{x}$.

!EJERCICIO

@. ¿Cuál es la asociatividad del operador ternario? Demostrarlo.

# Otros conceptos sobre operaciones

## Árboles sintácticos y evaluación

- Durante la fase de análisis sintáctico, el compilador o el intérprete
  traducen el programa fuente en una representación intermedia llamada **árbol
  sintáctico**.

- Resulta conveniente comprender qué forma tiene ese árbol sintáctico para
  entender adecuadamente cómo se evalúan las expresiones y, más concretamente,
  en qué orden se van evaluando las subexpresiones.

- En un árbol sintáctico, las hojas representan valores, mientras que los nodos
  intermedios representan operaciones.

- Si una expresión está correctamente escrita según la sintaxis del lenguaje,
  sólo tendrá un único árbol sintáctico equivalente.

  En caso contrario, es que la expresión no es sintácticamente correcta, o bien
  que la gramática del lenguaje no está bien diseñada.

---

- Por ejemplo, tenemos las siguientes expresiones y sus árboles sintácticos
  equivalentes:

:::: columns

::: column

```python
2
```

!DOT(arbol-dos.svg)()(width=10%)(width=5%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
rankdir = TB
2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```python
2 + 3
```

!DOT(arbol-dos-mas-tres.svg)()(width=22%)(width=10%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
edge [dir = none]
node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
rankdir = TB
mas[label = "+"]
mas -> 2
mas -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

```python
2 + 3 * 5
```

!DOT(arbol-dos-mas-tres-por-cinco.svg)()(width=30%)(width=14%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
edge [dir = none]
node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
rankdir = TB
mas -> 2
mas[label = "+"]
por[label = "*"]
por -> 3
por -> 5
mas -> por
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```python
2 * 3 + 5
```

!DOT(arbol-dos-por-tres-mas-cinco.svg)()(width=30%)(width=14%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
edge [dir = none]
node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
rankdir = TB
por -> 2
por -> 3
mas[label = "+"]
por[label = "*"]
mas -> 5
mas -> por
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Si la expresión contiene llamadas a funciones, se haría:

  ```python
  max(2, 3 + 5)
  ```

  !DOT(arbol-max-dos-tres-mas-cinco.svg)()(width=25%)(width=22%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  aplica[label = <<i>aplica</i>>, fixedsize = false, shape = ellipse, fontname = "Lato"]
  max[fixedsize = false, shape = ellipse]
  aplica -> max
  aplica -> 2
  aplica -> mas
  mas -> 3
  mas -> 5
  mas[label = "+"]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  El nodo _aplica_ representa la llamada a la función representada por su
  primer hijo, pasándole los argumentos representados por el resto de sus
  hijos.

  Por tanto, tendrá tantos hijos como parámetros tenga la función, más uno (la
  propia función).

---

- Para evaluar una expresión representada por su árbol sintáctico, se va
  recorriendo éste siguiendo un orden que dependerá del lenguaje de
  programación uilizado.

- En Python se sigue un esquema de recorrido llamado **primero en
  profundidad**, donde se van visitando los nodos del árbol de izquierda a
  derecha y de arriba abajo, buscando siempre el nodo que está más al fondo.

- La idea es que, antes de evaluar un nodo, debemos evaluar primero todos sus
  nodos hijos, en orden, de izquierda a derecha.

- De esta forma, para evaluar (reducir) un nodo, debemos reducir primero todos
  sus nodos hijo antes de reducir el propio nodo.

- Si el nodo no tiene hijos, entonces se podrá evaluar directamente.

- La evaluación consiste en ir sustituyendo unos subárboles por otros más
  reducidos hasta acabar teniendo un árbol que represente la forma normal de la
  expresión a evaluar.

---

- Por ejemplo, en la expresión !PYTHON(2 + 3 * 5), representada por este árbol:

  !IMGP(arbol-dos-mas-tres-por-cinco.svg)()(width=15%)(width=15%)

- El orden en el que vamos evaluando los nodos sería el siguiente:

`2`, `3`, `5`, `*`, `+`

---

- La evaluación se realizaría de la siguiente forma, donde en azul destacamos
  los nodos que ya están evaluados:

- **Paso 1**: Se empieza visitando la raíz `+` pero, como tiene hijos, antes de
  evaluarlo se pasa a visitar su primer hijo (`2`).

  !IMGP(arbol-dos-mas-tres-por-cinco.svg)()(width=12%)(width=15%)

- **Paso 2**: Como estamos en el nodo `2` y éste no tiene hijos, se puede
  evaluar directamente, ya que es un nodo hoja y, por tanto, representa un
  valor. La evaluación del nodo no cambia el nodo ni lo sustituye por ningún
  otro.

  !DOT(arbol-dos-mas-tres-por-cinco-dos-azul.svg)()(width=12%)(width=15%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  dos[label = "2", color = blue, fontcolor = blue]
  mas -> dos
  mas[label = "+"]
  por[label = "*"]
  por -> 3
  por -> 5
  mas -> por
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- **Paso 3**: Volvemos al padre del nodo `2`, que es el nodo raíz `+`, el cual
  todavía no lo podemos evaluar porque aún le queda otro nodo hijo por evaluar
  (el nodo `*`), así que bajamos hasta él. Éste, a su vez, tampoco se puede
  evaluar porque tiene hijos que hay que evaluar antes, el primero de los
  cuales es el nodo `3`, así que evaluamos `3`, que se evalúa directamente ya
  que es un nodo hoja.

  !DOT(arbol-dos-mas-tres-por-cinco-tres-azul.svg)()(width=12%)(width=15%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  dos[label = "2", color = blue, fontcolor = blue]
  tres[label = "3", color = blue, fontcolor = blue]
  mas -> dos
  mas[label = "+"]
  por[label = "*"]
  por -> tres
  por -> 5
  mas -> por
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- **Paso 4**: Volvemos al padre del nodo `3`, que es el nodo `*`, el cual
  todavía no lo podemos evaluar porque aún le queda otro nodo hijo por evaluar
  (el nodo `5`), así que bajamos hasta éste, el cual se evalúa directamente ya
  que es un nodo hoja.

  !DOT(arbol-dos-mas-tres-por-cinco-cinco-azul.svg)()(width=12%)(width=15%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  dos[label = "2", color = blue, fontcolor = blue]
  tres[label = "3", color = blue, fontcolor = blue]
  cinco[label = "5", color = blue, fontcolor = blue]
  mas -> dos
  mas[label = "+"]
  por[label = "*"]
  por -> tres
  por -> cinco
  mas -> por
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Paso 5**: Volvemos al padre del nodo `5`, que es el nodo `*`, el cual ya se
  puede evaluar porque ya se han evaluado todos sus hijos, así que se realiza
  la operación !PYTHON(3 * 5), dando como resultado !PYTHON(15), por lo que el
  subárbol que cuelga del nodo `*` se reduce y se sustituye por un único nodo
  hoja `15`.

  !DOT(arbol-dos-mas-quince-azul.svg)()(width=12%)(width=13%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.3, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  dos[label = "2", color = blue, fontcolor = blue]
  quince[label = "15", color = blue, fontcolor = blue]
  mas -> dos
  mas[label = "+"]
  mas -> quince
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- **Paso 6**: Volvemos al padre del que ahora es el nodo `15`, que es el nodo
  `+`, el cual ya se puede evaluar porque ya se han evaluado todos sus hijos,
  así que se realiza la operación !PYTHON(2 + 15), dando como resultado
  !PYTHON(17), por lo que el subárbol que cuelga del nodo `+` se reduce y se
  sustituye por un único nodo hoja `17`.

  !DOT(arbol-diecisiete-azul.svg)()(width=8%)(width=5%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  edge [dir = none]
  node [shape = circle, width = 0.4, fixedsize = shape, fillcolor = transparent, fontname = "monospace"]
  rankdir = TB
  diecisiete[label = "17", color = blue, fontcolor = blue]
  diecisiete
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Como ya se ha reducido el nodo raíz, la evaluación de la expresión ha
  terminado, dando como resultado un árbol que representa a la forma normal de
  la expresión inicial.

!UNUN(Importante)

- Recordar que este orden concreto de evaluación (_primero en profundidad_,
  donde se evalúan primero todos los nodos hijos antes de evaluar al nodo
  padre) es uno más de entre varios órdenes de evaluación que existen.

- El orden de evaluación concreto que se use dependerá del lenguaje de
  programación utilizado.

- Incluso dentro de un mismo lenguaje, podemos encontrarnos con algunas
  operaciones concretas que no siguen este orden de evaluación, aunque el resto
  de las operaciones sí lo hagan.

- Por ejemplo, los operadores lógicos o el operador ternario en Python se
  evalúan siguiendo un orden diferente al indicado aquí, como ya veremos más
  adelante.

## Tipos polimórficos y operaciones polimórficas

- Hasta ahora, hemos visto que la función !PYTHON(abs) de Python tiene la
  siguiente signatura:

  `abs(`$x$`:` `int)` `->` `int`

- Pero sabemos que también puede actuar sobre números reales, por lo que
  también podría tener la siguiente signatura:

  `abs(`$x$`:` `float)` `->` `float`

- En realidad, podríamos definir la función !PYTHON(abs) de Python con la
  siguiente signatura:

  `abs(`$x$`:` `Number)` `->` `Number`

  donde !PYTHON(Number) es un tipo que representa a todos los tipos numéricos
  en Python (como !PYTHON(int) o !PYTHON(float)).

---

- Eso quiere decir que el parámetro $\underline{x}$ de la función !PYTHON(abs)
  admite un valor de cualquier tipo numérico, ya sea un entero o un real.

- Por tanto, !PYTHON(Number) es **un tipo que representa a varios tipos a la
  vez**.

- Cuando eso ocurre, decimos que **ese tipo es _polimórfico_**.

  Por eso podemos afirmar que **!PYTHON(Number) es un tipo polimórfico en
  Python**.

- De la misma forma (aunque se utiliza menos), podemos decir que un **valor
  polimórfico** es un valor que pertenece a un tipo polimórfico.

- Asimismo, una **operación polimórfica** es aquella en cuya signatura aparece
  algún tipo polimórfico.

  Por ejemplo, la función !PYTHON(abs) definida con un parámetro de tipo
  !PYTHON(Number) sería polimórfica, ya que ese parámetro tendría un tipo
  polimórfico.

## Sobrecarga de operaciones

- Un **mismo operador, nombre de función o nombre de método** puede representar
  **varias operaciones diferentes**, dependiendo del tipo de los operandos o
  argumentos sobre los que actúa.

- Un ejemplo sencillo en Python es el operador `+`:

  - Cuando actúa sobre números, representa la operación de suma:

    ```python
    >>> 2 + 3
    5
    ```

  - Cuando actúa sobre cadenas, representa la *concatenación* de cadenas:

    ```python
    >>> "hola" + "pepe"
    'holapepe'
    ```

- Cuando esto ocurre, decimos que el operador (o la función, o el método) está
  **sobrecargado**.

---

- Es decir, es como si el operador `+` representara dos operaciones distintas
  con dos signaturas distintas:

  `+(`$a$`:` `Number,` ` `$b$`:` `Number)` `->` `Number`

  `+(`$a$`:` `str,` ` `$b$`:` `str)` `->` `str`

  de forma que, al usar el operador en una expresión del tipo:

  !NT(expr)$_1$ `+` !NT(expr)$_2$ <!-- $_ -->

  el intérprete llamará a una de las dos operaciones, dependiendo de los tipos
  de !NT(expr)$_1$ y !NT(expr)$_2$. <!-- $_ -->

- La sobrecarga no es polimorfismo, pero induce un cierto tipo de polimorfismo
  que se denomina **polimorfismo _ad-hoc_**.

- Esto es así porque tener varias operaciones diferentes con el mismo nombre
  pero con distinta signatura, equivale a tener una sola operación polimórfica
  donde algunos operandos pueden tomar un valor de varios tipos.

  Por ejemplo, los tipos de $a$ y $b$ representarían a la vez a `Number` y
  `str`.

## Equivalencia entre formas de operaciones

- Una operación puede tener *forma* de **operador**, de **función** o de
  **método**.

- También podemos encontrarnos operaciones con más de una forma.

- Por ejemplo, ya vimos anteriormente la operación «*longitud*», que consiste en
  determinar el número de caracteres que tiene una cadena. Esta operación se
  puede hacer:

  - Con la función !PYTHON(len), pasando la cadena como argumento:

    ```python
    >>> len("hola")
    4
    ```

  - Con el método !PYTHON(__len__) ejecutado sobre la cadena:

    ```python
    >>> "hola".__len__()
    4
    ```

---

- De hecho, en Python hay operaciones que tienen **las tres formas**. Por
  ejemplo, ya vimos anteriormente la operación *potencia*, que consiste en
  elevar un número a la potencia de otro ($x^y$). Esta operación se puede
  hacer:

  - Con el operador `**`:

    ```python
    >>> 2 ** 4
    16
    ```

  - Con la función !PYTHON(pow):

    ```python
    >>> pow(2, 4)
    16
    ```

  - Con el método !PYTHON(__pow__):

    ```python
    >>> (2).__pow__(4)
    16
    ```

<!--

---

- Otro ejemplo es la operación *contiene*, que consiste en comprobar si una
  cadena contiene a otra (una *subcadena*). Esa operación también tiene tres
  formas:

  - El operador `in`:

    ```python
    >>> "o" in "hola"
    True
    ```

  - La función `str.__contains__`:

    ```python
    >>> str.__contains__("hola", "o")
    True
    ```

  - El método `__contains__` ejecutado sobre la cadena (y pasando la
    subcadena como argumento):

    ```python
    >>> "hola".__contains__("o")
    True
    ```

    Observar que, en este caso, el objeto que recibe el mensaje (es decir,
    el objeto al que se le pide que ejecute el método) es la cadena `"hola"`.
    Es como si le preguntáramos a la cadena `"hola"` si contiene la subcadena
    `"o"`.

---

- Y la suma de dos números enteros se puede expresar:

  - Mediante el operador `+`:

    ```python
    4 + 3
    ```

  - Mediante la función `int.__add__`:

    ```python
    int.__add__(4, 3)
    ```

  - Mediante el método `__add__` ejecutado sobre uno de los enteros (y pasando
    el otro número como *argumento* del método):

    ```python
    (4).__add__(3)
    ```

-->

---

- La forma **más general** de representar una operación es la **función**, ya
  que **cualquier operación se puede expresar en forma de función** (cosa que
  no ocurre con los operadores y los métodos).

- Los operadores y los métodos son **formas sintácticas especiales** para
  representar operaciones que se podrían representar igualmente mediante
  funciones.

- Por eso, al hablar de operaciones, y mientras no se diga lo contrario,
  podremos suponer que están representadas como funciones.

- Eso implica que los conceptos de *conjunto origen*, *conjunto imagen*,
  *dominio*, *rango*, *aridad*, *argumento*, *resultado*, *composición* y
  *asociación* (o *correspondencia*), que estudiamos cuando hablamos de las
  funciones, también existen en los operadores y los métodos.

- Es decir: todos esos son conceptos propios de cualquier operación, da igual
  la forma que tenga esta.

---

- Muchos lenguajes de programación no permiten definir nuevos operadores, pero
  sí permiten definir nuevas funciones (o métodos, dependiendo del paradigma
  utilizado).

- En algunos lenguajes, los operadores son casos particulares de funciones (o
  métodos) y se pueden definir como tales. Por tanto, en estos lenguajes se
  pueden crear nuevos operadores definiendo nuevas funciones (o métodos).

## Igualdad de operaciones

- Dos operaciones son **iguales** si devuelven resultados iguales para
  argumentos iguales.

- Este principio recibe el nombre de **principio de extensionalidad**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~
  **Principio de extensionalidad:**

  $f = g$ si y sólo si $f(x) = g(x)$ para todo $x$.
  ~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo: una función que calcule el doble de su argumento multiplicándolo
  por 2, sería exactamente igual a otra función que calcule el doble de su
  argumento sumándolo consigo mismo.

  En ambos casos, las dos funciones devolverán siempre los mismos resultados
  ante los mismos argumentos.

- Cuando dos operaciones son iguales, podemos usar una u otra indistintamente.

!BIBLIOGRAFIA
