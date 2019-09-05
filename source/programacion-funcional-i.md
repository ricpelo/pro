---
title: Programación funcional I
author: Ricardo Pérez López
!DATE
nocite: |
  @blanco_calculo_2009, @abelson_structure_1996
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

#### Operadores aritméticos

--------------------------------------------------------------------------------
  Operador   Descripción       Ejemplo    Resultado  Comentarios
------------ --------------- ----------- ----------- ------------------------------
   `+`       Suma            `3 + 4`     `7`

   `-`       Resta           `3 - 4`     `-1`

   `*`       Producto        `3 * 4`     `12`

   `/`       División        `3 / 4`     `0.75`      Devuelve siempre un `float`


   `%`       Módulo          `4 % 3` \   `1` \       Resto de la división
                             `8 % 3`     `2`

   `**`      Exponente       `3 ** 4`    `81`        Devuelve $3^4$

   `//`      División entera `4 // 3` \   `1` \
                             `-4 // 3`    `-2`
--------------------------------------------------------------------------------

---

| Operador | Descripción | Ejemplo  | Resultado | Comentarios |
|:--------:|-------------|:--------:|:---------:|-------------|
| `+`      | Suma        | `3 + 4`  | `7`       |             |
| `-`      | Resta       | `3 - 4`  | `-1`      |             |
| `*`      | Producto    | `3 * 4`  | `12`      |             |
| `/`      | División    | `3 / 4`  | `0.75`    | Devuelve siempre un `float` |
| `%`      | Módulo      | `4 % 3`  | `1`       | Resto de dividir `4` entre `3` |
| `**`     | Exponente   | `3 ** 4` | `81`      | Devuelve $3^4$ |
| `//`     | División entera | `4 // 3`  | `1`  |             |
|          |                 | `-4 // 3` | `-2`  |             |


#### Cadenas

## Algebraicas vs. algorítmicas

## Aritméticas

## Operaciones predefinidas

### Operadores predefinidos

### Funciones predefinidas

### Métodos predefinidos

## Constantes predefinidas

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

# Variables y constantes

## Definiciones

## Identificadores

## Ligadura (*binding*)

## Estado

## Tipado estático vs. dinámico

## Evaluación de expresiones con variables

## Constantes

# Documentación interna

## Identificadores significativos

## Comentarios

## Docstrings

!FIN
