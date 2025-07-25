---
title: Evaluación
author: Ricardo Pérez López
!DATE
nocite: |
  @abelson_structure_1996
---

# El modelo de entorno

## Entorno (*environment*!ifdef(HTML)(&nbsp;)())

- El **entorno** es una extensión del concepto de _marco_, usado por los
  lenguajes interpretados en la **resolución de identificadores**, ya que:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **entorno** nos da acceso a **_todas_ las ligaduras (almacenadas en
  marcos, es decir, no de atributos de objetos) que son _visibles_ en un
  momento concreto de la ejecución de un programa interpretado**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El intérprete usa el entorno para resolver los identificadores que se
  encuentran ligados mediante ligaduras cuya visibilidad depende de un ámbito y
  que estén, por tanto, almacenadas en un marco.

- Por tanto, no lo usa para resolver los identificadores asociados a atributos
  de objetos.

---

- Durante la ejecución del programa, se van creando y destruyendo marcos a
  medida que se van entrando y saliendo de ciertos ámbitos; en concreto, a
  medida que se van ejecutando _scripts_, funciones o métodos.

- Asimismo, en esos marcos se van almacenando ligaduras.

- **Según se van creando en memoria, esos marcos van enlazándose unos con
  otros** creando una **secuencia de marcos** que se denomina **entorno** (del
  inglés, _environment_).

- En un momento dado, el entorno contendrá más o menos marcos dependiendo de
  por dónde haya pasado la ejecución del programa hasta ese momento.

---

- El entorno, por tanto, es un concepto **_dinámico_** que **depende del
  momento en el que se calcule**, es decir, de por dónde va la ejecución del
  programa.

- Más concretamente: depende de qué _scripts_, funciones, métodos y
  definiciones se han ejecutado hasta ahora.

- Por tanto, el entorno depende de qué partes del programa se han ido
  ejecutando hasta llegar a la instrucción actual.

- El entorno **siempre contendrá**, al menos, un marco: el _marco global_, que
  **siempre será _el último_ de la secuencia de marcos** que forman el entorno.

- Asimismo, el primer marco del entorno se denomina el **marco actual**.

- Si el marco global es el único que existe, entonces el marco actual será el
  marco global.

---

- Gráficamente, representaremos los entornos como una **lista enlazada de
  marcos** conectados entre sí formando secuencias, de manera que:

  - Usaremos la letra $E$ como un indicador que siempre apunta al primer marco
    de la lista.

    Ese primer marco es el **marco actual**.

  - El último marco siempre será el marco global.

  !DOT(cadena-de-marcos.svg)()(width=60%)(width=60%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  graph [rankdir = LR]
  node [fontname = "monospace"]
  E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
  E -> "Marco A" -> "Marco B" -> "Marco global"
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si sólo hay un marco en el entorno, ése será necesariamente el marco global,
  el cual será también al mismo tiempo el marco actual:

  !DOT(unico-marco-en-entorno.svg)()(width=25%)(width=25%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  graph [rankdir = LR]
  node [fontname = "monospace"]
  E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
  E -> "Marco global"
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por ejemplo:

  - Cuando entramos a ejecutar un _script_, se crea su _marco global_.

    !IMGP(unico-marco-en-entorno.svg)()(width=25%)

  - Si dentro de ese _script_ llamamos a una expresión lambda, se creará un
    marco para esa ejecución concreta de la expresión lambda, por lo que en ese
    caso habrá dos marcos en la memoria: el _global_ y el de esa llamada a la
    expresión lambda.

    El marco de la expresión lambda será el marco actual, que será el
    primer marco del entorno y apuntará a su vez al marco global.

    !DOT(marcos-de-expresion-lambda-y-global.svg)()(width=60%)(width=60%)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    graph [rankdir = LR]
    node [fontname = "monospace"]
    E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
    E -> "Marco de la expresión lambda" -> "Marco global"
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  - El marco de la expresión lambda se eliminará de la memoria cuando termine
    esa ejecución de la expresión lambda.

  - A su vez, el marco global sólo se eliminará de la memoria cuando se
    finalice la ejecución del _script_.

### Ámbitos, marcos y entornos

- Hagamos un resumen rápido de todo lo visto hasta ahora.

- El entorno contiene todas las ligaduras visibles en un punto concreto de la
  ejecución del programa interpretado, siempre que sean ligaduras cuya
  visibilidad dependa de un ámbito y estén, por tanto, almacenadas en un marco
  (o sea, no es el caso de los atributos de objetos).

- Un marco contiene un conjunto de ligaduras (ya que es un _espacio de
  nombres_), y un entorno es una secuencia de marcos.

- Los marcos se van creando y destruyendo a medida que se van ejecutando y
  terminando de ejecutar ciertas partes del programa (_scripts_, funciones o
  métodos).

- Una expresión lambda representa una función.

- Cuando se llama a una función, se crea un nuevo marco que contiene las
  ligaduras que ligan a los parámetros con los valores de esos argumentos.

---

- El cuerpo de una expresión lambda determina su propio ámbito, de forma que
  las ligaduras que ligan a los parámetros con los argumentos se definen dentro
  de ese ámbito y son, por tanto, _locales_ a ese ámbito.

- Es decir: los parámetros (y las ligaduras entre los parámetros y los
  argumentos) tienen **un ámbito local** al cuerpo de la expresión lambda y
  sólo son visibles dentro de él.

- Además, esas ligaduras tienen un **almacenamiento local** al **marco** que se
  crea al llamar a la expresión lambda.

- Ese **marco** y ese **ámbito** van ligados:

  - Cuando **se _empieza_** a ejecutar el cuerpo de la expresión lambda, **se
    _entra_** en el ámbito y, por tanto, **se _crea_** el marco en la memoria.

  - Cuando **se _termina_** de ejecutar el cuerpo de la expresión lambda, **se
    _sale_** del ámbito y, por tanto, **se _elimina_** el marco de la memoria.

- **Todo _marco_ lleva asociado un _ámbito_** (lo contrario no siempre es
  cierto).

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

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Un marco se crea** cuando se **entra** en el **ámbito** de un _script_,
  función o método, y **se destruye** cuando se **sale** de ese **ámbito**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

<!-- Esta diapositiva está repetida en una sección anterior -->

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

  Ese marco es el **marco actual**, y se corresponde con el ámbito actual, es
  decir, con el ámbito más interno de la instrucción actual.

- Por otra parte, el **último marco** del entorno siempre es el _marco global_.

---

- Por ejemplo, si en cierto momento de la ejecución del programa anterior
  tenemos el siguiente entorno:

  !DOT(lambda-suma-entorno.svg)()(width=60%)(width=50%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  compound = true
  graph [rankdir = LR]
  node [fontname = "monospace"]
  Manolo [shape = ellipse, label = "'Manolo'"]
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

  - El marco de la función !PYTHON(suma) apunta al marco global en el entorno.

  - El ámbito de la expresión lambda a la que está ligado !PYTHON(suma) está
    contenido en el ámbito global.

  - El marco actual es el marco de la expresión lambda.

  - Por tanto, el programa se encuentra actualmente ejecutando el cuerpo de la
    expresión lambda.

  - De hecho, está ejecutando la llamada !PYTHON(suma(3, 5)).

### Evaluación de expresiones con entornos

- Al evaluar una expresión, el intérprete **buscará en el entorno el valor al
  que está ligado cada identificador** que aparezca en la expresión.

- Para ello, el intérprete buscará **en el primer marco del entorno** (el
  _marco actual_) una ligadura para ese identificador y, si no la encuentra,
  **irá pasando por toda la secuencia de marcos** hasta encontrarla.

  **Si no aparece en ningún marco**, querrá decir que:

  - o bien el identificador **no está ligado** (porque aún no se ha creado la
    ligadura),

  - o bien su ligadura **está fuera del entorno** y por tanto no es visible
    actualmente (al encontrarse en otro ámbito inaccesible desde el ámbito
    actual).

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

!DOT(lambda-entorno-linea1.svg)(Entorno justo tras ejecutar la línea 1)(width=60%)(width=25%)
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

!DOT(lambda-entorno-linea2.svg)(Entorno justo tras ejecutar la línea 2)(width=60%)(width=25%)
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

!DOT(lambda-entorno-linea4.svg)(Entorno justo tras ejecutar la línea 4)(width=60%)(width=35%)
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

!DOT(lambda-entorno-linea5.svg)(Entorno justo tras ejecutar la línea 5)(width=60%)(width=35%)
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

### Evaluación de expresiones lambda con entornos

- Para que una expresión lambda funcione, todos los identificadores que
  aparezcan en el cuerpo deben estar ligados a algún valor en el entorno **en
  el momento de _evaluar la aplicación_ de la expresión lambda sobre unos
  argumentos**.

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

- Observar que no es necesario que los identificadores que aparecen en el
  cuerpo estén ligados en el entorno cuando *se crea* la expresión lambda, sino
  cuando **_se evalúa_ el cuerpo de la expresión lambda**, o sea, cuando se
  llama a la expresión lambda.

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

!DOT(cuatro-ambitos-entorno-linea1.svg)(Entorno justo tras ejecutar la línea 1)(width=60%)(width=25%)
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

!DOT(cuatro-ambitos-entorno-linea2.svg)(Entorno justo tras ejecutar la línea 2)(width=60%)(width=25%)
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

!DOT(cuatro-ambitos-entorno-linea4-despues-tercer-lambda.svg)(Entorno justo tras ejecutar la línea 4)(width=40%)(width=30%)
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

#### Ligaduras *sombreadas*

- Recordemos que la **resolución de identificadores** es el proceso por el cual
  el compilador o el intérprete determinan qué ligadura se corresponde con una
  aparición concreta de un determinado identificador.

- ¿Qué ocurre cuando una expresión lambda contiene como parámetros algunos
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
    ámbito global (el ámbito de esa ligadura es el ámbito global). Esa
    ligadura, se almacena en el marco global, y por eso decimos que esa
    !PYTHON(x) (la que aparece en la línea 1) es _global_.

    Por tanto, la aparición de la `x` en la línea 1 representa a la `x` cuya
    ligadura se encuentra almacenada en el marco global (es decir, la `x`
    global) y que está ligada al valor !PYTHON(4).

  - Las !PYTHON(x) de la línea 2 representan al parámetro de la expresión
    lambda. Ese parámetro está ligado al argumento de la llamada, el ámbito de
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

- Para determinar cuánto vale cada aparición de la `x` en ese código (es decir,
  para _resolver_ la aparición de cada `x`), el intérprete de Python consulta
  el **entorno**.

---

- La `x` que está en la línea 1 y las `x` que están en la línea 2 son
  apariciones distintas que se corresponden con ligaduras distintas que tienen
  ámbitos distintos y se almacenan en espacios de nombres distintos.

- Por tanto, el identificador `x` podrá tener valores distintos dependiendo de
  qué aparición concreta de la `x` estamos evaluando.

- Cuando un mismo identificador está ligado dos veces en dos ámbitos anidados
  uno dentro del otro, decimos que:

  - El identificador que aparece en el ámbito más externo está **sombreado** (y
    su ligadura está **sombreada**) por el del ámbito más interno.

  - El identificador que aparece en el ámbito más interno **hace sombra** al
    identificador sombreado (y también se dice que su ligadura **hace sombra**
    a la ligadura sombreada) que aparece en el ámbito más externo.

---

- En nuestro ejemplo, podemos decir que el parámetro !PYTHON(x) de la expresión
  lambda hace sombra al identificador !PYTHON(x) que aparece en el ámbito
  global.

- Eso significa que no podemos acceder a ese identificador !PYTHON(x) global
  desde dentro del cuerpo de la expresión lambda, porque la !PYTHON(x) dentro
  del cuerpo siempre se referirá a la !PYTHON(x) local (el parámetro de la
  expresión lambda).

- Esto ocurre así porque, al buscar un valor para !PYTHON(x), la primera
  ligadura que se encuentra el intérprete para el identificador !PYTHON(x) al
  recorrer la secuencia de marcos del entorno, es precisamente la que está en
  el marco de la expresión lambda, que es el marco actual cuando se está
  ejecutando su cuerpo.

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

- Si desde dentro de la expresión lambda necesitáramos acceder al valor de la
  `x` que está fuera de ese expresión lambda, lo que podríamos hacer es
  **cambiarle el nombre** al parámetro !PYTHON(x). Por ejemplo:

  ```python
  x = 4
  total = (lambda w: w * x)(3)  # Su valor es 12
  ```

  Así, en la expresión lambda tendríamos el parámetro !PYTHON(w) y el
  identificador libre !PYTHON(x), éste último ligado en el ámbito global, y a
  cuyo valor ahora sí podemos acceder al no estar sombreado y encontrarse
  dentro del entorno.

!DOT(lambda-entorno-sin-sombra.svg)(Entorno en el cuerpo de la expresión lambda, sin identificador sombreado)(width=60%)(width=55%)
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

#### Renombrado de parámetros

- Los parámetros se pueden *renombrar* sin que se altere el significado de la
  expresión lambda, siempre que ese renombrado se haga de forma adecuada.

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
  **captura de identificadores**.

#### Visualización en *Pythontutor*

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
    a. La visibilidad de cada ligadura.
    a. El tiempo de vida de cada ligadura.
    a. El almacenamiento de cada ligadura.
    a. Los ámbitos de cada aparición de cada identificador.
    a. Las ligaduras sombreadas y los identificadores sombreados.
    a. Los identificadores y ligaduras que hacen sombra.

# Resolución de atributos de objetos

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

# La pila de control

## La pila de control

- La **pila de control** es una estructura de datos que utiliza el intérprete
  para llevar la cuenta de las **ejecuciones _activas_** que hay en un
  determinado momento de la ejecución del programa.

- Las **ejecuciones activas** son aquellas llamadas a funciones (o ejecuciones
  de _scripts_) que aún no han terminado de ejecutarse.

- La pila de control es, básicamente, un **almacén de marcos**.

- El marco que hay en el fondo de la pila siempre es el _marco global_ y se
  corresponde con el espacio de nombres del _script_ actual.

---

- Cada vez que se hace una nueva llamada a una función:

  1. la ejecución actual se detiene,

  2. el marco correspondiente a esa llamada **se almacena en la cima de la
     pila** sobre los demás marcos que pudiera haber y

  3. se continúa la ejecución en la función llamada.

- Ese marco representa por dónde va la ejecución del programa en este momento.

- Según ésto, si un marco _A_ está justo debajo de otro marco _B_, es porque el
  código correspondiente a _A_ está esperando a que termine el código
  correspondiente a _B_ (normalmente, una función).

- Ese marco además es el primero de la secuencia de marcos que forman el
  entorno de la función, que también estarán almacenados en la pila, más abajo.

- Los marcos se enlazan entre sí para representar los entornos que actúan en
  las distintas llamadas activas.

---

- El intérprete almacena en el marco cualquier información que necesite para
  gestionar las llamadas a funciones, incluyendo:

  - Las ligaduras entre los parámetros y sus valores (por supuesto).

  - La ligadura que apunta al valor de retorno de la función.

  - Cuál es el siguiente marco que le sigue en el entorno.

  - El punto de retorno, dentro del programa, al que debe devolverse el control
    cuando finalice la ejecución de la función.

- Un marco almacenado en la pila también se denomina **registro de
  activación**. Por tanto, también podemos decir que la pila de control
  almacena registros de activación.

- Cada llamada activa está representada por su correspondiente marco en la
  pila.

- En cuanto la llamada finaliza, su marco se saca de la pila y se transfiere el
  control a la llamada que está inmediatamente debajo (si es que hay alguna).

!EJEMPLOS

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

!DOT(pila-control.svg)(Pila de control con la llamada a la función `tres` activada)(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = LR
compound = true
newrank = true
node [shape = record, fontname = "monospace"]
1 [shape = circle]
3 [shape = circle]
11 [shape = circle]
6 [shape = circle]
4 [shape = circle]
l1 [shape = circle, label = "λ"]
l2 [shape = circle, label = "λ"]
l3 [shape = circle, label = "λ"]
subgraph cluster9 {
    label = "Pila de control"
    bgcolor = grey95
    subgraph cluster3 {
        label = <Marco de <font face="monospace">tres</font>>
        bgcolor = "white"
        w [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster2 {
        rank = min
        label = <Marco de <font face="monospace">dos</font>>
        bgcolor = "white"
        y [shape = plaintext, fillcolor = transparent, width = 0.1]
        z [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster1 {
        label = <Marco de <font face="monospace">uno</font>>
        bgcolor = "white"
        x [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster0 {
        label = "Marco global"
        bgcolor = "white"
        g [shape = plaintext, fillcolor = transparent, width = 0.1]
        uno [shape = plaintext, fillcolor = transparent, width = 0.1]
        dos [shape = plaintext, fillcolor = transparent, width = 0.1]
        tres [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    {rank = same; x; y; z; w; g; uno; dos; tres}
}
uno -> l1
dos -> l2
tres -> l3
g -> 1
x -> 3
w -> 11
y -> 6
z -> 4
x -> dos [lhead = cluster0, ltail = cluster1, minlen = 2]
y -> g [lhead = cluster0, ltail = cluster2, minlen = 2]
w -> uno [lhead = cluster0, ltail = cluster3, minlen = 2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Del análisis del diagrama del ejemplo anterior se pueden deducir las
  siguientes conclusiones:

  - En un momento dado, dentro del ámbito global se ha llamado a la función
    !PYTHON(uno), la cual ha llamado a la función !PYTHON(dos), la cual ha
    llamado a la función !PYTHON(tres), la cual aún no ha terminado de
    ejecutarse.

  - El entorno en la función !PYTHON(uno) empieza por el marco de !PYTHON(uno),
    el cual apunta al marco global.

  - El entorno en la función !PYTHON(dos) empieza por el marco de !PYTHON(dos),
    el cual apunta al marco global.

  - El entorno en la función !PYTHON(tres) empieza por el marco de
    !PYTHON(tres), el cual apunta al marco global.

---

- Si tenemos ámbitos anidados, los marcos se apuntarán entre sí en el entorno.
  Por ejemplo:

  ```python
  g = 1
  uno = lambda x: dos(x - 1)
  dos = lambda y: 1 + (lambda z: z * 2)(y ** 3)
  uno(3)
  ```

---

!DOT(pila-control-ambitos-anidados.svg)(Pila de control con ámbitos anidados y la función `dos` activada)(width=30%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = LR
compound = true
newrank = true
node [shape = record]
subgraph cluster9 {
    label = "Pila de control"
    bgcolor = grey95
    subgraph cluster3 {
        label = "Marco del lambda interior"
        bgcolor = "white"
        node [fontname = "monospace"]
        z [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster2 {
        rank = min
        label = "Marco de dos"
        bgcolor = "white"
        node [fontname = "monospace"]
        y [shape = plaintext, fillcolor = transparent, width = 0.1]
        dummy [style = invis, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster1 {
        label = "Marco de uno"
        bgcolor = "white"
        node [fontname = "monospace"]
        x [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    subgraph cluster0 {
        label = "Marco global"
        bgcolor = "white"
        node [fontname = "monospace"]
        g [shape = plaintext, fillcolor = transparent, width = 0.1]
        uno [shape = plaintext, fillcolor = transparent, width = 0.1]
        dos [shape = plaintext, fillcolor = transparent, width = 0.1]
    }
    {rank = same; x; uno; dos; g; z; y}
}
3 [shape = circle]
8 [shape = circle]
1 [shape = circle]
2 [shape = circle]
l1 [shape = circle, label = "λ"]
l2 [shape = circle, label = "λ"]
uno -> l1
dos -> l2
g -> 1
x -> 3
z -> 8
y -> 2
x -> uno [lhead = cluster0, ltail = cluster1, minlen = 2]
y -> g [lhead = cluster0, ltail = cluster2, minlen = 2]
z -> dummy [lhead = cluster2, ltail = cluster3, minlen = 3]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Hemos dicho que habrá un marco por cada nueva llamada que se realice a una
  función, y que ese marco se mantendrá en la pila hasta que la llamada
  finalice.

- Por tanto, en el caso de una función recursiva, tendremos un marco por cada
  llamada recursiva.

```python
fact = lambda n: 1 if n == 0 else n * fact(n - 1)
fact(4)
```

---

!DOT(pila-control-factorial.svg)(Pila de control tras tres activaciones desde `fact(4)`)(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = LR
compound = true
newrank = true
node [shape = record, fontname = "monospace"]
subgraph cluster9 {
    label = "Pila de control"
    bgcolor = grey95
    subgraph cluster1 {
        label = <Marco de <font face="monospace">fact(4)</font>>
        bgcolor = "white"
        n4 [shape = plaintext, fillcolor = transparent, label = "n", width = 0.1]
    }
    subgraph cluster2 {
        label = <Marco de <font face="monospace">fact(3)</font>>
        bgcolor = "white"
        n3 [shape = plaintext, fillcolor = transparent, label = "n", width = 0.1]
    }
    subgraph cluster3 {
        label = <Marco de <font face="monospace">fact(2)</font>>
        bgcolor = "white"
        n2 [shape = plaintext, fillcolor = transparent, label = "n", width = 0.1]
    }
    subgraph cluster0 {
        label = "Marco global"
        bgcolor = "white"
        fact [shape = plaintext, fillcolor = transparent]
        dummy [style = invis]
    }
    {rank = same; n4; n3; n2; fact; dummy}
}
4 [shape = circle]
3 [shape = circle]
2 [shape = circle]
lambda [shape = circle, label = "λ"]
n4 -> 4
n3 -> 3
n2 -> 2
fact -> lambda
n4 -> fact [lhead = cluster0, ltail = cluster1]
n3 -> dummy [lhead = cluster0, ltail = cluster2]
n2 -> dummy [lhead = cluster0, ltail = cluster3]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Los **traductores que optimizan la recursividad final** lo que hacen es
  sustituir cada llamada recursiva por la nueva llamada recursiva a la misma
  función.

- De esta forma, el marco que genera cada nueva llamada recursiva no se apila
  sobre los marcos anteriores en la pila, sino que sustituye al marco de la
  llamada que la ha llamado a ella.

- Por ejemplo, en el siguiente caso:

  ```python
  fact_iter = lambda cont, acc: acc if cont == 0 else \
                                fact_iter(cont - 1, acc * cont)
  fact = lambda n: fact_iter(n, 1)

  fact(5)
  = fact_iter(5, 1)
  = fact_iter(4, 5)
  = fact_iter(3, 20)
  = fact_iter(2, 60)
  = fact_iter(1, 120)
  = fact_iter(0, 120)
  = 120
  ```

---

- !PYTHON(fact_iter(4, 5)) llama a !PYTHON(fact_iter(3, 20)) y devuelve
  directamente el resultado de ésta.

- Es decir: !PYTHON(fact_iter(4, 5) == fact_iter(3, 20)), así que hacer
  !PYTHON(fact_iter(4, 5)) es lo mismo que hacer !PYTHON(fact_iter(3, 20)).

- Por tanto, la llamada a !PYTHON(fact_iter(4, 5)) se puede sustituir por la
  llamada a !PYTHON(fact_iter(3, 20)).

- Un intérprete que optimiza la recursividad final no apilaría el marco de la
  segunda llamada sobre el marco de la primera, sino que el marco de la segunda
  sustituiría al marco de la primera dentro de la pila.

- Así se haría también con las demás llamadas recursivas a
  !PYTHON(fact_iter(2, 60)), !PYTHON(fact_iter(1, 120)) y
  !PYTHON(fact_iter(0, 120)).

- De este modo, la pila no crecería con cada nueva llamada recursiva.

# Estrategias de evaluación

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

      siempre es igual a !PYTHON(True), valga lo que valga $\underline{x}$.

    - !PYTHON(False and) \ $\;\underline{x}$

      siempre es igual a !PYTHON(False), valga lo que valga $\underline{x}$.

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

!BIBLIOGRAFIA
