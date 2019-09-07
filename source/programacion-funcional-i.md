---
title: Programación funcional I
author: Ricardo Pérez López
!DATE
nocite: |
  @blanco_calculo_2009, @abelson_structure_1996, @van-roy_concepts_2004
---

# El lenguaje de programación Python

## Historia

## Características principales

# Modelo de ejecución

## Modelo de ejecución

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
  definiciones de operadores y funciones predefinidas por el lenguaje, así como
  las definidas por el programador y que el código fuente del programa.

- La **evaluación de una expresión**, en esencia, consiste en **sustituir**,
  dentro de ella, unas *sub-expresiones* por otras que, de alguna manera, estén
  más cerca del valor a calcular, y así hasta calcular el valor de la expresión
  al completo.

- Por ello, la ejecución de un programa funcional se puede modelar como un
  **sistema de reescritura** al que llamaremos **modelo de sustitución**.

---

- La ventaja de este modelo es que no necesitamos recurrir a pensar que debajo
  de todo esto hay un ordenador con una determinada arquitectura *hardware*,
  que almacena los datos en celdas de la memoria principal, que ejecuta ciclos
  de instrucción en la CPU, que las instrucciones modifican los datos de la
  memoria, etc.
  
- Todo resulta mucho más fácil que eso.

- **Todo se reduce a evaluar expresiones**.

# Expresiones

## Evaluación de expresiones

- Ya hemos visto que la ejecución de un programa funcional consiste, en
  esencia, en evaluar una expresión.

- **_Evaluar_ una expresión** consiste en determinar el **valor** de la
  expresión. Es decir, una expresión *representa* o **denota** un valor.

- En programación funcional, el significado de una expresión es su valor, y no
  puede ocurrir ningún otro efecto, ya sea oculto o no, en ninguna operación
  que se utilice para calcularlo.

- Una característica de la programación funcional es que **toda expresión posee
  un valor definido**, a diferencia de otros paradigmas en los que, por
  ejemplo, existen las *sentencias*, que no poseen ningún valor.

- Además, el orden en el que se evalúe no debe influir en el resultado.

---

- Podemos decir que las expresiones:

  $3$

  $1+2$

  $5-3$

  denotan todas el mismo valor (el número abstracto **3**).

- Es decir: todas esas expresiones son representaciones diferentes del mismo
  ente abstracto.

- Lo que hace el sistema es buscar **la representación más simplificada o
  reducida** posible (en este caso, $3$).

- Por eso a menudo usamos, indistintamente, los términos *reducir*,
  *simplificar* y *evaluar*.

### Transparencia referencial

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

### Valores, expresión canónica y forma normal

- Los ordenadores no manipulan valores, sino que sólo pueden manejar
  representaciones concretas de los mismos.

  - Por ejemplo: utilizan la codificación binaria en complemento a 2 para
    representar los números enteros.

- Pidamos que la **representación del valor** resultado de una evaluación sea
  **única**.

- De esta forma, seleccionemos de cada conjunto de expresiones que denoten el
  mismo valor, a lo sumo una que llamaremos **expresión canónica de ese
  valor**.

- Además, llamaremos a la expresión canónica que representa el valor de una
  expresión la **forma normal de esa expresión**.

- Con esta restricción pueden quedar expresiones sin forma normal.

---

- Ejemplo:

  - De las expresiones anteriores:
  
    - $3$

    - $1+2$

    - $5-3$
    
    que denotan todas el mismo valor abstracto **3**, seleccionamos una (la
    expresión $3$) como la **expresión canónica** de ese valor.

  - Igualmente, la expresión $3$ es la **forma normal** de todas las
    expresiones anteriores (y de cualquier otra expresión con valor **3**).

  - Es importante no confundir el valor abstracto **3** con la expresión $3$
    que representa dicho valor.

---

- Hay valores que no tienen expresión canónica:

  - Las funciones (los valores de tipo *función*).

  - El número $\pi$ no tiene representación decimal finita, por lo que tampoco
    tiene expresión canónica.

- Y hay expresiones que no tienen forma normal:

  - Si definimos $inf = inf + 1$, la expresión $inf$ (que es un número) no
    tiene forma normal.

  - Lo mismo ocurre con $1\over0$.

### Formas normales y evaluación

- A partir de todo lo dicho, la ejecución de un programa será el proceso de
  encontrar su forma normal.

- Un ordenador evalúa una expresión (o ejecuta un programa) buscando su forma
  normal y mostrando este resultado.

- Con los lenguajes funcionales los ordenadores alcanzan este objetivo a través
  de múltiples pasos de reducción de las expresiones para obtener otra
  equivalente más simple.

- El sistema de evaluación dentro de un ordenador está hecho de forma tal que
  cuando ya no es posible reducir la expresión es porque se ha llegado a la
  forma normal.

---

!UML(evaluacion.svg)()(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:expresión;
while (¿es posible reducir?) is (sí)
  :aplicar una reducción;
endwhile (no)
:forma normal;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Literales

- Un **literal** es un valor escrito directamente en el código del programa (en
  una expresión).

- El literal representa un valor constante.

- Ejemplos:

  `-3`, `-2`, `-1`, `0`, `1`, `2`, `3` (literales que representan números
  enteros)

  `3.5`, `-2.7` (literales que representan números reales)

  `"hola"`, `"pepe"`, `"25"`, `""` (literales de tipo cadena)

- Los literales tienen que satisfacer las reglas de sintaxis del lenguaje.

- Gracias a esas reglas sintácticas, el intérprete puede identificar qué
  literales son, qué valor representan y de qué tipo son.

- Se deduce, pues, que **un literal debe ser la _expresión canónica_ del valor
  correspondiente**.

## Operaciones, operadores y operandos

- En una expresión puede haber:

  - **Datos**

  - **Operaciones** a realizar sobre esos datos

- A su vez, las operaciones se pueden representar en forma de:

  - Operadores

  - Funciones

  - Métodos

- Empezaremos hablando de los operadores.

---

- Un **operador** es un símbolo o palabra clave que representa la realización
  de una *operación* sobre unos datos llamados **operandos**.

- Ejemplos:

  - Los operadores aritméticos: `+`, `-`, `*`, `/` (entre otros):

    ```python
    3 + 4
    ```

    (aquí los operandos son los números `3` y `4`)

    ```python
    9 * 8
    ```

    (aquí los operandos son los números `9` y `8`)

  - El operador `in` para comprobar si un carácter pertenece a una cadena:

    ```python
    "c" in "barco"
    ```

    (aquí los operandos son las cadenas `"c"` y `"barco"`)

### Aridad de operadores

- Los operadores se clasifican en función de la cantidad de operandos sobre los
  que operan en:

  - **Unarios**: operan sobre un único operando.

    Ejemplo: el operador `-` que cambia el signo de su operando:
    ```python
    -5
    ```

  - **Binarios**: operan sobre dos operandos.

    Ejemplo: la mayoría de operadores aritméticos.

  - **Ternarios**: operan sobre tres operandos.

    Veremos un ejemplo más adelante.

### Paréntesis

- Los **paréntesis** sirven para agrupar elementos dentro de una expresión.

- Se usan, sobre todo, para hacer que varios elementos actúen como uno solo en
  el contexto de una operación.

  - Por ejemplo:

    `(3 + 4) * 5` vale `35`

    `3 + (4 * 5)` vale `23`

### Asociatividad de operadores

- En ausencia de paréntesis, cuando un operando está afectado a derecha e
  izquierda por el **mismo operador**, se aplican las reglas de la
  **asociatividad**:

  ```python
  8 / 4 / 2
  ```

  El `4` está afectado a derecha e izquierda por el mismo operador `/`, por lo
  que se aplican las reglas de la asociatividad. El `/` es *asociativo por la
  izquierda*, así que se actúa primero el operador que está a la izquierda.
  Equivale a hacer:

  ```python
  (8 / 4) / 2
  ```

  Si hiciéramos
  
  ```python
  8 / (4 / 2)
  ```
  
  el resultado sería distinto.

### Precedencia de operadores

- En ausencia de paréntesis, cuando un operando está afectado a derecha e
  izquierda por **distinto operador**, se aplican las reglas de la
  **prioridad**:

  ```python
  8 + 4 * 2
  ```

  El `4` está afectado a derecha e izquierda por distintos operadores (`+` y
  `*`), por lo que se aplican las reglas de la prioridad. El `*` tiene *más
  prioridad* que el `+`, así que actúa primero el `*`. Equivale a hacer:

  ```python
  8 + (4 * 2)
  ```

  Si hiciéramos
  
  ```python
  (8 + 4) * 2
  ```
  
  el resultado sería distinto.

## Funciones y métodos

### Funciones

:::: columns

::: column

- Matemáticamente, una **función** es una regla que *asocia* a cada elemento de
  un conjunto (el conjunto *origen* o *dominio*) un único elemento de un
  segundo conjunto (el conjunto *imagen* o *codominio*).

- Se representa así: $$f: A \rightarrow B$$ $$x \rightarrow f(x)$$

  donde $A$ es el conjunto *origen* y $B$ el conjunto *imagen*.

:::

::: column

!IMGP(funcion.svg)(Función que asocia a cada polígono con su número de lados)

:::

::::

---

- La **aplicación de la función $f$** sobre el elemento $x$ se representa por
  $f(x)$ y corresponde al valor que la función asocia al elemento $x$ en el
  conjunto imagen.

- En la aplicación $f(x)$, al valor $x$ se le llama **argumento** de la
  función.

- Por ejemplo:

  La función **valor absoluto**, que asocia a cada número entero ese mismo
  número sin el signo (un número natural).

  $$abs: \mathbb{Z} \rightarrow \mathbb{N}$$

  $$x \rightarrow abs(x)$$

  Cuando aplicamos la función $abs$ al valor $-35$ obtenemos:
  
  $$abs(-35) = 35$$

  El valor $35$ es el resultado de aplicar la función $abs$ a su argumento
  $-35$.

#### Funciones con varios argumentos

- El concepto de función se puede generalizar para obtener **funciones con más
  de un argumento**.

- Por ejemplo, podemos definir una función $max$ que asocie a cada par de
  números el máximo de los dos.

  $$max: \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z}$$

  $$(x,y) \rightarrow max(x,y)$$

- Si aplicamos la función $max$ a los argumentos $13$ y $-25$, el resultado
  sería $13$:

  $$max(13, -25) = 13$$

### Métodos

- Los **métodos** son, para la programación orientada a objetos, el equivalente
  a las **funciones** para la programación funcional.

- Los métodos son como funciones que actúan *sobre* un valor.

- La *aplicación* de un método se denomina **invocación** o **llamada** al
  método, y se escribe:

  $$v.m()$$

  que representa la **invocación** del método $m$ sobre el valor $v$.

- Los métodos también pueden tener argumentos como cualquier función:

  $$v.m(a_1, a_2, ..., a_n)$$

---

- En la práctica, no hay mucha diferencia entre hacer:

  $$v.m(a_1, a_2, ..., a_n)$$

  y hacer

  $$m(v, a_1, a_2, ..., a_n)$$

- Pero conceptualmente, hay una gran diferencia entre un estilo y otro:

  - El primero es más **orientado a objetos** (el *objeto* $v$ «recibe» un
    mensaje solicitando la ejecución del método $m$).
  
  - En cambio, el segundo es más **funcional** (la *función* $m$ se aplica a
    sus argumentos, de los cuales $v$ es uno más).

- Python es un lenguaje *multiparadigma* que soporta ambos estilos y por tanto
  dispone tanto de funciones como de métodos. Hasta que no veamos la
  orientación a objetos, supondremos que un método es como otra forma de
  escribir una función.

---

- Por ejemplo:

  Las cadenas tienen definidas el método `count()` que devuelve el número de
  veces que aparece una subcadena dentro de la cadena:

  ```java
  'hola caracola'.count('ol')
  ```

  devuelve 2.

  ```java
  'hola caracola'.count('a')
  ```

  devuelve 4.

- Si `count()` fuese una función en lugar de un método, recibiría dos
  parámetros: la cadena y la subcadena. En tal caso, se usaría así:

  ```python
  count('hola caracola', 'ol')
  ```

---

- Una operación podría tener *forma* de operador, de función o de método.

- De hecho, en Python hay operaciones que tienen **las tres formas**.

- Por ejemplo, la suma de dos números se puede expresar:

  - Mediante el operador `+`:
  
    ```python
    4 + 3
    ```

  - Mediante la función `int.__add__`:
  
    ```python
    int.__add__(4, 3)
    ```

  - Mediante el método `__add__` ejecutado sobre uno de los números (y pasando
    el otro número como *argumento* del método):

    ```python
    (4).__add__(3)
    ```

## Tipos de datos

### Concepto

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

- Ejemplos:

  - El tipo `int` en Python define el conjunto de los **números enteros**,
    sobre los que se pueden realizar las operaciones aritméticas (suma,
    producto, etc.) entre otras.

  - El tipo `str` define el conjunto de las **cadenas**, sobre las que se
    pueden realizar otras operaciones (la *concatenación*, la *indexación*,
    etc.).

#### Sistema de tipos

- El **sistema de tipos** de un lenguaje es el conjunto de reglas que asigna un
  tipo a cada elemento del programa.

- Exceptuando a los lenguajes **no tipados** (Ensamblador, código máquina,
  Forth...) todos los lenguajes tienen su propio sistema de tipos, con sus
  características.

- El sistema de tipos de un lenguaje depende también del paradigma de
  programación que soporte el lenguaje. Por ejemplo, en los lenguajes
  **orientados a objetos**, el sistema de tipos se construye a partir de los
  conceptos propios de la orientación a objetos (*clases*, *interfaces*...).

#### Tipado fuerte vs. débil

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

#### Errores de tipos

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

### Tipos de datos básicos

#### Números

- Hay dos tipos numéricos básicos en Python: los enteros y los reales.

  - Los **enteros** se representan con el tipo `int`.

    Sólo contienen parte entera, y sus literales se escriben con dígitos sin
    punto decimal (ej: `13`).

  - Los **reales** se representan con el tipo `float`.

    Contienen parte entera y parte fraccionaria, y sus literales se escriben
    con dígitos y con punto decimal separando ambas partes (ej: `4.87`). Los
    números en notación exponencial (`2e3`) también son reales.

- Las **operaciones** que se pueden realizar con los números son los que cabría
  esperar (aritméticas, trigonométricas, matemáticas en general).

- Los enteros y los reales generalmente se pueden combinar en una misma
  expresión aritmética y suele resultar en un valor real, ya que se considera
  que los reales *contienen* a los enteros.

  - Ejemplo: `4 + 3.5` devuelve `7.5`.

<!--

| Operador | Descripción     | Ejemplo   | Resultado | Comentarios                    |
|:--------:|-----------------|:---------:|:---------:|--------------------------------|
| `+`      | Suma            | `3 + 4`   | `7`       |                                |
| `-`      | Resta           | `3 - 4`   | `-1`      |                                |
| `*`      | Producto        | `3 * 4`   | `12`      |                                |
| `/`      | División        | `3 / 4`   | `0.75`    | Devuelve siempre un `float`    |
| `%`      | Módulo          | `4 % 3`   | `1`       | Resto de dividir `4` entre `3` |
| `**`     | Exponente       | `3 ** 4`  | `81`      | Devuelve $3^4$                 |
| `//`     | División entera | `4 // 3`  | `1`       |                                |
|          |                 | `-4 // 3` | `-2`      | ??                             |

+----------+-----------------+-------------+-----------+-----------------------------+
| Operador | Descripción     | Ejemplo     | Resultado | Comentarios                 |
+:========:+=================+:===========:+:=========:+=============================+
| `+`      | Suma            | `3 + 4`     | `7`       |                             |
+----------+-----------------+-------------+-----------+-----------------------------+
| `-`      | Resta           | `3 - 4`     | `-1`      |                             |
+----------+-----------------+-------------+-----------+-----------------------------+
| `*`      | Producto        | `3 * 4`     | `12`      |                             |
+----------+-----------------+-------------+-----------+-----------------------------+
| `/`      | División        | `3 / 4`     | `0.75`    | Devuelve un `float`         |
+----------+-----------------+-------------+-----------+-----------------------------+
| `%`      | Módulo          | `4 % 3`     | `1`       | Resto de la división        |
+----------+-----------------+-------------+-----------+-----------------------------+
| `**`     | Exponente       | `3 ** 4`    | `81`      | Devuelve $3^4$              |
+----------+-----------------+-------------+-----------+-----------------------------+
| `//`     | División entera | `4 // 3` \  | `1` \     | \hfill{} \                  |
|          |                 | `-4 // 3`   | `-2`      | ??                          |
+----------+-----------------+-------------+-----------+-----------------------------+

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

-->

#### Cadenas

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

  - Estos literales se usan para escribir cadenas formadas por varias líneas.
    La sintaxis de las triples comillas respetan los saltos de línea.

  - Ejemplo:

    !CAJA
    ~~~~~~~~~~~~~~~~~~~~~~~~~~
    ```
    """Bienvenido
    a
    Python"""
    ```
    ~~~~~~~~~~~~~~~~~~~~~~~~~~

- No es lo mismo `27` que `"27"`.

  - `27` es un número entero (un literal de tipo `int`).

  - `"27"` es una cadena (un literal de tipo `str`).

## Operaciones predefinidas

### Operadores predefinidos

#### Operadores aritméticos

----------------------------------------------------------------------------
  Operador   Descripción       Ejemplo    Resultado  Comentarios
------------ --------------- ----------- ----------- -----------------------
   `+`       Suma            `3 + 4`     `7`

   `-`       Resta           `3 - 4`     `-1`

   `*`       Producto        `3 * 4`     `12`

   `/`       División        `3 / 4`     `0.75`      Devuelve un `float`


   `%`       Módulo          `4 % 3` \   `1` \       Resto de la división
                             `8 % 3`     `2`

   `**`      Exponente       `3 ** 4`    `81`        Devuelve $3^4$

   `//`      División entera `4 // 3` \   `1` \      \hfill{} \
                             `-4 // 3`    `-2`       ??
----------------------------------------------------------------------------

#### Operadores de cadenas

------------------------------------------------------------------------
  Operador   Descripción     Ejemplo          Resultado   Comentarios
------------ --------------- ---------------- ----------- --------------
   `+`       Concatenación   `'ab' + 'cd'`    `'abcd'`    \hfill{} \
                             `'ab' 'cd'`                  Yuxtapuestas

   `*`       Repetición      `'ab' * 3`       `'ababab'`
                             `3 * 'ab'`       `'ababab'`

   `[0]`     Primer carácter `'hola'[0]`      `'h'`

   `[1:]`    Resto de cadena `'hola'[1:]`     `'ola'`
------------------------------------------------------------------------

<!--

---------------------------------------------------------------------------------------
  Operador         Descripción     Ejemplo          Resultado   Comentarios
------------       --------------- ---------------- ----------- -----------------------
   `+`             Concatenación   `'ab' + 'cd'`    `'abcd'`    \hfill{} \
                                   `'ab' 'cd'`                  Dos cadenas juntas

   `*`             Repetición      `'ab' * 3`       `'ababab'`
                                   `3 * 'ab'`       `'ababab'`

   `[]`            Indexación       `'hola'[2]`     `'l'`

   `[`$m$`:`$n$`]` *Slicing*        `'manolo'[1:3]` `'an'`
---------------------------------------------------------------------------------------

---

##### Indexación

- La **indexación** consiste en acceder al carácter situado en la posición
  indicada entre corchetes.

  ```
   +---+---+---+---+---+---+
   | P | y | t | h | o | n |
   +---+---+---+---+---+---+
     0   1   2   3   4   5
    -6  -5  -4  -3  -2  -1
  ```

##### *Slicing*

- El *slicing* (*hacer rodajas*) es una técnica que consiste en 
  ```
   +---+---+---+---+---+---+
   | P | y | t | h | o | n |
   +---+---+---+---+---+---+
   0   1   2   3   4   5   6
  -6  -5  -4  -3  -2  -1
  ```

-->

### Funciones predefinidas

-----------------------------------------------------------------------------------
Función                        Descripción           Ejemplo            Resultado   
------------------------------ --------------------- ------------------ -----------
`abs(`$n$`)`                   Valor absoluto        `abs(-23)`         `23`

`len(`$str$`)`                 Longitud de la cadena `len('hola')`      `4`

`max(`$n_1$(`,`$n_2$)\*`)`     Valor máximo          `max(2, 5, 3)`     `5`

`min(`$n_1$(`,`$n_2$)\*`)`     Valor mínimo          `min(2, 5, 3)`     `2`

`round(`$n$[`,`$p$]`)`         Redondeo              `round(23.493)`  \ `23` \
                                                     `round(23.493, 1)` `23.5`

`type(`$v$`)`                  Tipo del valor        `type(23.5)`       `<class` \
                                                                        `'float'>`
-----------------------------------------------------------------------------------

### Métodos predefinidos

[https://docs.python.org/3/library/stdtypes.html#string-methods](https://docs.python.org/3/library/stdtypes.html#string-methods)

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

- Esos dos valores son *formas especiales* para los enteros 0 y 1,
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

## Operadores lógicos

- Los **operadores lógicos** son operadores que toman uno o dos operandos
  *booleanos* y devuelven un valor *booleano*.

- Representan las operaciones básicas del álgebra de Boole llamadas **suma**,
  **producto** y **complemento**.

- En **lógica proposicional** (un tipo de lógica matemática que tiene
  estructura de álgebra de Boole), se llaman:
  
  - **Disyunción** ($\lor$),
  - **Conjunción** ($\land$) y
  - **Negación** ($\neg$).

- En Python se representan como `or`, `and` y `not`, respectivamente

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
10. Leyes de De Morgan:
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
  !NT(expresión_condicional) ::= !NT(valor_si_verdadero) !T(if) !NT(condición) !T(else) !NT(valor_si_falso)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

- donde:

  - !NT(condición) debe ser una expresión lógica

  - !NT(valor_si_verdadero) y !NT(valor_si_falso) pueden ser expresiones de
    cualquier tipo

- El valor de la expresión completa será !NT(valor_si_verdadero) si la
  !NT(condición) es cierta; en caso contrario, su valor será
  !NT(valor_si_falso).

- Ejemplo:

  ```python
  25 if 3 > 2 else 17
  ```

  evalúa a **25**.

# Definiciones

## Definiciones

- Introduciremos ahora en nuestro lenguaje una nueva instrucción (técnicamente
  es una **sentencia**) con la que vamos a poder hacer **definiciones**.

- A esa sentencia (en este momento) la llamaremos **definición**, y expresa el
  hecho de que **un _nombre_ representa un _valor_**.

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

!DOT(ligadura.svg)()(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
25 [shape = circle]
x [shape = record]
x -> 25
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- En un **lenguaje funcional puro**, un identificador ya ligado no se puede
  ligar a otro valor. Por ejemplo, lo siguiente daría un error:

  ```python
  x = 4
  x = 7
  ```

!DOT(rebinding.svg)()(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4 [shape = circle]
7 [shape = circle]
x -> 4 [style = dashed, color = grey]
x -> 7
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Python no es un lenguaje funcional puro, por lo que se permite volver a ligar
  el mismo identificador a otro valor distinto (*rebinding*).

  - Eso hace que se pierda el valor anterior.

  - Por ahora, **no lo hagamos**.

### Reglas léxicas

- Cuando hacemos una definición debemos tener en cuenta ciertas cuestiones
  relativas al identificador:

  - ¿Cuál es la **longitud máxima** de un identificador?

  - ¿Qué **caracteres** se pueden usar?

  - ¿Se distinguen **mayúsculas** de **minúsculas**?

  - ¿Coincide con una palabras clave o reservada?

    - **Palabra clave**: palabra que forma parte de la sintaxis del lenguaje.

    - **Palabra reservada**: palabra que no puede emplearse como identificador.

## Evaluación de expresiones con ligaduras

- Podemos usar un identificador ligado dentro de una expresión (siempre que la
  expresión sea una expresión válida según las reglas del lenguaje, claro
  está):

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

---

- Podemos hacer:

  ```python
  x = 25
  y = x
  ```

  - En este caso estamos ligando a `y` el valor que tiene `x`.

  - `x` e `y` comparten valor.

!DOT(ligadura-compartida.svg)()(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
25 [shape = circle];
x -> 25
y -> 25
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Entorno (*environment*)

- Se denomina **entorno** (del inglés, *environment*) al conjunto de todas las
  ligaduras que son accesibles en un punto concreto de un programa.

- El entorno, por tanto, depende del punto del programa en el que se calcule:

  ```{.python .number-lines}
  >>> x
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  >>> x = 25
  >>> x
  25
  ```

  - En la línea 1, el identificador `x` aún no está ligado, por lo que uso genera un error.

  - En la línea 6, en cambio, el identificador puede usarse sin error ya que ha
    sido ligado previamente en la línea 5.

---


:::: columns

::: column

- Si tenemos:

  ```{.python .number-lines}
  >>> x = 4
  >>> y = 3
  >>> z = 9
  >>> x = 5
  >>> y = x
  ```

  Según la línea en la que nos encontremos, tenemos los siguientes entornos:

!DOT(entorno-linea1.svg)(Entorno en la línea 1)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4 [shape = circle];
x -> 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!DOT(entorno-linea2.svg)(Entorno en la línea 2)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 [shape = circle];
4 [shape = circle];
x -> 4
y -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(entorno-linea3.svg)(Entorno en la línea 3)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
9 [shape = circle];
3 [shape = circle];
4 [shape = circle];
x -> 4
y -> 3
z -> 9
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!DOT(entorno-linea4.svg)(Entorno en la línea 4)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
9 [shape = circle];
3 [shape = circle];
5 [shape = circle];
x -> 5;
y -> 3;
z -> 9;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!DOT(entorno-linea5.svg)(Entorno en la línea 5)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
9 [shape = circle];
5 [shape = circle];
x -> 5
y -> 5
z -> 9
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Tipado estático vs. dinámico

- Cuando un identificador está ligado a un valor, a efectos prácticos el
  identificador actúa como si fuera el valor.

- Como cada valor tiene un tipo de dato asociado, también podemos hablar del
  **tipo de un identificador**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de un identificador ligado** es el tipo del dato con el que está
  ligado.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si un identificador no está ligado, no tiene sentido preguntarse qué tipo de
  dato tiene.

- Si un identificador ligado se liga a otro valor (cosa que ya hemos dicho que
  evitaremos por ahora) y ese otro valor es de otro tipo distinto al del valor
  original, el tipo del identificador cambia y pasa a ser el del valor con el
  que está ligado ahora.

---

- Eso quiere decir que **el tipo de un identificador puede cambiar durante la
  ejecución del programa**.

- A este enfoque se le denomina **tipado dinámico**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado dinámico:**

  Son aquellos que **permiten** que el tipo de un identificador **cambie**
  durante la ejecución del programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En contraste con los lenguajes de tipado dinámico, existen los llamados
  **lenguajes de tipado estático**.

- En un lenguaje de tipado estático, el tipo de un identificador se define una
  sola vez (en la fase de compilación o justo al empezar a ejecutarse el
  programa), y no puede cambiar durante la ejecución del mismo.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Lenguajes de tipado estático:**

Son aquellos que **obligan a declarar** el tipo de un identificador antes de
poder usarlo y **prohíben** que dicho tipo **cambie** durante la ejecución del
programa.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Estos lenguajes disponen de construcciones sintácticas que permiten declarar
  de qué tipo serán los datos con los que se ligará un identificador.
  
  Por ejemplo, en Java podemos hacer:

  ```java
  int x;
  ```

  con lo que declaramos que `x` sólo podrá ligarse a valores de tipo `int`.

- A veces, se pueden realizar al mismo tiempo la declaración del tipo y la
  ligadura al valor:

  ```java
  int x = 24;
  ```

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

## *Scripts*

- Cuando tenemos varias definiciones o muy largas resulta tedioso tener que
  introducirlas una y otra vez en el intérprete interactivo.

- Lo más cómodo es teclearlas juntas dentro un archivo que luego cargaremos
  desde dentro del intérprete.

- Ese archivo se llama **_script_** y, por ahora, contendrá una lista de las
  definiciones que nos interese usar en nuestras sesiones interactivas con el
  intérprete.

- Los nombres de archivo de los *scripts* en Python llevan extensión `.py`.

- Para cargar un *script* en nuestra sesión, usamos la orden `from`. Por
  ejemplo, para cargar un *script* llamado `definiciones.py`, usaremos:

  ```python
  from definiciones import *
  ```

# Documentación interna

## Identificadores significativos

## Comentarios

## Docstrings

!FIN
