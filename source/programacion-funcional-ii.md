---
title: Programación funcional II
author: Ricardo Pérez López
!DATE
nocite: |
  @abelson_structure_1996
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
  !NT(expr_lambda) ::=  !T(lambda) [!NT(lista_parámetros)]!T(:) !NT(expresión)
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

- Recordemos que *aplicar* una función a unos argumentos produce el valor que
  la función asocia a esos argumentos en el conjunto imagen.

- Por ejemplo, la aplicación de la función $max$ sobre los argumentos $3$ y
  $5$ se escribe como $max(3, 5)$ y eso denota el valor $5$.

- Igualmente, la aplicación de una expresión lambda como

  ```python
  lambda x, y: x + y
  ```

  sobre los argumentos `4` y `3` se representa así:

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

#### Llamadas a funciones

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

- Cuando aplicamos a sus argumentos una función así definida también podemos
  decir que estamos **invocando** o **llamando** a la función. Por ejemplo, en
  `suma(4, 3)` estamos *llamando* a la función `suma`, o hay una *llamada* a la
  función `suma`.

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

  En **Python**, salvo excepciones, los operandos y los argumentos de las
  funciones se evalúan **de izquierda a derecha**.
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
  = (lambda x, y: x + y)(4, 3) * suma(2, 7)  # definición de suma
  = (4 + 3) * suma(2, 7)                     # aplicación a 4, 3
  = 7 * suma(2, 7)                           # aritmética
  = 7 * (lambda x, y: x + y)(2, 7)           # definición de suma
  = 7 * (2 + 7)                              # aplicación a 2, 7
  = 7 * 9                                    # aritmética
  = 63
  ```

### Variables ligadas y libres

- Si un identificador aparece en la lista de parámetros de una expresión
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

### Ámbitos

- Recordemos que el **ámbito de una ligadura** es la porción del programa en la
  que dicha ligadura tiene validez.

- Ampliaremos ahora el concepto de *ámbito* para incluir los aspectos nuevos
  que incorporan las expresiones lambda.

#### Ámbito de una variable ligada

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
  tienen un **ámbito no local** o, a veces, un **ámbito más global**.

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

#### Ámbitos, marcos y entornos

- Recordemos que un marco es un conjunto de ligaduras.

- Y que un entorno es una secuencia de marcos que contienen todas las ligaduras
  validas en un punto concreto del programa.

- Cuando la ejecución del programa entra dentro de un ámbito, **se crea un
  nuevo marco asociado a ese ámbito**.

- Ahora hemos visto que **cada expresión lambda define un nuevo ámbito**.

- Por tanto, cuando se aplica una expresión lambda a unos argumentos, se crea
  un nuevo marco que contiene las ligaduras que define dicha expresión lambda
  con sus argumentos.

- Ese nuevo marco se enlaza con el marco del ámbito que lo contiene (el marco
  más interno *apunta* al más externo), de manera que el último siempre es el
  marco global.

- El marco desaparece cuando el flujo de control del programa se sale del
  ámbito, ya que cada marco va asociado a un ámbito.

---

- Se va formando así una cadena de marcos que representa el **entorno** del
  programa en un punto dado del mismo.

- A partir de ahora ya no vamos a tener un único marco (el *marco global*) sino
  que tendremos, además, al menos uno más cada vez que se aplique una expresión
  lambda a unos argumentos.

- El **ámbito** es un concepto *estático*: es algo que existe y se define
  simplemente leyendo el código del programa, sin tener que ejecutarlo.

- El **marco** es un concepto *dinámico*: es algo que se crea y se destruye a
  medida que vamos entrando o saliendo de un ámbito, y contiene las ligaduras
  propias de un punto concreto del programa.
 
- Por ejemplo:

  ```python
  suma = lambda x, y: x + y
  ```

  la función `suma` define un nuevo ámbito, pero cada vez que se la llama con
  unos argumentos concretos se crea un nuevo marco que liga sus argumentos con
  sus parámetros.

#### Ligaduras *sombreadas*

- ¿Qué ocurre cuando una expresión lambda contiene como parámetros nombres que
  ya están definidos (ligados) en el entorno (en un ámbito más global)?

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  total = (lambda x: x * x)(3)  # Su valor es 9
  ```

- La `x` que aparece en la línea 1 es distinta a la que aparece en la línea 2.

- El identificador `x` que aparece en el cuerpo de la expresión
  lambda **hace referencia al parámetro `x` de la expresión lambda**, y **no**
  al identificador `x` que está fuera de la expresión lambda (y que aquí está
  ligado al valor `4`).

- En este caso, decimos que **el parámetro `x` _hace sombra_** al identificador
  `x` global, y decimos que ese identificador está **sombreado** o que su
  ligadura está **sombreada**.

---

- Que el parámetro haga sombra al identificador de fuera significa que no
  podemos acceder a ese identificador externo desde el cuerpo de la expresión
  lambda como si fuera una variable libre.

- Si necesitáramos acceder al valor de la `x` que está fuera de la expresión
  lambda, lo que podemos hacer es **cambiar el nombre** al parámetro `x`. Por
  ejemplo:

  ```{.python .number-lines}
  x = 4
  total = (lambda w: w * x)(3)  # Su valor es 12
  ```

  Así, tendremos en la expresión lambda una variable ligada (el parámetro `w`)
  y una variable libre (el identificador `x` ligado en el ámbito global) al que
  ahora sí podemos acceder al no estar sombreada.

#### Renombrado de parámetros

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

#### Expresiones lambda y entornos

- Para encontrar el valor de un identificador en el entorno, buscamos **en el
  primer marco del entorno** una ligadura para ese identificador, y si no la
  encontramos, **vamos subiendo por la cadena de marcos** hasta encontrarla. Si
  no aparece en ningún marco, querrá decir que el identificador no está ligado
  (o que su ligadura está fuera del entorno, en otro ámbito).

- Debemos tener en cuenta también, por tanto, las posibles **variables
  sombreadas** que puedan aparecer.

  Si un identificador en un ámbito más local *hace sombra* a otro en un
  ámbito más global, al buscar una ligadura en la cadena de marcos (en el
  entorno) se encontrará primero la ligadura más local, ignorando las otras.
  
---

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  z = 1
  suma = (lambda x, y: x + y + z)(8, 12)
  y = 3
  w = 9
  ```

- En cada línea tendríamos los siguientes entornos:

:::: columns

::: column

!DOT(lambda-entorno-linea1.svg)(Entorno en la línea 1)(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    4 [shape = circle]
    x [shape = plaintext, fillcolor = transparent, label = "x"]
    x -> 4
}
E [shape = point]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea2.svg)(Entorno en la línea 2)(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    1 [shape = circle]
    4 [shape = circle]
    x [shape = plaintext, fillcolor = transparent, label = "x"]
    z [shape = plaintext, fillcolor = transparent, label = "z"]
    x -> 4
    z -> 1
}
E [shape = point]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

!DOT(lambda-entorno-linea3.svg)(Entorno en la línea 3 fuera de la expresión lambda)(width=25%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    1 [shape = circle]
    4 [shape = circle]
    x [shape = plaintext, fillcolor = transparent, label = "x"]
    z [shape = plaintext, fillcolor = transparent, label = "z"]

    suma [shape = plaintext, fillcolor = transparent, label = "suma"]
    suma -> lambda
    x -> 4
    z -> 1
}
E [shape = point]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

&nbsp;

!DOT(lambda-entorno-linea3-dentro-antes.svg)(Entorno en la línea 3 en el cuerpo de la expresión lambda, **antes** de aplicar los argumentos)(width=50%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x"]
xl [shape = plaintext, fillcolor = transparent, label = "x"]
yl [shape = plaintext, fillcolor = transparent, label = "y"]
z [shape = plaintext, fillcolor = transparent, label = "z"]
suma [shape = plaintext, fillcolor = transparent, label = "suma"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    suma -> lambda
    x -> 4
    z -> 1
}
subgraph cluster1 {
    label = "Marco de lambda"
    bgcolor = white
    xl -> xl
    yl -> yl
}
xl -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = point]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!DOT(lambda-entorno-linea3-dentro-despues.svg)(Entorno en la línea 3 en el cuerpo de la expresión lambda, **después** de aplicar los argumentos)(width=50%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR, splines = ortho]
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
8 [shape = circle]
12 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x"]
xl [shape = plaintext, fillcolor = transparent, label = "x"]
yl [shape = plaintext, fillcolor = transparent, label = "y"]
z [shape = plaintext, fillcolor = transparent, label = "z"]
suma [shape = plaintext, fillcolor = transparent, label = "suma"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    suma -> lambda
    x -> 4
    z -> 1
}
subgraph cluster1 {
    label = "Marco de lambda"
    bgcolor = white
    xl -> 8
    yl -> 12
}
8 -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = point]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

!DOT(lambda-entorno-linea4.svg)(Entorno en la línea 4)(width=40%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    21 [shape = circle];
    1 [shape = circle];
    3 [shape = circle];
    4 [shape = circle];
    x [shape = plaintext, fillcolor = transparent]
    z [shape = plaintext, fillcolor = transparent]
    suma [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
    x -> 4
    y -> 3
    z -> 1
    suma -> 21
}
E [shape = point]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea5.svg)(Entorno en la línea 5)(width=40%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    21 [shape = circle];
    1 [shape = circle];
    3 [shape = circle];
    4 [shape = circle];
    9 [shape = circle];
    x [shape = plaintext, fillcolor = transparent]
    z [shape = plaintext, fillcolor = transparent]
    suma [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
    w [shape = plaintext, fillcolor = transparent]
    x -> 4
    y -> 3
    z -> 1
    suma -> 21
    w -> 9
}
E [shape = point]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

#### Evaluación de expresiones lambda con entornos

- Para que una expresión lambda funcione, sus variables libres deben
  estar ligadas a algún valor en el entorno **en el momento de _evaluar_ una
  aplicación de la expresión lambda sobre unos argumentos**.

- Por ejemplo:

  ```python
  >>> prueba = lambda x, y: x + y + z  # aquí no da error
  >>> prueba(4, 3)                     # aquí sí
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "<stdin>", line 1, in <lambda>
  NameError: name 'z' is not defined
  ```

  da error porque `z` no está definido (no está ligado a ningún valor en el
  entorno).

---

- En cambio:

  ```{.python .number-lines}
  >>> prueba = lambda x, y: x + y + z
  >>> z = 9
  >>> prueba(4, 3)
  16
  ```

  sí funciona (y devuelve `16`) porque en el momento de evaluar la expresión
  lambda (en la línea 3) el identificador `z` está ligado a un valor en el
  entorno (en este caso, `9`).

- Observar que no es necesario que las variables libres estén ligadas en el
  entorno cuando *se crea* la expresión lambda, sino cuando **se evalúa el
  cuerpo de la expresión lambda**, o sea, cuando se aplica la expresión lambda
  a unos argumentos.

### Pureza

- Una expresión lambda cuyo cuerpo sólo contiene variables ligadas, es
  una expresión cuyo valor sólo va a depender de los argumentos que se usen
  cuando se aplique la expresión lambda.

- En cambio, el valor de una expresión lambda que contenga variables
  libres dependerá no sólo de los valores de sus argumentos, sino también de
  los valores a los que estén ligadas las variables libres al evaluar la
  expresión lambda.

- En el ejemplo anterior tenemos una expresión que no es pura, ya que su valor
  depende de una variable libre (`z`):

  ```python
  >>> prueba = lambda x, y: x + y + z
  >>> z = 9
  >>> prueba(4, 3)
  16
  ```

---

- En este otro ejemplo, escribimos una expresión lambda que calcula la suma de
  tres números a partir de otra expresión lambda que calcula la suma de dos
  números:

  ```python
  suma = lambda x, y: x + y
  suma3 = lambda x, y, z: suma(x, y) + z
  ```

  En este caso, hay un identificador (`suma`) que no aparece en la lista de
  parámetros de la expresión lambda `suma3`, por lo que es una variable libre.

  En consecuencia, el valor de dicha expresión lambda dependerá de lo que valga
  `suma` en el entorno actual.

---

- Una expresión lambda es **pura** cuando su valor depende, únicamente, del
  valor de sus parámetros.

- También se dice que una expresión lambda que contiene sólo variables ligadas
  es **más pura** que otra cuyo valor depende, además, de variables libres.

- En cuanto a *grados de pureza*, podemos decir que hay **más pureza** si una
  variable libre representa una **función** a aplicar en el cuerpo de la
  expresión lambda, que si representa cualquier otro tipo de valor.

- En el ejemplo anterior, tenemos que la expresión lambda `suma3`, sin ser
  *totalmente pura*, a efectos prácticos se la puede considerar **pura**, ya
  que su única variable libre se usa como una **función**, y las funciones
  tienden a no cambiar durante la ejecución del programa, al contrario que los
  demás tipos de valores.

---

- Por ejemplo, las siguientes expresiones lambda están ordenadas de mayor a
  menor pureza, siendo la primera totalmente **pura**:

  ```python
  # producto es una expresión lambda totalmente pura:
  producto = lambda x, y: x * y
  # cuadrado es casi pura; a efectos prácticos se la puede
  # considerar pura ya que sus variables libres (en este
  # caso, sólo una: producto) son funciones:
  cuadrado = lambda x: producto(x, x)
  # suma es impura, porque su variable libre no es una función:
  suma = lambda x, y: x + y + z
  ```

## Estrategias de evaluación

- A la hora de evaluar una expresión (cualquier expresión) existen varias
  **estrategias** diferentes que se pueden adoptar.

- Cada lenguaje implementa sus propias estrategias de evaluación que están
  basadas en las que vamos a ver aquí.

- Básicamente se trata de decidir, en cada paso de reducción, qué sub-expresión
  hay que reducir, en función de:

  - El orden (de fuera adentro o de dentro afuera).

  - La necesidad o no de evaluar dicha sub-expresión.

### Orden de evaluación

- En un lenguaje de programación funcional puro se cumple la **transparencia
  referencial**, según la cual el valor de una expresión depende sólo del valor
  de sus sub-expresiones (también llamadas *redexes*).

- Pero eso también implica que **no importa el orden en el que se evalúen las
  sub-expresiones**: el resultado debe ser siempre el mismo.

- Gracias a ello podemos usar nuestro modelo de sustitución como modelo
  computacional.

- Hay dos **estrategias básicas de evaluación**:

  - **Orden aplicativo**: reducir siempre el *redex* más **interno** (y más a
    la izquierda).

  - **Orden normal**: reducir siempre el *redex* más **externo** (y más a la
    izquierda).

- **Python usa el orden aplicativo**, salvo excepciones.

#### Orden aplicativo

- El **orden aplicativo** consiste en evaluar las expresiones *de dentro
  afuera*, es decir, empezando siempre por el *redex* más **interno** y más a
  la izquierda.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por valor**.

- Ejemplo:

  ```python
  cuadrado = lambda x: x * x
  ```

  Según el orden aplicativo, la expresión `cuadrado(3 + 4)` se reduciría así:

  ```python
  cuadrado(3 + 4)
  = cuadrado(7)              # aritmética
  = (lambda x, y: x * x)(7)  # definición de cuadrado
  = (7 * 7)                  # aplicación a 7
  = 49                       # aritmética
  ```

  alcanzando la forma normal en 4 pasos de reducción.

#### Orden normal

- El **orden normal** consiste en evaluar las expresiones *de fuera adentro*,
  es decir, empezando siempre por el *redex* más **externo** y más a la
  izquierda.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por nombre**.

- Ejemplo:

  ```python
  cuadrado = lambda x: x * x
  ```

  Según el orden normal, la expresión `cuadrado(3 + 4)` se reduciría así:

  ```python
  cuadrado(3 + 4)
  = (lambda x, y: x * x)(3 + 4)  # definición de cuadrado
  = ((3 + 4) * (3 + 4))          # aplicación a (3 + 4)
  = 7 * (3 + 4)                  # aritmética
  = 7 * 7                        # aritmética
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
  Por ejemplo, `primero(4, 3)` devuelve `4`.

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

- Hay un resultado teórico que avala lo que acabamos de observar:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Teorema:**

  Si una expresión tiene forma normal, el orden normal de evaluación conduce
  seguro a la misma.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En cambio, el orden aplicativo es posible que no encuentre la forma normal de
  la expresión.

---

- En **Python** la evaluación es **estricta**, salvo algunas excepciones:

  - El operador ternario:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~
    !NT(expr_condicional) ::= !NT(valor_si_cierto) !T(if) !NT(condición) !T(else) !NT(valor_si_falso)
    ~~~~~~~~~~~~~~~~~~~~~

    evalúa perezosamente !NT(valor_si_cierto) y !NT(valor_si_falso).

  - Los operadores lógicos `and` y `or` también son perezosos (se dice que
    evalúan **en cortocircuito**):

    - `True or x` siempre es igual a `True`.

    - `False and x` siempre es igual a `False`.

    En ambos casos no es necesario evaluar `x`.

- La mayoría de los lenguajes de programación se basan en la evaluación
  estricta y el paso de argumentos por valor (siguen el orden aplicativo).

- **Haskell**, por ejemplo, es un lenguaje funcional puro que se basa en la
  evaluación perezosa y sigue el orden normal.

## Composición de funciones

- Podemos crear una función que use otra función. Por ejemplo, para calcular el
  área de un círculo usamos otra función que calcule el cuadrado de un número:

  ```python
  cuadrado = lambda x: x * x
  area = lambda r: 3.1416 * cuadrado(r)
  ```

- La expresión `area(11 + 1)` se evaluaría así según el *orden aplicativo*:

  ```{.python .number-lines}
  area(11 + 1)                                     # aritmética
  = area(12)                                       # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(12)           # definición de cuadrado
  = (lambda r: 3.1416 * (lambda x: x * x)(r))(12)  # aplicación
  = (3.1416 * (lambda x: x * x)(12))               # aplicación
  = (3.1416 * (12 * 12))                           # aritmética
  = (3.1416 * 144)                                 # aritmética
  = 452.3904
  ```

---

- En detalle:

  - **Línea 1**: Se evalúa primero el argumento.

  - **Línea 3**: El *redex* más interno es `r`, pero no puede reducirse más en
    este momento. El siguiente más interno es `cuadrado(r)`; para evaluarlo hay
    que reescribir `cuadrado` con su definición.

  - **Línea 4**: El *redex* más interno es la aplicación del `lambda` derecho
    con el argumento `r`, pero éste aún no está evaluado ni se puede evaluar
    ahora mismo, así que no es posible reducir la aplicación. El siguiente más
    interno es el `*` sobre `3.1416`, pero el otro operando (el `lambda`
    derecho) aún no está evaluado ni se puede evaluar, así que el *redex* que
    queda es la aplicación del primer `lambda` sobre su argumento `12`.

  - **Línea 5**: El *redex* más interno es la aplicación del `lambda` derecho
    con el argumento `12`, que ahora sí se puede hacer porque el argumento está
    evaluado.

---

- La expresión `area(11 + 1)` se evaluaría así según el *orden normal*:

  ```{.python .number-lines}
  area(11 + 1)                                # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(11 + 1)  # aplicación
  = (3.1416 * cuadrado(11 + 1))               # definición de cuadrado
  = (3.1416 * (lambda x: x * x)(11 + 1))      # aplicación
  = (3.1416 * ((11 + 1) * (11 + 1)))          # aritmética
  = (3.1416 * (12 * (11 + 1)))                # aritmética
  = (3.1416 * (12 * 12))                      # aritmética
  = (3.1416 * 144)                            # aritmética
  = 452.3904
  ```

- En ambos casos (orden aplicativo y orden normal) se obtiene el mismo
  resultado.

---

- En detalle:

  - **Línea 1**: Se evalúa el *redex* más externo, que es `area` (se reescribe
    con su definición).

  - **Línea 2**: El *redex* más externo es la aplicación de la expresión
    `lambda` a su argumento `11 + 1`.

  - **Línea 3**: El *redex* más externo es el `*`, pero para evaluarlo hay que
    evaluar primero todos sus argumentos, por lo que ahora hay que evaluar
    `cuadrado`, reescribiéndolo con su definición.

  - **Línea 4**: Igual que en la línea 3, para poder evaluar el `*` más externo
    hay que evaluar primero la aplicación del `lambda` sobre su argumento `11 +
    1`.

# Computabilidad

## Funciones y procesos

- Los **procesos** son entidades abstractas que habitan los ordenadores.

- Conforme van evolucionando, los procesos manipulan otras entidades abstractas
  llamadas **datos**.

- La evolución de un proceso está dirigida por un patrón de reglas llamada
  **programa**.

- Los programadores crean programas para **dirigir** a los procesos.

- Es como decir que los programadores son magos que invocan a los espíritus del
  ordenador con sus conjuros.

---

- Una **función** describe la *evolución local* de un **proceso**.

- En cada paso se calcula el *siguiente estado* del proceso basándonos en el
  estado actual y en las reglas definidas por la función.

- Nos gustaría ser capaces de visualizar y de realizar afirmaciones sobre el
  comportamiento global del proceso cuya evolución local está definida por la
  función.

- Esto, en general, es muy difícil, pero al menos vamos a describir algunos de
  los modelos típicos de evolución de los procesos.

## Funciones recursivas


### Definición

- Una **función recursiva** es aquella que se define en términos de sí misma.

- En general, eso quiere decir que la definición de la función contiene una o
  varias referencias a ella misma y que, por tanto, se llama a sí misma dentro
  de su cuerpo.

- Las definiciones recursivas son el mecanismo básico para ejecutar
  **repeticiones de instrucciones** en un lenguaje de programación funcional.

- Por ejemplo:

  **GNU** significa **GNU No es Unix**.

  Por tanto, GNU = GNU No es Unix = GNU No es Unix No es Unix...

  Y así hasta el infinito.

### Casos base y casos recursivos

- Resulta importante que una definición recursiva se detenga alguna vez y
  proporcione un resultado, ya que si no, no sería útil (tendríamos lo que se
  llama una **recursión infinita**).

- Para ello, en algún momento, la recursión debe alcanzar un punto en el que la
  función no se llame a sí misma.

- La función, en cada paso recursivo, debe ir acercándose cada vez más a ese
  punto.

- A ese punto o puntos en los que la función recursiva no se llama a sí misma,
  se les denomina **casos base**.

- Es decir: la función recursiva, ante ciertos valores de sus argumentos, debe
  devolver directamente un valor y no llamarse de nuevo recursivamente.

- Los demás casos, que sí provocan llamadas recursivas, se denominan **casos
  recursivos**.

### El factorial

- El ejemplo más típico de función recursiva es el **factorial**.

- El factorial de un número natural $n$ se representa $n!$ y se define como el
  producto de todos los números desde 1 hasta $n$:
  $$n! = n\cdot(n-1)\cdot(n-2)\cdot\ldots\cdot1$$

  Por ejemplo:
  $$6! = 6\cdot5\cdot4\cdot3\cdot2\cdot1 = 720$$

- Pero para calcular $6!$ también se puede calcular $5!$ y después multiplicar
  el resultado por 6, ya que:
  $$6! = 6\cdot\overbrace{5\cdot4\cdot3\cdot2\cdot1}^{5!}$$
  $$6! = 6\cdot5!$$

- Por tanto, el factorial se puede definir de forma **recursiva**.

---

- Tenemos el **caso recursivo**, pero necesitamos un **caso base** para evitar
  que la recursión se haga *infinita*.

- El caso base del factorial se obtiene sabiendo que el factorial de 0 es
  directamente 1 (no hay que llamar al factorial recursivamente):
  $$0! = 1$$

- Combinando ambos casos tendríamos:

  $$n! = \begin{cases}
           1 & \text{si } n = 0 \text{\quad(caso base)} \\
           n\cdot(n-1)! & \text{si } n > 0 \text{\quad(caso recursivo)}
         \end{cases}$$

### Recursividad lineal

- Una función tiene **recursividad lineal** si cada llamada a la función
  recursiva genera, como mucho, otra llamada recursiva a la misma función.

- El factorial definido en el ejemplo anterior es un caso típico de
  recursividad lineal.

#### Procesos lineales recursivos

- La forma más directa y sencilla de definir una función que calcule el
  factorial de un número a partir de su definición recursiva podría ser la
  siguiente:

  ```python
  factorial = lambda n: 1 if n == 0 else n * factorial(n - 1)
  ```

- Utilizaremos el modelo de sustitución para observar el funcionamiento de esta
  función al calcular $6!$:

  ```python
  factorial(6)
  = (6 * factorial(5))
  = (6 * (5 * factorial(4)))
  = (6 * (5 * (4 * factorial(3))))
  = (6 * (5 * (4 * (3 * factorial(2)))))
  = (6 * (5 * (4 * (3 * (2 * factorial(1))))))
  = (6 * (5 * (4 * (3 * (2 * (1 * factorial(0)))))))
  = (6 * (5 * (4 * (3 * (2 * (1 * 1))))))
  = (6 * (5 * (4 * (3 * (2 * 1)))))
  = (6 * (5 * (4 * (3 * 2))))
  = (6 * (5 * (4 * 6)))
  = (6 * (5 * 24))
  = (6 * 120)
  = 720
  ```

---

- Podemos observar un perfil de **expansión** seguido de una **contracción**:

  - La **expansión** ocurre conforme el proceso construye una cadena de
    operaciones a realizar *posteriormente* (en este caso, una cadena de
    multiplicaciones).

  - La **contracción** se realiza conforme se van ejecutando realmente las
    multiplicaciones.

- Llamaremos **proceso recursivo** a este tipo de proceso caracterizado por una
  cadena de **operaciones pendientes de completar**.

- Para poder ejecutar este proceso, el intérprete necesita **memorizar**, en
  algún lugar, un registro de las multiplicaciones que se han dejado para más
  adelante.

- En el cálculo de $n!$, la longitud de la cadena de operaciones pendientes (y,
  por tanto, la información que necesita almacenar el intérprete), crece
  *linealmente* con $n$, al igual que el número de pasos de reducción.

  - A este tipo de procesos lo llamaremos **proceso recursivo _lineal_**.

#### Procesos lineales iterativos

- A continuación adoptaremos un enfoque diferente.

- Podemos mantener un producto acumulado y un contador desde $n$ hasta 1, de
  forma que el contador y el producto cambien de un paso al siguiente según la
  siguiente regla:

  $$\begin{cases}
      acumulado \leftarrow acumulado \cdot contador \\
      contador \leftarrow contador - 1
    \end{cases}$$

- Su traducción a Python podría ser la siguiente, usando una función auxiliar
  `fact_iter`:

  ```python
  fact_iter = lambda cont, acc: acc if cont == 0 else \
                                fact_iter(cont - 1, cont * acc)
  fact = lambda n: fact_iter(n, 1)
  ```

---

- Al igual que antes, usaremos el modelo de sustitución para visualizar el
  proceso del cálculo de $6!$:

  ```python
  fact(6)
  = fact_iter(6, 1)
  = fact_iter(5, 6)
  = fact_iter(4, 30)
  = fact_iter(3, 120)
  = fact_iter(2, 360)
  = fact_iter(1, 720)
  = fact_iter(0, 720)
  = 720
  ```

- Este proceso no tiene expansiones ni contracciones ya que, en cada instante,
  toda la información que se necesita almacenar es el valor actual de los
  parámetros `cont` y `acc`, por lo que el tamaño de la memoria necesaria es
  constante.

- A este tipo de procesos lo llamaremos **proceso iterativo**.

- El número de pasos necesarios para calcular $n!$ usando esta función crece
  *linealmente* con $n$.

  - A este tipo de procesos lo llamaremos **proceso iterativo _lineal_**.

---

-----------------------------------------------------------------------------
Tipo de proceso           Número de               Memoria necesaria 
                          reducciones        
------------------------- --------------------    ---------------------------
Recursivo                 Proporcional a `n`      Proporcional a `n`

Iterativo                 Proporcional a `n`      Constante
-----------------------------------------------------------------------------

<br>

-----------------------------------------------------------------------------
Tipo de proceso           Número de               Memoria necesaria 
                          reducciones        
------------------------- --------------------    ---------------------------
Recursivo lineal          Linealmente \           Linealmente \
                          proporcional a `n`      proporcional a `n`

Iterativo lineal          Linealmente \
                          proporcional a `n`      Constante
-----------------------------------------------------------------------------

---

- En general, un **proceso iterativo** es aquel que está definido por una serie
  de **variables de estado** junto con una **regla** fija que describe cómo
  actualizar dichas variables conforme cambia el proceso de un estado al
  siguiente.

- La **diferencia entre los procesos recursivo e iterativo** se puede describir
  de esta otra manera:

  - En el **proceso iterativo**, las variables ligadas dan una descripción
    completa del estado del proceso en cada instante.

    Así, si parásemos el cálculo entre dos pasos, lo único que necesitaríamos
    hacer para seguir con el cálculo es darle al intérprete el valor de los dos
    parámetros.
    
  - En el **proceso recursivo**, el intérprete tiene que mantener cierta
    información *oculta* que no está almacenada en ningún parámetro y que
    indica en qué punto se encuentra el proceso dentro de la cadena de
    operaciones pendientes.

---

- No debe confundirse un **proceso recursivo** con una **función recursiva**:

  - Cuando hablamos de *función recursiva* nos referimos al hecho sintáctico de
    que la definción de la función hace referencia a sí misma (directa o
    indirectamente).

  - Cuando hablamos de *proceso recursivo* nos referimos a la forma en como se
    desenvuelve la ejecución de la función.

- Puede parecer extraño que digamos que una función recursiva (por ejemplo,
  `fact_iter`) genera un proceso iterativo.

  Sin embargo, el proceso es realmente iterativo porque su estado está definido
  completamente por dos variables ligadas, y para ejecutar el proceso sólo se
  necesita almacenar esas dos variables.

### Recursividad en árbol

- La **recursividad en árbol** se produce cuando la función tiene
  **recursividad múltiple**.

- Una función tiene **recursividad múltiple** cuando una llamada a la función
  recursiva puede generar más de una llamada recursiva a la misma función.

- El ejemplo clásico es la función que calcula los términos de la **sucesión de
  Fibonacci**.

- La sucesión comienza con los números 0 y 1, y a partir de éstos, cada
  término es la suma de los dos anteriores:

  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, ...

---

- Podemos definir una función que devuelva el $n$-ésimo término de la sucesión
  de Fibonacci:

  $$fib(n) = \begin{cases}
               0 & \text{si } n = 0 \text{\quad (caso base)} \\
               1 & \text{si } n = 1 \text{\quad (caso base)} \\
               fib(n - 1) + fib(n - 2) & \text{si } n > 1 \text{\quad (caso recursivo)}
             \end{cases}$$

- Que traducida a Python sería:

  ```python
  fib = lambda n: 0 if n == 0 else 1 if n == 1 else fib(n - 1) + fib(n - 2)
  ```

  o bien:

  ```python
  fib = lambda n: 0 if n == 0 else \
                  1 if n == 1 else \
                  fib(n - 1) + fib(n - 2)
  ```

---

- Si vemos el perfil de ejecución de `fib(5)`, vemos que:

  - Para calcular `fib(5)`, antes debemos calcular `fib(4)` y `fib(3)`.

  - Para calcular `fib(4)`, antes debemos calcular `fib(3)` y `fib(2)`.

  - Así sucesivamente hasta poner todo en función de `fib(0)` y `fib(1)`, que
    se pueden calcular directamente (son los casos base).

- En general, el proceso resultante parece un árbol.

---

!DOT(arbol-fibonacci.svg)()()(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [shape = plaintext, fillcolor = transparent]
rankdir = TB
fib5[label = "fib(5)"]
fib4[label = "fib(4)"]
fib3_1[label = "fib(3)"]
fib3_2[label = "fib(3)"]
fib2_1[label = "fib(2)"]
fib2_2[label = "fib(2)"]
fib2_3[label = "fib(2)"]
fib1_1[label = "fib(1)"]
fib1_2[label = "fib(1)"]
fib1_3[label = "fib(1)"]
fib1_4[label = "fib(1)"]
fib1_5[label = "fib(1)"]
fib0_1[label = "fib(0)"]
fib0_2[label = "fib(0)"]
fib0_3[label = "fib(0)"]
u1[label = "1", shape = circle, width = 0.3, fixedsize = shape]
u2[label = "1", shape = circle, width = 0.3, fixedsize = shape]
u3[label = "1", shape = circle, width = 0.3, fixedsize = shape]
u4[label = "1", shape = circle, width = 0.3, fixedsize = shape]
u5[label = "1", shape = circle, width = 0.3, fixedsize = shape]
c1[label = "0", shape = circle, width = 0.3, fixedsize = shape]
c2[label = "0", shape = circle, width = 0.3, fixedsize = shape]
c3[label = "0", shape = circle, width = 0.3, fixedsize = shape]
fib5 -> fib4, fib3_2
fib4 -> fib3_1, fib2_2
fib3_1 -> fib2_1, fib1_2
fib2_1 -> fib1_1, fib0_1
fib1_1 -> u1
fib0_1 -> c1
fib1_2 -> u2
fib2_2 -> fib1_3, fib0_2
fib1_3 -> u3
fib0_2 -> c2
fib3_2 -> fib2_3, fib1_5
fib2_3 -> fib1_4, fib0_3
fib1_4 -> u4
fib0_3 -> c3
fib1_5 -> u5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- La función anterior es un buen ejemplo de recursión en árbol, pero desde
  luego es un método *horrible* para calcular los números de Fibonacci, por la
  cantidad de **operaciones redundantes** que efectúa.

- Para tener una idea de lo malo que es, se puede observar que $fib(n)$ crece
  exponencialmente en función de $n$.

- Por lo tanto, el proceso necesita una cantidad de tiempo que crece
  **exponencialmente** con $n$.

- Por otro lado, el espacio necesario sólo crece **linealmente** con $n$,
  porque en un cierto momento del cálculo sólo hay que memorizar los nodos que
  hay por encima.

- En general, en un proceso recursivo en árbol el tiempo de ejecución crece con
  el número de nodos mientras que el espacio necesario crece con la altura
  máxima del árbol.

---

- Se puede construir un **proceso iterativo** para calcular los números de
  Fibonacci.

- La idea consiste en usar dos variables de estado `a` y `b` (con valores
  iniciales `1` y `0`, respectivamente) y aplicar repetidamente la siguiente
  transformación:

  $$\begin{cases}
      a \leftarrow a + b \\
      b \leftarrow a
    \end{cases}$$

- Después de $n$ pasos, `a` y `b` contendrán, respectivamente, $fib(n + 1)$ y
  $fib(n)$.

- En Python sería:

  ```python
  fib_iter = lambda cont, a, b: b if cont == 0 else fib_iter(cont - 1, a + b, a)
  fib = lambda n: fib_iter(n , 1, 0)
  ```

- Esta función genera un proceso iterativo lineal, por lo que es mucho más
  eficiente.

## La pila de control

- La **pila de control** es una estructura de datos que utiliza el intérprete
  para llevar la cuenta de las **llamadas _activas_** en un determinado
  momento, incluyendo el valor de sus parámetros y el punto de retorno al que
  debe devolverse el control cuando finalice la ejecución de la función.

  - Las **llamadas activas** son aquellas llamadas a funciones que aún no han
    terminado de ejecutarse.

- La pila de control es, básicamente, un **almacén de entornos**.

- Cada vez que se hace una nueva llamada a una función, **su marco**
  correspondiente **se almacena en la cima de la pila** sobre los demás marcos
  que pudiera haber.

- Ese marco es el primero de la cadena de marcos que forman el entorno de la
  función, pero en general no es necesario almacenar toda la cadena en la pila
  (basta con su primer marco).

---

- El intérprete puede, además, almacenar ahí cualquier otra información que
  necesite para gestionar las llamadas a funciones.

- El marco de la función, junto con toda esa información adicional, se denomina
  **registro de activación**.

- Por tanto, **la pila de control almacena registros de activación**.

- Cada llamada activa está representada por su correspondiente registro de
  activación en la pila.

- En cuanto la llamada finaliza, su registro de activación se saca de la pila y
  se transfiere el control a la llamada que está inmediatamente debajo (si es
  que hay alguna).
 
---

- Supongamos el siguiente código:

:::: columns

::: column

```python
g = 1
uno = lambda x: 1 + dos(2 * x, 4)
dos = lambda y, z: tres(y + z + g)
tres = lambda w: "W vale " + str(w)
uno(3)
```

:::

::: column

!DOT(pila-control.svg)(Pila de control con la función `tres` activada)(width=100%)(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = LR
compound = true
node [shape = record]
pila [label = "<f3>Tres|<f2>Dos|<f1>Uno", xlabel = "Pila de\ncontrol"]
subgraph cluster1 {
    label = "Marco de uno"
    bgcolor = "white"
    node [fontname = "monospace"]
    3 [shape = circle]
    x [shape = plaintext, fillcolor = transparent]
    x -> 3
}
subgraph cluster2 {
    label = "Marco de dos"
    bgcolor = "white"
    node [fontname = "monospace"]
    6 [shape = circle]
    y [shape = plaintext, fillcolor = transparent]
    4 [shape = circle]
    z [shape = plaintext, fillcolor = transparent]
    y -> 6
    z -> 4
}
subgraph cluster3 {
    label = "Marco de tres"
    bgcolor = "white"
    node [fontname = "monospace"]
    w [shape = plaintext, fillcolor = transparent]
    11 [shape = circle]
    w -> 11
}
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    1 [shape = circle]
    g [shape = plaintext, fillcolor = transparent]
    g -> 1
}
pila:f1 -> x [lhead = cluster1, minlen = 2]
pila:f2 -> y [lhead = cluster2]
pila:f3 -> w [lhead = cluster3]
3 -> g [lhead = cluster0, ltail = cluster1]
6 -> g [lhead = cluster0, ltail = cluster2]
11 -> g [lhead = cluster0, ltail = cluster3]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Hemos dicho que habrá un registro de activación por cada nueva llamada que se
  realice a una función, y que ese registro se mantendrá en la pila hasta que
  la llamada finalice.

- Por tanto, en el caso de una función recursiva, tendremos un registro de
  activación por cada llamada recursiva.

:::: columns

::: column

```python
fact = lambda n: 1 if n == 0 else \
                 n * fact(n - 1)
fact(4)
```

:::

::: column

!DOT(pila-control-factorial.svg)(Pila de control de `fact` tras tres activaciones desde `fact(4)`)(width=100%)(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = LR
compound = true
node [shape = record]
pila [label = "<f3>fact(2)|<f2>fact(3)|<f1>fact(4)", xlabel = "Pila de\ncontrol"]
subgraph cluster1 {
    label = "Marco de fact(4)"
    bgcolor = "white"
    node [fontname = "monospace"]
    4 [shape = circle]
    n4 [shape = plaintext, fillcolor = transparent, label = n]
    n4 -> 4
}
subgraph cluster2 {
    label = "Marco de fact(3)"
    bgcolor = "white"
    node [fontname = "monospace"]
    3 [shape = circle]
    n3 [shape = plaintext, fillcolor = transparent, label = n]
    n3 -> 3
}
subgraph cluster3 {
    label = "Marco de fact(2)"
    bgcolor = "white"
    node [fontname = "monospace"]
    2 [shape = circle]
    n2 [shape = plaintext, fillcolor = transparent, label = n]
    n2 -> 2
}
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    lambda [shape = ellipse]
    fact [shape = plaintext, fillcolor = transparent]
    fact -> lambda
}
pila:f1 -> n4 [lhead = cluster1, minlen = 2]
pila:f2 -> n3 [lhead = cluster2]
pila:f3 -> n2 [lhead = cluster3]
4 -> fact [lhead = cluster0, ltail = cluster1]
3 -> fact [lhead = cluster0, ltail = cluster2]
2 -> fact [lhead = cluster0, ltail = cluster3]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Un lenguaje Turing-completo

- El paradigma funcional que hemos visto hasta ahora (uno que nos permite
  definir funciones, componer dichas funciones y aplicar recursividad, junto
  con el operador ternario condicional) es un lenguaje de programación
  **completo**.

- Decimos que es **Turing completo**, lo que significa que puede computar
  cualquier función que pueda computar una máquina de Turing.

- Como las máquinas de Turing son los ordenadores más potentes que podemos
  construir (ya que describen lo que cualquier ordenador es capaz de hacer),
  esto significa que nuestro lenguaje puede calcular todo lo que pueda calcular
  cualquier ordenador.

# Tipos de datos recursivos

## Cadenas

- Las **cadenas** se pueden considerar **datos recursivos compuestos**, ya que
  podemos decir que toda cadena `c`:

  - o bien es la cadena vacía `''` (*caso base*),
  
  - o bien está formada por dos partes:

    - El **primer carácter** de la cadena, al que se accede mediante `c[0]`.

    - El **resto** de la cadena (al que se accede mediante `c[1:]`), que
      también es una cadena (*caso recursivo*).

- Eso significa que podemos acceder al segundo carácter de la cadena
  (suponiendo que exista) mediante `c[1:][0]`.

  ```python
  cadena = 'hola'
  cadena[0]       # devuelve 'h'
  cadena[1:]      # devuelve 'ola'
  cadena[1:][0]   # devuelve 'o'
  ```

## Listas

- Las **listas** son una generalización de las cadenas.

- Una lista es una **secuencia de elementos** que no tienen por qué ser
  caracteres, sino que cada uno de ellos pueden ser **de cualquier tipo**
  (números, cadenas, booleanos, incluso otras listas).

- Los literales de tipo lista se representan enumerando sus elementos separados
  por comas y encerrados entre corchetes.

- Por ejemplo:

  ```python
  lista = [27, 'hola', True, 73.4, ['a', 'b', 'c'], 99]
  ```

---

- Las listas también pueden verse como un **tipo de datos recursivo**, ya que
  toda lista `l`:

  - o bien es la lista vacía, representada mediante `[]` (*caso base*),

  - o bien está formada por dos partes:

    - El **primer elemento** de la lista (al que se accede mediante `l[0]`),
      que hemos visto que puede ser de cualquier tipo.

    - El **resto** de la lista (al que se accede mediante `l[1:]`), que también
      es una lista (*caso recursivo*).

- Según el ejemplo anterior:

  ```python
  lista = [27, 'hola', True, 73.4, ['a', 'b', 'c'], 99]
  lista[0]       # devuelve 27
  lista[1:]      # devuelve ['hola', True, 73.4, ['a', 'b', 'c'], 99]
  lista[1:][0]   # devuelve 'hola'
  ```

---

- Junto a las operaciones `l[0]` (primer elemento) y `l[1:]` (resto de la
  lista), tenemos también la operación `+` (**concatenación**), al igual que
  ocurre con las cadenas.

- Con la concatenación se pueden crear nuevas listas a partir de otras listas.

- Por ejemplo:

  ```python
  [1, 2, 3] + [4, 5, 6]  # devuelve [1, 2, 3, 4, 5, 6]
  ```

## Rangos

- Un rango es un tipo de dato cuyos valores representan **sencuencias de
  números enteros**.

- Los rangos se crean con la función `range`, cuya sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(rango) ::= !T(range)!T{(}[!NT(inicio)!T(,)] !NT(fin)[!T(,) !NT(paso)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- !NT(inicio), !NT(fin) y !NT(paso) deben ser números enteros.
- Cuando se omite !NT(inicio), se entiende que es `0`.
- El valor de !NT(fin) no se alcanza nunca.
- Cuando !NT(inicio) y !NT(fin) son iguales, representa el *rango vacío*.
- Cuando !NT(inicio) es mayor que !NT(fin), el !NT(paso) debería ser negativo.
  En caso contrario, también representaría el rango vacío.

---

- Ejemplos:

  - `range(10)` representa la secuencia $0, 1, 2, \ldots, 9$

  - `range(3, 10)` representa la secuencia $3, 4, 5, \ldots, 9$

  - `range(0, 10, 2)` representa la secuencia $0, 2, 4, 6, 8$

  - `range(4, 0, -1)` representa la secuencia $4, 3, 2, 1$

  - `range(3, 3)` representa el rango vacío

  - `range(4, 3)` también representa el rango vacío

---

- Los rangos también pueden verse como un **tipo de datos recursivo**, ya que
  todo rango `r`:

  - o bien es el rango vacío (*caso base*),

  - o bien está formado por dos partes:

    - El **primer elemento** del rango (al que se accede mediante `r[0]`),
      que hemos visto que tiene que ser un número entero.

    - El **resto** del rango (al que se accede mediante `r[1:]`), que también
      es un rango (*caso recursivo*).

- Según el ejemplo anterior:

  ```python
  rango = range(4, 7)
  rango[0]       # devuelve 4
  rango[1:]      # devuelve range(5, 7)
  rango[1:][0]   # devuelve 5
  ```

## Conversión a lista

- Las cadenas y los rangos se pueden convertir fácilmente a listas usando la
  función `list`:

:::: columns

::: {.column width=40%}

```python
>>> list('hola')
['h', 'o', 'l', 'a']
>>> list('')
[]
```

:::

::: {.column width=60%}

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

:::

::::

# Funciones de orden superior

## Concepto

- Hemos visto que **las funciones son**, en realidad, **abstracciones** que
  describen operaciones compuestas a realizar sobre ciertos valores sin
  importar cuáles sean esos valores en concreto.

- Por ejemplo, cuando definimos:

  ```python
  cubo = lambda x: x * x * x
  ```

  no estamos hablando del cubo de un número en particular, sino más bien de un
  **método** para calcular el cubo de un número.

- Por supuesto, nos la podemos arreglar sin definir el cubo, escribiendo
  siempre expresiones explícitas (como `3*3*3`, `y*y*y`, etc.) sin usar la
  palabra «cubo», pero eso nos obligaría siempre a expresarnos en términos de
  las operaciones primitivas de nuestro lenguaje (como `*`), en vez de poder
  usar términos de más alto nivel.

  Es decir: **nuestros programas podrían calcular el cubo de un número, pero no
  tendrían la habilidad de expresar el concepto de _elevar al cubo_**.

---

- Una de las habilidades que deberíamos pedir a un lenguaje potente es la
  posibilidad de **construir abstracciones** asignando un nombre a los patrones
  más comunes, y luego trabajar directamente en términos de dichas
  abstracciones.

- Las funciones nos permiten esta habilidad y esa es la razón de que todos los
  lenguajes (salvo los más primitivos) incluyan mecanismos para definir
  funciones.

- Por ejemplo: en el caso anterior, vemos que hay un patrón (multiplicar algo
  por sí mismo tres veces) que se repite con frecuencia, y a partir de él
  construimos una abstracción que asigna un nombre a ese patrón (*elevar al
  cubo*). Esa abstracción la definimos como una función que describe la *regla*
  necesaria para elevar algo al cubo.

---

- Muchas veces observamos el mismo patrón en funciones muy diferentes.

- Para poder abstraer, de nuevo, lo que tienen en común dichas funciones,
  deberíamos ser capaces de manejar funciones que acepten a otras funciones
  como argumentos o que devuelvan otra función como resultado. A estas
  funciones que manejan otras funciones las llamaremos **funciones de orden
  superior**.

---

- Por ejemplo, supongamos las dos funciones siguientes: 

  ```python
  # Suma los enteros comprendidos entre a y b:
  suma_enteros = lambda a, b: 0 if a > b else a + suma_enteros(a + 1, b)

  # Suma los cubos de los enteros comprendidos entre a y b:
  suma_cubos = lambda a, b: 0 if a > b else cubo(a) + suma_enteros(a + 1, b)
  ```

- Estas dos funciones comparten claramente un patrón subyacente común. Se
  diferencian solamente en:

  - El nombre de la función

  - La función de `a` que se utiliza para calcular cada término

- Podríamos haber escrito las funciones anteriores rellenando los «casilleros»
  del siguiente *patrón general*:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(nombre) = !T(lambda) a, b: 0 !T(if) a > b !T(else) !NT{término}(a) + !NT{nombre}(a + 1, b)
  ~~~~~~~~~~~~~~~~~~~~

---

- La existencia de este patrón común nos demuestra que hay una abstracción
  esperando que la saquemos a la superficie.

- De hecho, los matemáticos han identificado hace mucho tiempo esta abstracción
  llamándola **suma de una serie**, y la expresan así:
  $$ \sum _ {n=a}^b f(n) = f(a) + \ldots + f(b)$$

- La ventaja que tiene usar la notación anterior es que se puede trabajar
  directamente con el concepto de sumatorio en vez de trabajar con sumas
  concretas, y podemos sacar conclusiones generales sobre los sumatorios
  independientemente de la serie particular que estemos tratando.

- Igualmente, como programadores estamos interesados en que nuestro lenguaje
  tenga la suficiente potencia como para describir directamente el concepto de
  *sumatorio*, en vez de funciones particulares que calculen sumas concretas.

---

- En programación funcional lo conseguimos creando funciones que conviertan los
  «casilleros» en parámetros:

  ```python
  suma = lambda term, a, b: 0 if a > b else term(a) + suma(term, a + 1, b)
  ```

- De esta forma, las dos funciones `suma_enteros` y `suma_cubos` anteriores se
  podrían definir en términos de esta `suma`:

  ```python
  suma_enteros = lambda a, b: suma(lambda x: x, a, b)
  suma_cubos = lambda a, b: suma(lambda x: x * x * x, a, b)
  # O mejor aún:
  suma_cubos = lambda a, b: suma(cubo, a, b)
  ```

- ¿Se podría generalizar aún más la función `suma`?

## `map`

- Supongamos que queremos escribir una función que, dada una lista de números,
  nos devuelva otra lista con los mismos números elevados al cubo.

- Inténtalo primero como ejercicio.

---

- Una forma de hacerlo sería:

  ```python
  elevar_cubo = lambda l: [] if l == [] else \
                          [cubo(l[0])] + elevar_cubo(l[1:])
  ```

- ¿Y elevar a la cuarta potencia?

  ```python
  elevar_cuarta = lambda l: [] if l == [] else \
                            [(lambda x: x ** 4)(l[0])] + elevar_cuarta(l[1:])
  ```

- Es evidente que hay un patrón subyacente que se podría abstraer creando una
  función de orden superior que aplique una función `f` a los elementos de una
  lista y devuelva la lista resultante.

  Esa función se llama `map`, y viene definida en Python:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~
  map(!NT(función), !NT(iterable)) -> !NT(iterador)
  ~~~~~~~~~~~~~~~~~~~~~

  donde !NT(iterable) puede ser cualquier cosa compuesta de elementos que se
  puedan recorrer de uno en uno, como una **lista**, una **cadena** o un
  **rango** (cualquier *secuencia* de elementos vale).

---

- Podemos usarla así:

  ```python
  >>> map(cubo, [1, 2, 3, 4])
  <map object at 0x7f22b25e9d68>
  ```

- Lo que devuelve no es una lista, sino un objeto *iterador* que examinaremos
  con más detalle en posteriores temas.

- Por ahora, nos basta con saber que un iterador es un flujo de datos que se
  pueden recorrer de uno en uno.

- Lo que haremos aquí será simplemente transformar ese iterador en la lista
  correspondiente usando la función `list` sobre el resultado de `map`:

  ```python
  >>> list(map(cubo, [1, 2, 3, 4]))
  [1, 8, 27, 64]
  ```

- Además de una lista, también podemos usar un rango:

  ```python
  >>> list(map(cubo, range(1, 5)))
  [1, 8, 27, 64]
  ```

- ¿Cómo definirías la función `map`?

---

- Podríamos definirla así:

  ```python
  map = lambda f, l: [] if l == [] else [f(l[0])] + map(l[1:])
  ```

## `filter`

- `filter` es una **función de orden superior** que devuelve aquellos elementos
  de una lista (o cualquier cosa *iterable*) que cumplen una determinada
  condición.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~
  filter(!NT(función), !NT(iterable)) -> !NT(iterador)
  ~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> list(filter(lambda x: x > 0, [-4, 3, 5, -2, 8, -3, 9]))
  [3, 5, 8, 9]
  ```

## `reduce`

- `reduce` es una **función de orden superior** que aplica, de forma
  acumulativa, una función a todos los elementos de una lista (o cualquier cosa
  *iterable*).

- Las operaciones se hacen agrupándose **por la izquierda**.

- Captura un **patrón muy frecuente** de recursión sobre listas de elementos.

- Por ejemplo, para calcular la suma de todos los elementos de una lista,
  haríamos:

  ```python
  suma = lambda l: 0 if l == [] else l[0] + suma(l[1:])
  ```

- Y para calcular el producto:

  ```python
  producto = lambda l: 1 if l == [] else l[0] * producto(l[1:])
  ```

- Como podemos observar, la estrategia de cálculo es esencialmente la misma
  (sólo se diferencian en la operación a realizar (`+` o `*`) y en el valor
  inicial o *elemento neutro* (`0` o `1`).

---

- Si abstraemos ese patrón común podemos crear una función de orden superior
  que capture la idea de **reducir todos los elementos de una lista a un único
  valor**.

- Eso es lo que hace la función `reduce`.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~
  reduce(!NT(función), !NT(iterable)[, !NT(valor_inicial)]) -> !NT(valor)
  ~~~~~~~~~~~~~~~~~~~~~

- El !NT(valor_inicial), si existe, se usará como primer elemento de la lista
  en el cálculo y sirve como valor por defecto cuando la lista está vacía.

- La !NT(función) debe recibir dos argumentos y devolver un valor.

---

- Para usarla, tenemos que *importarla* previamente del *módulo* `functools`.

  - No es la primera vez que importamos un módulo. Ya lo hicimos con el módulo
    `math`.

  - En su momento estudiaremos con detalle qué son los módulos. Por ahora nos
    basta con lo que ya sabemos: que contienen definiciones que podemos
    incorporar a nuestros *scripts*.

- Por ejemplo, para calcular la suma y el producto de `[1, 2, 3, 4]`:

  ```python
  from functools import reduce
  lista = [1, 2, 3, 4]
  suma_de_numeros = reduce(lambda x, y: x + y, lista, 0)
  producto_de_numeros = reduce(lambda x, y: x * y, lista, 1)
  ```

- ¿Cómo podríamos definir la función `reduce`?

---

- Una forma (con valor inicial obligatorio) podría ser así:

  ```python
  reduce = lambda fun, lista, ini: ini if lista == [] else \
                                   lista[0] if lista[1:] == [] else \
                                   fun(lista[0], reduce(fun, lista[1:], ini))
  ```

## Listas por comprensión

- Dos operaciones que se realizan con frecuencia sobre un iterador son:

  - Realizar alguna operación sobre cada elemento (`map`)

  - Seleccionar un subconjunto de elementos que cumplan alguna condición
    (`filter`)

- Las listas por comprensión son una notación copiada del lenguaje Haskell que
  nos permite realizar ambas operaciones de una forma muy concisa:

  ```python
  >>> [x ** 3 for x in [1, 2, 3, 4]]
  [1, 8, 27, 64]
  # equivale a:
  >>> list(map(lambda x: x ** 3, [1, 2, 3, 4]))
  [1, 8, 27, 64]

  >>> [x for x in [-4, 3, 5, -2, 8, -3, 9] if x > 0]
  [3, 5, 8, 9]
  # equivale a:
  >>> list(filter(lambda x: x > 0, [-4, 3, 5, -2, 8, -3, 9]))
  [3, 5, 8, 9]
  ```

---

- Su sintaxis es:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(lista_comp) ::= !T([)!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])+!T(])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los elementos de la salida generada serán los sucesivos valores de
  !NT(expresión).

- Las cláusulas !T(if) son opcionales. Si están, la !NT(expresión) sólo se
  evaluará y añadirá al resultado cuando se cumpla la !NT(condición).

- Por ejemplo:

  ```python
  >>> sec1 = 'abc'
  >>> sec2 = (1, 2, 3)
  >>> [(x, y) for x in sec1 for y in sec2]
  [('a', 1), ('a', 2), ('a', 3),
   ('b', 1), ('b', 2), ('b', 3),
   ('c', 1), ('c', 2), ('c', 3)]
  ```

!BIBLIOGRAFIA
