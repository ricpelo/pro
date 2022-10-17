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
  !NT(expresión_lambda) ::=  !T(lambda) [!NT(lista_parámetros)]!T(:) !NT(expresión)
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
  devolver la expresión resultante *parentizada* (entre paréntesis).

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

  3. Aplicar la expresión lambda a sus argumentos.

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
                   | !T{(}!NT(expresión_lambda)!T{)}
!NT(expresión_lambda) ::= !T(lambda) [!NT(lista_parámetros)]!T(:) !NT(expresión)
!NT(lista_parámetros) ::= !T{identificador}(!T(,) !T{identificador})\*
!NT(lista_argumentos) ::= !NT{expresión}(!T(,) !NT{expresión})\*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<!--

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
**Recuerda:**

En **Python**, las subexpresiones se evalúan **de izquierda a derecha**.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-->

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

## Variables ligadas y libres

- Si un _identificador_ de los que aparecen en el _cuerpo_ de una expresión
  lambda también aparece en la _lista de parámetros_ de esa expresión lambda, a
  ese identificador le llamamos **variable ligada** de la expresión lambda.

- En caso contrario, le llamamos **variable libre** de la expresión lambda.

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  los dos identificadores que aparecen en el cuerpo (!PYTHON(x) e !PYTHON(y))
  son variables ligadas, ya que ambos aparecen también en la lista de
  parámetros de la expresión lambda.

- En cambio, en la expresión lambda:

  ```python
  lambda x, y: x + y + z
  ```

  !PYTHON(x) e !PYTHON(y) son variables ligadas mientras que !PYTHON(z) es una
  variable libre.

---

- En realidad, **una _variable ligada_ y un _parámetro_ son la misma cosa**.

- Tan sólo cambia su denominación dependiendo del lugar donde aparece su
  identificador en la expresión lambda:

  - Cuando aparece **antes** del «`:`», le llamamos «_parámetro_».

  - Cuando aparece **después** del «`:`», le llamamos «_variable ligada_».

- Por ejemplo: en la siguiente expresión lambda:

  ```python
  lambda x, y: x + y
         ┬     ┬
         │     └────── variable ligada
         └── parámetro
  ```

  el identificador !PYTHON(x) aparece dos veces, pero en los dos casos
  representa la misma cosa. Tan sólo se llama de distinta forma («_parámetro_»
  o «_variable ligada_») dependiendo de dónde aparece.

---

- El que se llame «_variable ligada_» no tiene nada que ver con las _ligaduras_
  que hemos estudiado hasta ahora.

- Son conceptos totalmente distintos:

  - A las variables ligadas se las llama así porque están _ligadas a un
    parámetro_.

  - En cambio, una _ligadura_ es la asociación que se establece entre un
    _identificador_ y un _valor_.

# Ámbitos

## Ámbitos léxicos

- Un **ámbito léxico** es una porción del código fuente de un programa.

- Decimos que **ciertas construcciones sintácticas definen ámbitos léxicos**.

- Cuando una construcción define un ámbito léxico, **la sintaxis del lenguaje
  determina dónde empieza y acaba** ese ámbito léxico en el código fuente.

- Por tanto, siempre se puede determinar sin ambigüedad si **una instrucción
  está dentro de un determinado ámbito léxico**, tan sólo leyendo el código
  fuente del programa y sin necesidad de ejecutarlo.

- Eso significa que el concepto de _ámbito léxico_ es un concepto **estático**.

---

- Por ejemplo: en el lenguaje de programación Java, los bloques son estructuras
  sintácticas delimitadas por llaves `{` y `}` que contienen instrucciones.

- Los bloques de Java definen ámbitos léxicos; por tanto, si una instrucción
  está dentro de un bloque (es decir, si está situada entre las llaves `{` y
  `}` que delimitan el bloque), entonces esa instrucción se encuentra dentro
  del ámbito léxico que define el bloque.

---

- Además de los ámbitos léxicos, existen también los llamados **ámbitos
  dinámicos**, que funcionan de otra forma y que no estudiaremos en este curso.

- La mayoría de los lenguajes de programación usan ámbitos léxicos, salvo
  excepciones (como LISP o los _shell scripts_) que usan ámbitos dinámicos.

- Por esa razón, a partir de ahora, cuando hablemos de «ámbitos» sin
  especificar de qué tipo, nos estaremos siempre refiriendo a «ámbitos
  léxicos».

---

- Los ámbitos **se pueden anidar recursivamente**, o sea, que pueden estar
  contenidos unos dentro de otros.

- Por tanto, una instrucción puede estar en varios ámbitos al mismo tiempo
  (anidados unos dentro de otros).

- De todos ellos, el **ámbito más interno** es el que no contiene, a su vez, a
  ningún otro ámbito.

- En un momento dado, el **ámbito actual** es el ámbito más interno en el que
  se encuentra la instrucción que se está ejecutando actualmente.

---

- El concepto de _ámbito_ es un concepto nada trivial y, a medida que vayamos
  incorporando nuevos elementos al lenguaje, tendremos que ir adaptándolo para
  tener en cuenta más condicionantes.

- Por ahora sólo hemos tenido un ámbito llamado **ámbito global**:

  - Si se está ejecutando un _script_ en el intérprete por lotes (con
    `python script.py`), el _ámbito global_ abarca todo el _script_, desde la
    primera instrucción hasta la última.

  - Si estamos en el intérprete interactivo (con `python` o `ipython3`), el
    _ámbito global_ abarca toda nuestra sesión con el intérprete, desde que
    arrancamos la sesión hasta que finalicemos la misma.

- En el momento en que se empieza a ejecutar un _script_ o se arranca una
  sesión con el intérprete interactivo, se entra en el _ámbito global_.

- Del ámbito global sólo se sale cuando se finaliza la ejecución del _script_ o
  se cierra el intérprete interactivo.

---

- Se denominan **definiciones globales** a las definiciones que se ejecutan
  cuando el ámbito actual es el ámbito global.

- Las ligaduras que crean las definiciones globales se denominan **ligaduras
  globales** o **ligaduras de ámbito global**.

- Por ejemplo, en el siguiente _script_ se ejecutan cuatro instrucciones. El
  ámbito actual de cada una de las instrucciones es el ámbito global, que es el
  único ámbito que existe en el _script_:

  !IMGP(ambito-global.png)()(width=40%)(width=40%)

## Ámbito de creación de una ligadura

- Para nosotros, los ámbitos interesantes son los llamados _ámbitos de creación
  de una ligadura_.

- El **ámbito de creación de una ligadura** es el ámbito actual de la
  instrucción que crea la ligadura.

  Dicho de otra forma: es el ámbito más interno donde se crea la ligadura.

- Se dice que **la ligadura es _local_ al ámbito donde se crea la ligadura**.

- Si ese ámbito es el ámbito _global_, decimos que la ligadura es _global_.

---

- Como estamos usando un lenguaje de programación que trabaja con _ámbitos
  léxicos_, **el ámbito de creación de una ligadura siempre estará definido por
  una construcción sintáctica**.

- Por tanto:

  - Sus _límites_ vienen marcados únicamente por la _sintaxis_ de la
    construcción sintáctica que define el ámbito y dentro de la cual se está
    creando la ligadura.

  - El ámbito de creación de una ligadura se puede determinar simplemente
    leyendo el código fuente del programa, sin tener que ejecutarlo (es decir,
    que se puede determinar de forma _estática_).

### Visibilidad

- El ámbito de creación de una ligadura es una «región» cuyas fronteras limitan
  la porción del código fuente en la que es visible esa ligadura.

- En la mayoría de los lenguajes (incluyendo Python y Java), las ligaduras
  empiezan a existir justo donde se crea la ligadura, es decir, en el punto
  donde se ejecuta la instrucción que _define_ la ligadura.

  Por tanto, no es posible _acceder_ a esa ligadura _antes_ de ese punto.

- Por otra parte, una ligadura deja de existir (y, por tanto, deja de ser
  visible) allí donde termina su ámbito de creación.

- Eso significa que **no es posible acceder a esa ligadura fuera de su ámbito
  de creación**: sólo es visible dentro de él.

<!--

- Eso significa que la **visibilidad** de una ligadura y el **acceso** a una
  ligadura son conceptos distintos:

  - La **visibilidad** de una ligadura la define su ámbito de creación, y es,
    por tanto, un concepto **_estático_**.

  - La posibilidad de **acceder** a una ligadura depende de si esa ligadura ya
    se ha creado previamente al intentar acceder a ella durante la ejecución
    del programa, y es un concepto **_estático_** si el lenguaje es compilado,
    o **_dinámico_** si es interpretado.

-->

---

- En el siguiente ejemplo vemos cómo se crean varias ligaduras:

  ```{.python .number-lines}
  x = 25
  y = 99
  z = y
  nombre = 'Manolo'
  ```

- Todas esas ligaduras se definen en el ámbito global, por lo que el **ámbito
  de creación** de todas ellas es el **ámbito global** (y, por tanto, decimos
  que cada una de esas ligaduras es una **ligadura _global_** o **de _ámbito
  global_**).

- Una ligadura empieza a existir justo donde se crea, y termina de existir al
  final de su ámbito de creación.

- Por tanto, la ligadura `y` → `99` empieza a existir en la línea 2 y termina
  al final del _script_, que es donde termina su ámbito de creación (en este
  caso, el _ámbito global_).

- Eso quiere decir que esa ligadura sólo es visible desde que se crea hasta el
  final de su ámbito de creación.

---

- En resumen:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Ámbito (léxico):**

  Porción del código fuente de un programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Ámbito de creación de una ligadura:**

  El ámbito actual de la instrucción que define la ligadura; es decir: el
  ámbito más interno donde se define la ligadura. Los límites de ese ámbito
  sólo vienen determinados por la sintaxis del lenguaje, ya que ciertas
  construcciones sintácticas definen su propio ámbito.

  Este ámbito determina dónde está el límite de visibilidad de la ligadura
  (_dónde_ se puede ver la ligadura dentro del programa).
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Como a nosotros nos interesan principalmente los _ámbitos de creación_, a
  partir de ahora supondremos que, cuando hablamos de «_ámbito_», nos referimos
  al _ambito de creación de una ligadura_, si no se dice lo contrario.

---

- Un caso especial ocurre con los atributos de los _objetos_ de Python.

- Recordemos que, por ejemplo, cuando importamos un módulo usando la sentencia
  !PYTHON(import), podemos acceder al objeto que representa ese módulo usando
  su nombre, lo que nos permite acceder a sus atributos y crear otros nuevos.

- Esos atributos y sus ligaduras correspondientes (tanto las ya existentes como
  las nuevas que podamos crear) sólo son visibles cuando accedemos a ellas
  usando el operador punto (`.`) a través del objeto donde se ha definido, que
  es quien determina el contexto válido en el que esos atributos son visibles.

- Por tanto, no son visibles fuera del objeto:

  ```python
  >>> import math
  >>> math.pi
  3.141592653589793     # El nombre 'pi' es visible dentro del objeto
  >>> pi                # El nombre 'pi' no es visible fuera del objeto
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'pi' is not defined
  ```

---

- Igualmente, si creamos un nuevo atributo dentro del objeto, esa ligadura sólo
  existirá en el propio objeto y, por tanto, sólo será visible cuando accedamos
  al atributo a través del objeto donde se ha definido.

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

- En resumen: al resolver el nombre de un atributo de un objeto, la visibilidad
  de su ligadura no vendrá definida por un determinado ámbito, sino por el
  _contexto_ en el que se quiere acceder al atributo.

  Sólo podremos acceder al atributo si usamos el contexto adecuado, que en este
  caso es el objeto que contiene ese atributo.

### Almacenamiento

- Las ligaduras se almacenan en _espacios de nombres_.

- Si una instrucción crea una ligadura, se denomina **espacio de nombres
  actual** al espacio de nombres donde se almacena dicha ligadura.

- El espacio de nombres actual, es decir, el espacio de nombres que el
  compilador o el intérprete selecciona para almacenar una ligadura, depende
  del _contexto_ en el que se crea la ligadura.

- Tenemos dos posibilidades:

  1. El espacio de nombres seleccionado depende del ámbito donde se crea la
     ligadura.

  2. El espacio de nombres seleccionado NO depende del ámbito donde se crea la
     ligadura.

---

1. Si el espacio de nombres seleccionado depende del ámbito donde se crea la
   ligadura, tenemos que:

   a. Si el ámbito donde se crea la ligadura lleva asociado un espacio de
      nombres, ese espacio de nombres almacenará las ligaduras que se crean
      dentro de ese ámbito.

   b. Si no, entonces la ligadura se almacenará en el espacio de nombres del
      ámbito de creación más interno que contenga al actual y que sí lleve
      asociado un espacio de nombres.

   Por tanto, a la hora de almacenar una ligadura, se van mirando todos los
   ámbitos desde el ámbito actual, pasando por todos los ámbitos que incluyen a
   éste (en orden, de más interno a más externo), hasta encontrar el primer
   ámbito que lleve asociado un espacio de nombres.

   En todo caso, en Python, cuando el lugar donde se almacena la ligadura
   depende del ámbito donde se crea la ligadura, el espacio de nombres
   seleccionado será siempre un marco.

---

2. Si el espacio de nombres seleccionado NO depende del ámbito donde se crea la
   ligadura, entonces es porque la instrucción ya está indicando directamente
   el espacio de nombres apropiado.

   - Esto es lo que ocurre cuando se crea una ligadura dentro de un objeto en
     Python usando el operador punto (`.`), ya que los objetos son espacios de
     nombres en este lenguaje.

   - Por ejemplo, si en Python hacemos:

     ```python
     import math
     math.x = 75
     ```

     estamos creando la ligadura `x` → `75` en el espacio de nombres que
     representa el módulo `math` (que es un objeto en Python y que, por tanto,
     es quien almacena la ligadura), no en el espacio de nombres global ni en
     ningún otro.

     Por tanto, el espacio de nombres ha sido seleccionado a través del
     operador punto (`.`), no en función del ámbito donde se ha ejecutado la
     sentencia !PYTHON(math.x = 75).

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**En resumen:**

- El **ámbito** de una ligadura determina la **visibilidad** de la ligadura:
  dónde es _visible_ esa ligadura.

- El **espacio de nombres** determina el **almacenamiento** de la ligadura:
  dónde se _almacena_ esa ligadura.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Cuando las ligaduras se definen en el ámbito global, se dice que tienen
  **ámbito global**.

- Cuando las ligaduras se almacenan en el espacio de nombres global, se dice
  que tienen **almacenamiento global**.

- Ampliaremos ahora el concepto de _ámbito_ para incluir los aspectos nuevos
  que incorporan las expresiones lambda.

## Ámbito de un identificador

- A veces, por economía del lenguaje, se suele hablar del «**_ámbito de un
  identificador_**», en lugar de hablar del «_ámbito de creación de la ligadura
  que liga ese identificador con un valor_».

- Por ejemplo, en el siguiente _script_:

  ```python
  x = 25
  ```

  tenemos que:

  - En el ámbito global, se crea una ligadura que liga al identificador
    !PYTHON(x) con el valor !PYTHON(25).

  - Por tanto, se dice que **el _ámbito de creación de esa ligadura_ es el
    ámbito global**.

  - Pero también se suele decir que «_el identificador !PYTHON(x) es global_»
    (o, simplemente, que «_!PYTHON(x) es global_»), **asociando al ámbito** no
    la ligadura, sino **el identificador en sí**.

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

- **El cuerpo de la expresión lambda define un ámbito.**

- **Al llamar a la expresión lambda**, se empieza a ejecutar su cuerpo y, por
  tanto, **se entra en dicho ámbito**.

- En ese momento, **se crea un nuevo marco** en la memoria, que representa esa
  ejecución concreta de dicha expresión lambda.

- Lo primero que ocurre entonces es que **cada parámetro de la expresión lambda
  se liga a uno de esos argumentos** en el orden en que aparecen en la llamada
  a la expresión lambda (primer parámetro con primer argumento, segundo con
  segundo, etcétera).

- Esas ligaduras **se almacenan en el marco de la expresión lambda** nada más
  entrar en el cuerpo de la expresión lambda.

- Ese marco se eliminará de la memoria cuando se termine de ejecutar la
  expresión lambda.

---

- En consecuencia, podemos decir que:

  - El **ámbito de creación de la ligadura** entre un parámetro y su argumento
    es el **cuerpo** de la expresión lambda, así que la **visibilidad** del
    parámetro es ese cuerpo.

  - Esa ligadura se crea justo al entrar en ese ámbito, así que se puede
    **acceder** a ella en cualquier parte del cuerpo de la expresión lambda.

  - El **espacio de nombres** que almacena las ligaduras entre parámetros y
    argumentos es el marco que se crea al llamar a la expresión lambda.

- Esto se resume diciendo que «el **ámbito de un parámetro** es el **cuerpo**
  de su expresión lambda».

- También se dice que el parámetro tiene un **ámbito _local_** y un
  **almacenamiento _local_** al cuerpo de la expresión lambda; por tanto, y
  resumiendo: que es **local** a dicha expresión lambda.

- En consecuencia, **sólo podemos acceder al valor de un parámetro dentro del
  cuerpo de su expresión lambda**.

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

## Ámbito de una variable ligada

- Hemos visto que a los **parámetros** de una expresión lambda se les llama
  **variables ligadas** cuando aparecen dentro del cuerpo de dicha expresión
  lambda.

- Por tanto, todo lo que se dijo sobre el ámbito de un parámetro se aplica
  exactamente igual al ámbito de una variable ligada.

- Recordemos que el ámbito de un parámetro es el cuerpo de su expresión lambda,
  que es la porción de código donde podemos acceder al valor del argumento con
  el que está ligado.

- Por tanto, **el _ámbito_ de una variable ligada es el _cuerpo_ de la
  expresión lambda** donde aparece, y es el único lugar dentro del cual
  podremos acceder al valor de la variable ligada (que también será el valor
  del argumento con el que está ligada).

- Por eso también se dice que la variable ligada tiene un **ámbito local** al
  cuerpo de la expresión lambda o que es **local** a dicha expresión lambda.

---

- Por contraste, las variables, identificadores y ligaduras que no tienen
  ámbito local se dice que tienen un **ámbito _no local_** o, a veces, un
  **ámbito _más global_**.

  Si, además, ese ámbito resulta ser el **ámbito global**, decimos directamente
  que esa variable, identificador o ligadura es **global**.

- Por ejemplo, las **variables libres** que aparecen en una expresión lambda no
  son locales a dicha expresión (ya que no representan parámetros de la
  expresión) y, por tanto, tienen un ámbito más global que el cuerpo de dicha
  expresión lambda y se almacenarán en otro espacio de nombres distinto al
  marco que se crea al llamar a la expresión lambda.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**En resumen:**

- El **ámbito de una variable ligada** es el ámbito de la ligadura que se crea
  entre ésta y su argumento correspondiente , y se corresponde con el
  **cuerpo** de la expresión lambda donde aparece.

- Por tanto, la variable ligada sólo existe dentro del cuerpo de la expresión
  lambda y no podemos **acceder** a su valor fuera del mismo; por eso se dice
  que tiene un **ámbito _local_** a la expresión lambda.

- Además, **la ligadura** entre la variable ligada y su argumento **se almacena
  en el marco** de la llamada a la expresión lambda, y por eso se dice que
  tiene un **almacenamiento _local_** a la expresión lambda.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- O sea: con los **variables ligadas** ocurre exactamente lo mismo que con los
  **parámetros**, ya que, de hecho, **un parámetro y una variable ligada son la
  misma cosa**, como ya hemos visto.

!EJEMPLO

- En el siguiente _script_:

  ```{.python .number-lines}
  # Aquí empieza el script (no hay más definiciones antes de esta línea):
  producto = lambda x: x * x
  y = producto(3)
  z = x + 1       # da error
  ```

- Hay dos ámbitos: (1) el ámbito global y (2) el ámbito local definido el
  cuerpo de la expresión lambda (la expresión !PYTHON(x * x)).

- La expresión lambda de la línea 2 tiene un parámetro (!PYTHON(x)) que aparece
  como la variable ligada !PYTHON(x) en el cuerpo de la expresión lambda.

- El ámbito de la variable ligada !PYTHON(x) es el **cuerpo** de la expresión
  lambda.

- Por tanto, fuera del cuerpo de la expresión lambda, no es posible acceder al
  valor de la variable ligada !PYTHON(x), al encontrarnos **fuera de su
  ámbito** (la !PYTHON(x) **sólo está ligada en el cuerpo** de la expresión
  lambda).

- Por eso, la línea 4 dará un error al intentar acceder al valor del
  identificador !PYTHON(x), que no está ligado en el ámbito actual (el global).

# Evaluación

## Entorno (*environment*!ifdef(HTML)(&nbsp;)())

- El **entorno** es una extensión del concepto de _marco_, usado por los
  lenguajes interpretados en la **resolución de identificadores**, ya que:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **entorno** nos dice **_todas_ las ligaduras que son _accesibles_ en un
  momento concreto de la ejecución de un programa interpretado**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
- Durante la ejecución del programa, se van creando y destruyendo marcos a
  medida que se van ejecutando _scripts_, funciones o métodos.

- **Según se van creando en memoria, esos marcos van enlazándose unos con
  otros** creando una **secuencia de marcos** que se denomina **entorno** (del
  inglés, _environment_).

- En un momento dado, el entorno contendrá más o menos marcos dependiendo de
  por dónde haya pasado la ejecución del programa hasta ese momento.

---

- El entorno, por tanto, es un concepto **_dinámico_** que **depende del
  momento en el que se calcule**, es decir, de por dónde va la ejecución del
  programa.

- O, más concretamente: depende de qué _scripts_, funciones, métodos y
  definiciones se han ejecutado hasta ahora.

- Por tanto, el entorno depende de qué partes del programa se han ido
  ejecutando hasta llegar a la instrucción actual.

- El entorno **siempre contendrá**, al menos, un marco: el _marco global_, que
  **siempre será _el último_ de la secuencia de marcos** que forman el entorno.

---

- Gráficamente, representaremos los entornos como una **lista enlazada de
  marcos** conectados entre sí formando secuencias, de manera que:

  - Usaremos la letra $E$ como un indicador que siempre apunta al primer marco
    de la lista (el _marco actual_).

  - El último marco siempre será el marco global.

  !DOT(cadena-de-marcos.svg)()(width=60%)(width=60%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  graph [rankdir = LR]
  node [fontname = "monospace"]
  E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
  E -> "Marco A" -> "Marco B" -> "Marco global"
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por ejemplo:

  - Cuando entramos a ejecutar un _script_, se crea su _marco global_.

  - Si dentro de ese _script_ llamamos a una expresión lambda, se creará un
    marco para esa ejecución concreta de la expresión lambda.

    En ese caso habrá dos marcos en la memoria: el _global_ y el de esa llamada
    a la expresión lambda. Este último marco se eliminará de la memoria cuando
    termine esa ejecución de la expresión lambda.

  - El marco global sólo se eliminará de la memoria cuando se finalice la
    ejecución del _script_.

### Ámbitos, marcos y entornos

- Hagamos un resumen rápido de todo lo visto hasta ahora.

- El entorno contiene todas las ligaduras accesibles en un punto concreto de la
  ejecución del programa interpretado.

- Un marco contiene un conjunto de ligaduras (representa un _espacio de
  nombres_), y un entorno es una secuencia de marcos.

- Los marcos se van creando y destruyendo a medida que se van activando ciertas
  partes del programa (_scripts_, funciones o métodos) durante la ejecución del
  mismo.

- Una expresión lambda representa una función.

- Cuando se llama a una función, se crea un nuevo marco que contiene las
  ligaduras que ligan a los parámetros con los valores de esos argumentos.

---

- El cuerpo de una expresión lambda define su propio ámbito, de forma que, las
  ligaduras que ligan a los parámetros con los argumentos, se definen dentro de
  ese ámbito y son, por tanto, _locales_ a ese ámbito.

- Es decir: los parámetros (y las ligaduras entre los parámetros y los
  argumentos) tienen **un ámbito local** al cuerpo de la expresión lambda y
  sólo existen y son visibles dentro de él.

- Además, esas ligaduras tienen un **almacenamiento local** al **marco** que se
  crea al llamar a la expresión lambda.

- Ese **marco** y ese **ámbito** van ligados:

  - Cuando **se _empieza_** a ejecutar el cuerpo de la expresión lambda, **se
    _entra_** en el ámbito y **se _crea_** el marco en la memoria.

  - Cuando **se _termina_** de ejecutar el cuerpo de la expresión lambda, **se
    _sale_** del ámbito y **se _elimina_** el marco de la memoria.

- Todo marco lleva asociado un ámbito.

---

- Cuando se crea el nuevo marco, éste se enlaza con el marco que hasta ese
  momento había sido el marco actual, en cadena.

- El último marco de la cadena es siempre el marco global.

- Se va formando así una **secuencia de marcos** que representa el **entorno**
  del programa allí donde se está ejecutando la instrucción actual.

- A partir de ahora ya no vamos a tener un único marco (el _marco global_) sino
  que tendremos, además, al menos uno más cada vez que se llame a una expresión
  lambda y mientras dure la ejecución de la misma.

- El **ámbito** es un concepto _estático_: es algo que existe y se reconoce
  simplemente leyendo el código del programa, sin tener que ejecutarlo.

- El **marco** es un concepto _dinámico_: es algo que se crea y se destruye a
  medida que se van ejecutando y terminando de ejecutar ciertas partes del
  programa: _scripts_, funciones y métodos.

  Dicho de otra forma: los marcos se crean cuando se va entrando y saliendo de
  ciertos ámbitos.
 
---

- Por ejemplo, en el siguiente código:

  ```python
  suma = lambda x, y: x + y
  ```

  el cuerpo de la función !PYTHON(suma) define un nuevo ámbito.

- Por tanto, en el siguiente código tenemos dos ámbitos: el ámbito global (más
  externo) y el ámbito del cuerpo de la expresión lambda (más interno y
  anidado dentro del ámbito global):

  !IMGP(ambitos-anidados.png)()(width=60%)

- Además, cada vez que se llama a !PYTHON(suma), la ejecución del programa
  entra en su cuerpo, lo que crea un nuevo marco que almacena las ligaduras
  entre sus parámetros y los argumentos usados en esa llamada.

---

- El concepto de **entorno** refleja el hecho de que los ámbitos se contienen
  unos a otros (están anidados unos dentro de otros).

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Si un marco $A$ apunta a un marco $B$ en el entorno, significa que el
  ámbito de $A$ está contenido en el ámbito de $B$.**
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El **primer marco** en la cadena del entorno siempre será el último marco que
  se ha creado y que todavía no se ha destruido.

  Ese marco es el **marco actual**.

- Por otra parte, el **último marco** del entorno siempre es el _marco global_.

---

- Por ejemplo, si en cierto momento de la ejecución de un programa tenemos el
  siguiente entorno (donde !PYTHON(suma) es una expresión lambda):

  !DOT(lambda-suma-entorno.svg)()(width=60%)(width=50%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  compound = true
  graph [rankdir = LR]
  node [fontname = "monospace"]
  Manolo [shape = ellipse]
  3 [shape = circle]
  5 [shape = circle]
  subgraph cluster0 {
      label = "Marco global"
      bgcolor = "white"
      nombre [shape = plaintext, fillcolor = transparent, width = 0.1]
      suma [shape = plaintext, fillcolor = transparent]
  }
  lambda [shape = circle, label = "λ"]
  suma -> lambda
  nombre -> Manolo
  subgraph cluster1 {
      label = <Marco de <font face="monospace">suma</font>>
      bgcolor = white
      xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
      yl [shape = plaintext, fillcolor = transparent, label = "y", width = 0.1]
  }
  xl -> 3
  yl -> 5
  xl -> nombre [lhead = cluster0, ltail = cluster1, minlen = 2]
  E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
  E -> xl [lhead = cluster1]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Podemos afirmar que:

  - El marco de la expresión lambda apunta al marco global en el entorno.

  - El ámbito de la expresión lambda está contenido en el ámbito global.

  - El marco actual es el marco de la expresión lambda.

  - Por tanto, el programa se encuentra actualmente ejecutando el cuerpo de la
    expresión lambda.

  - De hecho, está evaluando la llamada !PYTHON(suma(3, 5)).

## Evaluación de expresiones con entornos

- Al evaluar una expresión, el intérprete **buscará en el entorno el valor al
  que está ligado cada identificador** que aparezca en la expresión.

- Para saber cuánto vale cada identificador, el intérprete buscará **en el
  primer marco del entorno** (el _marco actual_) una ligadura para ese
  identificador, y si no la encuentra, **irá subiendo por la secuencia de
  marcos** hasta encontrarla.

  **Si no aparece en ningún marco**, querrá decir que el identificador no está
  ligado (porque aún no se ha creado la ligadura), o que su ligadura está fuera
  del entorno (en otro ámbito inaccesible desde el ámbito actual).

  En cualquiera de estos casos, **generará un error** de tipo
  !PYTHON{NameError} («_nombre no definido_»).

---

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  z = 1
  suma = (lambda x, y: x + y + z)(8, 12)
  y = 3
  w = 9
  ```

- A medida que vamos ejecutando cada línea del código, tendríamos los
  siguientes entornos:

:::: columns

::: column

!DOT(lambda-entorno-linea1.svg)(Entorno en la línea 1)(width=60%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
}
x -> 4
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea2.svg)(Entorno en la línea 2)(width=60%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
1 [shape = circle]
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
    z [shape = plaintext, fillcolor = transparent, width = 0.1]
}
x -> 4
z -> 1
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

!DOT(lambda-entorno-linea3-durante.svg)(Entorno en la línea 3 en el cuerpo de la expresión lambda, después de aplicar los argumentos y **durante** la ejecución del cuerpo)(width=60%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
8 [shape = circle]
12 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
    z [shape = plaintext, fillcolor = transparent, width = 0.1]
}
x -> 4
z -> 1
subgraph cluster1 {
    label = "Marco de lambda"
    bgcolor = white
    xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
    yl [shape = plaintext, fillcolor = transparent, label = "y", width = 0.1]
}
xl -> 8
yl -> 12
xl -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!DOT(lambda-entorno-linea3-despues.svg)(Entorno en la línea 3, **después** de ejecutar el cuerpo y devolver el resultado)(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
21 [shape = circle];
1 [shape = circle];
4 [shape = circle];
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
    z [shape = plaintext, fillcolor = transparent, width = 0.1]
    suma [shape = plaintext, fillcolor = transparent]
}
x -> 4
z -> 1
suma -> 21
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> z [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

!DOT(lambda-entorno-linea4.svg)(Entorno en la línea 4)(width=60%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
21 [shape = circle];
1 [shape = circle];
3 [shape = circle];
4 [shape = circle];
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
    z [shape = plaintext, fillcolor = transparent, width = 0.1]
    suma [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent, width = 0.1]
}
x -> 4
y -> 3
z -> 1
suma -> 21
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> z [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(lambda-entorno-linea5.svg)(Entorno en la línea 5)(width=60%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
21 [shape = circle];
1 [shape = circle];
3 [shape = circle];
4 [shape = circle];
9 [shape = circle];
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.1]
    z [shape = plaintext, fillcolor = transparent, width = 0.1]
    suma [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent, width = 0.1]
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
}
x -> 4
y -> 3
z -> 1
suma -> 21
w -> 9
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> z [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Evaluación de expresiones lambda con entornos

- Para que una expresión lambda funcione, sus variables libres deben
  estar ligadas a algún valor en el entorno **en el momento de _evaluar_ la
  aplicación de la expresión lambda sobre unos argumentos**.

- Por ejemplo:

  ```{.python .number-lines}
  >>> prueba = lambda x, y: x + y + z  # aquí no da error
  >>> prueba(4, 3)                     # aquí sí
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "<stdin>", line 1, in <lambda>
  NameError: name 'z' is not defined
  ```

  da error porque !PYTHON(z) no está definido (no está ligado a ningún valor en
  el entorno) en el momento de llamar a !PYTHON(prueba) en la línea 2.

---

- En cambio:

  ```{.python .number-lines}
  >>> prueba = lambda x, y: x + y + z
  >>> z = 9
  >>> prueba(4, 3)
  16
  ```

  sí funciona (y devuelve !PYTHON(16)) porque, en el momento de evaluar la
  aplicación de la expresión lambda (en la línea 3), el identificador
  !PYTHON(z) está ligado a un valor en el entorno (en este caso, !PYTHON(9)).

- Observar que no es necesario que las variables libres estén ligadas en el
  entorno cuando *se crea* la expresión lambda, sino cuando **_se evalúa_ el
  cuerpo de la expresión lambda**, o sea, cuando se llama a la expresión
  lambda.

!EJEMPLO

- En el siguiente _script_:

  ```{.python .number-lines}
  w = 2
  f = lambda x, y: 5 + (lambda z: z + 3)(x + y)
  r = f(2, 4)
  m = (lambda x: x ** 2)(3)
  ```

  existen cuatro ámbitos:

  !IMGP(cuatro-ambitos.png)()(width=100%)

---

- Su ejecución, línea a línea, produce los siguientes entornos:

:::: columns

::: column

!DOT(cuatro-ambitos-entorno-linea1.svg)(Entorno en la línea 1)(width=60%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
2 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> w [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(cuatro-ambitos-entorno-linea2.svg)(Entorno en la línea 2)(width=60%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
2 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> w [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

!DOT(cuatro-ambitos-entorno-linea3-durante-primer-lambda.svg)(Entorno en la línea 3 en el cuerpo de la primera expresión lambda, después de aplicar sus argumentos y durante la ejecución de su cuerpo)(width=60%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
2 [shape = circle]
4 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
subgraph cluster1 {
    label = "Marco del primer lambda"
    bgcolor = white
    xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
    yl [shape = plaintext, fillcolor = transparent, label = "y", width = 0.1]
}
xl -> 2
yl -> 4
xl -> w [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!DOT(cuatro-ambitos-entorno-linea3-durante-segundo-lambda.svg)(Entorno en la línea 3 en el cuerpo de la segunda expresión lambda, después de aplicar sus argumentos y durante la ejecución de su cuerpo)(width=90%)(width=75%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
2 [shape = circle]
4 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
subgraph cluster1 {
    label = "Marco del primer lambda"
    bgcolor = white
    xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
    yl [shape = plaintext, fillcolor = transparent, label = "y", width = 0.1]
}
6 [shape = circle]
subgraph cluster2 {
    label = "Marco del segundo lambda"
    bgcolor = white
    z [shape = plaintext, fillcolor = transparent, label = "z", width = 0.1]
}
z -> 6
xl -> 2
yl -> 4
z -> xl [lhead = cluster1, ltail = cluster2, minlen = 2]
xl -> w [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> z [lhead = cluster2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!IMGP(cuatro-ambitos-entorno-linea3-durante-primer-lambda.svg)(Entorno en la línea 3 en el cuerpo de la segunda expresión lambda, después de ejecutar su cuerpo y devolver su resultado)(width=60%)(width=55%)

---

!DOT(cuatro-ambitos-entorno-linea3-despues-primer-lambda.svg)(Entorno en la línea 3 en el cuerpo de la primera expresión lambda, después de ejecutar su cuerpo y devolver su resultado)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
2 [shape = circle]
14 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
    r [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
r -> 14
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> f [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!DOT(cuatro-ambitos-entorno-linea4-durante-tercer-lambda.svg)(Entorno en la línea 4 en el cuerpo de la tercera expresión lambda, después de aplicar sus argumentos y durante la ejecución de su cuerpo)(width=60%)(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
2 [shape = circle]
3 [shape = circle]
14 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
    r [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
r -> 14
subgraph cluster1 {
    label = "Marco del tercer lambda"
    bgcolor = white
    xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
}
xl -> 3
xl -> f [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!DOT(cuatro-ambitos-entorno-linea4-despues-tercer-lambda.svg)(Entorno en la línea 4 en el cuerpo de la tercera expresión lambda, después de ejecutar su cuerpo y devolver su resultado)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
2 [shape = circle]
14 [shape = circle]
9 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    w [shape = plaintext, fillcolor = transparent, width = 0.1]
    f [shape = plaintext, fillcolor = transparent, width = 0.1]
    r [shape = plaintext, fillcolor = transparent, width = 0.1]
    m [shape = plaintext, fillcolor = transparent, width = 0.1]
}
w -> 2
f -> lambda
r -> 14
m -> 9
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> f [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Ligaduras *sombreadas*

- Recordemos que la **resolución de identificadores** es el proceso por el cual
  el compilador o el intérprete determinan qué ligadura se corresponde con una
  aparición concreta de un determinado identificador.

- ¿Qué ocurre cuando una expresión lambda contiene como parámetros
  identificadores que ya están ligados en el entorno, en un espacio de nombres
  asociado a un ámbito más global?

- Por ejemplo:

  ```{.python .number-lines}
  x = 4
  total = (lambda x: x * x)(3)  # Su valor es 9
  ```

- ¿Cómo resuelve el intérprete de Python las distintas `x` que aparecen en el
  código? ¿Son la misma `x`? ¿Se corresponden con la misma ligadura? ¿Están
  todas esas `x` ligadas al mismo valor?

---

- La !PYTHON(x) que aparece en la línea 1 es distinta a las que aparecen en la
  2:

  - La !PYTHON(x) de la línea 1 es un identificador ligado a un valor en el
    ámbito global (el ámbito de creación de esa ligadura es el ámbito global).
    Esa ligadura, se almacena en el marco global, y por eso decimos que esa
    !PYTHON(x) (la que aparece en la línea 1) es _global_.

    Por tanto, la aparición de la `x` en la línea 1 representa a la `x` cuya
    ligadura se encuentra almacenada en el marco global (es decir, la `x`
    global) y que está ligada al valor !PYTHON(4).

  - Las !PYTHON(x) de la línea 2 representan el parámetro y la variable ligada
    (que ya sabemos que son la misma cosa) de la expresión lambda. Ese
    parámetro está ligado al argumento de la llamada, el ámbito de creación de
    esa ligadura es el cuerpo de la expresión lambda y esa ligadura se almacena
    en el marco de la llamada a la expresión lambda.

    En consecuencia, las apariciones de la `x` en la línea 2 representan a la
    `x` _local_ a la expresión lambda, cuya ligadura se encuentra almacenada en
    el marco de la llamada a la expresión lambda y que está ligada a
    !PYTHON(3).

---

- Por tanto, la `x` que aparece en el cuerpo de la expresión lambda **no** se
  refiere al identificador !PYTHON(x) que está fuera de la expresión lambda (y
  que aquí está ligado al valor !PYTHON(4)), sino al parámetro !PYTHON(x) que,
  en la llamada de la línea 2, está ligado al valor !PYTHON{3} (el argumento de
  la llamada).

- Es decir:

  - Dentro del cuerpo de la expresión lambda, !PYTHON(x) vale !PYTHON(3).

  - Fuera del cuerpo de la expresión lambda, !PYTHON(x) vale !PYTHON(4).

- Para determinar cuánto vale cada aparición de la `x` en el código (es decir,
  para resolver la aparición de cada `x`), el intérprete de Python consulta el
  **entorno** siempre que se encuentra el identificador `x` en el código y
  tiene que evaluarlo.

---

- Cada una de las apariciones de la `x` en este ejemplo se corresponde con una
  ligadura distinta que tiene un ámbito distinto y se almacena en un espacio de
  nombres distinto.

- Por tanto, la misma `x` podrá tener un valor u otro dependiendo de cuál es el
  espacio de nombres actual en el momento de evaluar la `x`.

- Cuando un mismo identificador está ligado dos veces en dos ámbitos anidados
  uno dentro del otro, decimos que:

  - El identificador que aparece en el ámbito más externo está **sombreado** (y
    su ligadura está **sombreada**) por el del ámbito más interno.

  - El identificador que aparece en el ámbito más interno **hace sombra** al
    identificador sombreado (y su ligadura también se dice que **hace sombra**
    a la ligadura sombreada) que aparece en el ámbito más externo.

---

- En nuestro ejemplo, podemos decir que el parámetro !PYTHON(x) de la expresión
  lambda hace sombra al identificador !PYTHON(x) que aparece en el ámbito
  global.

- Eso significa que no podemos acceder a ese identificador !PYTHON(x) global
  desde dentro del cuerpo de la expresión lambda como si fuera una variable
  libre, porque la !PYTHON(x) dentro del cuerpo siempre se referirá a la
  !PYTHON(x) local (el parámetro de la expresión lambda).

- Esto ocurre así porque la primera ligadura del identificador !PYTHON(x) que
  se encuentra el intérprete al recorrer la secuencia de marcos del entorno
  cuando busca un valor para !PYTHON(x), es la que está en el marco de la
  expresión lambda, que es el marco actual cuando se está ejecutando su cuerpo.

!DOT(lambda-entorno-con-sombra.svg)(Entorno en el cuerpo de la expresión lambda, con ligadura sombreada)(width=50%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
4 [shape = circle]
3 [shape = circle]
x [shape = plaintext, fillcolor = transparent, width = 0.1]
xl [shape = plaintext, fillcolor = transparent, label = "x", width = 0.1]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    x
}
x -> 4
subgraph cluster1 {
    label = "Marco de lambda"
    bgcolor = white
    xl
}
xl -> 3
xl -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> xl [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Si necesitáramos acceder, desde el cuerpo de la expresión lambda, al valor de
  la !PYTHON(x) que está fuera de la expresión lambda, lo que podemos hacer es
  **cambiar el nombre** al parámetro !PYTHON(x). Por ejemplo:

  ```python
  x = 4
  total = (lambda w: w * x)(3)  # Su valor es 12
  ```

  Así, tendremos en la expresión lambda una variable ligada (el parámetro
  !PYTHON(w)) y una variable libre (el identificador !PYTHON(x) ligado en el
  ámbito global) al que ahora sí podemos acceder al no estar sombreada y
  encontrarse dentro del entorno.

!DOT(lambda-entorno-sin-sombra.svg)(Entorno en el cuerpo de la expresión lambda, sin variable sombreada)(width=60%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
4 [shape = circle]
3 [shape = circle]
x [shape = plaintext, fillcolor = transparent, width = 0.1]
w [shape = plaintext, fillcolor = transparent, width = 0.1]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    x
}
x -> 4
subgraph cluster1 {
    label = "Marco de lambda"
    bgcolor = white
    w
}
w -> 3
w -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> w [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

  si renombramos !PYTHON(x) a !PYTHON(z) tendríamos:

  ```python
  lambda z, y: z + y + z
  ```

  lo que es claramente incorrecto. A este fenómeno indeseable se le denomina
  **captura de variables**.

### Visualización en *Pythontutor*

- **Pythontutor** es una herramienta online muy interesante y práctica que nos
  permite ejecutar un _script_ paso a paso y visualizar sus efectos.

- Muestra la pila de control, los marcos dentro de ésta, las ligaduras dentro
  de éstos y los datos almacenados en el montículo.

- Entrando en
  [http://pythontutor.com/visualize.html](http://pythontutor.com/visualize.html)
  se abre un área de texto donde se puede teclear (o copiar y pegar) el código
  fuente del _script_ a ejecutar.

- Pulsando en «_Visualize Execution_» se pone en marcha, pudiendo ejecutar todo
  el _script_ de una vez o hacerlo paso a paso.

- Conviene elegir las siguientes opciones:

  - _Hide exited frames (default)_

  - _Render all objects on the heap (Python/Java)_

  - _Draw pointers as arrows (default)_

---

[Visualizar el _script_ anterior en Pythontutor](http://pythontutor.com/visualize.html#code=w%20%3D%202%0Af%20%3D%20lambda%20x,%20y%3A%205%20%2B%20%28lambda%20z%3A%20z%20%2B%203%29%28x%20%2B%20y%29%0Ar%20%3D%20f%282,%204%29%0Am%20%3D%20%28lambda%20x%3A%20x%20**%202%29%283%29%0A&cumulative=false&curInstr=0&heapPrimitives=true&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target="\_blank"}

!EJERCICIO

@. En el _script_ anterior:

    ```{.python .number-lines}
    w = 2
    f = lambda x, y: 5 + (lambda z: z + 3)(x + y)
    r = f(2, 4)
    m = (lambda x: x ** 2)(3)
    ```

    indicar:

    a. Los identificadores.

    a. Los ámbitos.

    a. Los entornos, marcos y ligaduras en cada línea de código.

    a. Los ámbitos de cada ligadura.

    a. Los ámbitos de creación de cada ligadura.

    a. Los ámbitos de cada aparición de cada identificador.

    a. Las ligaduras sombreadas y los identificadores sombreados.

    a. Los identificadores y ligaduras que hacen sombra.

## Resolución de atributos de objetos

- Ya estudiamos que el acceso a un atributo de un objeto suponía buscar la
  correspondiente ligadura únicamente en el espacio de nombres asociado a ese
  objeto, y no en ningún otro.

- Por tanto, dicha resolución requiere de un mecanismo algo distinto a lo visto
  hasta ahora, ya que las ligaduras que ligan el nombre del atributo con su
  valor se almacenan en el propio objeto, no en un marco.

- En consecuencia, el acceso a un atributo de un objeto usando el operador
  punto (`.`), como en la expresión !PYTHON(math.pi) de este ejemplo:

  ```python
  import math
  x = math.pi * 2
  ```

  no requiere usar el entorno.

- De hecho, el lenguaje ni siquiera tiene por qué tener entornos. Recordemos
  que los lenguajes compilados no usan entornos para resolver identificadores y
  pueden resolver perfectamente los atributos de los objetos.

---

- Concretamente, resolver el identificador `pi` en la expresión
  !PYTHON(math.pi) requerirá de los siguientes pasos:

  #. Se busca el valor de `math` en el entorno, que devuelve el objeto que
     representa al módulo `math`.

  #. Una vez que sabemos que el operando izquierdo del operador punto (`.`) es
     un objeto, procedemos a resolver el identificador `pi`, pero para ello
     sólo se considera el espacio de nombres asociado al objeto `math`.

     Es decir: buscamos el valor de `pi` en el espacio de nombres de `math`, y
     sólo ahí.

  #. Una vez localizado, se devolverá el valor ligado al nombre `pi` en el
     espacio de nombres de `math`, o se lanzará un error !PYTHON(NameError) en
     caso de que no haya ninguna ligadura para `pi` en `math`.

- Como se puede observar, en ningún momento se usa el entorno para resolver el
  identificador `pi` dentro de `math`.

## Estrategias de evaluación

- A la hora de evaluar una expresión (cualquier expresión) existen varias
  **estrategias** diferentes que se pueden adoptar.

- Cada lenguaje implementa sus propias estrategias de evaluación que están
  basadas en las que vamos a ver aquí.

- Básicamente se trata de decidir, en cada paso de reducción, qué subexpresión
  hay que reducir, en función de:

  - El orden de evaluación:

    - De fuera adentro o de dentro afuera.

    - De izquierda a derecha o de derecha a izquierda.

  - La necesidad o no de evaluar dicha subexpresión.

### Orden de evaluación

- En un lenguaje de programación funcional puro se cumple la **transparencia
  referencial**, según la cual el valor de una expresión depende sólo del valor
  de sus subexpresiones (también llamadas *redexes*, del inglés, _reducible
  expression_).

- Pero eso también implica que **no importa el orden en el que se evalúen las
  subexpresiones**: el resultado debe ser siempre el mismo.

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
  afuera*, es decir, empezando por el *redex* más **interno** y a la
  izquierda.

- El _redex_ más interno es el que no contiene a otros _redexes_. Si existe más
  de uno que cumpla esa condición, se elige el que está más a la izquierda.

- Eso implica que los operandos y los argumentos se evalúan **antes** que los
  operadores y las aplicaciones de funciones.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por valor** (_call-by-value_).

---

- Por ejemplo, si tenemos la siguiente función:

  ```python
  cuadrado = lambda x: x * x
  ```

  según el orden aplicativo, la expresión !PYTHON(cuadrado(3 + 4)) se reduce
  así:

  ```python
  cuadrado(3 + 4)               # definición de cuadrado
  = (lambda x: x * x)(3 + 4)    # evalúa 3 y devuelve 3
  = (lambda x: x * x)(3 + 4)    # evalúa 4 y devuelve 4
  = (lambda x: x * x)(3 + 4)    # evalúa 3 + 4 y devuelve 7
  = (lambda x: x * x)(7)        # aplicación a 7
  = (7 * 7)                     # evalúa (7 * 7) y devuelve 49
  = 49
  ```

#### Orden normal

- El **orden normal** consiste en evaluar las expresiones *de fuera adentro*,
  es decir, empezando siempre por el *redex* más **externo** y a la
  izquierda.

- El _redex_ más externo es el que no está contenido en otros _redexes_. Si
  existe más de uno que cumpla esa condición, se elige el que está más a la
  izquierda.

- Eso implica que los operandos y los argumentos se evalúan **después** de las
  aplicaciones de los operadores y las funciones.

- Por tanto, los argumentos que se pasan a las funciones lo hacen **sin
  evaluarse** previamente.

- Corresponde a lo que en muchos lenguajes de programación se denomina **paso
  de argumentos por nombre** (_call-by-name_).

---

- Por ejemplo, si tenemos la siguiente función:

  ```python
  cuadrado = lambda x: x * x
  ```

  según el orden normal, la expresión !PYTHON(cuadrado(3 + 4)) se reduce así:

  ```python
  cuadrado(3 + 4)               # definición de cuadrado
  = (lambda x: x * x)(3 + 4)    # aplicación a (3 + 4)
  = ((3 + 4) * (3 + 4))         # evalúa 3 y devuelve 3
  = ((3 + 4) * (3 + 4))         # evalúa 4 y devuelve 4
  = ((3 + 4) * (3 + 4))         # evalúa (3 + 4) y devuelve 7
  = 7 * (3 + 4)                 # evalúa 3 y devuelve 3
  = 7 * (3 + 4)                 # evalúa 4 y devuelve 4
  = 7 * (3 + 4)                 # evalúa (3 + 4) y devuelve 7
  = 7 * 7                       # evalúa 7 * 7 y devuelve 49
  = 49
  ```

### Composición de funciones

- Podemos crear una función que use otra función. Por ejemplo, para calcular el
  área de un círculo usamos otra función que calcule el cuadrado de un número:

  ```python
  cuadrado = lambda x: x * x
  area = lambda r: 3.1416 * cuadrado(r)
  ```

- La expresión !PYTHON(area(11 + 1)) se evaluaría así según el *orden
  aplicativo*:

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

  - **Líneas 2--4**: Lo siguiente a evaluar es la aplicación de !PYTHON(area)
    sobre su argumento, por lo que primero evaluamos éste (es el _redex_ más
    interno).

  - **Línea 5**: Ahora se aplica la expresión lambda a su argumento
    !PYTHON(12).

  - **Línea 6**: El _redex_ más interno y a la izquierda es el !PYTHON(3.1416),
    que ya está evaluado.

  - **Línea 7**: El *redex* más interno que queda por evaluar es la aplicación
    de !PYTHON(cuadrado) sobre !PYTHON(12). Primero se evalúa
    !PYTHON(cuadrado), sustituyéndose por su definición...

  - **Línea 8**: ... y ahora se aplica la expresión lambda a su argumento
    !PYTHON(12).

  - Lo que queda es todo aritmética.

---

- La expresión !PYTHON(area(11 + 1)) se evaluaría así según el *orden normal*:

  ```{.python .number-lines}
  area(11 + 1)                                # definición de area
  = (lambda r: 3.1416 * cuadrado(r))(11 + 1)  # aplicación a (11 + 1)
  = (3.1416 * cuadrado(11 + 1))               # evalúa 3.1416 y devuelve 3.1416
  = (3.1416 * cuadrado(11 + 1))               # definición de cuadrado
  = (3.1416 * (lambda x: x * x)(11 + 1))      # aplicación a (11 + 1)
  = (3.1416 * ((11 + 1) * (11 + 1)))          # evalúa (11 + 1) y devuelve 12
  = (3.1416 * (12 * (11 + 1)))                # evalúa (11 + 1) y devuelve 12
  = (3.1416 * (12 * 12))                      # evalúa (12 * 12) y devuelve 144
  = (3.1416 * 144)                            # evalúa (3.1416 * 144) y...
  = 452.3904                                  # ... devuelve 452.3904
  ```

- En ambos casos (orden aplicativo y orden normal) se obtiene el mismo
  resultado.

---

- En detalle:

  - **Línea 1**: Se evalúa el *redex* más externo, que es
    !PYTHON(area(11 + 1)). Para ello, se reescribe la definición de
    !PYTHON(area)...

  - **Línea 2**: ... y se aplica la expresión lambda al argumento
    !PYTHON(11 + 1).

  - **Línea 3**: El _redex_ más externo es el `*`, pero para evaluarlo hay que
    evaluar primero todos sus argumentos, por lo que primero se evalúa el
    izquierdo, que es !PYTHON(3.1416).

  - **Línea 4**: Ahora hay que evaluar el derecho (!PYTHON(cuadrado(11 + 1))),
    por lo que se reescribe la definición de !PYTHON(cuadrado)...

  - **Línea 5**: ... y se aplica la expresión lambda al argumento
    !PYTHON(11 + 1).

  - Lo que queda es todo aritmética.

---

- A veces no resulta fácil determinar si un *redex* es más interno o externo
  que otro, sobre todo cuando se mezclan funciones y operadores en una misma
  expresión.

- En ese caso, puede resultar útil reescribir los operadores como funciones,
  cuando sea posible.

- Por ejemplo, la siguiente expresión:

  ```python
  abs(-12) + max(13, 28)
  ```

  se puede reescribir como:

  ```python
  from operator import add
  add(abs(-12), max(13, 28))
  ```

  lo que muestra claramente que la suma es más externa que el valor absoluto y
  el máximo (que están, a su vez, al mismo nivel de profundidad).

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

### Evaluación estricta y no estricta

- Existe otra forma de ver la evaluación de una expresión:

  - **Evaluación estricta o _impaciente_**: Reducir todos los *redexes* aunque
    no hagan falta para calcular el valor de la expresión.

  - **Evaluación no estricta o _perezosa_**: Reducir sólo los *redexes* que
    sean estrictamente necesarios para calcular el valor de la expresión.

!EJEMPLO

- Sabemos que la expresión !PYTHON(1 / 0) da un error de *división por cero*:

  ```python
  >>> 1 / 0
  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  ZeroDivisionError: division by zero
  ```

- Supongamos que tenemos la siguiente definición:

  ```python
  primero = lambda x, y: x
  ```

  de forma que !PYTHON(primero) es una función que simplemente devuelve el
  primero de sus argumentos.

- Es evidente que la función !PYTHON(primero) no necesita evaluar nunca su
  segundo argumento, ya que no lo utiliza (simplemente devuelve el primero de
  ellos). Por ejemplo, !PYTHON(primero(4, 3)) devuelve !PYTHON(4).

---

- Sabiendo eso... ¿qué valor devolvería la siguiente expresión?

  ```python
  primero(4, 1 / 0)
  ```

- Curiosamente, el resultado dependerá de si la evaluación es estricta o
  perezosa:

  - **Si es estricta**, el intérprete evaluará todos los argumentos de la
    expresión lambda aunque no se utilicen luego en su cuerpo. Por tanto, al
    evaluar !PYTHON(1 / 0) devolverá un error.

    Es lo que ocurre cuando se evalúa siguiendo el **orden aplicativo**.

  - En cambio, **si es perezosa**, el intérprete evaluará únicamente aquellos
    argumentos que se usen en el cuerpo de la expresión lambda, y en este caso
    sólo se usa el primero, así que dejará sin evaluar el segundo, no dará
    error y devolverá directamente !PYTHON(4).

    Es lo que ocurre cuando se evalúa siguiendo el **orden normal**:

    ```python
    primero(4, 1 / 0) = (lambda x, y: x)(4, 1 / 0) = (4) = 4
    ```

---

- Hay un resultado teórico que avala lo que acabamos de observar:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Teorema de estandarización:**

  Si una expresión tiene forma normal, el **orden normal** de evaluación
  conduce seguro a la misma.
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

    evalúa perezosamente !NT(valor_si_cierto) y !NT(valor_si_falso) dependiendo
    del valor de la !NT(condición).

  - Los operadores lógicos !PYTHON(and) y !PYTHON(or) también son perezosos (se
    dice que evalúan **en cortocircuito**):

    - !PYTHON(True or) \ $\;\underline{x}$

      siempre es igual a !PYTHON(True).

    - !PYTHON(False and) \ $\;\underline{x}$

      siempre es igual a !PYTHON(False).

    En ambos casos no es necesario evaluar $\underline{x}$.

- En Java también existe un operador ternario (`?` `:`) y unos operadores
  lógicos (`||` y `&&`) que se evalúan de igual forma que en Python.

---

- La mayoría de los lenguajes de programación usan evaluación estricta y paso
  de argumentos por valor (siguen el orden aplicativo).

- **Haskell**, por ejemplo, es un lenguaje funcional puro que usa evaluación
  perezosa y sigue el orden normal.

- La evaluación perezosa en Haskell permite resultados muy interesantes, como
  la posibilidad de manipular estructuras de datos infinitas.

# Abstracciones funcionales

## Pureza

- Si el cuerpo de una expresión lambda no contiene variables libres, el valor
  que obtendremos al aplicarla a unos argumentos dependerá únicamente del valor
  que tengan esos argumentos (no dependerá de nada más que sea «*exterior*» a
  la expresión lambda).

- En cambio, si el cuerpo de una expresión lambda sí contiene variables libres,
  el valor que obtendremos al aplicarla a unos argumentos no sólo dependerá del
  valor de esos argumentos, sino también de los valores a los que estén ligadas
  las variables libres en el momento de evaluar la aplicación de la expresión
  lambda.

- Es el caso del ejemplo anterior, donde tenemos una expresión lambda que
  contiene una variable libre (!PYTHON(z)) y, por tanto, cuando la aplicamos a
  los argumentos !PYTHON(4) y !PYTHON(3) obtenemos un valor que depende, no
  sólo de los valores de !PYTHON(x) e !PYTHON(y), sino también del valor de
  !PYTHON(z):

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

  En este caso, hay un identificador (!PYTHON(suma)) que no aparece en la lista
  de parámetros de la expresión lambda !PYTHON(suma3), por lo que es una
  variable libre en el cuerpo de la expresión lambda de !PYTHON(suma3).

  En consecuencia, el valor de dicha expresión lambda dependerá de lo que valga
  !PYTHON(suma) en el entorno actual.

---

- Se dice que una expresión lambda es **pura** si, siempre que la apliquemos a
  unos argumentos, el valor obtenido va a depender únicamente del valor de esos
  argumentos, es decir, de sus parámetros o variables ligadas.

- Podemos decir que hay distintos **grados de pureza**:

  - Una expresión lambda que contiene **sólo variables ligadas** es **más
    pura** que otra que también contiene variables libres.

  - Una expresión lambda cuyas **variables libres** representan **funciones**
    que se usan en el cuerpo de la expresión lambda, es **más pura** que otra
    cuyas variables libres representan cualquier otro tipo de valor.

  En el ejemplo anterior, tenemos que la expresión lambda de !PYTHON(suma3),
  sin ser *totalmente pura*, a efectos prácticos se la puede considerar
  **pura**, ya que su única variable libre (!PYTHON(suma)) se usa como una
  **función**.

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
  # suma es impura, porque su variable libre (z) no es una función:
  suma = lambda x, y: x + y + z
  ```

- **La pureza de una función es un rasgo deseado y que hay que tratar de
  alcanzar siempre que sea posible**, ya que facilita el desarrollo y
  mantenimiento de los programas, además de simplificar el razonamiento sobre
  los mismos, permitiendo aplicar directamente nuestro modelo de sustitución.

- Es más incómodo trabajar con !PYTHON(suma) porque hay que *recordar* que
  depende de un valor que está *fuera* de la expresión lambda, cosa que no
  resulta evidente a no ser que mires en el cuerpo de la expresión lambda.

## Las funciones como abstracciones

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

- «_Abstraer_» es centrarse en lo importante en un determinado momento e
  ignorar lo que en ese momento no resulta importante.

- «_Crear una abstracción_» es meter un mecanismo más o menos complejo dentro
  de una caja negra y darle un nombre, de forma que podamos referirnos a todo
  el conjunto simplemente usando su nombre y sin tener que conocer su
  composición interna ni sus detalles internos de funcionamiento.

- Por tanto, para usar la abstracción nos bastará con conocer su _nombre_ y _lo
  que hace_, sin necesidad de saber _cómo lo hace_ ni de qué elementos está
  formada _internamente_.

- **La abstracción es el principal instrumento de control de la complejidad**,
  ya que nos permite ocultar detrás de un nombre los detalles que componen una
  parte del programa, haciendo que esa parte actúe (a ojos del programador que
  la utilice) como si fuera un elemento _predefinido_ del lenguaje.

---

- **Las funciones son**, por tanto, **abstracciones** porque nos permiten
  usarlas sin tener que conocer los detalles internos del procesamiento que
  realizan.

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

- Por supuesto, nos las podemos arreglar sin definir el concepto de _cubo_,
  escribiendo siempre expresiones explícitas (como !PYTHON(3*3*3),
  !PYTHON(y*y*y), etc.) sin usar la palabra «cubo», pero eso nos obligaría
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
  general_ que agrupa a todos los posibles casos particulares que cumplen el
  mismo patrón.

- A ese caso general le damos un nombre y ocultamos sus detalles internos en
  una «caja negra».

- Eso es una **abstracción**.

- **Crear casos generales a partir de patrones que se repiten** en casos
  particulares es una de las principales razones por las que creamos
  abstracciones.

- Otras veces creamos abstracciones cuando queremos **reducir la complejidad**,
  dándole un nombre a un mecanismo complejo para poder referirnos a todo el
  conjunto a través de su nombre sin tener que recordar continuamente qué
  piezas contiene el mecanismo.

- Y otras veces simplemente cuando queremos que nuestro programa pueda
  **expresar un concepto abstracto**, como el de «elevar al cubo».

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
y [label = "y * y * y", fontname = "monospace"]
radio [label = "radio * radio * radio", fontname = "monospace"]
3 -> c [minlen = 2]
y -> c [minlen = 2]
radio -> c [minlen = 2]
cp [label = "(casos particulares)"]
cg [label = "(caso general)"]
{ rank = same; cg; c }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

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

### Especificaciones de funciones

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
