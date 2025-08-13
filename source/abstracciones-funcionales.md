---
title: Abstracciones funcionales
author: Ricardo Pérez López
!DATE
nocite: |
  @abelson_structure_1996
---

# Abstracciones lambda

## Expresiones lambda

- Las **expresiones lambda** (también llamadas **abstracciones lambda** o
  **funciones anónimas** en algunos lenguajes) son expresiones que capturan la
  idea abstracta de «**función**».

- Son la forma más simple y primitiva de describir funciones en un lenguaje
  funcional.

- Su sintaxis (simplificada) es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expresión_lambda) ::= !T(lambda) [!NT(lista_parámetros)]!T(:) !NT(expresión)
  !NT(lista_parámetros) := !T{identificador} (!T(,) !T(identificador))\*
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo, la siguiente expresión lambda captura la idea general de
  «_suma_»:

  ```python
  lambda x, y: x + y
  ```

## Parámetros y cuerpos

- Los identificadores que aparecen entre la palabra clave !PYTHON(lambda) y el
  carácter de dos puntos (`:`) son los **parámetros** de la expresión lambda.

- La expresión que aparece tras los dos puntos (`:`) es el **cuerpo** de la
  expresión lambda.

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  - Los parámetros son !PYTHON(x) e !PYTHON(y).

  - El cuerpo es !PYTHON(x + y).

  - Esta expresión lambda captura la idea general de sumar dos valores (que en
    principio pueden ser de cualquier tipo, siempre y cuando admitan el
    operador `+`).

  - En sí misma, esa expresión devuelve un valor válido que representa a una
    función.

## Aplicación funcional

- De la misma manera que podemos aplicar una función a unos argumentos, también
  podemos aplicar una expresión lambda a unos argumentos.

- Por ejemplo, la aplicación de la función !PYTHON(max) sobre los argumentos
  !PYTHON(3) y !PYTHON(5) es una expresión que se escribe como
  !PYTHON(max(3, 5)) y que denota el valor **cinco**.

- Igualmente, la aplicación de una expresión lambda como

  ```python
  lambda x, y: x + y
  ```

  sobre los argumentos !PYTHON(4) y !PYTHON(3) se representa así:

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

  O sea, que la expresión lambda representa el papel de una función.

### Evaluación de una aplicación funcional

- En nuestro _modelo de sustitución_, la **evaluación de la aplicación de una
  expresión lambda** consiste en **sustituir**, en el cuerpo de la expresión
  lambda, **cada parámetro por su argumento correspondiente** (por orden) y
  devolver la expresión resultante *parentizada* (o sea, entre paréntesis).

- A esta operación se la denomina **aplicación funcional** o **β-reducción**.

- Siguiendo con el ejemplo anterior:

  ```python
  (lambda x, y: x + y)(4, 3)
  ```

  sustituimos en el cuerpo de la expresión lambda los parámetros !PYTHON(x) e
  !PYTHON(y) por los argumentos !PYTHON(4) y !PYTHON(3), respectivamente, y
  parentizamos la expresión resultante, lo que da:

  ```python
  (4 + 3)
  ```

  que simplificando (según las reglas del operador `+`) da !PYTHON(7).

---

- Es importante hacer notar que el cuerpo de una expresión lambda sólo se
  evalúa cuando se lleva a cabo una β-reducción (es decir, cuando se aplica la
  expresión lambda a unos argumentos), y no antes.

- Por tanto, el cuerpo de la expresión lambda no se evalúa cuando se define la
  expresión.

- Por ejemplo, al evaluar la expresión:

  ```python
  lambda x, y: x + y
  ```

  el intérprete no evalúa la expresión del cuerpo (!PYTHON{x + y}), sino que
  crea un valor de tipo «función» pero sin entrar a ver «qué hay» en el cuerpo.

  Sólo se mira lo que hay en el cuerpo cuando se aplica la expresión lambda a
  unos argumentos.

- En particular, podemos tener una expresión lambda como la siguiente, que sólo
  dará error cuando se aplique a un argumento, no antes:

  ```python
  lambda x: x + 1/0
  ```

### Funciones con nombre

- Si hacemos la siguiente definición:

  ```python
  suma = lambda x, y: x + y
  ```

  le estamos dando un nombre a la expresión lambda, es decir, a una función.

- A partir de ese momento podemos usar !PYTHON(suma) en lugar de su valor (la
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
  !PYTHON(suma(4, 3)) estamos *llamando* a la función !PYTHON(suma), o hay una
  *llamada* a la función !PYTHON(suma).

---

- La evaluación de la llamada a !PYTHON(suma(4, 3)) implicará realizar los
  siguientes tres pasos y en este orden:

  1. Sustituir el nombre de la función !PYTHON(suma) por su definición, es
     decir, por la expresión lambda a la cual está ligado.

  2. Evaluar los argumentos que aparecen en la llamada.

  3. Aplicar la expresión lambda a sus argumentos (β-reducción).

- Esto implica la siguiente secuencia de reescrituras:

  ```python
  suma(4, 3)                    # evalúa suma y devuelve su definición
  = (lambda x, y: x + y)(4, 3)  # evalúa 4 y devuelve 4
  = (lambda x, y: x + y)(4, 3)  # evalúa 3 y devuelve 3
  = (lambda x, y: x + y)(4, 3)  # aplica la expresión lambda sus argumentos
  = (4 + 3)                     # evalúa 4 + 3 y devuelve 7
  = 7
  ```

---

- Como una expresión lambda es una función, **aplicar una expresión lambda a
  unos argumentos es como llamar a una función pasándole dichos argumentos**.

- Por tanto, también podemos decir que **_llamamos_ o _invocamos_ una expresión
  lambda**, pasándole unos argumentos durante esa llamada.

- En consecuencia, ampliamos ahora nuestra gramática de las expresiones en
  Python incorporando las expresiones lambda como un tipo de función:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(llamada_función) ::= !NT(función)!T{(}[!NT(lista_argumentos)]!T{)}
  !NT(función) ::= !T(identificador)
  !SPC(25) | !T{(}!NT(expresión_lambda)!T{)}
  !NT(expresión_lambda) ::= !T(lambda) [!NT(lista_parámetros)]!T(:) !NT(expresión)
  !NT(lista_parámetros) ::= !T{identificador}(!T(,) !T{identificador})\*
  !NT(lista_argumentos) ::= !NT{expresión}(!T(,) !NT{expresión})\*
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJEMPLO

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
  suma(4, 3) * suma(2, 7)                    # definición de suma
  = (lambda x, y: x + y)(4, 3) * suma(2, 7)  # evaluación de 4
  = (lambda x, y: x + y)(4, 3) * suma(2, 7)  # evaluación de 3
  = (lambda x, y: x + y)(4, 3) * suma(2, 7)  # aplicación a 4 y 3
  = (4 + 3) * suma(2, 7)                     # evaluación de 4 + 3
  = 7 * suma(2, 7)                           # definición de suma
  = 7 * (lambda x, y: x + y)(2, 7)           # evaluación de 2
  = 7 * (lambda x, y: x + y)(2, 7)           # evaluación de 7
  = 7 * (lambda x, y: x + y)(2, 7)           # aplicación a 2 y 7
  = 7 * (2 + 7)                              # evaluación de 2 + 7
  = 7 * 9                                    # evaluación de 7 * 9
  = 63
  ```

### Composición de funciones

- Podemos crear una función que use otra función. Por ejemplo, para calcular el
  área de un círculo usamos otra función que calcule el cuadrado de un número:

  ```python
  cuadrado = lambda x: x * x
  area = lambda r: 3.1416 * cuadrado(r)
  ```

- La expresión !PYTHON(area(11 + 1)) se evaluaría así:

  ```{.python .number-lines}
  area(11 + 1)                                # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(11 + 1)  # evalúa 11 y devuelve 11
  = (lambda r: 3.1416 * cuadrado(r))(11 + 1)  # evalúa 1 y devuelve 1
  = (lambda r: 3.1416 * cuadrado(r))(11 + 1)  # evalúa 11 + 1 y devuelve 12
  = (lambda r: 3.1416 * cuadrado(r))(12)      # aplicación a 12
  = (3.1416 * cuadrado(12))                   # evalúa 3.1416 y devuelve 3.1416
  = (3.1416 * cuadrado(12))                   # definición de cuadrado
  = (3.1416 * (lambda x: x * x)(12))          # aplicación a 12
  = (3.1416 * (12 * 12))                      # evalúa (12 * 12) y devuelve 144
  = (3.1416 * 144)                            # evalúa (3.1416 * 11) y...
  = 452.3904                                  # ... devuelve 452.3904
  ```

---

- En detalle:

  - **Línea 1**: Se evalúa !PYTHON(area), que devuelve su definición (una
    expresión lambda).

  - **Líneas 2--4**: Lo siguiente a evaluar es la aplicación de la expresión
    lambda de !PYTHON(area) sobre su argumento, por lo que primero evaluamos
    éste.

  - **Línea 5**: Ahora se aplica la expresión lambda a su argumento
    !PYTHON(12).

  - **Línea 6**: Lo siguiente que toca evaluar es el !PYTHON(3.1416), que ya
    está evaluado.

  - **Línea 7**: A continuación hay que evaluar la aplicación de
    !PYTHON(cuadrado) sobre !PYTHON(12). Primero se evalúa !PYTHON(cuadrado),
    sustituyéndose por su definición...

  - **Línea 8**: ... y ahora se aplica la expresión lambda a su argumento
    !PYTHON(12).

  - Lo que queda ya por evaluar es todo aritmética.

---

- A veces no resulta fácil determinar el orden en el que hay que evaluar las
  subexpresiones que forman una expresión, sobre todo cuando se mezclan
  funciones y operadores en una misma expresión.

- En ese caso, puede resultar útil reescribir los operadores como funciones,
  cuando sea posible, y luego dibujar el árbol sintático correspondiente a esa
  expresión, para ver a qué profundidad quedan los nodos.

- Por ejemplo, la siguiente expresión:

  ```python
  abs(-12) + max(13, 28)
  ```

  se puede reescribir como:

  ```python
  from operator import add
  add(abs(-12), max(13, 28))
  ```

  y si dibujáramos el árbol sintáctico veríamos que la suma está más arriba que
  el valor absoluto y el máximo (que están, a su vez, al mismo nivel de
  profundidad).

---

- Un ejemplo más complicado:

  ```python
  abs(-12) * max((2 + 3) ** 5), 37)
  ```

  se reescribiría como:

  ```python
  from operator import add, mul
  mul(abs(-12), max(pow(add(2, 3), 5), 37))
  ```

  donde se aprecia claramente que el orden de las operaciones, de más interna a
  más externa, sería:

  1. Suma (`+` o !PYTHON(add)).

  2. Potencia (`**` o !PYTHON(pow)).

  3. Valor absoluto (!PYTHON(abs)) y máximo (!PYTHON(max)) al mismo nivel.

  4. Producto (`*` o !PYTHON(mul)).

## Identificadores cuantificados y libres de una expresión lambda

- Si un _identificador_ de los que aparecen en el _cuerpo_ de una expresión
  lambda también aparece en la _lista de parámetros_ de esa expresión lambda,
  decimos que es un **identificador cuantificado** de la expresión lambda.

- En caso contrario, le llamamos **identificador libre** de la expresión
  lambda.

---

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  los dos identificadores que aparecen en el cuerpo (!PYTHON{x} e !PYTHON{y})
  aparecen también en la lista de parámetros de la expresión lambda, por lo que
  ambos son identificadores cuantificados y no hay ningún identificador libre.

- En cambio, en la expresión lambda:

  ```python
  lambda x, y: x + y + z
  ```

  !PYTHON(x) e !PYTHON(y) son identificadores cuantificados (porque aparecen en
  la lista de parámetros de la expresión lambda), mientras que !PYTHON(z) es un
  identificador libre.

---

- En realidad, **un _identificador cuantificado_ y un _parámetro_ están
  vinculados, hasta el punto en que podemos considerar que son la misma cosa**.

- Tan sólo cambia su denominación dependiendo del lugar donde aparece su
  identificador en la expresión lambda:

  - Cuando aparece **antes** del «`:`», le llamamos «_parámetro_».

  - Cuando aparece **después** del «`:`», le llamamos «_identificador
    cuantificado_».

- Por ejemplo: en la siguiente expresión lambda:

  ```python
  lambda x, y: x + y
         ┬     ┬
         │     └────── identificador cuantificado
         └── parámetro
  ```

  el identificador !PYTHON(x) aparece dos veces, pero en los dos casos
  representa la misma cosa. Tan sólo se llama de distinta forma («_parámetro_»
  o «_identificador cuantificado_») dependiendo de dónde aparece.

---

- A los identificadores cuantificados se les llama así porque sus posibles
  valores están cuantificados o _restringidos_ a los posibles valores que
  puedan tomar los parámetros de la expresión lambda en cada llamada a la
  misma.

- Dicho valor además vendrá determinado automáticamente por la ligadura que
  crea el intérprete durante la llamada a la expresión lambda.

  Es decir: el intérprete liga automáticamente el identificador cuantificado
  al valor del correspondiente argumento durante la llamada a la expresión
  lambda.

- En cambio, el valor al que esté ligado un identificador libre de una
  expresión lambda no viene determinado por ninguna característica propia de
  dicha expresión lambda.

# Ámbitos

## Ámbitos léxicos

- Un **ámbito léxico** (también llamado **ámbito estático**) es una porción del
  código fuente de un programa.

- Decimos que **ciertas construcciones sintácticas determinan ámbitos
  léxicos**.

- Cuando una construcción determina un ámbito léxico, **la sintaxis del
  lenguaje establece dónde empieza y acaba** ese ámbito léxico en el código
  fuente.

- Por tanto, siempre se puede determinar sin ambigüedad si **una instrucción
  situada en un punto concreto del programa está dentro de un determinado
  ámbito léxico**, tan sólo leyendo el código fuente del programa y sin
  necesidad de ejecutarlo.

- Eso significa que el concepto de _ámbito léxico_ es un concepto **estático**.

---

- Además de los ámbitos léxicos, existen también los llamados **ámbitos
  dinámicos**, que funcionan de otra forma y que no estudiaremos en este curso.

- La mayoría de los lenguajes de programación usan ámbitos léxicos, salvo
  excepciones (como LISP o los _shell scripts_) que usan ámbitos dinámicos.

- Por esa razón, a partir de ahora, cuando hablemos de «ámbitos» sin
  especificar de qué tipo, nos estaremos siempre refiriendo a «ámbitos
  léxicos».

---

- Por ejemplo: en el lenguaje de programación Java, los _bloques_ son
  estructuras sintácticas delimitadas por llaves `{` y `}` que contienen
  instrucciones.

- Los bloques de Java determinan ámbitos léxicos; por tanto, si una instrucción
  está dentro de un bloque (es decir, si está situada entre las llaves `{` y
  `}` que delimitan el bloque), entonces esa instrucción se encuentra dentro
  del ámbito léxico que define el bloque.

- En Python, **las expresiones lambda determinan ámbitos léxicos**, así
  que, cada vez que creamos una expresión lambda, estamos introduciendo un
  nuevo ámbito en el código fuente de nuestro programa.

- En concreto, el ámbito que determina una expresión lambda viene
  delimitado por su **cuerpo**.

---

- Los ámbitos **se pueden anidar recursivamente**, o sea, que pueden estar
  contenidos unos dentro de otros.

- Por tanto, una instrucción puede estar en varios ámbitos al mismo tiempo
  (anidados unos dentro de otros).

- De todos ellos, el **ámbito más interno** es el que no contiene, a su vez, a
  ningún otro ámbito.

- Definimos el **ámbito de una instrucción** como el ámbito más interno en el
  que se encuentra dicha instrucción.

- Según lo anterior, en un momento dado, el **ámbito actual** es el ámbito de
  la instrucción actual, es decir, el ámbito más interno en el que se encuentra
  la instrucción que se está ejecutando actualmente.

---

- Decimos que los ámbitos léxicos cumplen la **propiedad de la estructura**.

- Una **estructura** es una construcción sintáctica que puede **anidarse
  completamente** dentro de otras estructuras, de forma que, dadas dos
  estructuras cualesquiera, o una está incluida completamente dentro de la
  otra, o no se tocan en absoluto.

- Por tanto, los bordes de dos ámbitos léxicos nunca pueden cruzarse:

:::: columns

::: column

!IMGP(estructuras-anidadas.!EXT)(Ámbitos léxicos anidados)(width=35%)(width=25%)

:::

::: column

!IMGP(estructuras-que-se-cruzan.!EXT)(Estas no son estructuras)(width=35%)(width=25%)

:::

::::

### Ámbito global

<!--

- El concepto de _ámbito_ no es nada trivial y, a medida que vayamos
  incorporando nuevos elementos al lenguaje, tendremos que ir adaptándolo para
  tener en cuenta más condicionantes.

-->

- Un ámbito que siempre existe en cualquier programa es el llamado **ámbito
  global**:

  - Si se está ejecutando un _script_ en el intérprete por lotes (con
    `python script.py`), **el _ámbito global_ abarca todo el _script_**, desde
    la primera instrucción hasta la última.

  - Si estamos en el intérprete interactivo (con `python` o `ipython3`), el
    _ámbito global_ abarca **toda nuestra sesión con el intérprete**, desde que
    arrancamos la sesión hasta que finalizamos la misma.

- Por tanto:

  - En el momento en que se empieza a ejecutar un _script_ o se arranca una
    sesión con el intérprete interactivo, **se entra** en el _ámbito global_.

  - Del ámbito global sólo **se sale** cuando se finaliza la ejecución del
    _script_ o se cierra el intérprete interactivo.

!EJEMPLOS

- Por ejemplo, en la siguiente línea de código:

  ```python
  suma = lambda x, y: x + y
  ```

  el cuerpo de la función !PYTHON(suma) determina un ámbito.

- Por tanto, en el siguiente código tenemos dos ámbitos: el ámbito global (más
  externo) y el ámbito del cuerpo de la expresión lambda (más interno y
  anidado dentro del ámbito global):

  !IMGP(ambitos-anidados.png)()(width=60%)

---

- En este otro ejemplo más complicado, tenemos el siguiente _script_:

  ```{.python .number-lines}
  w = 2
  f = lambda x, y: 5 + (lambda z: z + 3)(x + y)
  r = f(2, 4)
  m = (lambda x: x ** 2)(3)
  ```

  donde existen cuatro ámbitos:

  !IMGP(cuatro-ambitos.png)()(width=100%)

## Ámbito de una definición y de una ligadura

- El **ámbito de una definición** es el ámbito actual de esa definición, es
  decir, el ámbito más interno donde aparece esa definición.

- Por extensión, llamamos **ámbito de una ligadura** al ámbito de la definición
  que, al ejecutarse, creará la ligadura (es decir, el ámbito más interno donde
  aparece la definición que, al ejecutarse, creará la ligadura en tiempo de
  ejecución).

- En la práctica, es lo mismo hablar del «ámbito de una definición» que del
  «ámbito de la ligadura que se creará al ejecutar la definición», ya que son
  la misma cosa.

- Decimos que la _definición_ (y la _ligadura_ correspondiente que se creará al
  ejecutar esa definición) es **local** a su ámbito.

- Si ese ámbito es el ámbito _global_, decimos que la _definición_ (y la
  _ligadura_ que se creará al ejecutar esa definición) es **global**.

---

- Por ejemplo, en el siguiente _script_ se ejecutan cuatro definiciones:

  !IMGP(ambito-global.png)()(width=40%)(width=40%)

- El ámbito de cada una de las instrucciones es el ámbito _global_, que es el
  único ámbito que existe en el _script_.

- En consecuencia:

  - Las cuatro definiciones tienen **ámbito global** (y son, por tanto,
    **definiciones globales**).

  - Cuando se ejecuten, esas definiciones crearán **ligaduras globales**.

---

- Como estamos usando un lenguaje de programación que trabaja con _ámbitos
  léxicos_, **el ámbito de una definición siempre vendrá determinado por una
  _construcción sintáctica_** del lenguaje.

- Por tanto:

  - Sus _límites_ vienen marcados únicamente por la _sintaxis_ de la
    construcción que determina el ámbito de esa definición.

  - El ámbito de la definición se puede determinar simplemente leyendo el
    código fuente del programa, observando dónde empieza y dónde acaba esa
    construcción, sin tener que ejecutarlo.

    Es decir, que se puede determinar de forma _estática_.

### Visibilidad

- La visibilidad de una ligadura indica en qué lugares del código fuente del
  programa es visible y accesible esa ligadura.

- Una ligadura puede existir en un punto concreto del programa, pero en cambio
  no ser accesible en ese mismo punto.

- Para determinar las reglas de visibilidad de una ligadura, existen dos
  posibilidades, dependiendo de si la ligadura está ligando un atributo de un
  objeto, o no.

- Veamos cada caso con detalle.

---

1. Si el identificador ligado es un **atributo de un objeto**, la ligadura sólo
   será visible dentro del objeto.

   En tal caso, decimos que la visibilidad de la ligadura (y del
   correspondiente atributo ligado) es **local al objeto** que contiene el
   atributo.

   Eso significa que debemos indicar (usando el operador punto (`.`)) el objeto
   que contiene a la ligadura para poder acceder a ella, lo que significa que
   también debemos tener acceso al propio objeto que la contiene.

---

2. Si el identificador ligado **NO es un atributo de un objeto**, la ligadura
   sólo será visible dentro del ámbito donde se definió la ligadura.

   Ese ámbito representa una «región» cuyas fronteras limitan la porción del
   código fuente en la que es visible esa ligadura.

   En tal caso, decimos que la **visibilidad** de la ligadura es **local a su
   ámbito**.

   Eso significa que **no es posible acceder a esa ligadura fuera de su
   ámbito**; sólo es visible dentro de él.

   En cambio, si el ámbito de la ligadura contiene dentro otro ámbito anidado,
   sí que podremos acceder a la ligadura dentro de ese ámbito más interno, ya
   que técnicamente seguiría estando dentro de su ámbito. 

   Si el ámbito es el global, decimos que la ligadura tiene **visibilidad
   global**.

---

- Suponiendo que tenemos los siguientes cuatro ámbitos, identificados con las
  letras A, B, C y D:

  :::: columns

  ::: {.column width=40%}

  !IMGP(estructuras-anidadas.!EXT)(Ámbitos léxicos anidados)(width=45%)(width=22%)

  :::

  ::: {.column width=60%}

  - A puede ver los nombres definidos en A, pero no los definidos en B, C o D.

  - B puede ver los nombres definidos en A y B, pero no los definidos en C o D.

  - C puede ver los nombres definidos en A, B y C, pero no los definidos en D.

  - D puede ver los nombres definidos en A y D, pero no los definidos en B o C.

  :::

  ::::

### Tiempo de vida

- El **tiempo de vida** de una ligadura representa el periodo de tiempo durante
  el cual _existe_ esa ligadura, es decir, el periodo comprendido desde su
  creación y almacenamiento en la memoria hasta su posterior destrucción.

- En la mayoría de los lenguajes (incluyendo Python y Java), una ligadura
  **empieza a existir** justo cuando se crea, es decir, en el punto donde se
  ejecuta la instrucción que define la ligadura.

  Por tanto, no es posible _acceder_ a esa ligadura _antes_ de ese punto, ya
  que no existe hasta entonces.

---

- Por otra parte, el momento en que una ligadura **deja de existir** depende si
  el identificador ligado es un atributo de un objeto, o no:

  - Si el identificador ligado es un atributo de un objeto, la ligadura dejará
    de existir cuando se elimine el objeto de la memoria, o bien, cuando se
    elimine el propio atributo ligado.

  - En caso contrario, la ligadura dejará de existir allí donde termine el
    ámbito de la ligadura.

- Es importante hacer notar que, en un momento dado, una ligadura puede existir
  pero no ser visible.

- Por ejemplo, si una ligadura local y una global vinculan el mismo
  identificador, la local «hace sombra» a la global, cosa que estudiaremos con
  más profundidad posteriormente.

<!--

- Eso significa que la **visibilidad** de una ligadura y el **acceso** a una
  ligadura son conceptos distintos:

  - La **visibilidad** de una ligadura la define su ámbito, y es, por tanto, un
    concepto **_estático_**.

  - La posibilidad de **acceder** a una ligadura depende de si esa ligadura ya
    se ha creado previamente al intentar acceder a ella durante la ejecución
    del programa, y es un concepto **_estático_** si el lenguaje es compilado,
    o **_dinámico_** si es interpretado.

-->

### Almacenamiento

- Sabemos que las ligaduras se almacenan en _espacios de nombres_.

- En Python, hay dos lugares donde se pueden almacenar ligaduras y, por tanto,
  **hay dos posibles espacios de nombres: los _objetos_ y los _marcos_**.

- Así que tenemos dos posibilidades:

  #. Si el identificador que se está ligando es un _atributo_ de un objeto,
     entonces la ligadura se almacenará en el objeto, junto con el propio
     atributo.

  #. En caso contrario, la ligadura se almacenará en un marco, el cual depende
     del _ámbito actual_.

- Veamos cada caso con más detalle.

---

1. Cuando se crea una ligadura dentro de un objeto en Python usando el operador
   punto (`.`), **el espacio de nombres será el propio objeto**, ya que los
   objetos son espacios de nombres en Python.

   En tal caso, la ligadura asocia un valor con un _atributo_ del objeto, y
   tanto el atributo como la ligadura se almacenan dentro del objeto.

   Por ejemplo, si en Python hacemos:

   ```python
   import math
   math.x = 75
   ```

   estamos creando la ligadura `x` → `75` en el espacio de nombres que
   representa el módulo `math`, el cual es un objeto en Python y, por tanto, es
   quien almacena la ligadura.

   Así que el espacio de nombres ha sido seleccionado a través del operador
   punto (`.`) para resolver el atributo dentro del objeto, y no depende del
   ámbito donde se encuentre la sentencia !PYTHON(math.x = 75).

   Diremos que la ligadura es **local** al objeto.

---

2. Si la ligadura no se crea dentro de un objeto usando el operador punto
   (`.`), entonces el espacio de nombres irá asociado al ámbito y, en este
   caso, **ese espacio de nombres siempre será un marco**.

   Ese marco será el que corresponda al _ámbito actual_, es decir, el ámbito
   más interno en el que se encuentra la instrucción que crea la ligadura.

   Cuando el ámbito es el _ámbito global_ (y, por tanto, la ligadura se
   almacena en el marco global), se dice que la ligadura es **global**.

   En caso contrario, decimos que es **local** al ámbito, y se almacenará en el
   marco correspondiente a ese ámbito.

!EJEMPLO

- En el siguiente ejemplo vemos cómo hay varias definiciones que, al
  ejecutarse, crearán ligaduras en un determinado ámbito, pero no en un objeto
  (ya que no se están creando atributos dentro de ningún objeto):

  ```{.python .number-lines}
  x = 25
  y = 99
  z = y
  nombre = 'Manolo'
  ```

- Todas esas definiciones son globales y, por tanto, las ligaduras que crean al
  ejecutarse son ligaduras globales o de ámbito global, y se almacenan en el
  marco global.

- Al no tratarse de atributos de objetos, la visibilidad vendrá determinada
  por sus ámbitos.

- En consecuencia, la visibilidad de todas esas ligaduras será el ámbito
  global, ya que son ligaduras globales. Por tanto, decimos que su
  **visibilidad** es **global**.

---

- Por otra parte, como esas ligaduras no se crean sobre atributos de objetos,
  empezarán a existir justo donde se crean, y terminarán de existir al final de
  su ámbito.

- Por ejemplo, la ligadura `y` → `99` empezará a existir en la línea 2 y
  terminará al final del _script_, que es donde termina su ámbito (que, en este
  ejemplo, es el ámbito global).

- En consecuencia, el **tiempo de vida** de la ligadura será el periodo
  comprendido desde su creación (en la línea 2) hasta el final de su ámbito.

---

- Cuando la ligadura se crea sobre un **atributo** de un _objeto_ de Python,
  entonces ese objeto almacenará la ligadura y será, por tanto, su espacio de
  nombres.

- Recordemos que, por ejemplo, cuando importamos un módulo usando la sentencia
  !PYTHON(import), podemos acceder al objeto que representa ese módulo usando
  su nombre, lo que nos permite acceder a sus atributos y crear otros nuevos.

- Esos atributos y sus ligaduras correspondientes sólo son visibles cuando
  accedemos a ellos usando el operador punto (`.`) a través del objeto que lo
  contiene.

- Por tanto, los atributos no son visibles fuera del objeto, y debemos usar el
  operador punto (`.`) para acceder a ellos (su visibilidad es local al objeto
  que los contiene).

---

- Por ejemplo:

  ```python
  >>> import math
  >>> math.pi
  3.141592653589793     # El nombre 'pi' es visible dentro del objeto
  >>> pi                # El nombre 'pi' no es visible fuera del objeto
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'pi' is not defined
  ```

- Igualmente, si creamos un nuevo atributo dentro del objeto, la ligadura entre
  el atributo y su valor sólo existirá en el propio objeto y, por tanto, sólo
  será visible cuando accedamos al atributo a través del objeto donde se ha
  creado.

  ```python
  >>> import math
  >>> math.x = 95       # Creamos un nuevo atributo en el objeto
  >>> math.x            # El nombre 'x' es visible dentro del objeto
  95
  >>> x                 # El nombre 'x' no es visible fuera del objeto
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  ```

---

- Resumiendo:

  - Para poder acceder a un atributo de un objeto, debemos acceder primero al
    objeto y usar el operador punto (`.`).

  - Por tanto, la **visibilidad** de su ligadura correspondiente no vendrá
    determinada por un ámbito, sino por el objeto que contiene al atributo (y
    que, por consiguiente, también contiene a su ligadura).

    En tal caso, diremos que la visibilidad es local al objeto que contiene el
    atributo.

  - Por otra parte, el **tiempo de vida** de la ligadura será el tiempo que
    permanezca el atributo en el objeto, ligado a algún valor.

#### Resumen

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Ámbito (léxico):**

Porción del código fuente de un programa. Los límites de ese ámbito sólo
vienen determinados por la sintaxis del lenguaje, ya que ciertas
construcciones sintácticas determinan su propio ámbito.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Ámbito de una definición:**

El ámbito actual de la definición; es decir: el ámbito más interno donde
aparece la definición.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Ámbito de una ligadura:**

El ámbito de la instrucción que creará la ligadura en tiempo de ejecución. Por
ejemplo, si la instrucción es una definición, se corresponde con el ámbito de
la definición.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Visibilidad de una ligadura:**

Determina dónde es visible una ligadura dentro del programa.

Esa visibilidad depende de si el identificador ligado es un atributo de un
objeto o no:

a. Si es un atributo de un objeto, la visibilidad lo determina el objeto que
   contiene la ligadura.

b. En caso contrario, la visibilidad lo determina el ámbito de la ligadura.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Tiempo de vida de una ligadura:**

El periodo de tiempo durante el cual _existe_ esa ligadura, es decir, el
periodo comprendido desde su creación y almacenamiento en la memoria hasta su
posterior destrucción.

Su tiempo de vida empieza siempre en el momento en que se crea la ligadura, y
su final depende de si el identificador ligado es un atributo de un objeto o
no:

a. Si es un atributo de un objeto, el tiempo de vida acabará cuando se destruya
   el objeto que lo contiene (o cuando se elimine el atributo ligado).

b. En caso contrario, el tiempo de vida acabará al final del ámbito de la
   ligadura.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Almacenamiento de una ligadura:**

Determina el **espacio de nombres** donde se almacenará la ligadura:

a. Si el identificador ligado es un atributo de un objeto, el espacio de
   nombres será el objeto que lo contiene.

b. En caso contrario, el espacio de nombres será el marco asociado al ámbito de
   la ligadura.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Ámbito de un identificador

- A veces, por economía del lenguaje, se suele hablar del «**_ámbito de un
  identificador_**», en lugar de hablar del «_ámbito de la ligadura que liga
  ese identificador con un valor_».

- Por ejemplo, en el siguiente _script_:

  ```python
  x = 25
  ```

  tenemos que:

  - En el ámbito global, hay una definición que liga al identificador
    !PYTHON(x) con el valor !PYTHON(25).

  - Por tanto, se dice que **el _ámbito de esa ligadura_ es el ámbito global**.

  - Pero también se suele decir que «_el identificador !PYTHON(x) es global_»
    o, simplemente, que «_!PYTHON(x) es global_».

- O sea, se **asocia al ámbito** no la ligadura, sino **el identificador en
  sí**.

---

- Pero hay que tener cuidado, ya que ese mismo identificador puede aparecer en
  ámbitos diferentes y, por tanto, ligarse en ámbitos diferentes.

- Así que no tendría sentido hablar del ámbito que tiene ese identificador (ya
  que podría tener varios) sino, más bien, **del ámbito que tiene _una
  aparición concreta_ de ese identificador**.

- Por eso, sólo deberíamos hablar del ámbito de un identificador cuando no haya
  ninguna ambigüedad respecto a qué aparición concreta nos estamos refiriendo.

- Por ejemplo, en el siguiente _script_:

  ```{.python .number-lines}
  x = 4
  suma = (lambda x, y: x + y)(2, 3)
  ```

  el identificador !PYTHON(x) que aparece en la línea 1 y el identificador
  !PYTHON(x) que aparece en la línea 2 pertenecen a ámbitos distintos (como
  veremos en breve) aunque sea el mismo identificador.

## Ámbito de un parámetro

- **El cuerpo de la expresión lambda determina un ámbito.**

- Por ejemplo, supongamos la siguiente llamada a una expresión lambda:

  ```python
  (lambda x, y: x + y)(2, 3)
  ```

- **Al llamar a la expresión lambda** (es decir, al aplicar la expresión lambda
  a unos argumentos), se empieza a ejecutar su cuerpo y, por tanto, **se entra
  en dicho ámbito**.

- En ese momento, **se crea un nuevo marco** en la memoria, que representa esa
  ejecución concreta de dicha expresión lambda.

- Lo que ocurre justo a continuación es que **cada parámetro de la expresión
  lambda se liga a uno de los argumentos** en el orden en que aparecen en la
  llamada a la expresión lambda (primer parámetro con primer argumento, segundo
  con segundo, etcétera).

---

- En el ejemplo anterior, es como si el intérprete ejecutara las siguientes
  definiciones dentro del ámbito de la expresión lambda:

  ```python
  x = 2
  y = 3
  ```

- Las ligaduras que crean esas definiciones **se almacenan en el marco de la
  llamada a la expresión lambda**.

- Ese marco se eliminará de la memoria al salir del ámbito de la expresión
  lambda, es decir, cuando se termine de ejecutar el cuerpo de la expresión
  lambda al finalizar la llamada a la misma.

  Por tanto, las ligaduras se destruyen de la memoria al eliminarse el marco
  que las almacena.

---

- La próxima vez que se llame a la expresión lambda, se volverán a ligar sus
  parámetros con los argumentos que haya en esa llamada.

- Por ejemplo, supongamos que tenemos esta situación:

  ```python
  suma = lambda x, y: x + y
  a = suma(4, 3)
  b = suma(8, 9)
  ```

- En la primera llamada, se entrará en el ámbito determinado por el cuerpo la
  expresión lambda, se creará el marco que representa a esa llamada, y se
  ejecutarán las siguientes definiciones dentro del ámbito:

  ```python
  x = 4
  y = 3
  ```

  lo que creará las correspondientes ligaduras y las almacenará en el marco de
  esa llamada.

  Despues, evaluará el cuerpo de la expresión lambda y devolverá el resultado,
  saliendo del cuerpo de la expresión lambda y, por tanto, del ámbito que
  determina dicho cuerpo, lo que hará que se destruya el marco y, en
  consecuencia, las ligaduras que contiene.

---

- En la siguiente llamada ocurrirá lo mismo pero, esta vez, las definiciones
  que se ejecutarán serán las siguientes:

  ```python
  x = 8
  y = 9
  ```

  lo que creará otras ligaduras, que serán destruidas luego cuando se destruya
  el marco que las contiene, al finalizar la ejecución del cuerpo de la
  expresión lambda.

- Es importante hacer notar que **en ningún momento se está haciendo un
  _rebinding_ de los parámetros**, ya que cada vez que se llama de nuevo a la
  expresión lambda, se está creando una ligadura nueva sobre un identificador
  que no estaba ligado.

---

- En consecuencia, podemos decir que:

  - El **ámbito de la ligadura** entre un parámetro y su argumento es el
    **cuerpo** de la expresión lambda, así que la **visibilidad** del parámetro
    (y de la ligadura) es ese cuerpo.

  - Esa ligadura se crea justo después de entrar en ese ámbito, así que se
    puede acceder a ella en cualquier parte del cuerpo de la expresión
    lambda, por lo que su **tiempo de vida** va desde el principio hasta el
    final de la llamada.

  - El **espacio de nombres** que almacena las ligaduras entre parámetros y
    argumentos es el **marco** que se crea al llamar a la expresión lambda.

---

- Esto se resume diciendo que «el **ámbito de un parámetro** es el **cuerpo**
  de su expresión lambda».

- También se dice que el parámetro tiene un **ámbito _local_** y un
  **almacenamiento _local_** al cuerpo de la expresión lambda.

  Resumiendo: el parámetro es **local** a dicha expresión lambda.

- Por tanto, **sólo podemos acceder al valor de un parámetro dentro del cuerpo
  de su expresión lambda**.

---

<!-- Esta diapositiva está repetida en una sección posterior -->

- Por ejemplo, en el siguiente código:

  ```python
  suma = lambda x, y: x + y
  ```

  el cuerpo de la expresión lambda ligada a !PYTHON(suma) determina su propio
  ámbito.

- Por tanto, en el siguiente código tenemos dos ámbitos: el ámbito global (más
  externo) y el ámbito del cuerpo de la expresión lambda (más interno y
  anidado dentro del ámbito global):

  !IMGP(ambitos-anidados.png)()(width=60%)

- Además, cada vez que se llama a !PYTHON(suma), la ejecución del programa
  entra en su cuerpo, lo que crea un nuevo marco que almacena las ligaduras
  entre sus parámetros y los argumentos usados en esa llamada.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**En resumen:**

- El **ámbito de un parámetro** es el ámbito de la ligadura que se establece
  entre éste y su argumento correspondiente, y se corresponde con el **cuerpo**
  de la expresión lambda donde aparece.

- Por tanto, el parámetro sólo existe dentro del cuerpo de la expresión lambda
  y no podemos **acceder** a su valor fuera del mismo; por eso se dice que
  tiene un **ámbito _local_** a la expresión lambda.

- Además, **la ligadura** entre el parámetro y su argumento **se almacena en el
  marco** de la llamada a la expresión lambda, y por eso se dice que tiene un
  **almacenamiento _local_** a la expresión lambda.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Los ámbitos léxicos permiten ligaduras locales a ciertas construcciones
  sintácticas, lo cual nos permite programar definiendo partes suficientemente
  independientes entre sí.

- Esto es la base de la llamada _programación modular_.

- Por ejemplo, nos permite crear funciones sin preocuparnos de si los nombres
  de los parámetros ya han sido utilizados en otras partes del programa.

- Igualmente, nos permite crear programas sin preocuparnos de si estamos usando
  nombres que ya han sido usadas en el interior de alguna de las funciones del
  programa.

---

- De lo contrario, se podría provocar lo que se conoce como **_name clash_**
  (_conflicto de nombres_ o _choque de nombres_), que es el problema que se
  produce cuando usamos el mismo nombre para varias cosas diferentes y que
  impide que se puedan acceder a todas al mismo tiempo.

- Lo que impide el _name clash_ son dos cosas:

  - Los _ámbitos_ hacen que los nombres sólo sean visibles en ciertas zonas.

  - Los _espacios de nombres_ permiten que un mismo nombre pueda ligarse a
    diferentes nombres simultáneamente.

## Ámbito de un identificador cuantificado

- Hemos visto que a los **parámetros** de una expresión lambda se les llama
  **identificadores cuantificados** cuando aparecen dentro del cuerpo de dicha
  expresión lambda.

- Por tanto, todo lo que se dijo sobre el ámbito de un parámetro se aplica
  exactamente igual al ámbito de un identificador cuantificado.

- Recordemos que el ámbito de un parámetro es el cuerpo de su expresión lambda,
  que es la porción de código donde podemos acceder al valor del argumento con
  el que está ligado.

- Por tanto, **el _ámbito_ de un identificador cuantificado es el _cuerpo_ de
  la expresión lambda** donde aparece, y es el único lugar dentro del cual
  podremos acceder al valor del identificador cuantificado (que también será el
  valor del argumento con el que está ligada).

- Por eso también se dice que el identificador cuantificado tiene un **ámbito
  local** al cuerpo de la expresión lambda.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**En resumen:**

- El **ámbito de un identificador cuantificado** es el ámbito de la ligadura
  que se crea entre ésto y su argumento correspondiente, y se corresponde con
  el **cuerpo** de la expresión lambda donde aparece.

- Por tanto, el identificador cuantificado sólo existe dentro del cuerpo de la
  expresión lambda y no podemos **acceder** a su valor fuera del mismo; por eso
  se dice que tiene un **ámbito _local_** a la expresión lambda.

- Además, **la ligadura** entre el identificador cuantificado y su argumento
  **se almacena en el marco** de la llamada a la expresión lambda, y por eso se
  dice que tiene un **almacenamiento _local_** a la expresión lambda.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- O sea: con los **identificadores cuantificados** ocurre exactamente lo mismo
  que con los **parámetros**, ya que, de hecho, **un parámetro y un
  identificador cuantificado son la misma cosa**, como ya hemos visto.

!EJEMPLO

- En el siguiente _script_:

  ```{.python .number-lines}
  # Aquí empieza el script (no hay más definiciones antes de esta línea):
  producto = lambda x: x * x
  y = producto(3)
  z = x + 1       # da error
  ```

- Hay dos ámbitos: el ámbito global y el ámbito local definido por el cuerpo de
  la expresión lambda (o sea, la expresión !PYTHON(x * x)).

- Esa expresión lambda tiene un parámetro (!PYTHON(x)) que aparece como el
  identificador cuantificado !PYTHON(x) en el cuerpo de la expresión lambda.

- El ámbito del parámetro !PYTHON{x} (o, lo que es lo mismo, el identificador
  cuantificado !PYTHON(x)) es el **cuerpo** de la expresión lambda.

- Por tanto, fuera de ese cuerpo, no es posible acceder al valor del
  identificador cuantificado !PYTHON(x), al encontrarnos **fuera de su ámbito**
  (la ligadura **sólo es visible dentro del cuerpo** de la expresión lambda).

- Por eso, la línea 4 dará un error al intentar acceder al valor !PYTHON(x),
  cuya ligadura no es visible fuera de la expresión lambda.

## Ámbito de un identificador libre

- Los identificadores y ligaduras que no tienen ámbito local se dice que tienen
  un **ámbito _no local_** o, a veces, un **ámbito _más global_**.

  Si, además, ese ámbito resulta ser el **ámbito global**, decimos directamente
  que esos identificadores o ligaduras son **globales**.

- Por ejemplo, los **identificadores libres** que aparecen en una expresión
  lambda no son locales a dicha expresión (ya que no representan parámetros de
  la expresión) y, por tanto:

  #. Tienen un ámbito más global que el cuerpo de dicha expresión lambda.

  #. Se almacenarán en otro espacio de nombres distinto al marco que se crea al
     llamar a la expresión lambda.

# Funciones recursivas

## Definición

- Una **función recursiva** es aquella que se define en términos de sí misma.

- Eso quiere decir que, durante la ejecución de una llamada a la función, se
  ejecuta otra llamada a la misma función, es decir, que la función se llama a
  sí misma directa o indirectamente.

- La forma más sencilla y habitual de función recursiva es aquella en la que
  **la propia definición de la función contiene una o varias llamadas a ella
  misma**. En tal caso, decimos que la función se llama a sí misma
  _directamente_ o que hay una **recursividad directa**.

  Ese es el tipo de recursividad que vamos a estudiar.

- Las definiciones recursivas son el mecanismo básico para ejecutar
  **repeticiones de instrucciones** en un lenguaje de programación funcional.

---

- Por ejemplo: $$f(n) = n + f(n + 1)$$

- Esta función matemática es _recursiva_ porque aparece ella misma en su propia
  definición.

  Para calcular el valor de $f(n)$ tenemos que volver a utilizar la propia
  función $f$.

- Por ejemplo: $$f(1) = 1 + f(2) = 1 + 2 + f(3) = 1 + 2 + 3 + f(4) = \ldots$$

- Cada vez que una función se llama a sí misma decimos que se realiza una
  **llamada recursiva** o **paso recursivo**.

!ifdef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~

---

!IMGP(pintura-recursiva.jpg)()(width=100%)
~~~~~~~~~~~~~~~~~~~~~~~

!EJERCICIO

@. Desde el principio del curso ya hemos estado trabajando con estructuras que
pueden tener una definición recursiva. ¿Cuáles son?

## Casos base y casos recursivos

- Resulta importante que una definición recursiva se detenga alguna vez y
  proporcione un resultado, ya que si no, no sería útil (tendríamos lo que se
  llama una **recursión infinita**).

- Por tanto, en algún momento, la recursión debe alcanzar un punto en el que la
  función no se llame a sí misma y se detenga.

- Para ello, es necesario que la función, en cada paso recursivo, se vaya
  acercando cada vez más a ese punto.

---

- Ese punto en el que la función recursiva **no se llama a sí misma**, se
  denomina **caso base**, y puede haber más de uno.

- Los casos base, por tanto, determinan bajo qué condiciones la función no se
  llamará a sí misma, o dicho de otra forma, con qué valores de sus argumentos
  la función devolverá directamente un valor y no provocará una nueva llamada
  recursiva.

- Los demás casos, que sí provocan llamadas recursivas, se denominan **casos
  recursivos**.

## El factorial

- El ejemplo más típico de función recursiva es el **factorial**.

- El factorial de un número natural $n$ se representa por $n!$ y se define como
  el producto de todos los números desde 1 hasta $n$:
  $$n! = n\cdot(n-1)\cdot(n-2)\cdot\cdots\cdot1$$

  Por ejemplo:
  $$6! = 6\cdot5\cdot4\cdot3\cdot2\cdot1 = 720$$

- Pero para calcular $6!$ también se puede calcular $5!$ y después multiplicar
  el resultado por 6, ya que:
  $$6! = 6\cdot\overbrace{5\cdot4\cdot3\cdot2\cdot1}^{5!}$$
  $$6! = 6\cdot5!$$

- Por tanto, el factorial se puede definir de forma **recursiva**.

---

- Tenemos el **caso recursivo**, pero necesitamos al menos un **caso base**
  para evitar que la recursión se haga *infinita*.

- El caso base del factorial se obtiene sabiendo que el factorial de 0 es
  directamente 1 (no hay que llamar al factorial recursivamente):
  $$0! = 1$$

- Combinando ambos casos tendríamos:

  $$n! = \begin{cases}
           1 & \text{si } n = 0 \text{\quad(caso base)} \\
           n\cdot(n-1)! & \text{si } n > 0 \text{\quad(caso recursivo)}
         \end{cases}$$

---

- La **especificación** de una función que calcule el factorial de un número
  sería:

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(n \geq 0)
  !SIGNAT(\texttt{factorial(!VAR(n):\,int)\;->\;int})
  !POST(\texttt{factorial(!VAR(n))} = n!)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Y su **implementación** en Python podría ser la siguiente:

  ```python
  factorial = lambda n: 1 if n == 0 else n * factorial(n - 1)
  ```

  que sería prácticamente una traducción literal de la definición recursiva de
  factorial que acabamos de obtener.

## Diseño de funciones recursivas

- El diseño de funciones recursivas se basa en:

  #. Identificación de casos base

  #. Descomposición (reducción) del problema

  #. Pensamiento optimista

### Identificación de casos base

- Debemos identificar los ejemplares para los cuales hay una solución directa
  que no necesita recursividad.

- Esos ejemplares representarán los _casos base_ de la función recursiva, y por
  eso los denominamos _ejemplares básicos_.

- Por ejemplo:

  - Supongamos que queremos diseñar una función (llamada $fact$, por ejemplo)
    que calcule el factorial de un número.

    Es decir: $fact(n)$ debe devolver el factorial de $n$.

  - Sabemos que $0! = 1$, por lo que nuestra función podría devolver
    directamente $1$ cuando se le pida calcular el factorial de $0$.

  - Por tanto, el caso base del factorial es el cálculo del factorial de 0:
    $$fact(0) = 1$$

### Descomposición (reducción) del problema

- Reducimos el problema de forma que así tendremos un ejemplar _más pequeño_
  del problema.

- Un ejemplar más pequeño es aquel que está **más cerca del caso base**.

- De esta forma, cada ejemplar se irá acercando más y más al caso base hasta
  que finalmente se alcanzará dicho caso base y eso detendrá la recursión.

- Es importante comprobar que eso se cumple, es decir, que la reducción que le
  realizamos al problema produce ejemplares que están más cerca del caso base,
  porque de lo contrario se produciría una _recursión infinita_.

---

- En el ejemplo del factorial:

  - El caso base es $fact(0)$, es decir, el caso en el que queremos calcular el
    factorial de 0, que ya vimos que es directamente 1 (sin necesidad de
    llamadas recursivas).

  - Si queremos resolver el problema de calcular, por ejemplo, el factorial de
    5, podríamos intentar reducir el problema a calcular el factorial de 4, que
    es un número que está más cerca del caso base (que es 0).

  - A su vez, para calcular el factorial de 4, reduciríamos el problema a
    calcular el factorial de 3, y así sucesivamente.

  - De esta forma, podemos reducir el problema de calcular el factorial de $n$
    a calcular el factorial de $(n - 1)$, que es un número que está más cerca
    del 0. Así, cada vez estaremos más cerca del caso base y, al final, siempre
    lo acabaremos alcanzando.

### Pensamiento optimista

- Consiste en suponer que la función deseada ya existe y que, aunque no sabe
  resolver el ejemplar original del problema, sí que es capaz de resolver
  ejemplares _más pequeños_ de ese problema (este paso se denomina **hipótesis
  inductiva** o **hipótesis de inducción**).

- Suponiendo que se cumple la _hipótesis inductiva_, y aprovechando que ya
  contamos con un método para _reducir el ejemplar a uno más pequeño_, ahora
  tratamos de encontrar un _patrón común_ de forma que resolver el ejemplar
  original implique usar el mismo patrón en un ejemplar más pequeño.

- Es decir:

  - Al reducir el problema, obtenemos un ejemplar más pequeño del mismo
    problema y, por tanto, podremos usar la función para poder resolver ese
    ejemplar más pequeño (que sí sabe resolverlo, por hipótesis inductiva).

  - A continuación, usamos dicha solución _parcial_ para tratar de obtener la
    solución para el ejemplar original del problema.

---

- En el ejemplo del factorial:

  - Supongamos que queremos calcular, por ejemplo, el factorial de 6.

  - Aún no sabemos calcular el factorial de 6, pero suponemos (por _hipótesis
    inductiva_) que sí sabemos calcular el factorial de 5.

    En ese caso, ¿cómo puedo aprovechar que sé resolver el factorial de 5 para
    lograr calcular el factorial de 6?

  - Analizando el problema, observo que se cumple esta propiedad:
    $$6! = 6\cdot\overbrace{5\cdot4\cdot3\cdot2\cdot1}^{5!}=6\cdot 5!$$

    Por tanto, he deducido un método para resolver el problema de calcular el
    factorial de 6 a partir del factorial de 5: _para calcular el
    factorial de 6 basta con calcular primero el factorial de 5 y luego
    multiplicar el resultado por 6_.

    !CAJA
    ~~~~~~~~~~~~~~~~~~~~
    Dicho de otro modo: _si yo supiera_ calcular el factorial de 5, me bastaría
    con multiplicarlo por 6 para obtener el factorial de 6.
    ~~~~~~~~~~~~~~~~~~~~

---

- Generalizando para cualquier número, no sólo para el 6:

  - Si queremos diseñar una función $fact(n)$ que calcule el factorial de $n$,
    supondremos que esa función ya existe pero que aún no sabe calcular el
    factorial de $n$, aunque **sí sabe calcular el factorial de
    $\pmb{(n - 1)}$**.

    Tenemos que creer en que es así y actuar como si fuera así, aunque ahora
    mismo no sea verdad. _Ésta es nuestra **hipótesis inductiva**_.

  - Por otra parte, sabemos que:
    $$n! = n\cdot\overbrace{(n-1)\cdot(n-2)\cdot(n-3)\cdot2\cdot1}^{(n-1)!}=n\cdot(n-1)!$$

    Por tanto, si sabemos calcular el factorial de $(n - 1)$ llamando a $fact(n
    - 1)$, para calcular $fact(n)$ sólo necesito multiplicar $n$ por el
    resultado de $fact(n - 1)$.

    !CAJA
    ~~~~~~~~~~~~~~~~~~~~
    Resumiendo: **_si yo supiera_ calcular el factorial de $\pmb{(n - 1)}$, me
    bastaría con multiplicarlo por $\pmb{n}$ para obtener el factorial de
    $\pmb{n}$**.
    ~~~~~~~~~~~~~~~~~~~~

  - Así obtengo el caso recursivo de la función _fact_, que sería:
    $$fact(n) = n\cdot fact(n-1)$$

---

- Combinando todos los pasos, obtenemos la solución general:

$$fact(n) = \begin{cases}
         1 & \text{si } n = 0 \text{\quad(caso base)} \\
         n\cdot fact(n-1) & \text{si } n > 0 \text{\quad(caso recursivo)}
       \end{cases}$$

## Recursividad lineal

- Una función tiene **recursividad lineal** si cada llamada a la función
  recursiva genera, como mucho, otra llamada recursiva a la misma función.

- El factorial definido en el ejemplo anterior es un caso típico de
  recursividad lineal ya que, cada vez que se llama al factorial se genera,
  como mucho, otra llamada al factorial.

- Eso se aprecia claramente observando que la definición del caso recursivo de
  la función $fact$ contiene una única llamada a la misma función $fact$:

$$fact(n) = n\cdot fact(n-1)\quad \text{si } n > 0\quad \text{(caso recursivo)}$$

### Procesos recursivos lineales

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

  - La **expansión** ocurre conforme el proceso construye una secuencia de
    operaciones a realizar *posteriormente* (en este caso, una secuencia de
    multiplicaciones).

  - La **contracción** se realiza conforme se van ejecutando realmente las
    multiplicaciones.

- Llamaremos **proceso recursivo** a este tipo de proceso caracterizado por una
  secuencia de **operaciones pendientes de completar**.

- Para poder ejecutar este proceso, el intérprete necesita **memorizar**, en
  algún lugar, un registro de las multiplicaciones que se han dejado para más
  adelante.

- En el cálculo de $n!$, la longitud de la secuencia de operaciones pendientes
  (y, por tanto, la información que necesita almacenar el intérprete), crece
  *linealmente* con $n$, al igual que el número de pasos de reducción.

  A este tipo de procesos lo llamaremos **proceso recursivo _lineal_**.

### Procesos iterativos lineales

- A continuación adoptaremos un enfoque diferente.

- Podemos mantener un producto acumulado y un contador desde $n$ hasta 1, de
  forma que el contador y el producto cambien de un paso al siguiente según la
  siguiente regla:

  $$\begin{array}{l}
      acumulador_{nuevo} = acumulador_{viejo} \cdot contador_{viejo} \\!MASSEP
      contador_{nuevo} = contador_{viejo} - 1
    \end{array}$$

- Su traducción a Python podría ser la siguiente, usando una función auxiliar
  `fact_iter`:

  ```python
  fact_iter = lambda cont, acc: acc if cont == 0 else \
                                fact_iter(cont - 1, cont * acc)
  factorial = lambda n: fact_iter(n, 1)
  ```

---

- Al igual que antes, usaremos el modelo de sustitución para visualizar el
  proceso del cálculo de $6!$:

  ```python
  factorial(6)
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
  parámetros !PYTHON(cont) y !PYTHON(acc), por lo que el tamaño de la memoria
  necesaria es constante.

- A este tipo de procesos lo llamaremos **proceso iterativo**.

- El número de pasos necesarios para calcular $n!$ usando esta función crece
  *linealmente* con $n$.

  A este tipo de procesos lo llamaremos **proceso iterativo _lineal_**.

---

--------------------------------------------------------------------------------------------
Tipo de proceso           Número de                          Memoria necesaria
                          reducciones
------------------------- -------------------------------    -------------------------------
Recursivo                 Proporcional a $\underline{n}$     Proporcional a $\underline{n}$

Iterativo                 Proporcional a $\underline{n}$     Constante
--------------------------------------------------------------------------------------------

!ifdef(LATEX)()(<br>* * *<br>)

-------------------------------------------------------------------------------------------
Tipo de proceso           Número de                         Memoria necesaria
                          reducciones
------------------------- -------------------------------   -------------------------------
Recursivo lineal          Linealmente \                     Linealmente \
                          proporcional a $\underline{n}$    proporcional a $\underline{n}$

Iterativo lineal          Linealmente \
                          proporcional a $\underline{n}$    Constante
-------------------------------------------------------------------------------------------

---

- En general, un **proceso iterativo** es aquel que está definido por una serie
  de **coordenadas de estado** junto con una **regla** fija que describe cómo
  actualizar dichas coordenadas conforme cambia el proceso de un estado al
  siguiente.

- La **diferencia entre los procesos recursivo e iterativo** se puede describir
  de esta otra manera:

  - En el **proceso iterativo**, los parámetros dan una descripción completa
    del estado del proceso en cada instante.

    Así, si parásemos el cálculo entre dos pasos, lo único que necesitaríamos
    hacer para seguir con el cálculo es darle al intérprete el valor de los dos
    parámetros.

  - En el **proceso recursivo**, el intérprete tiene que mantener cierta
    información *oculta* que no está almacenada en ningún parámetro y que
    indica qué operaciones ha realizado hasta ahora y cuáles quedan pendientes
    por hacer.

---

- No debe confundirse un **proceso recursivo** con una **función recursiva**:

  - Cuando hablamos de *función recursiva* nos referimos al hecho de que la
    función se llama a sí misma (directa o indirectamente).

  - Cuando hablamos de *proceso recursivo* nos referimos a la forma en como se
    desenvuelve la ejecución de la función (con una expansión más una
    contracción).

- Puede parecer extraño que digamos que una función recursiva (por ejemplo,
  !PYTHON(fact_iter)) genera un proceso iterativo.

  Sin embargo, el proceso es realmente iterativo porque su estado está definido
  completamente por dos parámetros, y para ejecutar el proceso sólo se necesita
  almacenar el valor de esos dos parámetros.

---

- Aquí hemos visto un ejemplo donde se aprecia claramente que **una función
  sólo puede tener una especificación** pero **puede tener varias
  implementaciones** distintas.

- Eso sí: todas las implementaciones de una función deben satisfacer su
  especificación.

- En este caso, las dos implementaciones son:

  ```python
  factorial = lambda n: 1 if n == 0 else n * factorial(n - 1)
  ```

  y

  ```python
  fact_iter = lambda cont, acc: acc if cont == 0 else \
                                fact_iter(cont - 1, cont * acc)
  factorial = lambda n: fact_iter(n, 1)
  ```

- Y aunque las dos satisfacen la misma especificación (y, por tanto, calculan
  exactamente los mismos valores), lo hacen de una forma muy diferente,
  generando incluso procesos de distinto tipo.

## Recursividad múltiple

- Una función tiene **recursividad múltiple** cuando, durante la misma
  activación o llamada a la función, se puede generar más de una llamada
  recursiva a la misma función.

- El ejemplo clásico es la función que calcula los términos de la **sucesión de
  Fibonacci**.

- La sucesión comienza con los números 0 y 1, y a partir de éstos, cada
  término es la suma de los dos anteriores:

  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, ...

---

- Podemos definir una función recursiva que devuelva el $n$-ésimo término de la
  sucesión de Fibonacci:

  $$fib(n) = \begin{cases}
               0 & \text{si } n = 0 \text{\quad (caso base)} \\
               1 & \text{si } n = 1 \text{\quad (caso base)} \\
               fib(n - 1) + fib(n - 2) & \text{si } n > 1 \text{\quad (caso recursivo)}
             \end{cases}$$

---

- La especificación de una función que devuelva el $n$-ésimo término de la
  sucesión de Fibonacci sería:

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(n \geq 0)
  !SIGNAT(\texttt{fib(!VAR(n):\,int)\;->\;int})
  !POST(\texttt{fib(!VAR(n))} = \text{el !VAR(n)-ésimo término de la sucesión de Fibonacci})
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Y su implementación en Python podría ser:

  ```python
  fib = lambda n: 0 if n == 0 else 1 if n == 1 else fib(n - 1) + fib(n - 2)
  ```

  o bien, separando la definición en varias líneas:

  ```python
  fib = lambda n: 0 if n == 0 else \
                  1 if n == 1 else \
                  fib(n - 1) + fib(n - 2)
  ```

---

- Si vemos el perfil de ejecución de !PYTHON(fib(5)), vemos que:

  - Para calcular !PYTHON(fib(5)), antes debemos calcular !PYTHON(fib(4)) y
    !PYTHON(fib(3)).

  - Para calcular !PYTHON(fib(4)), antes debemos calcular !PYTHON(fib(3)) y
    !PYTHON(fib(2)).

  - Así sucesivamente hasta poner todo en función de !PYTHON(fib(0)) y
    !PYTHON(fib(1)), que se pueden calcular directamente (son los casos base).

- En general, el proceso resultante tiene forma de árbol.

- Por eso decimos que las funciones con recursividad múltiple generan
  **procesos recursivos en árbol**.

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
u1[label = "1", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
u2[label = "1", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
u3[label = "1", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
u4[label = "1", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
u5[label = "1", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
c1[label = "0", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
c2[label = "0", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
c3[label = "0", shape = circle, width = 0.3, fixedsize = shape, fillcolor = white]
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

- En general, en un proceso recursivo en árbol **el tiempo de ejecución crece
  con el _número de nodos_ del árbol** mientras que **el espacio necesario
  crece con la _altura máxima_ del árbol**.

---

- Se puede construir un **proceso iterativo** para calcular los números de
  Fibonacci.

- La idea consiste en usar dos coordenadas de estado _a_ y _b_ (con valores
  iniciales 0 y 1, respectivamente) y aplicar repetidamente la siguiente
  transformación:

  $$\begin{array}{l}
      a_{nuevo} = b_{viejo} \\!MASSEP
      b_{nuevo} = b_{viejo} + a_{viejo}
    \end{array}$$

- Después de $n$ pasos, _a_ y _b_ contendrán $fib(n)$ y $fib(n + 1)$,
  respectivamente.

- En Python sería:

  ```python
  fib_iter = lambda cont, a, b: a if cont == 0 else fib_iter(cont - 1, b, a + b)
  fib = lambda n: fib_iter(n, 0, 1)
  ```

- Esta función genera un proceso iterativo lineal, por lo que es mucho más
  eficiente.

## Recursividad final y no final

- Lo que diferencia al !PYTHON(fact_iter) que genera un proceso iterativo del
  !PYTHON(factorial) que genera un proceso recursivo, es el hecho de que
  !PYTHON(fact_iter) se llama a sí misma y devuelve directamente el valor que
  le ha devuelto su llamada recursiva sin hacer luego nada más.

  En cambio, !PYTHON(factorial) tiene que hacer una multiplicación después de
  llamarse a sí misma y antes de terminar de ejecutarse:

  ```python
  # Versión con recursividad final:
  fact_iter = lambda cont, acc: acc if cont == 0 else \
                                fact_iter(cont - 1, acc * cont)
  fact = lambda n: fact_iter(n, 1)

  # Versión con recursividad no final:
  factorial = lambda n: 1 if n == 0 else n * factorial(n - 1)
  ```

---

- Es decir:

  - !PYTHON(fact_iter(cont, acc)) simplemente llama a:

    !PYTHON(fact_iter(cont - 1, acc * cont))

    y luego devuelve directamente el valor que le entrega ésta llamada, sin
    hacer ninguna otra operación posterior antes de terminar.

  - En cambio, !PYTHON(factorial(n)) hace:

    !PYTHON(n * factorial(n - 1))

    o sea,
    se llama a sí misma pero el resultado de la llamada recursiva tiene que
    multiplicarlo luego por !PYTHON(n) antes de devolver el resultado final.

- Por tanto, **lo último que hace !PYTHON(fact_iter) es llamarse a sí misma**.
  En cambio, lo último que hace !PYTHON(factorial) no es llamarse a sí misma,
  porque tiene que hacer más operaciones (en este caso, la multiplicación)
  antes de devolver el resultado.

---

- Cuando lo último que hace una función recursiva es llamarse a sí misma y
  devolver directamente el valor devuelto por esa llamada recursiva, decimos
  que la función es **recursiva final** o que tiene **recursividad final**.

- En caso contrario, decimos que la función es **recursiva no final** o que
  tiene **recursividad no final**.

- **Las funciones recursivas finales generan procesos iterativos.**

- La función `fact_iter` es recursiva final, y por eso genera un proceso
  iterativo.

- En cambio, la función `factorial` es recursiva no final, y por eso genera un
  proceso recursivo.

---

- En la práctica, para que un proceso iterativo consuma realmente una cantidad
  constante de memoria, es necesario que el traductor **optimice la
  recursividad final**.

- Ese tipo de optimización se denomina **_tail-call optimization (TCO)_**.

- No muchos traductores optimizan la recursividad final.

- De hecho, ni el intérprete de Python ni la máquina virtual de Java optimizan
  la recursividad final.

- Por tanto, en estos dos lenguajes, las funciones recursivas finales consumen
  tanta memoria como las no finales.

# Abstracciones funcionales

## Las funciones como abstracciones y generalizaciones

- Recordemos la definición de la función !PYTHON(area):

  ```python
  cuadrado = lambda x: x * x
  area = lambda r: 3.1416 * cuadrado(r)
  ```

- Aunque es muy sencilla, la función !PYTHON(area) ejemplifica la propiedad más
  potente de las funciones definidas por el programador: la **abstracción**.

- La función !PYTHON(area) está definida sobre la función !PYTHON(cuadrado),
  pero sólo necesita saber de ella qué resultados de salida devuelve a partir
  de sus argumentos de entrada (o sea, **_qué_** calcula y no **_cómo_** lo
  calcula).

- Podemos escribir la función !PYTHON(area) sin preocuparnos de cómo calcular
  el cuadrado de un número, porque eso ya lo hace la función !PYTHON(cuadrado).

- **Los detalles** sobre cómo se calcula el cuadrado están **ocultos dentro de
  la definición** de !PYTHON(cuadrado). Esos detalles **se ignoran en este
  momento** al diseñar !PYTHON(area), para considerarlos más tarde si hiciera
  falta.

---

- De hecho, por lo que respecta a !PYTHON(area), !PYTHON(cuadrado) no
  representa una definición concreta de función, sino más bien la abstracción
  de una función, lo que se denomina una **abstracción funcional**, ya que a
  !PYTHON(area) le sirve igual de bien cualquier función que calcule el
  cuadrado de un número.

- Por tanto, si consideramos únicamente los valores que devuelven, las tres
  funciones siguientes son indistinguibles e igual de válidas para
  !PYTHON(area). Ambas reciben un argumento numérico y devuelven el cuadrado de
  ese número:

  ```python
  cuadrado = lambda x: x * x
  cuadrado = lambda x: x ** 2
  cuadrado = lambda x: x * (x - 1) + x
  ```

- En otras palabras: la definición de una función debe ser capaz de **ocultar
  sus detalles internos de funcionamiento**, ya que para usar la función no
  debe ser necesario conocer esos detalles.

---

- **Encapsular** es el acto de encerrar algo dentro una _cápsula_, de forma que
  parte de lo que hay dentro queda visible y accesible desde el exterior,
  mientras que el resto queda oculto e inaccesible en el interior.

  El resultado de la encapsulación se denomina una «**_caja negra_**».

- **Abstraer** es centrarse en lo importante en un determinado momento e
  ignorar lo que en ese momento no resulta importante.

- **Crear una abstracción** es meter un mecanismo más o menos complejo dentro
  de una caja negra y darle un nombre, de forma que podamos referirnos a todo
  el conjunto simplemente usando su nombre sin tener que conocer su composición
  interna ni sus detalles internos de funcionamiento.

- Es importante entender que no todas las cajas negras son abstracciones. Una
  caja negra sólo es una abstracción cuando la encapsulación se hace de forma
  que deja visible sólo lo necesario para usar la abstracción y oculta lo demás
  (es decir, lo que no es necesario).

---

- Por tanto, para usar la abstracción nos bastará con conocer su _nombre_ y
  saber _qué hace_, sin necesidad de saber _cómo lo hace_ ni qué elementos la
  forman _internamente_.

- En consecuencia, las abstracciones están _encapsuladas_, pero no de cualquier
  manera, sino de forma que:

  - lo que queda visible desde el exterior de la cápsula es _qué hace la
    abstracción_, y

  - lo que se oculta en el interior es _cómo lo hace_.

- **La abstracción es el principal instrumento de control de la complejidad**,
  ya que nos permite ocultar detrás de un nombre los detalles que componen una
  parte del programa, haciendo que esa parte actúe (a ojos del programador que
  la utilice) como si fuera un elemento _predefinido_ del lenguaje, de forma
  que el programador lo puede usar sin tener que saber cómo funciona por
  dentro.

---

- Por tanto, **las funciones son abstracciones** porque nos permiten usarlas
  sin tener que conocer los detalles internos del procesamiento que realizan.

- Por ejemplo, si queremos usar la función !PYTHON{cubo} (que calcula el cubo
  de un número), nos da igual que dicha función esté implementada de cualquiera
  de las siguientes maneras:

  ```python
  cubo = lambda x: x * x * x
  cubo = lambda x: x ** 3
  cubo = lambda x: x * x ** 2
  ```

- Para **usar** la función, nos basta con saber que calcula el cubo de un
  número, sin necesidad de saber qué cálculo concreto realiza para obtener el
  resultado.

- Los detalles de implementación quedan ocultos y por eso también decimos que
  !PYTHON(cubo) es una abstracción.

---

- Las funciones también son abstracciones porque describen operaciones
  compuestas a realizar sobre ciertos valores sin importar cuáles sean esos
  valores en concreto (son **_generalizaciones_** de casos particulares).

- Por ejemplo, cuando definimos:

  ```python
  cubo = lambda x: x * x * x
  ```

  no estamos hablando del cubo de un número en particular, sino más bien de un
  **método** para calcular el cubo de cualquier número.

  Es decir: **estamos definiendo en qué consiste _elevar «algo» al cubo_, en
  general**.

- Por supuesto, nos las podemos arreglar sin definir el concepto de _cubo_,
  escribiendo siempre expresiones explícitas (como !PYTHON(3*3*3),
  !PYTHON(5*5*5), etc.) sin usar la palabra «`cubo`», pero eso nos obligaría
  siempre a expresarnos usando las operaciones primitivas de nuestro lenguaje
  (como `*`), en vez de poder usar términos de más alto nivel.

  Es decir: **nuestros programas podrían calcular el cubo de un número, pero no
  tendrían la habilidad de expresar el concepto de _elevar al cubo_**.

---

- Una de las habilidades que deberíamos pedir a un lenguaje potente es la
  posibilidad de **construir abstracciones** asignando nombres a los patrones
  más comunes, y luego trabajar directamente usando dichas abstracciones.

- Las funciones nos permiten esta habilidad, y esa es la razón de que todos los
  lenguajes (salvo los más primitivos) incluyan mecanismos para definir
  funciones.

- Por ejemplo: en el caso anterior, vemos que hay un patrón (multiplicar algo
  por sí mismo tres veces) que se repite con frecuencia, y a partir de él
  construimos una abstracción que asigna un nombre a ese patrón (*elevar al
  cubo*).

- Esa abstracción la definimos como una función que describe la *regla*
  necesaria para elevar algo al cubo.

---

- Por tanto, algunas veces, analizando ciertos _casos particulares_, observamos
  que se repite el mismo patrón en todos ellos, y de ahí extraemos un _caso
  general_ (es decir, hacemos una **generalización**) que agrupa a todos los
  posibles casos particulares que cumplen ese patrón.

- Luego, hacemos una **encapsulación**, metiendo ese caso general en una «_caja
  negra_» que oculte sus detalles internos, y finalmente le damos un nombre a
  la «caja», con lo que acabamos creando una **abstracción**.

- En resumen, creamos abstracciones:

  - Cuando queremos **reducir la complejidad**, dándole un nombre a un
    mecanismo complejo para poder referirnos a todo el conjunto a través de su
    nombre sin tener que recordar continuamente qué piezas contiene el
    mecanismo o cómo funciona éste por dentro.

  - Cuando queremos que nuestro programa pueda **expresar un concepto
    abstracto**, como el de «elevar al cubo».

  - Cuando creamos **casos generales a partir de patrones que se repiten** en
    varios casos particulares.

---

- Por ejemplo, cuando vemos que en nuestros programas es frecuente tener que
  multiplicar una cosa por sí misma tres veces, deducimos que ahí hay un patrón
  común que se repite en todos los casos.

- De ahí, creamos la abstracción que describe ese patrón general y le llamamos
  «_elevar al cubo_»:

!DOT(de-particular-a-general.svg)()(width=80%)(width=90%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
node [shape = plaintext, fillcolor = transparent]
rankdir = BT
c [label = "«elevar al cubo»"]
3 [label = "3 * 3 * 3", fontname = "monospace"]
y [label = "5 * 5 * 5", fontname = "monospace"]
radio [label = "radio * radio * radio", fontname = "monospace"]
3 -> c [minlen = 2]
y -> c [minlen = 2]
radio -> c [minlen = 2]
cp [label = "(casos particulares)"]
cg [label = "(caso general)"]
{ rank = same; cg; c }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ese patrón general representa a cada miembro del grupo formado por sus casos
  particulares, y se construye colocando un _parámetro_ allí donde los casos
  particulares se diferencian entre sí (es decir, hacemos una
  **parametrización**).

- La función resultante es, al mismo tiempo:

  - una **encapsulación** (porque los detalles internos de la función quedan
    ocultos dentro del cuerpo de la expresión lambda como si fuera una caja
    negra),

  - una **abstracción** (porque se puede invocar a la función usando
    simplemente su nombre sin necesidad de saber cómo está hecha por dentro y,
    por tanto, sabiendo _qué_ sin tener que saber _cómo_ lo hace), y

  - una **generalización** (porque, al estar parametrizada, representa muchos
    casos particulares con un único caso general).

- Al invocar a la función, se ligan sus parámetros con los argumentos de la
  llamada, lo que produce un caso particular a partir del caso general.

---

- En resumen, el proceso conceptual sería el siguiente:

  1. Observar que hay varios casos particulares que se parecen.

  2. Generalizar esos casos particulares creando un patrón.

  3. Parametrizar el patrón creando una abstracción lambda.

  4. Abstraer el patrón dándole un nombre.

- Veamos cada paso por separado con detalle.

---

1. Partimos de casos particulares que comparten un patrón que se repite:

   ```python
   3 * 3 * 3
   5 * 5 * 5
   ```

   - En este caso, el patrón es que hay «algo» que se multiplica por sí mismo
     tres veces.

   - En todos los casos particulares de ese patrón repetido vemos que hay
     elementos que se son iguales y otros que son diferentes.

   - Por ejemplo, los `*` son iguales, y lo que varía es el «objeto» que se
      multiplica (el `3`, el `5`, etcétera).

---

2. Generalizamos estos casos particulares, convirtiendo en identificadores
   libres aquellas partes en las que los casos particulares se diferencian,
   es decir, las partes que no son comunes:

   ```python
   x * x * x
   ```

   - El valor de esta expresión actualmente depende del valor al que esté ligado
     el identificador `x`, y decimos que ese identificador es _libre_.
   
   - Los **identificadores libres** son nombres que no se sabe de antemano a qué
     valores van a estar ligados, ya que dependen del _contexto_, es decir, de lo
     que hay fuera de la expresión cuando se va a evaluar.
   
   - En todo caso, un identificador libre estará ligado siempre a un mismo valor
     (de lo contrario, sería un _rebinding_, cosa que está prohibida) y, en ese
     sentido, se pueden considerar constantes.
   
   - Se dice que una expresión con identificadores libres está _abierta_, porque
     su valor depende de elementos externos a ella.

---

- El valor de la expresión !PYTHON(x * x * x) sigue dependiendo del valor
  ligado a `x`, ya que esta `x` es libre.

- Por tanto, para deducir qué valor tendrá la expresión tendremos que seguir
  conociendo su interior: tenemos que saber que su valor se calcula a partir
  del valor que tiene el identificador libre `x`.

- Esto hace que la expresión !PYTHON(x * x * x) no sea una buena abstracción,
  ya que no funciona como una _caja negra_. Esto se debe, principalmente, a
  que la expresión está _abierta_.

- Cuando una parte de un programa está _abierta_ resulta más difícil de
  programar y de razonar sobre ella, ya que su comportamiento depende del
  resto del programa. Lo que nos interesa (siempre que sea posible) es que la
  expresión esté _cerrada_.

---

3. Generalizamos aún más, _parametrizando_ los identificadores libres obtenidos
   en el paso anterior (y sólo éstos) utilizando el cuantificador
   !PYTHON(lambda), creando así una **_abstracción lambda_**:

   ```python
   cubo = lambda x: x * x * x
   ```

   Un **_cuantificador_** es un símbolo que _cierra_ expresiones convirtiendo
   los elementos que son externos a la expresión (los identificadores libres)
   en elementos propios de la expresión (_parámetros_).

   Los **parámetros** son nombres cuyo valor cambia dependiendo de los
   argumentos de la llamada. Por eso se pueden considerar _variables_ en el
   sentido matemático del término.

   Visto así, podemos interpretar que un cuantificador es un símbolo que
   convierte constantes en variables.

---

- Ahora hemos _cerrado_ la expresión creando una función en la que los
  identificadores libres ya no son libres sino _parámetros_ de la expresión
  lambda, así que la expresión ya no depende de nada que haya en el exterior de
  la misma.

- Al invocarla con un argumento concreto, el parámetro toma el valor de ese
  argumento y así se van obteniendo los casos particulares deseados:

  ```python
  (lambda x: x * x * x)(3) → 3 * 3 * 3
  (lambda x: x * x * x)(5) → 5 * 5 * 5
  ```

- La expresión lambda es una expresión cerrada que puede usarse simplemente
  pasándole los argumentos necesarios en cada llamada, sin necesidad de
  manipular directamente la expresión que forma su cuerpo y que es la que lleva
  a cabo el procesamiento y el cálculo del resultado.

- Por eso podemos decir que el cuerpo está _encapsulado_ dentro de la expresión
  lambda, la cual forma una **caja negra** con una parte visible y manipulable
  desde el exterior (sus parámetros) y otra parte que «vive» dentro de la
  cápsula (su cuerpo).

---

4. Abstraemos dándole un nombre a toda la expresión, de forma que ahora podemos
   usar su nombre en lugar de la expresión lambda:

   ```python
   cubo = lambda x: x * x * x
   ```

   - Por tanto, de ahora en adelante podemos llamar a la función usando su
     nombre:

      ```python
      cubo(3) → 3 * 3 * 3
      cubo(5) → 5 * 5 * 5
      ```

   - La función `cubo` así creada **es una abstracción** porque:

     - Para usarla sólo basta con saber su nombre y _qué_ hace.

     - No es necesario saber _cómo_ lo hace.

     - Es una caja negra que expone el _qué_ y oculta el _cómo_.

   - Además, una expresión lambda sin nombre es como una función de «usar y
     tirar» que vive y muere en la misma expresión donde se la utiliza. En
     cambio, cuando le damos un nombre, ya puede reutilizarse en muchas
     expresiones.

---

- La importancia de la **abstracción** reside en su capacidad para ocultar
  detalles irrelevantes y en el uso de nombres para referenciar objetos.

- La principal preocupación del usuario de un programa (o de cada una de sus
  partes) es _qué_ hace. Esto contrasta con la del programador de esa parte del
  programa, cuya principal preocupación es _cómo_ lo hace.

- Los lenguajes de programación proporcionan abstracción mediante funciones (y
  otros elementos como procedimientos y módulos, que veremos posteriormente)
  que permiten al programador distinguir entre lo que hace una parte del
  programa y cómo se implementa esa parte.

- Una función, además, **encapsula** porque crea una _cápsula_ alrededor de
  ella que sólo deja visible al exterior parte de su contenido; en particular,
  la cápsula de una función sólo deja pasar fuera lo necesario para poder usar
  la función, y oculta dentro todo lo demás, es decir, lo que no es necesario
  conocer ni manipular para usarla.

- La abstracción es esencial en la construcción de programas. Pone el énfasis
  en lo que algo es o hace, más que en cómo se representa o cómo funciona. Por
  lo tanto, es el principal medio para gestionar la complejidad en programas
  grandes.

---

- De igual importancia es la **generalización**.

- Mientras que la abstracción reduce la complejidad al ocultar detalles
  irrelevantes, la generalización la reduce al sustituir, con una sola
  construcción, varios elementos que realizan una funcionalidad similar.

- Los lenguajes de programación permiten la generalización mediante variables,
  parametrización, genéricos y polimorfismo.

- La generalización es esencial en la construcción de programas. Pone el
  énfasis en las similitudes entre elementos. Por lo tanto, ayuda a gestionar
  la complejidad al agrupar individuos y proporcionar un representante que
  puede utilizarse para especificar cualquier individuo del grupo.

## Pureza

- Si una expresión lambda no contiene identificadores libres, el valor que
  obtendremos al aplicarla a unos argumentos dependerá únicamente del valor que
  tengan esos argumentos (no dependerá de nada que sea «_exterior_» a la
  expresión lambda).

- En cambio, si el cuerpo de una expresión lambda contiene identificadores
  libres, el valor que obtendremos al aplicarla a unos argumentos no sólo
  dependerá del valor de los argumentos, sino también de los valores a los que
  estén ligados esos identificadores libres en el momento de evaluar la
  aplicación de la expresión lambda.

- Es el caso del siguiente ejemplo, donde tenemos una expresión lambda que
  contiene un identificador libre (!PYTHON{z}) y, por tanto, cuando la
  aplicamos a los argumentos !PYTHON(4) y !PYTHON(3) obtenemos un valor que
  depende no sólo de los valores de !PYTHON(x) e !PYTHON(y) sino también del
  valor de !PYTHON(z) en el entorno:

  ```python
  >>> prueba = lambda x, y: x + y + z
  >>> z = 9
  >>> prueba(4, 3)
  16
  ```

---

- En este otro ejemplo, tenemos una expresión lambda que calcula la suma de
  tres números a partir de otra expresión lambda que calcula la suma de dos
  números:

  ```python
  suma = lambda x, y: x + y
  suma3 = lambda x, y, z: suma(x, y) + z
  ```

  En este caso, hay un identificador (!PYTHON(suma)) que no aparece en la lista
  de parámetros de la expresión lambda ligada a !PYTHON(suma3).

  En consecuencia, el valor de dicha expresión lambda dependerá de lo que valga
  !PYTHON(suma) en el entorno actual.

---

- Se dice que una expresión lambda es **pura** si, siempre que la apliquemos a
  unos argumentos, el valor obtenido va a depender únicamente del valor de esos
  argumentos o, lo que es lo mismo, del valor de sus parámetros en la llamada.

- Podemos decir que hay distintos **grados de pureza**:

  - Una expresión lambda en cuyo cuerpo no hay ningún identificador libre es
    **más pura** que otra que contiene identificadores libres.

  - Una expresión lambda cuyos **identificadores libres** representan
    **funciones** que se usan en el cuerpo de la expresión lambda, es **más
    pura** que otra cuyos identificadores libres representan cualquier otro
    tipo de valor.

  En el ejemplo anterior, tenemos que la expresión lambda de !PYTHON(suma3),
  sin ser *totalmente pura*, a efectos prácticos se la puede considerar
  **pura**, ya que su único identificador libre (!PYTHON(suma)) se usa como una
  **función**.

---

- Por ejemplo, las siguientes expresiones lambda están ordenadas de mayor a
  menor pureza, siendo la primera totalmente **pura**:

  ```python
  # producto es una expresión lambda totalmente pura:
  producto = lambda x, y: x * y
  # cuadrado es casi pura; a efectos prácticos se la puede
  # considerar pura ya que sus identificadores libres (en este
  # caso, sólo una: producto) son funciones:
  cuadrado = lambda x: producto(x, x)
  # suma es impura, porque su identificador libre (z) no es una función:
  suma = lambda x, y: x + y + z
  ```

- **La pureza de una función es un rasgo deseado y que hay que tratar de
  alcanzar siempre que sea posible**, ya que facilita el desarrollo y
  mantenimiento de los programas, además de simplificar el razonamiento sobre
  los mismos, permitiendo aplicar directamente nuestro modelo de sustitución.

- Es más incómodo trabajar con !PYTHON(suma) porque hay que *recordar* que
  depende de un valor que está *fuera* de la expresión lambda, cosa que no
  resulta evidente a no ser que mires en el cuerpo de la expresión lambda.

## Especificaciones de funciones

- La **especificación de una _función_** es la descripción de **qué** hace la
  función sin entrar a detallar **cómo** lo hace.

- La **implementación de una _función_** es la descripción de **cómo** hace lo
  que hace, es decir, los detalles de su algoritmo interno.

- **Para poder usar una función, un programador no debe necesitar saber cómo
  está implementada**.

- Eso es lo que ocurre, por ejemplo, con las funciones predefinidas del
  lenguaje (como !PYTHON(max), !PYTHON(abs) o !PYTHON(len)): sabemos *qué*
  hacen pero no necesitamos saber *cómo* lo hacen.

- Incluso puede que el usuario de una función no sea el mismo que la ha
  escrito, sino que la puede haber recibido de otro programador como una
  «**caja negra**», que tiene unas entradas y una salida pero no se sabe cómo
  funciona por dentro.

---

- Para poder **usar una abstracción funcional** _nos basta_ con conocer su
  _especificación_, porque es la descripción de qué hace esa función.

- Igualmente, para poder **implementar una abstracción funcional**
  _necesitamos_ conocer su _especificación_, ya que necesitamos saber _qué
  tiene que hacer_ la función antes de diseñar _cómo va a hacerlo_.

- La especificación de una abstracción funcional describe tres características
  fundamentales de dicha función:

  - El **dominio**: el conjunto de datos de entrada válidos.

  - El **rango** o **codominio**: el conjunto de posibles valores que devuelve.

  - El **propósito**: qué hace la función, es decir, la relación entre su
    entrada y su salida.

---

- Hasta ahora, al especificar **programas**, hemos llamado «**entrada**» al
  dominio, y hemos agrupado el rango y el propósito en una sola propiedad que
  llamamos «**salida**».

- Por ejemplo, cualquier función !PYTHON(cuadrado) que usemos para implementar
  !PYTHON(area) debe satisfacer esta especificación:

  $$\begin{cases}
    \text{\textbf{Entrada}}: n \in \mathbb{R} \\
    \texttt{cuadrado} \\
    \text{\textbf{Salida}}: n^2
  \end{cases}$$

- La especificación **no concreta cómo** se debe llevar a cabo el propósito.
  Esos son **detalles de implementación** que se abstraen a este nivel.

- Este esquema es el que hemos usado hasta ahora para especificar programas, y
  se podría seguir usando para especificar funciones, ya que éstas son
  consideradas _subprogramas_ (programas que forman parte de otros programas
  más grandes).

---

- Pero para especificar funciones resulta más adecuado usar el siguiente
  esquema, al que llamaremos **especificación funcional**:

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(\texttt{True})
  !SIGNAT(\texttt{cuadrado(!VAR(n):\,float)\;->\;float})
  !POST(\texttt{cuadrado(!VAR(n))} = n^2)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- «**Pre**» representa la **precondición**: la propiedad que debe cumplirse
  justo _en el momento_ de llamar a la función.

- «**Post**» representa la **postcondición**: la propiedad que debe cumplirse
  justo *después* de que la función haya terminado de ejecutarse.

- Lo que hay en medio es la **signatura**: el nombre de la función, el nombre y
  tipo de sus parámetros y el tipo del valor de retorno.

- La especificación se lee así: «**_Si se llama a la función respetando su
  signatura y cumpliendo su precondición, la llamada termina cumpliendo su
  postcondición_**».

---

- En este caso, la **precondición** es !PYTHON(True), que equivale a decir que
  cualquier condición de entrada es buena para usar la función.

- Dicho de otra forma: no hace falta que se dé ninguna condición especial para
  usar la función. Siempre que la llamada respete la signatura de la función,
  el parámetro $n$ puede tomar cualquier valor de tipo !PYTHON(float) y no hay
  ninguna restricción adicional.

- Por otro lado, la **postcondición** dice que al llamar a la función
  !PYTHON(cuadrado) con el argumento $n$ se debe devolver $n^2$.

- Tanto la precondición como la postcondición son **predicados**, es decir,
  expresiones lógicas que se escriben usando el lenguaje de las matemáticas y
  la lógica.

- La **signatura** se escribe usando la sintaxis del lenguaje de programación
  que se vaya a usar para implementar la función (Python, en este caso).

---

- Recordemos la diferencia entre:

  - **Dominio** y **conjunto origen** de una función.

  - **Rango** (o **codominio**) y **conjunto imagen** de una función.

- ¿Cómo recoge la especificación esas cuatro características de la función?

  - La **signatura** expresa el **conjunto origen** y el **conjunto imagen** de
    la función.

  - El **dominio** viene determinado por los valores del conjunto origen que
    cumplen la **precondición**.

  - El **codominio** viene determinado por los valores del conjunto imagen que
    cumplen la **postcondición**.

---

- En el caso de la función !PYTHON(cuadrado) tenemos que:

  - El conjunto origen es !PYTHON(float), ya que su parámetro $n$ está
    declarado de tipo !PYTHON(float) en la signatura de la función.

    Por tanto, los datos de entrada a la función deberán pertenecer al tipo
    !PYTHON(float).

  - El dominio coincide con el conjunto origen, ya que su precondición es
    !PYTHON(True). Eso quiere decir que cualquier dato de entrada es válido
    siempre que pertenezca al dominio (en este caso, el tipo !PYTHON(float)).

  - El conjunto imagen también es !PYTHON(float), ya que así está declarado el
    tipo de retorno de la función.

---

- Las pre y postcondiciones no es necesario escribirlas de una manera **formal
  y rigurosa**, usando el lenguaje de las Matemáticas o la Lógica.

- Si la especificación se escribe en *lenguaje natural* y se entiende bien,
  completamente y sin ambigüedades, no hay problema.

- El motivo de usar un lenguaje formal es que, normalmente, resulta **mucho más
  conciso y preciso que el lenguaje natural**.

- El lenguaje natural suele ser:

  - **Más prolijo**: necesita más palabras para decir lo mismo que diríamos
    matemáticamente usando menos caracteres.

  - **Más ambiguo**: lo que se dice en lenguaje natural se puede interpretar de
    distintas formas.

  - **Menos completo**: quedan flecos y situaciones especiales que no se tienen
    en cuenta.

---

- En este otro ejemplo, más completo, se especifica una función llamada
  !PYTHON(cuenta):

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(car !NEQ \text{\texttt{""}} \land \texttt{len(}car\texttt{)} = 1)
  !SIGNAT(\texttt{cuenta(!VAR(cadena):\,str,\;!VAR(car):\,str)\;->\;int})
  !POST
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    \texttt{cuenta(!VAR(cadena),\;!VAR(car))} \geq 0\ \land
  & \texttt{cuenta(!VAR(cadena),\;!VAR(car))} = cadena\texttt{.count(!VAR(car))}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Con esta especificación, estamos diciendo que !PYTHON(cuenta) es una función
  que recibe una cadena y un carácter (otra cadena con un único carácter
  dentro).

- Ahora bien: esa cadena y ese carácter no pueden ser cualesquiera, sino que
  tienen que cumplir la _precondición_.

- Eso significa, entre otras cosas, que aquí **el _dominio_ y el _conjunto
  origen_ de la función no coinciden** (no todos los valores pertenecientes al
  conjunto origen sirven como datos de entrada válidos para la función).

---

- En esta especificación, !PYTHON(count) se usa como un **método auxiliar**.

  Las _operaciones auxiliares_ se puede usar en una especificación siempre que
  estén perfectamente especificadas, aunque no estén implementadas.

- En este caso, se usa en la _postcondición_ para decir que la función
  !PYTHON(cuenta), la que se está especificando, debe devolver el mismo
  resultado que devuelve el método !PYTHON{count} (el cual ya conocemos
  perfectamente y sabemos qué hace, puesto que es un método que ya existe en
  Python).

- Es decir: la especificación anterior describe con total precisión que la
  función !PYTHON(cuenta) **cuenta el número de veces que el carácter
  $\underline{\textbf{\textit{car}}}$ aparece en la cadena
  $\underline{\textbf{\textit{cadena}}}$**.

---

- En realidad, las condiciones de la especificación anterior se podrían
  simplificar aprovechando las propiedades de las expresiones lógicas, quedando
  así:

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(\texttt{len(!VAR(car))} = 1)
  !SIGNAT(\texttt{cuenta(!VAR(cadena):\,str,\;!VAR(car):\,str)\;->\;int})
  !POST(\texttt{cuenta(!VAR(cadena),\;!VAR(car))} = cadena\texttt{.count(!VAR(car))})
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJERCICIO

@. ¿Por qué?

---

- Finalmente, podríamos escribir la misma especificación en lenguaje natural:

  !ESPEC
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PRE(car \text{ debe ser un único carácter})
  !SIGNAT(\texttt{cuenta(!VAR(cadena):\,str,\;!VAR(car):\,str)\;->\;int})
  !POST
  ~~~~~~~~~~~~~~~~~~~~~~~~~
    \texttt{cuenta(!VAR(cadena),\;!VAR(car))} \text{ devuelve el número de veces}
  & \text{que aparece el carácter } car \text{ en la cadena } cadena.
  & \text{Si } cadena \text{ es vacía o } car \text{ no aparece nunca en la}
  & \text{cadena } cadena \text{, debe devolver } 0.
  ~~~~~~~~~~~~~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Probablemente resulta más fácil de leer (sobre todo para los novatos), pero
  también es más largo y prolijo.

- Es como un contrato escrito por un abogado en lenguaje jurídico.

<!--

- Un ejemplo mucho más avanzado para los curiosos:

  $$\begin{cases}
    \text{\textbf{Pre}}: lista !NEQ \texttt{[]} \\
    suma\ (lista: \texttt{List[}T\texttt{]}) \text{ -> } T \\
    \text{\textbf{Post}}: suma(lista) = sum(lista)
  \end{cases}$$

- $sum$ es una función auxiliar.

- `List[`$T$`]` es un tipo genérico que pertenece al módulo `typing` y que se
  puede utilizar para indicar el tipo de una lista cuyos elementos son todos
  del tipo $T$.

- Con esto estamos diciendo que `suma` es una función que recibe una lista no
  vacía de elementos de un determinado tipo y que devuelve un resultado de ese
  mismo tipo.

- Para más información, consultar:

  - [https://docs.python.org/3/library/typing.html](https://docs.python.org/3/library/typing.html)

  - [https://www.python.org/dev/peps/pep-0484/](https://www.python.org/dev/peps/pep-0484/)
-->

!BIBLIOGRAFIA
