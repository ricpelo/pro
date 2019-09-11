---
title: Programación funcional II
author: Ricardo Pérez López
!DATE
---

# Abstracciones funcionales


## Expresiones lambda

- Las **expresiones lambda** (también llamadas **abstracciones lambda** o
  **funciones anónimas** en algunos lenguajes) son expresiones que capturan la
  idea abstracta de «**función**».

- Son la forma más simple y primitiva de describir funciones en un lenguaje
  funcional.

- Su sintaxis (simplificada) es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expr_lambda) ::=  !T(lambda) [!NT(lista_parámetros)] !T(:) !NT(expresión)
!NT(lista_parámetros) := !NT{identificador} (!T(,) !NT(identificador))\*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  lambda x, y: x + y
  ```

### Parámetros y cuerpos

- Los identificadores que aparecen entre la palabra clave `lambda` y el
  carácter de dos puntos (`:`) son los **parámetros** de la expresión lambda.

- La expresión que aparece tras los dos puntos (`:`) es el **cuerpo** de la
  expresión lambda.

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  - Los parámetros son `x` e `y`.

  - El cuerpo es `x + y`.

  - Esta expresión lambda captura la idea general de sumar dos valores (que en
    principio pueden ser de cualquier tipo, siempre y cuando admitan el
    operador `+`).

### Aplicación funcional

- De la misma manera que decíamos que podemos aplicar una función a unos
  argumentos, también podemos aplicar una expresión lambda a unos argumentos.

- Recordemos que *aplicar* una función a unos argumentos producía el valor que
  la función asocia a esos argumentos en el conjunto imagen.

- Por ejemplo, la aplicación de la función $max$ sobre los argumentos $3$ y
  $5$ se denota como $max(3, 5)$ y eso denota el valor $5$.

- Igualmente, la aplicación de una expresión lambda como

  ```python
  lambda x, y: x + y
  ```

  sobre los argumentos `4` y `3` se representa así:

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

---

- Si hacemos la siguiente definición:

  ```python
  suma = lambda x, y: x + y
  ```

  a partir de ese momento podemos usar `suma` en lugar de su valor (la
  expresión lambda), por lo que podemos hacer:

  ```python
  suma(4, 3)
  ```

  en lugar de

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

#### Evaluación de una aplicación funcional

- En nuestro modelo de sustitución, la **evaluación de la aplicación de una
  expresión lambda** consiste en **sustituir**, en el cuerpo de la expresión
  lambda, **cada parámetro por su argumento correspondiente** (por orden) y
  devolver la expresión resultante *parentizada* (entre paréntesis).

- A esta operación se la denomina **aplicación funcional** o **β-reducción**.

- Siguiendo con el ejemplo anterior:

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

  sustituimos en el cuerpo de la expresión lambda los parámetros `x` e `y` por
  los argumentos `4` y `3`, respectivamente, y parentizamos la expresión
  resultante, lo que da:

  ```python
  (4 + 3)
  ```

  que simplificando (según las reglas del operador `+`) da `7`.

---

- Lo mismo podemos hacer si definimos previamente la expresión lambda
  ligándola a un identificador:

  ```python
  suma = lambda x, y: x + y
  ```

- Así, la aplicación de la expresión lambda resulta más fácil y clara de
  escribir:

  ```python
  suma(4, 3)
  ```

- En ambos casos, el resultado es el mismo (`7`).

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Importante:**

  En **Python**, el **orden de evaluación** de cualquier expresión es
  **de izquierda a derecha**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Ejemplos

- Dado el siguiente código:

  ```python
  suma = lambda x, y: x + y
  ```

  ¿Cuánto vale la expresión siguiente?

  ```python
  suma(4, 3) * suma(2, 7)
  ```

  Según el modelo de sustitución, reescribimos:

  ```python
  suma(4,3) * suma(2, 7)
  = (lambda x, y: x + y)(4, 3) * suma(2, 7)
  = (4 + 3) * suma(2, 7)
  = 7 * suma(2, 7)
  = 7 * (lambda x, y: x + y)(2, 7)
  = 7 * (2 + 7)
  = 7 * 9
  = 63
  ```

### Variables ligadas y libres

  - Si un identificador aparece en la lista de parámetros de la expresión
    lambda, a ese identificador le llamamos **variable ligada** de la expresión
    lambda.

  - En caso contrario, le llamamos **variable libre** de la expresión lambda.

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  los dos identificadores que aparecen en el cuerpo (`x` e `y`) son variables
  ligadas, ya que ambos aparecen en la lista de parámetros de la expresión
  lambda.

- En cambio, en la expresión lambda:

  ```python
  lambda x, y: x + y + z
  ```

  `x` e `y` son variables ligadas mientras que `z` es libre.

---

- Para que una expresión lambda funcione, sus variables libres deben
  estar ligadas a algún valor en el entorno **en el momento de evaluar una
  aplicación** de la expresión lambda sobre unos argumentos.

- Por ejemplo:

  ```python
  prueba = lambda x, y: x + y + z
  prueba(4, 3)
  ```

  da error porque `z` no está definido (no está ligado a ningún valor en el
  entorno).

- En cambio:

  ```{.python .number-lines}
  prueba = lambda x, y: x + y + z
  z = 9
  prueba(4, 3)
  ```

  sí funciona (y devuelve `16`) porque en el momento de evaluar la expresión
  lambda (en la línea 3) el identificador `z` está ligado a un valor (`9`).

- Observar que no es necesario que las variables libres estén ligadas en el
  entorno cuando se *crea* la expresión lambda, sino cuando se *aplica*.

---

- Una expresión lambda cuyo cuerpo sólo contiene variables ligadas, es
  una expresión cuyo valor sólo va a depender de los argumentos que se usen
  cuando se aplique la expresión lambda.

- En cambio, el valor de una expresión lambda que contenga variables
  libres dependerá no sólo de los valores de sus argumentos, sino también de
  los valores a los que estén ligadas las variables libres al evaluar la
  expresión lambda.

- Por ejemplo, podemos escribir una expresión lambda que calcule la suma de
  tres números a partir de otra expresión lambda que calcule la suma de dos
  números:

  ```python
  lambda x, y, z: suma(x, y) + z
  ```

  En este caso, hay un identificador (`suma`) que no aparece en la lista de
  parámetros de la expresión lambda (por lo que es una variable libre).

  Por tanto, el valor de la expresión lambda anterior dependerá de lo que valga
  `suma` (de lo que haga, de lo que devuelva...).

### Ámbito de una variable ligada

- Recordemos que el **ámbito de una ligadura** es la porción del programa en la
  que dicha ligadura tiene validez.

- Hemos visto que **un parámetro** de una expresión lambda **es una variable
  ligada** en el cuerpo de dicha expresión lambda.

- En realidad, lo que hace la expresión lambda es **ligar al parámetro con la
  variable ligada que está dentro del cuerpo**, y esa ligadura existe
  únicamente en el cuerpo de la expresión lambda.

- Por tanto, **el ámbito de una variable ligada es el cuerpo de la expresión
  lambda** que la liga con su parámetro.

- También se dice que la variable ligada tiene un **ámbito local** a la
  expresión lambda.

- Por contraste, los identificadores que no tienen ámbito local se dice que
  tienen un **ámbito global**.

---

- Por ejemplo:

  ```{.python .number-lines}
  # Aquí empieza el script (no hay más definiciones antes de esta línea):
  producto = lambda x: x * x
  y = producto(3)
  z = x + 1       # da error
  ```

- La expresión lambda de la línea 2 tiene un parámetro (`x`) ligado a la
  variable ligada `x` situada en el cuerpo de la expresión lambda.

- Por tanto, el ámbito de la variable ligada `x` es el **cuerpo** de la
  expresión lambda (`x * x`).

- Eso quiere decir que, fuera de la expresión lambda, no es posible acceder al
  valor de la variable ligada, al encontrarnos **fuera de su ámbito**.

- Por ello, la línea 4 dará un error al intentar acceder al valor de un
  identificador no ligado.

### Variables *sombreadas*

- ¿Qué ocurre cuando una expresión lambda contiene como parámetros nombres que
  ya están definidos (ligados) en el entorno?

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  total = (lambda x: x * x)(3)  # Su valor es 9
  ```

- La `x` que aparece en la línea 1 es diferente a la que aparece en la lista de
  parámetros de la expresión lambda de la línea 2.

<!--

- Técnicamente, decimos que la expresión lambda introduce un nuevo *ámbito*
  (concepto que desarrollaremos más adelante).

-->

- En este caso, decimos que **el parámetro `x` _hace sombra_** al identificador
  `x` que, en el entorno, está ligado al valor 4.

- Por tanto, el identificador `x` que aparece en el cuerpo de la expresión
  lambda **hace referencia al parámetro `x` de la expresión lambda**, y **no**
  al identificador `x` que está fuera de la expresión lambda (y que aquí está
  ligado al valor `4`).

---

- Que el parámetro haga sombra al identificador de fuera significa que no
  podemos acceder a ese identificador externo desde el cuerpo de la expresión
  lambda como si fuera una variable libre.

- Si necesitáramos acceder al valor de la `x` que está fuera de la expresión
  lambda, lo que podemos hacer es cambiar el nombre al parámetro `x`. Por
  ejemplo:

  ```{.python .number-lines}
  x = 4
  total = (lambda w: w * x)(3)  # Su valor es 12
  ```

  Así, tendremos en la expresión lambda una variable ligada (el parámetro `w`)
  y una variable libre (el identificador `x`).

### Expresiones lambda y entornos

- Recordemos que el **entorno** es el conjunto de todas las ligaduras que son
  accesibles en un punto concreto de un programa.

- Para calcular el entorno en un punto dado, debemos tener en cuenta las
  ligaduras, así como los ámbitos de dichas ligaduras y las variables ligadas
  que hagan sombra a otras situadas en el mismo ámbito.

---

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  z = 1
  suma = (lambda x, y: x + y + z)(8, 12)
  y = 3
  z = 9
  ```

- En cada línea tendríamos los siguientes entornos:

:::: columns

::: column

!DOT(lambda-entorno-linea1.svg)(Entorno en la línea 1)(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
4 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x (global)"]
x -> 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea2.svg)(Entorno en la línea 2)(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x (global)"]
z [shape = plaintext, fillcolor = transparent, label = "z (global)"]
x -> 4
z -> 1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

!DOT(lambda-entorno-linea3.svg)(Entorno en la línea 3 fuera de la expresión lambda)(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x (global)"]
z [shape = plaintext, fillcolor = transparent, label = "z (global)"]

suma [shape = plaintext, fillcolor = transparent, label = "suma (global)"]
suma -> lambda
x -> 4
z -> 1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

&nbsp;

!DOT(lambda-entorno-linea3-dentro.svg)(Entorno en la línea 3 en el cuerpo de la expresión lambda)(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
node [fontname = "monospace"]
1 [shape = circle]
12 [shape = circle]
8 [shape = circle]
xl [shape = plaintext, fillcolor = transparent, label = "x (local)"]
yl [shape = plaintext, fillcolor = transparent, label = "y (local)"]
z [shape = plaintext, fillcolor = transparent, label = "z (global)"]

suma [shape = plaintext, fillcolor = transparent, label = "suma (global)"]
suma -> lambda
xl -> 8
yl -> 12
z -> 1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<!--

compound = true
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
8 [shape = circle]
12 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x (global)"]
xl [shape = plaintext, fillcolor = transparent, label = "x (local)"]
yl [shape = plaintext, fillcolor = transparent, label = "y (local)"]
z [shape = plaintext, fillcolor = transparent, label = "z (global)"]

suma [shape = plaintext, fillcolor = transparent, label = "suma (global)"]
subgraph cluster0 {
    label = "lambda"
    bgcolor = white
    xl -> 8
    yl -> 12
}
suma -> xl [lhead = cluster0]
x -> 4
z -> 1

-->

---

:::: columns

::: column

!DOT(lambda-entorno-linea4.svg)(Entorno en la línea 4)(width=40%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
3 [shape = circle];
4 [shape = circle];
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
z [shape = plaintext, fillcolor = transparent]
x -> 4
y -> 3
z -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea5.svg)(Entorno en la línea 5)(width=40%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
3 [shape = circle];
4 [shape = circle];
x [shape = plaintext, fillcolor = transparent]
y [shape = plaintext, fillcolor = transparent]
z [shape = plaintext, fillcolor = transparent]
x -> 4
y -> 3
z -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Renombrado de parámetros

- Los parámetros se pueden *renombrar* (siempre que se haga de forma adecuada)
  sin que se altere el significado de la expresión lambda.

- A esta operación se la denomina **α-conversión**.

- Un ejemplo de α-conversión es la que hicimos antes.

- La α-conversión hay que hacerla correctamente para evitar efectos indeseados.
  Por ejemplo, en:

  ```python
  lambda x, y: x + y + z
  ```

  si renombramos `x` a `z` tendríamos:

  ```python
  lambda z, y: z + y + z
  ```

  lo que es claramente incorrecto. A este fenómeno indeseable se le denomina
  **captura de variables**.

## Estrategias de evaluación

- A la hora de evaluar una expresión existen varias estrategias diferentes que
  se pueden adoptar.

- Cada lenguaje implementa sus propias estrategias de evaluación que están
  basadas en las que vamos a ver aquí.

- Básicamente se trata de decidir, en cada paso de reducción, qué sub-expresión
  hay que reducir, en función de:

  - El orden (de fuera adentro o de dentro afuera).

  - La necesidad o no de evaluar dicha expresión.

### Orden de evaluación

- En un lenguaje de programación funcional puro se cumple la **transparencia
  referencial**, según la cual el valor de una expresión depende sólo del valor
  de sus sub-expresiones (también llamadas *redexes*).

- Pero eso también implica que **no importa el orden en el que se evalúen las
  sub-expresiones**: el resultado debe ser siempre el mismo.

- Gracias a ello podemos usar nuestro modelo de sustitución como modelo
  computacional.

- Hay dos **estrategias básicas de evaluación**:

  - **Orden aplicativo**: reducir siempre el *redex* más **interno**.

  - **Orden normal**: reducir siempre el *redex* más **externo**.

- **Python usa el orden aplicativo**, salvo excepciones.

#### Orden aplicativo

- El **orden aplicativo** consiste en evaluar las expresiones *de dentro
  afuera*, es decir, empezando siempre por el *redex* más **interno**.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por valor**.

- Ejemplo:

  ```python
  cuadrado = lambda x, y: x * x
  ```

  Según el orden aplicativo, la expresión `cuadrado(3 + 4)` se reduciría así:

  ```python
  cuadrado(3 + 4)
  = cuadrado(7)
  = (lambda x, y: x * x)(7)
  = (7 * 7)
  = 49
  ```

  alcanzando la forma normal en 4 pasos de reducción.

#### Orden normal

- El **orden normal** consiste en evaluar las expresiones *de fuera adentro*,
  es decir, empezando siempre por el *redex* más **externo**.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por nombre**.

- Ejemplo:

  ```python
  cuadrado = lambda x, y: x * x
  ```

  Según el orden normal, la expresión `cuadrado(3 + 4)` se reduciría así:

  ```python
  cuadrado(3 + 4)
  = (lambda x, y: x * x)(3 + 4)
  = (3 + 4) * (3 + 4)
  = 7 * (3 + 4)
  = 7 * 7
  = 49
  ```

  alcanzando la forma normal en 5 pasos de reducción.

### Evaluación estricta y no estricta

- Existe otra forma de ver la evaluación de una expresión:

  - **Evaluación estricta**: Reducir todos los *redexes* aunque no hagan falta.

  - **Evaluación no estricta**: Reducir sólo los *redexes* que sean
    estrictamente necesarios para calcular el valor de la expresión.

    A esta estrategia de evaluación se la denomina también **evaluación
    perezosa**.

---

- Por ejemplo:

  Sabemos que la expresión `1/0` da un error de *división por cero*:

  ```python
  >>> 1/0
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  ZeroDivisionError: division by zero
  ```

- Supongamos que tenemos la siguiente definición:

  ```python
  primero = lambda x, y: x
  ```

  de forma que `primero` es una función que simplemente devuelve el primero de
  sus argumentos.

- Es evidente que la función `primero` no necesita evaluar nunca su segundo
  argumento, ya que no lo utiliza (simplemente devuelve el primero de ellos).
  Por ejemplo, `primero(4, 3)` devuelve `3`.

---

- Sabiendo eso... ¿qué valor devolvería la siguiente expresión?

  ```python
  primero(4, 1/0)
  ```

- Curiosamente, el resultado dependerá de si la evaluación es estricta o
  perezosa:

  - **Si es estricta**, el intérprete evaluará todos los argumentos de la
    expresión lambda aunque no se utilicen luego en su cuerpo. Por tanto, al
    evaluar `1/0` devolverá un error.

    Es lo que ocurre cuando se evalúa siguiendo el **orden aplicativo**.

  - En cambio, **si es perezosa**, el intérprete evaluará únicamente aquellos
    argumentos que se usen en el cuerpo de la expresión lambda, y en este caso
    sólo se usa el primero, así que dejará sin evaluar el segundo, no dará
    error y devolverá directamente `4`.

    Es lo que ocurre cuando se evalúa siguiendo el **orden normal**:

    ```python
    primero(4, 1/0) = (lambda x, y: x)(4, 1/0) = (4) = 4
    ```

---

- En **Python** la evaluación es **estricta**, salvo excepciones que veremos.

- De hecho, la mayoría de los lenguajes de programación se basan en la
  evaluación estricta y el paso de argumentos por valor (por lo que siguen el
  orden aplicativo).

- **Haskell**, por ejemplo, es un lenguaje funcional puro que se basa en la
  evaluación perezosa y sigue el orden normal.

- Todo tiene ventajas e inconvenientes.

## Composición de funciones

- Podemos crear una función que use otra función. Por ejemplo, para calcular el
  área de un círculo usamos otra función que calcule el cuadrado de un número:

  ```python
  cuadrado = lambda x: x * x
  area = lambda r: 3.1416 * cuadrado(r)
  ```

- La expresión `area(12)` se evaluaría así según el *orden aplicativo*:

  ```python
  area(12)                                         # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(12)           # definición de cuadrado
  = (lambda r: 3.1416 * (lambda x: x * x)(r))(12)  # aplicación
  = (3.1416 * (lambda x: x * x)(12))               # aplicación
  = (3.1416 * (12 * 12))                           # aritmética
  = 452.3904
  ```

---

- Y según el *orden normal*:

  ```python
  area(12)                                # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(12)  # aplicación
  = (3.1416 * cuadrado(12))               # definición de cuadrado
  = (3.1416 * (lambda x: x * x)(12))      # aplicación
  = (3.1416 * (12 * 12))                  # aritmética
  = 452.3904
  ```

# Tipos de datos compuestos

## Cadenas

## Listas

# Computabilidad

## Funciones y procesos

- Los **procesos** son entidades abstractas que habitan los ordenadores.

- Conforme van evolucionando, los procesos manipulan otras entidades abstractas
  llamadas **datos**.

- La evolución de un proceso está dirigida por un patrón de reglas llamada
  **programa**.

- Los programadores crean programas para dirigir a los procesos.

- Es como decir que los programadores son magos que invocan a los espíritus del
  ordenador con sus conjuros.

---

- Una función describe la evolución local de un **proceso**.

- En cada paso se calcula el siguiente estado del proceso basándonos en el
  estado actual y en las reglas definidas por la función.

- Nos gustaría ser capaces de visualizar y de realizar afirmaciones sobre el
  comportamiento global del proceso cuya evolución local está definida por la
  función.

- Esto, en general, es muy difícil, pero al menos vamos a describir algunos de
  los modelos típicos de evolución de los procesos.

## Funciones recursivas

### Recursividad lineal

#### Procesos lineales recursivos

#### Procesos lineales iterativos

### Recursividad en árbol

## Un lenguaje Turing-completo

# Funciones de orden superior

## `map()`

## `filter()`

## `reduce()`

