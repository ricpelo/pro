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
                    | !T{(}!NT(expresión_lambda)!T{)}
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

## Identificadores libres de una expresión lambda

- Si un _identificador_ aparece en el _cuerpo_ de una expresión lambda pero no
  aparece también en la _lista de parámetros_ de esa expresión lambda, decimos
  que es un **identificador libre** en la expresión lambda.

- En el ejemplo anterior:

  ```python
  lambda x, y: x + y
  ```

  los dos identificadores que aparecen en el cuerpo (!PYTHON{x} e !PYTHON{y})
  aparecen también en la lista de parámetros de la expresión lambda, por lo que
  ninguno de esos identificadores son libres.

- En cambio, en la expresión lambda:

  ```python
  lambda x, y: x + y + z
  ```

  !PYTHON(z) es un identificador libre, ya que no aparece en la lista de
  parámetros, donde sí aparecen !PYTHON(x) e !PYTHON(y).

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
  está dentro de un determinado ámbito léxico**, tan sólo leyendo el código
  fuente del programa y sin necesidad de ejecutarlo.

- Eso significa que el concepto de _ámbito léxico_ es un concepto **estático**.

---

- Por ejemplo: en el lenguaje de programación Java, los _bloques_ son
  estructuras sintácticas delimitadas por llaves `{` y `}` que contienen
  instrucciones.

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
  se encuentra la instrucción que se está ejecutando actualmente (es decir, la
  **instrucción actual**).

---

- El concepto de _ámbito_ no es nada trivial y, a medida que vayamos
  incorporando nuevos elementos al lenguaje, tendremos que ir adaptándolo para
  tener en cuenta más condicionantes.

- Hasta ahora sólo hemos tenido un ámbito, llamado **ámbito global**:

  - Si se está ejecutando un _script_ en el intérprete por lotes (con
    `python script.py`), el _ámbito global_ abarca todo el _script_, desde la
    primera instrucción hasta la última.

  - Si estamos en el intérprete interactivo (con `python` o `ipython3`), el
    _ámbito global_ abarca toda nuestra sesión con el intérprete, desde que
    arrancamos la sesión hasta que finalizamos la misma.

- Por tanto:

  - En el momento en que se empieza a ejecutar un _script_ o se arranca una
    sesión con el intérprete interactivo, se entra en el _ámbito global_.

  - Del ámbito global sólo se sale cuando se finaliza la ejecución del _script_
    o se cierra el intérprete interactivo.

<!--

---

- Se denominan **definiciones globales** a las definiciones que se ejecutan
  cuando el ámbito actual es el ámbito global.

- Las ligaduras que crean las definiciones globales se denominan **ligaduras
  globales** o **ligaduras de ámbito global**.

- Por ejemplo, en el siguiente _script_ se ejecutan cuatro instrucciones. El
  ámbito actual de cada una de las instrucciones es el ámbito global, que es el
  único ámbito que existe en el _script_:

  !IMGP(ambito-global.png)()(width=40%)(width=40%)

-->

## Ámbito de una definición y de una ligadura

- El **ámbito de una definición** es el ámbito actual de esa definición (es
  decir, el ámbito más interno donde aparece esa definición).

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

- Por ejemplo, en el siguiente _script_ se ejecutan cuatro definiciones.

- El ámbito actual de cada una de las instrucciones es el ámbito _global_, que
  es el único ámbito que existe en el _script_:

  !IMGP(ambito-global.png)()(width=40%)(width=40%)

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

### Almacenamiento

- Sabemos que las ligaduras se almacenan en _espacios de nombres_.

- En Python, hay dos lugares donde se pueden almacenar ligaduras y, por tanto,
  hay dos posibles espacios de nombres: los objetos y los marcos.

- Así que tenemos dos posibilidades:

  #. Si el identificador que se está ligando es un _atributo_ de un objeto,
     entonces la ligadura se almacenará en el objeto.

  #. En caso contrario, la ligadura se almacenará en un marco que depende del
     _ámbito actual_.

- Veamos cada caso con más detalle.

---

1. Cuando se crea una ligadura dentro de un objeto en Python usando el
   operador punto (`.`), el espacio de nombres será el propio objeto, ya que
   los objetos son espacios de nombres en Python. En tal caso, la ligadura
   asocia un _atributo_ del objeto con un valor.

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

---

2. Si la ligadura no se crea dentro de un objeto usando el operador punto
   (`.`), entonces el espacio de nombres dependerá del ámbito:

   a. Si el ámbito donde se crea la ligadura lleva asociado un espacio de
      nombres, ese espacio de nombres almacenará las ligaduras que se crean
      dentro de ese ámbito.

   b. Si no, entonces la ligadura se almacenará en el espacio de nombres del
      ámbito más interno que contenga al actual y que sí lleve asociado un
      espacio de nombres.

   Por tanto, a la hora de almacenar una ligadura, se van mirando todos los
   ámbitos desde el ámbito actual, pasando por todos los ámbitos que incluyen a
   éste (en orden, del más interno al más externo), hasta encontrar el primer
   ámbito que lleve asociado un espacio de nombres.

   En cualquier caso, aquí el espacio de nombres seleccionado siempre será un
   marco.

   Cuando la ligadura se almacena en el marco global, se dice que tiene
   **almacenamiento global**.

### Visibilidad

- La visibilidad de una ligadura indica cuándo y de qué manera es visible esa
  ligadura.

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
   sólo será visible en el ámbito donde se definió la ligadura, el cual va
   asociado al marco donde se almacena la ligadura.

   Ese ámbito representa una «región» cuyas fronteras limitan la porción del
   código fuente en la que es visible esa ligadura.

   En tal caso, decimos que la **visibilidad** de la ligadura es **local a su
   ámbito**.

   Eso significa que **no es posible acceder a esa ligadura fuera de su
   ámbito**; sólo es visible dentro de él.

   Si el ámbito es el global, decimos que la ligadura tiene **visibilidad
   global**.

### Tiempo de vida

- El **tiempo de vida** de una ligadura representa el periodo de tiempo durante
  el cual _existe_ esa ligadura, es decir, el periodo comprendido desde su
  creación y almacenamiento en la memoria hasta su posterior destrucción.

- En la mayoría de los lenguajes (incluyendo Python y Java), una ligadura
  **empieza a existir** justo donde se crea, es decir, en el punto donde se
  ejecuta la instrucción que define la ligadura.

  Por tanto, no es posible _acceder_ a esa ligadura _antes_ de ese punto, ya
  que no existe hasta entonces.

- Por otra parte, el momento en que una ligadura **deja de existir** depende su
  almacenamiento:

  - Si se almacena en un objeto, es porque la ligadura está ligando un atributo
    de ese objeto a un determinado valor. En tal caso, la ligadura dejará de
    existir cuando se elimine el objeto de la memoria, o bien, cuando se
    elimine el atributo ligado.

  - En caso contrario, la ligadura dejará de existir allí donde termine su
    ámbito.

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

---

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

- Al no tratarse de atributos de objetos, la visibilidad y el tiempo de vida de
  las ligaduras vendrán determinadas por sus ámbitos.

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
  operador punto (`.`) para acceder a ellos:

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

- En resumen:

  - Para poder acceder a un atributo de un objeto debemos indicar éste y usar
    el operador punto (`.`).

  - Por tanto, la **visibilidad** de su ligadura correspondiente no vendrá
    determinada por un ámbito, sino por el objeto que contiene al atributo (y
    que, por consiguiente, también contiene a su ligadura).

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

a. Si es un atributo de un objeto, la visibilidad será el objeto que contiene
   la ligadura.

b. En caso contrario, la visibilidad será el ámbito de la ligadura.

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

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Almacenamiento de una ligadura:**

- Determina el **espacio de nombres** donde se almacenará la ligadura.

- En Python:

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
  expresión lambda**.

- Ese marco se eliminará de la memoria al salir del ámbito de la expresión
  lambda, es decir, cuando se termine de ejecutar el cuerpo de la expresión
  lambda.

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
    puede **acceder** a ella en cualquier parte del cuerpo de la expresión
    lambda.

  - El **espacio de nombres** que almacena las ligaduras entre parámetros y
    argumentos es el **marco** que se crea al llamar a la expresión lambda.

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
  independientes entre sí (que es la base de la _programación modular_).

- Por ejemplo, nos permite crear funciones sin preocuparnos de si los nombres
  de los parámetros ya han sido utilizados en otras partes del programa.

<!--

## Ámbito de un identificador ligado

- Hemos visto que a los **parámetros** de una expresión lambda se les llama
  **identificadores ligados** cuando aparecen dentro del cuerpo de dicha
  expresión lambda.

- Por tanto, todo lo que se dijo sobre el ámbito de un parámetro se aplica
  exactamente igual al ámbito de un identificador ligado.

- Recordemos que el ámbito de un parámetro es el cuerpo de su expresión lambda,
  que es la porción de código donde podemos acceder al valor del argumento con
  el que está ligado.

- Por tanto, **el _ámbito_ de un identificador ligado es el _cuerpo_ de la
  expresión lambda** donde aparece, y es el único lugar dentro del cual
  podremos acceder al valor del identificador ligado (que también será el valor
  del argumento con el que está ligada).

- Por eso también se dice que el identificador ligado tiene un **ámbito local**
  al cuerpo de la expresión lambda o que es **local** a dicha expresión lambda.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**En resumen:**

- El **ámbito de un identificador ligado** es el ámbito de la ligadura que se
  crea entre ésto y su argumento correspondiente, y se corresponde con el
  **cuerpo** de la expresión lambda donde aparece.

- Por tanto, el identificador ligado sólo existe dentro del cuerpo de la
  expresión lambda y no podemos **acceder** a su valor fuera del mismo; por eso
  se dice que tiene un **ámbito _local_** a la expresión lambda.

- Además, **la ligadura** entre el identificador ligado y su argumento **se
  almacena en el marco** de la llamada a la expresión lambda, y por eso se dice
  que tiene un **almacenamiento _local_** a la expresión lambda.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- O sea: con los **identificadores ligados** ocurre exactamente lo mismo que
  con los **parámetros**, ya que, de hecho, **un parámetro y un identificador
  ligado son la misma cosa**, como ya hemos visto.

!EJEMPLO

- En el siguiente _script_:

  ```{.python .number-lines}
  # Aquí empieza el script (no hay más definiciones antes de esta línea):
  producto = lambda x: x * x
  y = producto(3)
  z = x + 1       # da error
  ```

- Hay dos ámbitos: el ámbito global y el ámbito local definido por el cuerpo de
  la expresión lambda (la expresión !PYTHON(x * x)).

- La expresión lambda de la línea 2 tiene un parámetro (!PYTHON(x)) que aparece
  como la variable ligada !PYTHON(x) en el cuerpo de la expresión lambda.

- El ámbito de la variable ligada !PYTHON(x) es el **cuerpo** de la expresión
  lambda.

- Por tanto, fuera del cuerpo de la expresión lambda, no es posible acceder al
  valor de la variable ligada !PYTHON(x), al encontrarnos **fuera de su
  ámbito** (la ligadura **sólo es visible dentro del cuerpo** de la expresión
  lambda).

- Por eso, la línea 4 dará un error al intentar acceder al valor del
  identificador !PYTHON(x), cuya ligadura no es visible fuera de la expresión
  lambda.

-->

## Ámbito de un identificador libre

- Los identificadores y ligaduras que no tienen ámbito local se dice que tienen
  un **ámbito _no local_** o, a veces, un **ámbito _más global_**.

  Si, además, ese ámbito resulta ser el **ámbito global**, decimos directamente
  que esos identificadores o ligaduras son **globales**.

- Por ejemplo, los **identificadores libres** que aparecen en una expresión
  lambda no son locales a dicha expresión (ya que no representan parámetros de
  la expresión) y, por tanto, tienen un ámbito más global que el cuerpo de
  dicha expresión lambda y se almacenarán en otro espacio de nombres distinto
  al marco que se crea al llamar a la expresión lambda.

# Abstracciones funcionales

## Pureza

- Si una expresión lambda no contiene identificadores libres, el valor que
  obtendremos al aplicarla a unos argumentos dependerá únicamente del valor que
  tengan esos argumentos (no dependerá de nada más que sea «*exterior*» a la
  expresión lambda).

- En cambio, si el cuerpo de una expresión lambda contiene identificadores
  libres, el valor que obtendremos al aplicarla a unos argumentos no sólo
  dependerá del valor de los argumentos, sino también de los valores a los que
  estén ligados esos identificadores libres en el momento de evaluar la
  aplicación de la expresión lambda.

- Es el caso del ejemplo anterior, donde tenemos una expresión lambda que
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

- En este otro ejemplo, escribimos una expresión lambda que calcula la suma de
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

- En resumen, creamos abstracciones:

  - Cuando creamos **casos generales a partir de patrones que se repiten** en
    varios casos particulares.

  - Cuando queremos **reducir la complejidad**, dándole un nombre a un
    mecanismo complejo para poder referirnos a todo el conjunto a través de su
    nombre sin tener que recordar continuamente qué piezas contiene el
    mecanismo o cómo funciona éste por dentro.

  - Cuando queremos que nuestro programa pueda **expresar un concepto
    abstracto**, como el de «elevar al cubo».

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
