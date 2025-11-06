---
title: Programación imperativa (I)
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008
---

# Modelo de ejecución

## Máquina de estados

- La **programación imperativa** es un paradigma de programación basado en los
  conceptos de «**_estado_**» y «**_sentencia_**».

- Un programa imperativo está formado por una **secuencia de sentencias**

- El programa imperativo va pasando por diferentes **estados** a medida que se
  van ejecutando las sentencias que lo forman.

- Por tanto, una **sentencia** es una instrucción que cambia el estado del
  programa.

- El **fundamento teórico** de la programación imperativa son las **máquinas de
  Turing** y la arquitectura de **Von Neumann**, que son modelos abstractos de
  cómo funciona un ordenador.

- El **modelo de ejecución** de un programa imperativo es el de una **máquina
  de estados**, es decir, un dispositivo abstracto que va pasando por
  diferentes estados a medida que el programa va ejecutándose.

---

- El concepto de «_**tiempo**_» también es muy importante en programación
  imperativa, ya que el estado del programa va cambiando a lo largo del tiempo
  conforme se van ejecutando las sentencias que lo forman.
  
- A su vez, el comportamiento del programa depende del estado en el que se
  encuentre.

  Eso significa que, ante los mismos datos de entrada, una función en
  programación imperativa puede devolver **valores distintos en momentos
  distintos**.

- En programación funcional, en cambio, el comportamiento de una función no
  depende del momento en el que se ejecute, ya que siempre devolverá los mismos
  resultados ante los mismos datos de entrada (_transparencia referencial_).

- Eso significa que, para modelar el comportamiento de un programa imperativo,
  ya **no nos vale el modelo de sustitución** que hemos estado usando hasta
  ahora en programación funcional.

## Sentencias

- Las **sentencias** son las instrucciones principales que componen un programa
  imperativo.

- La ejecución de una sentencia **cambia el estado interno del programa**
  provocando uno de estos **efectos**:

  - **Cambiar las coordenadas** del proceso asociado al programa, normalmente
    mediante la llamada **sentencia de asignación**.

  - Cambiar el **flujo de control** del programa, haciendo que la ejecución se
    bifurque (*salte*) a otra parte del mismo.

- La principal diferencia entre una _sentencia_ y una _expresión_ es que las
  sentencias no denotan ningún valor, sino que son órdenes a ejecutar por el
  programa para producir un _efecto_.

  - Las _expresiones_ se _evalúan_ y devuelven un _valor_.

  - Las _sentencias_ se _ejecutan_ para producir un _efecto_.

---

- **En un lenguaje funcional puro:**

  - Un programa es una expresión.

  - Ejecutar un programa consiste en evaluar dicha expresión usando las
    definiciones predefinidas del lenguaje y las definidas por el programador.

  - Todo son expresiones, excepto las sentencias que producen el efecto de
    crear _ligaduras_ (como las sentencias de definición, o de importación de
    módulos).

  - Evaluar una expresión no produce ningún otro efecto salvo el de calcular su
    valor.

  - Las expresiones devuelven siempre el mismo valor (tienen _transparencia
    referencial_).

  - El comportamiento de un programa se puede modelar usando el _modelo de
    sustitución_.

---

- **En cambio, en un lenguaje imperativo:**

  - Los programas están formados por sentencias que, al ejecutarse, van
    cambiando el estado del programa.

  - El valor de una expresión depende del estado en el que se encuentre el
    programa en el momento de evaluar dicha expresión (no hay _transparencia
    referencial_).

  - Evaluar una expresión puede provocar otros efectos (los llamados _efectos
    laterales_) más allá de calcular su valor.

  - En muchos lenguajes imperativos es posible colocar una expresión donde
    debería ir una sentencia (aunque no al revés).

    Esto sólo resultaría útil en caso de que la evaluación de la expresión
    provocara *efectos laterales*. De lo contrario, el valor de la evaluación
    se perdería sin más y no habría servido de nada calcularlo.

## Secuencia de sentencias

- Un programa imperativo está formado por una **secuencia de sentencias**.

- Ejecutar un programa imperativo es provocar los **cambios de estado** que
  dictan las sentencias en el **orden** definido por el programa.

- Las sentencias del programa van provocando **transiciones** entre estados,
  haciendo que la máquina pase de un estado al siguiente.

- Para modelar el comportamiento de un programa imperativo tendremos que saber
  en qué estado se encuentra el programa, para lo cual tendremos que seguirle
  la pista desde su estado inicial al estado actual.

- Eso básicamente se logra «ejecutando» mentalmente el programa sentencia por
  sentencia y llevando la cuenta de los cambios que van produciendo conforme se
  van ejecutando.

---

- Al decir que un programa imperativo está formado por una _secuencia_ de
  sentencias, estamos diciendo que importa mucho el orden en el que están
  colocadas las sentencias dentro del programa.

- En general, un programa imperativo se comportará de forma diferente si se
  cambia el orden en el que se ejecutan sus sentencias.

  Por eso, si se ejecuta _A_ antes que _B_, el programa seguramente no
  producirá el mismo efecto que si se ejecuta _B_ antes que _A_.

- Por ejemplo, muchas veces el funcionamiento de una sentencia _B_ depende del
  efecto producido por una sentencia _A_ anterior. Por tanto, en ese caso, _A_
  debería ejecutarse antes que _B_.

# Asignación destructiva

## Valores y referencias

- Todos los **valores** se almacenan en una zona de la memoria conocida como el
  **montículo**.

- El valor se guardará en el montículo a partir de una determinada dirección de
  memoria y ocupando el espacio que se necesite en función del tamaño que tenga
  el valor.

- Dado un determinado valor, se denomina **referencia al valor** a un
  localizador que permite identificar, localizar y acceder a ese valor dentro
  del montículo.

- Cada vez que aparece un valor nuevo dentro del programa, el intérprete lo
  guarda dentro del montículo y crea una referencia al mismo.

- En tal caso, se dice también que «**la referencia _apunta_ al valor**».

---

- A partir de ese momento, el valor se manipulará siempre a través de esa
  referencia, la cual sirve como localizador y como forma de acceder a ese
  valor en la memoria.

- Por tanto, para poder manipular un valor, necesitamos disponer de la
  referencia a dicho valor.

- Por ejemplo, la expresión !PYTHON(500) representa al valor `500` que está
  almacenado en el montículo pero, en realidad, al evaluar la expresión, el
  intérprete no devuelve ese valor, sino una referencia al valor, a través de
  la cual podremos acceder al valor.

---

- En la mayoría de los lenguajes de programación, esa referencia coincide con
  la **dirección de comienzo** de la zona que ocupa ese valor dentro del
  montículo, aunque ese es un detalle de funcionamiento interno del intérprete
  que no es necesario conocer.

  Por ese misma razón, en la mayoría de los lenguajes, las referencias son
  únicas y constantes para cada valor:

  - Que sean únicas quiere decir que dos valores distintos tendrán referencias
    distintas.

  - Que sean constantes quiere decir que la referencia a un valor nunca cambia
    durante la vida del mismo.

---

- No está de más recordar que los programas no pueden manipular valores
  directamente (ya que los valores son entidades abstractas), sino que sólo
  pueden manipular _representaciones_ de ese valor.

- Por ejemplo, un programa no puede manipular el número **cinco**, ya que los
  números sólo existen de forma ideal en el mundo abstracto.

- Sin embargo, el programa puede manipular expresiones como !PYTHON(2 + 3) o
  !PYTHON(5), que representan (o _denotan_) a ese valor **cinco**.

- Por otra parte, !PYTHON(5) es la _expresión canónica_ del valor **cinco**.

- Esa expresión canónica representa al valor dentro del programa, ya que es,
  además, la _forma normal_ de todas las expresiones que denotan el mismo
  valor.

---

- Pero aunque ya sabemos que lo que se manipula y se almacena en la
  memoria no es el valor en sí, sino su expresión canónica, nosotros, para
  simplificar, siempre vamos a hablar de manipular y almacenar
  _valores_, aunque no sea del todo correcto.

- A su vez, los valores (o, mejor dicho, sus expresiones canónicas) se
  almacenan en la memoria del ordenador usando una _codificación_ apropiada al
  tipo de cada valor.

- Por ejemplo, un número entero como el !PYTHON(5) se puede almacenar usando
  una codificación binaria en complemento a dos, mientras que una cadena como
  !PYTHON('hola') se podría almacenar como una secuencia de caracteres Unicode.

- Por tanto, cuando se almacena un valor en la memoria (o, mejor dicho, cuando
  se almacena su expresión canónica), ocupará un espacio que dependerá del
  valor que sea y del tipo que tenga.

## Variables

- Una **variable** es un lugar en la **memoria** donde se puede **almacenar la
  referencia** a un valor.

- En tal caso, se puede decir que:

  - «La variable contiene (o almacena) una referencia al valor».
  - «La variable hace referencia al valor».
  - «La variable apunta al valor».

- Otras formas menos correctas (pero que se utilizan con frecuencia por abuso
  del lenguaje) serían:

  - «La variable contiene (o almacena) el valor».
  - «La variable vale el valor».
  - «La variable es una referencia al valor».

- Aunque la referencia sea única para cada valor, podemos tener varias
  referencias apuntando a la vez al mismo valor, una por cada variable que
  contenga la referencia al valor. Por esto se puede hablar de «_una_
  referencia al valor» y no sólo de «_la_ referencia al valor».

---

- El contenido de una variable (es decir, la _referencia_ que contiene) **puede
  cambiar** durante la ejecución del programa, haciendo que la variable pueda
  «_apuntar_» (o «_hacer referencia_») a distintos valores durante la ejecución
  del programa.

- A partir de ahora, un identificador no se va a ligar directamente con un
  valor, sino que tendremos:

  - Una **ligadura** entre un identificador y una **variable**.

  - La variable **contiene una referencia** al valor.

!DOT(identificador-variable-valor.svg)()(width=70%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
identificador [shape = plaintext, fillcolor = transparent, fontname = "monospace"]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable -> valor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Este comportamiento es el propio de los **lenguajes de programación
  _orientados a objetos_** (como Python o Java), que son los lenguajes
  imperativos más usados a día de hoy.

- Otros lenguajes imperativos más «clásicos» (como C o Pascal) se comportan, en
  general, de forma diferente.

- En esos lenguajes, los valores se almacenan directamente dentro de las
  variables, es decir, que las variables son contenedores que almacenan
  valores, no referencias a los valores.

- Por tanto, el compilador tiene que reservar espacio suficiente en la memoria
  para cada variable del programa, de manera que dicha variable pueda contener
  un valor de un determinado tamaño y que ese valor «quepa» dentro de la
  variable.

---

- De todos modos, algunos lenguajes de programación tienen un comportamiento
  híbrido, que combina ambas técnicas:

  - En Java, existen _tipos primitivos_ (cuyos valores se almacenan
    directamente en las variables) y _tipos referencia_ (cuyos valores se
    almacenan en el montículo y las variables contienen referencias a esos
    valores).

  - En C, los valores se almacenan dentro de las variables, pero es posible
    reservar memoria dinámicamente dentro del montículo y almacenar en una
    variable un *puntero* al comienzo de dicha zona de memoria, lo que permite
    crear y destruir datos en tiempo de ejecución.

## Estado

- La **ligadura** es la asociación que se establece entre un identificador y
  una variable.

- El **estado de una variable** es el valor al que hace referencia una variable
  en un momento dado.

  Por tanto, el estado es la asociación que se establece entre una variable y
  un valor (es decir, la referencia que contiene la variable y que apunta al
  valor).

!DOT(identificador-ligadura-variable-estado-valor.svg)()(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
identificador [shape = plaintext, fillcolor = transparent, fontname = "monospace"]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable [label = "ligadura"]
variable -> valor [label = "estado"]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Tanto las ligaduras como los estados pueden cambiar durante la ejecución de
  un programa imperativo.

- El **estado de un programa** es el conjunto de los estados de todas sus
  variables (más cierta información auxiliar gestionada por el intérprete).

## Marcos en programación imperativa

- Hasta ahora, los marcos contenían ligaduras entre identificadores y valores.

- A partir de ahora, un marco contendrá:

  - Las **ligaduras entre identificadores y variables**.

  - El **estado de cada variable**, es decir, la referencia que contiene cada
    variable en un momento dado.

!DOT(marcos-imperativa.svg)()(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
subgraph cluster0 {
    label = "Montículo"
    bgcolor = grey95
    style = rounded
    4 [shape = circle, width = 0.3, fixedsize = shape]
    5 [shape = circle, width = 0.3, fixedsize = shape]
}
subgraph cluster1 {
    label = "Marco global"
    bgcolor = white
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.01]
    y [shape = plaintext, fillcolor = transparent, width = 0.01]
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    x -> v1 -> 4
    y -> v2 -> 5
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Para simplificar la representación gráfica, generalmente dibujaremos cada
  identificador al lado de su correspondiente variable (representando la
  _ligadura_), y la variable apuntando a su valor en el montículo
  (representando el _estado_).

!DOT(marcos-imperativa-simplificado.svg)()(width=20%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
5 [shape = circle, width = 0.3, fixedsize = shape]
4 [shape = circle, width = 0.3, fixedsize = shape]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x:f1 -> 4
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El montículo como tal normalmente no lo dibujaremos, ya que sabemos que los
  valores se almacenan en él.

- Igualmente, a veces tampoco dibujaremos el marco si se sobreentiende cuál es
  (o si no tiene importancia en ese momento).

- Incluso, a veces, llegado el caso, también dibujaremos el valor directamente
  almacenado en la variable que le apunta, para simplificar (aunque sabemos que
  eso no es lo que ocurre en Python).

## Sentencia de asignación

- La forma más básica de cambiar el estado de una variable es usando la
  **sentencia de asignación**.

- Es la misma instrucción que hemos estado usando hasta ahora para ligar
  valores a identificadores, pero ahora, en el paradigma imperativo, tiene otro
  significado:

  ```python
  x = 4
  ```

  Esa instrucción ahora se lee así:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  «_Asigna el valor !PYTHON(4) a la variable !PYTHON(x)_»
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  y el efecto que produce es el de almacenar, en la variable ligada al
  identificador !PYTHON(x), la _referencia_ del valor !PYTHON(4) almacenado en
  el montículo.

- A partir de este momento, se dice (aunque no esté muy bien dicho) que «_la
  variable !PYTHON(x) **vale** !PYTHON(4)_».

---

- Como se ve, por economía del lenguaje se dice:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  «_Asigna el valor !PYTHON(4) a la variable !PYTHON(x)_»
  ~~~~~~~~~~~~~~~~~~~~~~~

  o también (menos frecuente pero algo más correcto):

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  «_Almacena el valor !PYTHON(4) en la variable ligada al identificador
  !PYTHON(x)_»
  ~~~~~~~~~~~~~~~~~~~~~~~

  en lugar de la forma más correcta, pero menos frecuente:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  «_Almacena una referencia al valor !PYTHON(4) en la variable ligada al
  identificador !PYTHON(x)_».
  ~~~~~~~~~~~~~~~~~~~~~~~

- Aunque esto simplifica las cosas a la hora de hablar, hay que tener cuidado,
  porque llegado el momento es posible tener:

  - Varios identificadores distintos ligados a la misma variable (ocurre en
    algunos lenguajes como PHP, aunque no en Python ni Java).

  - Un mismo identificador ligado a distintas variables en diferentes puntos
    del programa.

  - Varias variables apuntando al mismo valor.

---

- Podemos ejecutar varias sentencias de asignación sobre una misma variable en
  diferentes puntos del programa, lo que permite que una variable pueda cambiar
  su valor durante la ejecución del programa.

- Se dice que la asignación es **destructiva** porque, al cambiarle el valor a
  una variable, **el nuevo valor sustituye a su valor anterior** en esa
  variable.

- Por ejemplo, si tras haber ejecutado la anterior asignación !PYTHON(x = 4),
  ahora hacemos:

  ```python
  x = 9
  ```

  el valor de la variable !PYTHON(x) pasa ahora a ser !PYTHON(9), sustituyendo
  el valor !PYTHON(4) anterior.

---

- Por tanto, eso significa que la variable `x` puede hacer referencia a
  distintos valores dependiendo del momento en el que se compruebe su valor.

- De hecho, la asignación anterior crea un instante que divide el flujo
  temporal de ejecución en dos momentos:

  - **Antes** de ejecutar la asignación, `x` vale !PYTHON(4).

  - **Después** de ejecutar la asignación, `x` vale !PYTHON(9).

---

- Cada nueva asignación provoca un cambio de estado en el programa.

- En el ejemplo anterior, el programa pasa de estar en un estado en el que la
  variable !PYTHON(x) vale !PYTHON(4) a otro en el que la variable vale
  !PYTHON(9).

- Al final, un programa imperativo se puede reducir a una **secuencia de
  asignaciones** realizadas en el orden dictado por el programa.

- Este modelo de funcionamiento está estrechamente ligado a la arquitectura de
  un ordenador: hay una memoria formada por celdas que contienen datos que
  pueden cambiar a lo largo del tiempo según dicten las instrucciones del
  programa que controla al ordenador.

#### Un ejemplo completo

- Cuando se ejecuta la siguiente instrucción:

  ```python
  x = 2500
  ```

  ocurre lo siguiente:

  1. Se crea el valor !PYTHON(2500) en el montículo.

     En determinadas situaciones, no crea un nuevo valor si ya había otro
     exactamente igual en el montículo, pero éste no es el caso.

  2. El intérprete resuelve el identificador `x` (que aquí consiste en
     determinar a qué variable está ligado el identificador !PYTHON(x))
     consultando el entorno.

     Si no existía dicha variable, la crea en ese momento y la liga a
     !PYTHON(x) en el marco actual.

  3. Almacena en la variable una referencia al valor.

## La sentencia !PYTHON(del)

- En Python existe la sentencia contraria a la asignación, es decir, **una
  sentencia que _elimina variables_**.

- Para ello, se usa la palabra clave !PYTHON(del) seguido de una expresión que
  identifique a la variable (que normalmente será un simple identificador):

  ```python
  >>> x = 25
  >>> x
  25
  >>> del x
  >>> x
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  ```

- Al hacer !PYTHON(del x), se elimina la variable ligada al identificador `x`
  en el marco donde está almacenada la variable.

- Tras eliminar la variable, se elimina también, en ese mismo marco, el
  identificador `x` y la ligadura que existía entre este y la variable, puesto
  que ya no tiene sentido que sigan existiendo al no existir la variable.

## Alias de variables y valores idénticos

- Cuando una variable que tiene un valor se asigna a otra, ambas variables
  pasan a **_compartir_ el mismo valor**, produciéndose un fenómeno conocido
  como **alias de variables**.

  ```python
  x = (66, 77, 88, 99)
  y = x  # x se asigna a y; ahora y tiene el mismo valor que x
  ```

- Esto se debe a que las variables almacenan **referencias** a los valores, no
  los valores en sí mismos (éstos se almacenan en el montículo).

:::: columns

::: column

!DOT(alias0.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
lista:f0 -> 66
lista:f1 -> 77
lista:f2 -> 88
lista:f3 -> 99
x:f1 -> lista
y:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Las dos variables almacenan la misma referencia (o, dicho de otra forma, son
  dos referencias al mismo valor).

- En tal caso, decimos que `x` e `y` son datos **idénticos** (no sólo
  _iguales_), ya que apuntan al mismo valor en el montículo.

:::

::::

## Recolección de basura

- Un valor se vuelve **inaccesible** cuando no hay ninguna referencia que
  apunte a él.

- Eso ocurre cuando no queda ninguna variable que contenga una referencia a ese
  valor.

- En tal caso, el intérprete lo marca como *candidato para ser eliminado*.

- Cada cierto tiempo, el intérprete activa el **recolector de basura**, que es
  un componente que se encarga de liberar de la memoria a los valores que están
  marcados como candidatos para ser eliminados.

- Por tanto, el programador Python no tiene que preocuparse de gestionar
  manualmente la memoria ocupada por los valores que componen su programa.

---

- Por ejemplo:

  ```python
  tupla1 = (1, 2, 3)  # crea la tupla y guarda una referencia a ella en tupla1
  tupla2 = tupla1     # almacena en tupla2 la referencia que hay en tupla1
  ```

  A partir de ahora, ambas variables apuntan al mismo valor y, por tanto,
  decimos que el valor tiene dos referencias, o que hay dos referencias
  apuntándole.


  ```python
  del tupla1          # elimina una referencia pero el valor aún tiene otra
  del tupla2          # elimina la otra referencia y ahora el valor es inaccesible
  ```

  Como ya no hay ninguna referencia apuntándole, se marca como _candidato a ser
  eliminado_ y, por tanto, la próxima vez que se active el recolector de
  basura, se eliminará la tupla del montículo.

## Evaluación de expresiones con variables

- Al evaluar expresiones, las variables actúan de modo similar a las ligaduras
  de la programación funcional pero, ahora, los valores de las variables pueden
  cambiar a lo largo del tiempo, por lo que deberemos *seguirle la pista* a los
  cambios que sufran dichas variables.

- Todo lo visto hasta ahora sobre marcos, ámbitos, sombreado, entornos, etc. se
  aplica igualmente a las variables.

- Por ejemplo:

  ```python
  >>> x = 4
  >>> y = 3
  >>> x * y + 5    # esta expresión vale 17 porque 'x' vale 4 y 'y' vale 3
  17
  >>> x = 9
  >>> x * y + 5    # la misma expresión ahora vale 32 porque 'x' vale 9
  32
  ```

---

- Los parámetros de las funciones (es decir, de las expresiones lambda) también
  son ahora variables en el paradigma imperativo.

- Por tanto, si tenemos el siguiente código:

  ```python
  cuadrado = lambda x: x **2
  total = cuadrado(4)
  ```

  el parámetro `x` es ahora un identificador que se ligará a una variable, la
  cual almacenará una referencia a su argumento correspondiente durante las
  llamadas a la función.

  Por tanto, en la llamada !PYTHON(cuadrado(4)), se guardará en el marco de la
  expresión lambda una ligadura entre el identificador `x` y una variable que
  se creará y se almacenará en el mismo marco, y esa variable contendrá una
  referencia al argumento !PYTHON(4).

## Tipado estático vs. dinámico

- Cuando una variable tiene asignado un valor, al ser usada en una expresión
  actúa como si fuera ese valor.

- Como cada valor tiene un tipo asociado, también podemos hablar del **tipo de
  una variable**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de una variable** es el tipo del valor al que hace referencia la
  variable.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si a una variable se le asigna otro valor de un tipo distinto al del valor
  anterior, el tipo de la variable cambia y pasa a ser el del nuevo valor que
  se le ha asignado.

---

- Eso quiere decir que **el tipo de una variable podría cambiar durante la
  ejecución del programa**.

- A este enfoque se le denomina **tipado dinámico**.

- En esos lenguajes, no existen mecanismos que permitan asignar de manera fija
  y única el tipo de una variable de forma que siempre sea el mismo durante
  toda la ejecución del programa.

- Así, los traductores de un lenguaje dinámico no tratan de asignar un tipo a
  las variables durante la fase de compilación o al empezar a leer el código
  fuente del programa, sino que el tipo es una propiedad de la variable que va
  cambiando a medida que se van ejecutando las instrucciones del programa, de
  forma dinámica.

- Por esta razón, en general, en un lenguaje dinámico no se puede determinar el
  tipo de una variable simplemente leyendo el código fuente del programa, sin
  ejecutarlo.

---

- Asimismo, en esos lenguajes tampoco es posible, en general, deteminar de
  antemano (sin ejecutar el programa) la signatura de las funciones, es decir,
  el tipo de sus parámetros y el de su valor de retorno, ya que todos ellos
  también son variables.

  Por tanto, es la propia función la que, durante una llamada a la misma, se
  encarga de comprobar en tiempo de ejecución si los argumentos de entrada que
  le han pasado en la llamada son del tipo correcto.

- Por ejemplo, en la siguiente función:

  ```python
  f = lambda x, y: x + y
  ```

  no están determinados de antemano los tipos de los parámetros ni el tipo de
  retorno, por lo que dicha función podría admitir argumentos de cualquier tipo
  siempre que soporten el operador `+`.

---

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado dinámico:**

  Son aquellos que **permiten** que el tipo de una variable **cambie** durante
  la ejecución del programa y en los que, por tanto, en general, no es posible
  determinar de antemano el tipo de la variable sin ejecutar el programa. Eso
  incluye también la signatura de las funciones, es decir, el tipo de sus
  parámetros y su tipo de retorno.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- En contraste con los lenguajes de tipado dinámico, existen los llamados
  **lenguajes de tipado estático**.

- En un lenguaje de tipado estático, el tipo de una variable se define una sola
  vez (en la fase de compilación o justo al empezar a ejecutarse el programa),
  y **no puede cambiar** durante la ejecución del mismo.

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado estático:**

  Son aquellos que asocian forzosamente y de forma única un tipo a cada
  variable del programa antes de comenzar a ejecutarse y **prohíben** que dicho
  tipo **cambie** durante la ejecución del mismo.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto, en un programa escrito en un lenguaje de tipado estático es
  posible determinar el tipo de una variable simplemente leyendo el código
  fuente del mismo, sin necesidad de ejecutarlo.

---

- Estos lenguajes disponen de instrucciones que permiten _declarar_ de qué tipo
  serán los datos que se pueden asignar a una variable.

  Por ejemplo, en Java podemos hacer:

  ```java
  String x;
  ```

  con lo que declaramos que a !JAVA(x) sólo se le podrán asignar valores de
  tipo !JAVA(String) (es decir, *cadenas*) desde el primer momento y a lo largo
  de toda la ejecución del programa.

- A veces, se pueden realizar al mismo tiempo la declaración del tipo y la
  asignación del valor:

  ```java
  String x = "Hola";
  ```

---

- Otros lenguajes de tipado estático disponen de un mecanismo conocido como
  **inferencia de tipos**, que permite *deducir* automáticamente el tipo de una
  variable.

- Por ejemplo, en Java podemos hacer:

  ```java
  var x = "Hola";
  ```

  El compilador de Java deduce que la variable !JAVA(x) debe ser de tipo
  !JAVA(String) porque se le está asignando una cadena (el valor
  !JAVA("Hola")).

- La inferencia de tipos permite el tipado estático sin necesidad de usar
  declaraciones explícitas de tipos.

- Aún así, la inmensa mayoría de los lenguajes estáticos con inferencia de
  tipos disponen de mecanismos de declaración explícita de tipos, ya que a
  veces es necesario «ayudar» al traductor a deducir el tipo de una variable.

- Así ocurre, por ejemplo, con algunos lenguajes funcionales como Haskell o ML.

---

- En los lenguajes de tipado estático, el traductor es capaz de comprobar si
  existen errores de tipos **antes de empezar la ejecución del programa**, es
  decir, durante la fase de compilación (si es un compilador) o justo al
  empezar a leer el código fuente (si es un intérprete).

- Por ejemplo, el compilador de Java podría detectar, en tiempo de compilación
  y sin tener que ejecutarlo, que el siguiente trozo de código es erróneo, ya
  que se intenta asignar un valor de tipo cadena a una variable declarada de
  tipo entero:

  ```{.java .number-lines}
  int x;

  x = "Hola";
  ```

- Al ser un lenguaje de tipado estático, el compilador conoce (o deduce) **en
  tiempo de compilación** el tipo de la variable `x` y el del valor
  !JAVA("Hola"), sabe que son tipos diferentes (!JAVA(int) y !JAVA(String),
  respectivamente) y concluye que no es correcto asignar ese valor a esa
  variable puesto que sus tipos son incompatibles, generando un **error de
  tipos** en la línea 3 y deteniendo la generación del código objeto.

---

- De igual forma, el compilador detecta en tiempo de compilación que la
  siguiente expresión no es correcta, ya que se intenta multiplicar un número
  con una cadena, algo que no está permitido en Java:

  ```java
  x * "Hola"
  ```

- Por contra, el lenguaje Python es un lenguaje dinámico, por lo que el
  intérprete desconoce de antemano el tipo de las variables, ya que éste va
  cambiando sobre la marcha a medida que se va ejecutando el programa:

  ```python
  x = 4       # Ahora x es de tipo int
  x = 'Hola'  # Ahora x es de tipo str
  ```

- Por tanto, el intérprete no puede saber de antemano (antes de ejecutar el
  programa) si la siguiente expresión es correcta o incorrecta:

  ```python
  x / 2       # Se puede dividir un entero, pero no una cadena
  ```

  Sólo podrá saberlo cuando esté ejecutando el programa y esté a punto de
  evaluar la expresión, porque hasta entonces no sabrá cuál es el tipo de la
  variable `x` _en ese momento_.

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

## Asignación compuesta

- Los operadores de **asignación compuesta** nos permiten realizar operaciones
  sobre una variable y luego asignar el resultado a la misma variable.

- Tienen la forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_compuesta) ::= !T(identificador)\  !NT(op)!T(=)\  !NT(expresión)
  !NT(op) ::= !T(+) | !T(-) | !T( * ) | !T(/) | !T(%) | !T(//) | !T( ** ) | !T(&) | !T(|) | !T(^) | !T(>>) | !T(<<)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

-----------------------------------------------------------
Operador         Ejemplo             Equivalente a
---------------- ------------------- ----------------------
!PYTHON(=)       !PYTHON(x = 5)      !PYTHON(x = 5)
                       
!PYTHON(+=)      !PYTHON(x += 5)     !PYTHON(x = x + 5)
                       
!PYTHON(-=)      !PYTHON(x -= 5)     !PYTHON(x = x - 5)
                       
!PYTHON(*=)      !PYTHON(x *= 5)     !PYTHON(x = x * 5)
                       
!PYTHON(/=)      !PYTHON(x /= 5)     !PYTHON(x = x / 5)
                       
!PYTHON(%=)      !PYTHON(x %= 5)     !PYTHON(x = x % 5)
                       
!PYTHON(//=)     !PYTHON(x //= 5)    !PYTHON(x = x // 5)
                       
!PYTHON(**=)     !PYTHON(x **= 5)    !PYTHON(x = x ** 5)
                       
!PYTHON(&=)      !PYTHON(x &= 5)     !PYTHON(x = x & 5)
                       
!PYTHON(|=)      !PYTHON(x |= 5)     !PYTHON(x = x | 5)
                       
!PYTHON(^=)      !PYTHON(x ^= 5)     !PYTHON(x = x ^ 5)
                       
!PYTHON(>>=)     !PYTHON(x >>= 5)    !PYTHON(x = x >> 5)
                       
!PYTHON(<<=)     !PYTHON(x <<= 5)    !PYTHON(x = x << 5)
-----------------------------------------------------------

<!-- -->

## Asignación múltiple

- Con la **asignación múltiple** podemos asignar valores a varias variables
  **al mismo tiempo** en una sola sentencia.

- La sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_múltiple) ::= !NT(lista_identificadores) !T(=) !NT(lista_expresiones)
  !NT(lista_identificadores) ::= !T{identificador} (!T(,) !T{identificador})\*
  !NT(lista_expresiones) ::= !NT{expresión}(!T(,) !NT{expresión})\*
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  con la condición de que tiene que haber tantos identificadores como
  expresiones.

- Por ejemplo:

  ```python
  x, y = 10, 20
  ```

  asigna el valor !PYTHON(10) a !PYTHON(x) y el valor !PYTHON(20) a !PYTHON(y).

---

- Lo interesante de la asignación múltiple es que **todas las asignaciones se
  llevan a cabo _a la vez, en paralelo_**, no una tras otra.

- Por ejemplo, si quisiéramos intercambiar los valores de `x` e `y` sin
  asignación múltiple, tendríamos que usar una variable auxiliar que almacenara
  el valor de una de las variables para no perderlo:

  ```python
  aux = x
  x = y
  y = aux
  ```

- En cambio, si usamos la asignación múltiple, se puede hacer simplemente:

  ```python
  x, y = y, x
  ```

- Lo que ocurre es que la `x` toma el valor que tenía `y` **justo antes de
  ejecutar la sentencia**, y la `y` toma el valor que tenía `x` **justo antes
  de ejecutar la sentencia**.

- Por tanto, las asignaciones que se realizan en una asignación múltiple **no
  se afectan entre ellas**.

---

- A la asignación múltiple también se la denomina **desempaquetado de tuplas**,
  ya que, técnicamente, es una asignación entre dos tuplas, como si se hubiera
  escrito así:

  ```python
  (x, y) = (10, 20)
  ```

- Esto es así porque, en realidad, los paréntesis que rodean a una tupla casi
  nunca son estrictamente necesarios (salvo para la tupla vacía y para evitar
  ambigüedades) y, por tanto:

  ```python
  2, 3
  ```

  es lo mismo que

  ```python
  (2, 3)
  ```

- En consecuencia, lo que ocurre es que _se desempaquetan_ las dos tuplas y se
  asigna cada elemento de la tupla derecha a la variable correspondiente de la
  tupla izquierda.

## Constantes

- En programación funcional no existen las variables y un identificador sólo
  puede ligarse a un valor (un identificador ligado no puede re-ligarse a otro
  valor distinto).

  - En la práctica, eso significa que un identificador ligado actúa como un
    valor constante que no puede cambiar durante la ejecución del programa.

  - El valor de esa constante es el valor al que está ligado el identificador.

- Pero en programación imperativa, los identificadores se ligan a variables,
  que son las que realmente apuntan a los valores.

- Una **constante** en programación imperativa sería el equivalente a una
  variable cuyo valor no puede cambiar durante la ejecución del programa.

---

- Muchos lenguajes de programación permiten definir constantes, pero **Python
  no es uno de ellos**.

- En Python, una constante **es una variable más**, pero **es responsabilidad
  del programador** no cambiar su valor durante todo el programa.

- Python no hace ninguna comprobación ni muestra mensajes de error si se cambia
  el valor de una constante.

- En Python, por **convenio**, los identificadores ligados a una variable con
  valor constante se escriben con todas las letras en **mayúscula**:

  ```python
  PI = 3.1415926
  ```

  El nombre en mayúsculas nos recuerda que !PYTHON(PI) es una constante, aunque
  nada nos impide cambiar su valor (cosa que debemos evitar):

  ```python
  PI = 99
  ```

- Sólo es un convenio entre programadores, que no tiene por qué cumplirse
  siempre.

# Saltos

## Incondicionales

- Un **salto incondicional** es una sentencia que provoca una ruptura abrupta
  del flujo de control del programa hacia otro punto del mismo.

- Se le llama _salto_ porque el programa «salta» a otra línea del código,
  normalmente marcada mediante un _número de línea_ o una _etiqueta_.

- Se llama *incondicional* porque no depende de ninguna condición, es decir, se
  lleva a cabo **siempre** que se alcanza la sentencia de salto.

- Históricamente, a esta instrucción se la ha llamado **instrucción _GOTO_**.

- El uso de instrucciones _GOTO_ es considerado, en general, una mala práctica
  de programación ya que favorece la creación del llamado **código
  _espagueti_**: programas con una lógica tan complicada de seguir que resultan
  casi imposibles de leer y de mantener.

- En cambio, usadas controladamente y de manera local, puede ayudar a escribir
  soluciones sencillas y claras.

---

:::: columns

::: {.column width=47%}

- Algoritmo imperativo que usa saltos incondicionales con etiquetas:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  $i \longleftarrow 0$
  **saltar** a la etiqueta _fin_
  $i \longleftarrow i + 1$
  **etiqueta** _fin_
  $i \longleftarrow i + 2$
  **fin**
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El mismo algoritmo con números de línea:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1. **inicio**
  2. $i \longleftarrow 0$
  3. **saltar** a la línea 5
  4. $i \longleftarrow i + 1$
  5. $i \longleftarrow i + 2$
  6. **fin**
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=6%}

:::

::: {.column width=47%}

- Representado como diagrama de flujo:

!IMGP(salto-incondicional.!EXT)()(width=60%)(width=30%)

¿Cuánto vale $i$ al final del programa?

:::

::::

---

- Python no incluye la instrucción *GOTO* pero se puede simular usando el
  módulo experimental `with_goto` del paquete llamado `python-goto`:

  ```console
  $ sudo apt install python3-pip
  $ pip install git+https://github.com/tushar-deepsource/python-goto.git
  ```

:::: columns

::: {.column width=39%}

- Sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(goto) ::= !T(goto) !NT(etiqueta)
  !NT(label) ::= !T(label) !NT(etiqueta)
  !NT(etiqueta) ::= !T(.)!NT(identificador)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=61%}

- Un ejemplo de uso:

  ```python
  from goto import with_goto

  CODIGO = """
  i = 0
  goto .fin
  i = 1
  label .fin
  i = 2
  """

  exec(with_goto(compile(CODIGO, '', 'exec')))
  ```

:::

::::

- Si _Pylint_ o _Pylance_ se quejan de la última línea, escribirla así:

  ```python
  exec(with_goto(compile(CODIGO, '', 'exec'))) # type: ignore pylint: disable=exec-used
  ```

## Condicionales

- Un **salto condicional** es un salto que se lleva a cabo sólo si se cumple
  una determinada condición.

- En el caso de que la condición no se cumpla, no se produce el salto y, por
  tanto, el flujo de control del programa continúa en la siguiente sentencia
  que aparece en el código fuente.

- En pseudocódigo se puede escribir de la siguiente forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **si** !NT(condición) **saltar a** (!NT(etiqueta)|!NT(número_línea))
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En Python, usando el módulo `with_goto`, podríamos implementarlo de la
  siguiente forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(salto_condicional) ::= !T(if) !NT(condición)!T(:) !T(goto) !NT(etiqueta)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

- Ejemplo que combina saltos condicionales e incondicionales:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  $primero \longleftarrow 2$
  $ultimo \longleftarrow 25$
  $suma \longleftarrow 0$
  $i \longleftarrow primero$
  **etiqueta** _bucle_
  **si** $i = ultimo$ **saltar** a la etiqueta _salir_
  $suma \longleftarrow suma + i$
  $i \longleftarrow i + 1$
  **saltar** a la etiqueta _bucle_
  **etiqueta** _salir_
  **fin**
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  ¿Cuánto vale $suma$ al final?

:::

::: column

!IMGP(salto-condicional.!EXT)()(width=50%)(width=30%)

:::

::::

---

- Traducción a Python usando el módulo `with_goto`:

  ```python
  from goto import with_goto

  CODIGO = """
  primero = 2
  ultimo = 25

  suma = 0
  i = primero

  label .inicio
  if i == ultimo: goto .fin

  suma += i
  i += 1
  goto .inicio

  label .fin
  """

  exec(with_goto(compile(CODIGO, '', 'exec')))
  ```

---

- También existe el paquete experimental `goto-plus`, que funciona de forma
  similar pero usando números de línea en lugar de etiquetas.

- Para su instalación, puede usarse cualquiera de estas dos vías:

  1. Ejecutar el siguiente comando:

     ```console
     $ pip install goto-plus
     ```

     o bien...

  2. Descargar el archivo `goto.py` desde GitHub usando cualquiera de las
     siguientes URL y guardarlo en el directorio de trabajo con el nombre
     `goto_plus.py`:

     - [`abhinav-gg/SyllyPipPackages`](https://raw.githubusercontent.com/abhinav-gg/SillyPipPackages/refs/heads/main/GoTo-Python/goto_plus/goto.py)
     - [`ricpelo/SillyPipPackages`](https://raw.githubusercontent.com/ricpelo/SillyPipPackages/refs/heads/main/GoTo-Python/goto_plus/goto.py)

---

- Ejemplo:

  ```{.python .number-lines}
  from goto_plus import goto, gotoconfig
  gotoconfig(__file__)

  suma = 0
  j = 0
  j += 1
  suma += j
  if j < 10: goto(6)
  ```

  ¿Cuánto vale `suma` al final?

!BIBLIOGRAFIA
