---
title: Programación imperativa
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

# Mutabilidad

## Estado de un dato

- Ya hemos visto que en programación imperativa es posible cambiar el estado de
  una variable asignándole un nuevo valor (un nuevo dato).

- Al hacerlo, no estamos cambiando el valor en sí, sino que estamos
  sustituyendo el valor de la variable por otro nuevo, mediante el uso de la
  asignación destructiva.

- Sin embargo, también existen valores que poseen su propio **estado interno**
  y es posible cambiar dicho estado, no asignando un nuevo valor a la variable
  que lo contiene, sino **modificando el interior de dicho valor**.

- Es decir: no estaríamos **cambiando** el estado de la variable (haciendo que
  ahora contenga un nuevo valor) sino **el estado interno** del propio valor
  al que hace referencia la variable.

- Los valores que permiten cambiar su estado interno se denominan **mutables**.

## Tipos mutables e inmutables

- En Python existen tipos cuyos valores son *inmutables* y otros que son
  *mutables*.

- Un valor **inmutable** es aquel cuyo **estado interno NO puede cambiar**
  durante la ejecución del programa.

- Los tipos inmutables en Python son los números (!PYTHON(int) y
  !PYTHON(float)), los booleanos (!PYTHON(bool)), las cadenas (!PYTHON(str)),
  las tuplas (!PYTHON(tuple)), los rangos (!PYTHON(range)) y los conjuntos
  congelados (!PYTHON(frozenset)).

- Un valor **mutable** es aquel cuyo **estado interno puede cambiar** durante
  la ejecución del programa **sin cambiar su identidad**.

  Muchos valores mutables son **colecciones de elementos** (datos _compuestos_
  o **contenedores**) y cambiar su estado interno es cambiar su **contenido**,
  es decir, los elementos que contiene.

- Los principales tipos mutables predefinidos en Python son las listas
  (!PYTHON(list)), los conjuntos (!PYTHON(set)) y los diccionarios
  (!PYTHON(dict)).

### Valores inmutables

- Un valor de un tipo inmutable no puede cambiar su estado interno durante la
  ejecución del programa.

:::: columns

::: column

Si tenemos:

```python
x = 4
y = 5
```

!DOT(inmutable1.svg)()(width=35%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
4 [shape = circle, width = 0.3]
5 [shape = circle, width = 0.3]
x:f1 -> 4
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

y hacemos:

```python
x = 7
```

quedaría:

!DOT(inmutable2.svg)()(width=34%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
5 [shape = circle, width = 0.3]
4 [shape = circle, width = 0.3]
7 [shape = circle, width = 0.3]
x:f1 -> 7
x:f1 -> 4 [style = dashed, color = grey]
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

- Lo que hace la asignación !PYTHON(x = 7) no es cambiar el contenido del valor
  !PYTHON(4), sino hacer que la variable !PYTHON(x) contenga otro valor
  distinto (el valor !PYTHON(4) en sí mismo no se cambia internamente en ningún
  momento).

---

- Las **cadenas** también son _datos inmutables_ y, por tanto, con ellas ocurre
  exactamente igual.

- Si tenemos:

  ```python
  x = 'hola'
  ```

  !DOT(inmutable3.svg)()(width=20%)(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x:f1 -> hola
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  y luego hacemos:

  ```python
  x = 'hola manolo'
  ```

  **se crea una nueva cadena** y se la asignamos a la variable !PYTHON(x).
 
:::: columns

::: column

- Es decir: la cadena !PYTHON('hola') original **no se cambia** (no se le añade
  !PYTHON(' manolo') detrás), sino que la nueva **sustituye** a la anterior en
  la variable:

:::

::: column

!DOT(inmutable4.svg)()(width=65%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
holamanolo [shape = ellipse, width = 1.8, label = "'hola manolo'", fixedsize = true] 
x:f1 -> hola [style = dashed, color = grey]
x:f1 -> holamanolo
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las **tuplas** también son _datos inmutables_, por lo que, una vez creadas,
  no se puede cambiar su contenido.

- Por ejemplo, si tenemos una tupla !PYTHON((1, 2, 3)) y le concatenamos otra
  tupla !PYTHON((4, 5, 6)), el resultado es una nueva tupla creada a partir de
  las otras dos (que permanecen inalteradas):

:::: columns

::: column

```python
>>> x = (1, 2, 3)
>>> y = (4, 5, 6)
>>> z = x + y
>>> z
(1, 2, 3, 4, 5, 6)
>>> x
(1, 2, 3)
>>> y
(4, 5, 6)
```

:::

::: column

!DOT(inmutable5.svg)()(width=65%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
z [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>z|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
t1 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3}"]
t2 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>4|<f1>5|<f2>6}"]
t3 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3|<f3>4|<f4>5|<f5>6}"]
x:f1 -> t1
y:f1 -> t2
z:f1 -> t3
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

- Si ahora le asignamos otra tupla a !PYTHON(z), ésta pasa a apuntar a la nueva
  tupla, sin modificar a la anterior:

:::: columns

::: column

```python
z = (7, 8, 9)
```

:::

::: column

!DOT(inmutable6.svg)()(width=65%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
z [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>z|<f1>⬤}"]
t3 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>1|<f1>2|<f2>3|<f3>4|<f4>5|<f5>6}"]
t4 [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>7|<f1>8|<f2>9}"]
z:f1 -> t3:w [style = dashed, color = grey]
z:f1 -> t4
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

#### Secuencias

- Las **cadenas**, las **tuplas** y los **rangos** son _datos inmutables_, así
  que no podemos modificarlos.

- Pero también son **datos compuestos** de otros datos (sus _elementos_ o
  _componentes_) a los que podemos acceder individualmente y con los que
  podemos operar, aunque no podamos cambiarlos, ya que están contenidos en
  datos compuestos inmutables.

- De hecho, las cadenas, las tuplas y los rangos pertenecen a la familia de las
  **secuencias**, que son colecciones de elementos ordenados según la posición
  que ocupan dentro de la secuencia.

- Por tanto, con las cadenas, las tuplas y los rangos podemos usar las
  **operaciones comunes a cualquier secuencia** de elementos.

- La siguiente tabla recoge las operaciones comunes sobre secuencias,
  ordenadas por prioridad ascendente. $\underline{s}$ y $\underline{t}$ son
  secuencias del mismo tipo, $\underline{n}$, $\underline{i}$, $\underline{j}$
  y $\underline{k}$ son enteros y $\underline{x}$ es un dato cualquiera que
  cumple con las restricciones que impone $\underline{s}$.

---

--------------------------------------------------------------------------------------------------------------------------
Operación                                 Resultado
----------------------------------------- --------------------------------------------------------------------------------
$x\ $ !PYTHON(in) $\ s$                   !PYTHON(True) si algún elemento de $\underline{s}$ es igual a $\underline{x}$

$x\ $ !PYTHON(not)\  !PYTHON(in) $\ s$    !PYTHON(False) si algún elemento de $\underline{s}$ es igual a $\underline{x}$

$s$ `+` $t$                               La concatenación de $\underline{s}$ y $\underline{t}$ (no va con rangos)
                                        
$s$ `*` $n$ \                             Equivale a concatenar $\underline{s}$ consigo misma $\underline{n}$ veces
$n$ `*` $s$                               (no va con rangos)

$s$`[`$i$`]`                              El $\underline{i}$-ésimo elemento de $\underline{s}$, empezando por 0

$s$`[`$i$`:`$j$`]`                        Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$

$s$`[`$i$`:`$j$`:`$k$`]`                  Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$ con paso $\underline{k}$

!PYTHON(len)`(`$s$`)`                     Longitud de $\underline{s}$

!PYTHON(min)`(`$s$`)`                     El elemento más pequeño de $\underline{s}$

!PYTHON(max)`(`$s$`)`                     El elemento más grande de $\underline{s}$

$s$!PYTHON(.index)`(`$x$                  El índice de la primera aparición de $\underline{x}$ en $\underline{s}$
[`, ` $i$ [`, ` $j$ ] ]`)`                (desde el índice $\underline{i}$ inclusive y antes del $\underline{j}$)

$s$!PYTHON(.count)`(`$x$`)`               Número total de apariciones de $\underline{x}$ en $\underline{s}$
--------------------------------------------------------------------------------------------------------------------------

---

- El *operador* de **indexación** consiste en acceder al elemento situado en la
  posición indicada entre corchetes:

:::: columns

::: column

```python
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
    0   1   2   3   4   5
   -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[2]
't'
>>> s[-2]
'o'
```

:::

::::

- Los índices positivos (del !PYTHON(0) en adelante) empiezan a contar desde el
  comienzo de la secuencia (o sea, desde el primer elemento, el que está
  situado más a la izquierda).

- Los índices negativos (del !PYTHON(-1) hacia atrás) empieza a contar desde el
  final de la secuencia (o sea, desde el último elemento, el que está situado
  más a la derecha).

---

- El **_slicing_** (*hacer rodajas*) es una operación que consiste en obtener
  una **subsecuencia** a partir de una secuencia, indicando los _índices_ de
  los elementos _inicial_ y _final_ de la misma, así como un posible _paso_:

:::: columns

::: column

```python
     con paso positivo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
  0   1   2   3   4   5   6
 -6  -5  -4  -3  -2  -1

     con paso negativo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
      0   1   2   3   4   5
 -7  -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[0:2]
'Py'
>>> s[-5:-4]
'y'
>>> s[-4:-5]
''
>>> s[0:4:2]
'Pt'
>>> s[-3:-6]
''
>>> s[-3:-6:-1]
'hty'
```

:::

::::

- Es más fácil trabajar con las rodajas si suponemos que los índices se
  encuentran _entre_ los elementos.

- El elemento _final_ nunca se alcanza.

- Si el _paso_ es negativo, la rodaja se hará al revés (de derecha a
  izquierda).

---

- En la rodaja `s[`$i$`:`$j$`:`$k$`]`, los tres valores $i$, $j$ y $k$ son
  opcionales, así que se pueden omitir.

- Si se omite $k$, se entiende que es !PYTHON(1).

- Si se omite $i$, se entiende que queremos la rodaja desde el elemento más la
  izquierda de la secuencia (si $k$ es positivo) o más a la derecha (si $k$ es
  negativo).

- Si se omite $j$, se entiende que queremos la rodaja hasta el elemento más a
  la derecha de la secuencia (si $k$ es positivo) o más a la izquierda (si $k$
  es negativo).

- Si el índice $i$ está más a la izquierda que el índice $j$, $k$ debería ser
  positivo (de lo contrario, devolvería la secuencia vacía).

- Si el índice $i$ está más a la derecha que el índice $j$, $k$ debería ser
  negativo (de lo contrario, devolvería la secuencia vacía).

- Si $i = j$, devuelve la secuencia vacía.

---

- Casos particulares notables:

  - !PYTHON(s[:)$n$`]` es la rodaja desde el primer elemento de !PYTHON(s)
    hasta la posición $\underline{n}$.
  
  - !PYTHON(s[)$n$`:]` es la rodaja desde la posición $\underline{n}$ hasta el
    final de !PYTHON(s).

    Siempre se cumple que !PYTHON(s) `==` !PYTHON(s[:)$n$`]` `+`
    !PYTHON(s[)$n$`:]`.

  - !PYTHON(s[)$n$!PYTHON(::-1]) es la rodaja invertida desde la posición
    $\underline{n}$ hasta el primer elemento de !PYTHON(s), con los elementos
    al revés.

  - !PYTHON(s[:]) devuelve una _copia_ de !PYTHON(s).

  - !PYTHON(s[::-1]) devuelve una copia invertida de !PYTHON(s).

!EJERCICIO

@. Dada la siguiente tupla:

    ```python
    a = (0, 11, 22, 33, 44, 55, 66, 77, 88, 99)
    ```

    ¿Qué valor devuelven las siguientes expresiones?

    a. !PYTHON(a[0:7:1])
    b. !PYTHON(a[0:7:2])
    c. !PYTHON(a[0:7])
    d. !PYTHON(a[2:7:1])
    e. !PYTHON(a[7:2:1])
    f. !PYTHON(a[7:2:-1])
    g. !PYTHON(a[:7:1])
    h. !PYTHON(a[5::1])
    i. !PYTHON(a[:-5:-1])
    j. !PYTHON(a[-5::-1])
    k. !PYTHON(a[5:-1:1])
    l. !PYTHON(a[-1:5:-1])

### Valores mutables: listas

- Los valores de tipos **mutables**, en cambio, pueden cambiar su estado
  interno durante la ejecución del programa sin cambiar su identidad.

- El tipo mutable más frecuente es la **lista** (!PYTHON(list)).

- Una lista es como una tupla pero que puede cambiar sus elementos, aumentar o
  disminuir de tamaño.

- Eso significa que **una lista puede cambiar su _contenido_ y, por tanto, su
  _estado interno_**.

- Los literales de tipo !PYTHON(list) se crean separando sus elementos con
  comas y encerrándolos entre corchetes `[` y `]`:

  ```python
  >>> l = [124, 333, 'a', 3.2, 9, 53]
  >>> l
  [124, 333, 'a', 3.2, 9, 53]
  ```

---

- También se pueden crear listas a partir de otros datos estructurados
  (cadenas, tuplas, rangos, etcétera) usando la función !PYTHON(list):

  ```python
  >>> list((1, 2, 3))
  [1, 2, 3]
  >>> list('hola')
  ['h', 'o', 'l', 'a']
  >>> list(range(0, 6))
  [0, 1, 2, 3, 4, 5]
  ```

- No se puede crear una lista con !PYTHON(list) a partir de un dato no
  estructurado:

  ```python
  >>> list(1)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: 'int' object is not iterable
  ```

- Para ello, lo mejor sería encerrar directamente el valor entre corchetes:

  ```python
  >>> [1]
  [1]
  ```

---

- Las listas son secuencias mutables y, como tales, se pueden modificar usando
  ciertas operaciones:

  - Los *operadores* de **indexación** y **_slicing_** combinados con
    !PYTHON(=) y !PYTHON(del):

    ```
      +-----+-----+-----+-----+-----+-----+
    l | 124 | 333 | 'a' | 3.2 |  9  |  53 |
      +-----+-----+-----+-----+-----+-----+
      0     1     2     3     4     5     6
     -6    -5    -4    -3    -2    -1
    ```

    ```python
    >>> l = [124, 333, 'a', 3.2, 9, 53]
    >>> l[3]
    3.2
    >>> l[3] = 99
    >>> l
    [124, 333, 'a', 99, 9, 53]
    >>> l[0:2] = [40]
    >>> l
    [40, 'a', 99, 9, 53]
    >>> del l[3]
    >>> l
    [40, 'a', 99, 53]
    ```

  - *Métodos* como !PYTHON(append), !PYTHON(clear), !PYTHON(insert),
    !PYTHON(remove), !PYTHON(reverse) o !PYTHON(sort).

---

- Al cambiar el estado interno de una lista no se crea una nueva lista, sino
  que **se modifica la ya existente**:

  ```python
  >>> x = [24, 32, 15, 81]
  >>> x[1] = 99
  >>> x
  [24, 99, 15, 81]
```

:::: columns

::: column

!DOT(cambio-estado-lista-antes.svg)(La lista antes de cambiar `x[`1`]`)(width=75%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
99 [style= invis, width = 0.6]
24 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6]
15 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
lista:f0 -> 24
lista:f1 -> 99 [style = invis]
lista:f1 -> 32
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(cambio-estado-lista-despues.svg)(La lista después de cambiar `x[`1`]`)(width=75%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
99 [shape = circle, width = 0.6]
24 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6, style = dashed, color = grey, fontcolor = grey]
15 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
lista:f0 -> 24
lista:f1 -> 99
lista:f1 -> 32 [style = dashed, color = grey]
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las siguientes tablas muestran todas las **operaciones** que nos permiten
  **modificar listas**.

- En ellas, $\underline{s}$ y $\underline{t}$ son listas, y $\underline{x}$ es
  un valor cualquiera.

-------------------------------------------------------------------------------------------
Operación                     Resultado
----------------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$          El elemento $i$-ésimo de $\underline{s}$ se sustituye
                              por $\underline{x}$

$s$`[`$i$`:`$j$`]`            La rodaja de $\underline{s}$ desde $\underline{i}$ hasta
`=` $t$                       $\underline{j}$ se sustituye por $\underline{t}$

$s$`[`$i$`:`$j$`:             Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$               por $\underline{t}$

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`]` \
`$j$`]`                       Equivale a hacer $s$`[`$i$`:`$j$`]` `=` `[]`

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`:`$k$`]`
`$j$`:`$k$`]`
-------------------------------------------------------------------------------------------

---

-----------------------------------------------------------------------------------------------------------------------------------
Operación                         Resultado
--------------------------------- -------------------------------------------------------------------------------------------------
$s$!PYTHON(.append)`(`$x$`)`      Añade $\underline{x}$ al final de $\underline{s}$; es igual que \
                                  $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` `[`$x$`]`

$s$!PYTHON(.clear())              Elimina todos los elementos de $\underline{s}$; es igual que \
                                  !PYTHON(del) $\ s$!PYTHON([:])

$s$!PYTHON(.copy())               Crea una copia *superficial* de $\underline{s}$; es igual que $s$!PYTHON([:])

$s$!PYTHON(.extend)`(`$t$`)` \    Extiende $\underline{s}$ con el contenido de $\underline{t}$; es igual que \
$s$ `+=` $t$                      $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` $t$ 

$s$ `*=` $n$                      Modifica $\underline{s}$ repitiendo su contenido $\underline{n}$ veces

$s$!PYTHON(.insert)`(`$i$`, `     Inserta $\underline{x}$ en $\underline{s}$ en el índice $\underline{i}$; es igual que
$x$`)`                            $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$!PYTHON(.pop)`(`[ $i$ ]`)`     Extrae el elemento $\underline{i}$ de $\underline{s}$ y lo devuelve\
                                  (por defecto, $i$ vale !PYTHON(-1))

$s$!PYTHON(.remove)`(`$x$`)`      Quita el primer elemento de $\underline{s}$ que sea igual a $\underline{x}$

$s$!PYTHON(.reverse())            Invierte los elementos de $\underline{s}$

$s$!PYTHON(.sort())               Ordena los elementos de $\underline{s}$
-----------------------------------------------------------------------------------------------------------------------------------

---

Partiendo de !PYTHON(x = [8, 10, 7, 9]):

--------------------------------------------------------
Ejemplo                    Valor de !PYTHON(x) después
-------------------------- -----------------------------
!PYTHON(x.append(14))      !PYTHON([8, 10, 7, 9, 14])

!PYTHON(x.clear())         !PYTHON([])

!PYTHON(x += [4, 5])       !PYTHON([8, 10, 7, 9, 4, 5])

!PYTHON(x *= 2)            !PYTHON([8, 10, 7, 9, 8, 10, 7, 9]) <!-- *= -->

!PYTHON(x.insert(3, 66))   !PYTHON([8, 10, 7, 66, 9])

!PYTHON(x.pop())           !PYTHON([8, 10, 7])

!PYTHON(x.remove(7))       !PYTHON([8, 10, 9])

!PYTHON(x.reverse())       !PYTHON([9, 7, 10, 8])

!PYTHON(x.sort())          !PYTHON([7, 8, 9, 10])
--------------------------------------------------------

<!-- \* -->

---

- Es importante tener en cuenta que, si $\underline{s}$ es una lista (o
  cualquier otro objeto mutable) no es lo mismo hacer:

  ```python
  s += t
  ```

  que hacer:

  ```python
  s = s + t
  ```

- En el primer caso, estamos _extendiendo_ la lista $\underline{s}$ y, por
  tanto, la estamos _mutando_. Es decir, estamos cambiando internamente la
  lista sin cambiar su identidad ni crear una lista nueva.

- En el segundo caso, no estamos mutando la lista $\underline{s}$, sino que
  estamos creando una lista nueva a partir de la concatenación de las dos
  listas originales, y luego hacemos que $\underline{s}$ apunte a la nueva
  lista, perdiéndose la referencia a la lista $\underline{s}$ original. Por
  tanto, la identidad del objeto almacenado en $\underline{s}$ sí ha cambiado.

- Lo mismo se puede decir de `s *= n` con respecto a `s = s * n`.

## Alias de variables y valores mutables

- Ya vimos que cuando una variable que tiene un valor se asigna a otra, ambas
  variables pasan a **_compartir_ el mismo valor**, produciéndose el fenómeno
  conocido como **alias de variables**:

  ```python
  x = [66, 77, 88, 99]
  y = x  # x se asigna a y; ahora y tiene el mismo valor que x
  ```

- Esto se debe a que las variables almacenan **referencias** a los valores, no
  los valores en sí mismos (éstos se almacenan en el montículo).

:::: columns

::: column

!DOT(alias1.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
40 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
lista:f0 -> 66
lista:f1 -> 77
lista:f2 -> 88 [style = dashed, color = grey]
lista:f2 -> 40
lista:f3 -> 99
x:f1 -> lista
y:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Si el valor es **mutable** y cambiamos su **contenido** desde !PYTHON(x),
  también cambiará !PYTHON(y) (y viceversa), pues ambas variables **apuntan al
  mismo dato**:

  ```python
  >>> y[2] = 40
  >>> x
  [66, 77, 40, 99]
  ```

:::

::::

---

- No es lo mismo cambiar el **valor** que cambiar el **contenido** del valor.

- Cambiar el **contenido** es algo que sólo se puede hacer si el valor es
  **mutable** (por ejemplo, cambiando un elemento de una lista):

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y[2] = 40
```

:::

::: {.column width=60%}

!IMGP(alias1.svg)()(width=60%)(width=40%)

:::

::::

---

- Cambiar el **valor** es algo que **siempre** se puede hacer (da igual la
  mutabilidad) simplemente **asignando** a la variable **un nuevo valor**:

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y = [1, 2, 3]
```

:::

::: {.column width=60%}

!DOT(alias2.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista1 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
lista2 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
1 [shape = circle, width = 0.6]
2 [shape = circle, width = 0.6]
3 [shape = circle, width = 0.6]
lista1:f0 -> 66
lista1:f1 -> 77
lista1:f2 -> 88
lista1:f3 -> 99
lista2:f0 -> 1
lista2:f1 -> 2
lista2:f2 -> 3
x:f1 -> lista1
y:f1 -> lista1 [style = dashed, color = grey]
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Cuando los valores son inmutables, no importa si se comparten o no, ya que no
  se pueden modificar.

- De hecho, el intérprete a veces crea valores inmutables nuevos y otras veces
  comparte los valores inmutables ya existentes.

- Por ejemplo, el intérprete de Python crea internamente todos los números
  enteros comprendidos entre $-5$ y $256$, por lo que todas las variables de
  nuestro programa que contengan el mismo número dentro de ese intervalo
  compartirán el mismo valor (serán *alias*):

:::: columns

::: {.column width=50%}

```python
x = 5 # está entre -5 y 256
y = 5
```

!DOT(inmutable7.svg)(Se comparte el valor)(width=35%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
5 [shape = circle, width = 0.3, fixedsize = shape]
x:f1 -> 5
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=50%}

```python
x = 480 # no está entre -5 y 256
y = 480
```

!DOT(inmutable8.svg)(No se comparte el valor)(width=35%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
c1 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
c2 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
x:f1 -> c1
y:f1 -> c2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- También crea valores compartidos cuando contienen exactamente las mismas
  cadenas.

!SALTOLARGOBEAMER

:::::: columns

:::: column

Si tenemos:

```python
x = 'hola'
y = 'pepe'
```

!DOT(inmutable9.svg)()(width=45%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 'pepe'
```

quedaría:

!DOT(inmutable10.svg)()(width=45%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola [style = dashed, color = grey]
x:f1 -> pepe
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- El intérprete aprovecharía la cadena ya creada (buscándola primero en el
  montículo) y no crearía una nueva, para ahorrar memoria.

- Por tanto, ambas variables contendrían la misma referencia a la misma cadena
  (o dicho, como también suele decirse, las dos variables serían dos
  referencias a la misma cadena).

---

- También se comparten valores si se usa el mismo dato varias veces, aunque sea
  un dato mutable.

- De nuevo, esto se debe a que en todo caso estamos accediendo al dato mutable
  a través de la misma referencia.

- Por ejemplo, si hacemos:

  ```python
  >>> x = [1, 2, 3]
  >>> y = [x, x]
  >>> y
  [[1, 2, 3], [1, 2, 3]]
  ```

  se compartiría la lista `x`, por lo que nos quedaría:

!DOT(alias3.svg)()(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1
lista1:f1 -> 2
lista1:f2 -> 3
lista2:f0 -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

Y si ahora hacemos:

```python
>>> y[0][0] = 99
>>> x[1] = 77
>>> y
[[99, 77, 3], [99, 77, 3]]
```

:::

::: column

nos quedaría:

!DOT(alias4.svg)()(width=90%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
99 [shape = circle, width = 0.3, fixedsize = shape]
77 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1 [style = dashed, color = grey]
lista1:f1 -> 2 [style = dashed, color = grey]
lista1:f0 -> 99
lista1:f1 -> 77
lista1:f2 -> 3
lista2:f0 -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Identidad

- Se denomina **identidad del valor** a un número entero que va asociado
  siempre a ese valor, el cual es único y constante durante toda la existencia
  del valor.

- Ese número _identifica_ al valor de entre todos los valores almacenados en el
  montículo, y lo distingue de entre todos los demás valores, ya sean iguales o
  distintos a él.

- Dos valores distintos deben tener identidades distintas. 

- En cambio, dos valores iguales pueden o no tener la misma identidad.

- En caso de que dos valores tengan la misma identidad, querrá decir que esos
  dos valores son **idénticos**, es decir, que son realmente **el mismo
  valor** almacenado en una única zona del montículo y al que se está
  accediendo a través de la **misma referencia**.

  Dicho de otra forma: NO serían dos valores almacenados en dos zonas distintas
  del montículo y accesibles a través de dos referencias distintas.

---

- La identidad de un valor nunca cambia durante la ejecución del programa o
  durante la misma sesión con el intérprete interactivo, incluso aunque el
  dato sea mutable y cambie su contenido.

  En cambio, la identidad del valor sí que puede cambiar (y lo normal es que
  cambie) entre dos ejecuciones distintas del mismo programa, o entre dos
  sesiones distintas con el intérprete interactivo.

- En Python, la identidad de un valor se consulta usando la función
  !PYTHON(id):

  :::: columns

  ::: {.column width=45%}

  ```python
  >>> id('hola')
  140294723570672
  >>> id('adiós')
  140587522259616
  ```

  :::

  ::: {.column width=5%}

  :::

  ::: {.column width=45%}

  ```python
  >>> id(5)
  140666458866032
  >>> id(400)
  140635543277200
  ```

  :::

  ::::

---

- Si hacemos:

  ```python
  >>> id('prueba')
  139905258241392
  >>> id('prueba')
  139905255890928
  ```

  puede parecer que la identidad del valor !PYTHON('prueba') ha cambiado, ya
  que hemos consultado dos veces su identidad usando la función !PYTHON(id) y
  en cada caso nos ha devuelto resultados diferentes.

- Sin embargo, lo que ocurre es que esos dos !PYTHON('prueba') **no son _el
  mismo valor_**, sino dos _valores iguales_ que se han creado en momentos
  diferentes y que ocupan zonas diferentes en la memoria, por lo que tienen
  _identidades diferentes_ (aunque sus valores sean iguales).

- En cambio, si hacemos:

  ```python
  >>> x = 'prueba'
  >>> id(x)
  139754569626160
  >>> id(x)
  139754569626160
  ```

  se obtiene el mismo resultado, ya que sólo hay un único valor
  !PYTHON('prueba') en la memoria y, por tanto, la identidad es la misma en
  ambos casos.

---

- Los conceptos de _identidad_ y de _referencia_ están relacionados.

- Para comprobar si dos valores son **idénticos** (es decir, si son realmente
  **_el mismo valor_**) podríamos hacer una de estas dos comprobaciones:

  - Comprobar si tienen la misma identidad.

  - Comprobar si se usan las mismas referencias para acceder a ellos (es decir,
    si apuntan al mismo lugar en el montículo).

- Así que, para saber si dos datos son **idénticos** (es decir, si ambos
  contienen **el mismo valor**, no simplemente **dos valores _iguales_**),
  podríamos intentar comparar sus referencias y ver su coinciden.

- Pero el lenguaje Python no nos permite comparar directamente dos referencias,
  ya que, cuando hacemos:

  ```python
  x == y
  ```

  en realidad estamos preguntando si son iguales sus _valores_, no sus
  _referencias_.

---

- Por tanto, para saber si dos datos son idénticos, debemos usar otro
  mecanismo que no sea el de comparar referencias.

- Una forma de saber si dos valores son **el mismo valor** (es decir, si son
  **_idénticos_**), es usar la función !PYTHON(id).

- Sabemos que la función !PYTHON(id) aplicada a un valor devuelve la
  **identidad** del valor, que es un número único para cada valor.

- Por esa razón, si dos variables tienen el mismo !PYTHON(id), significa que
  ambas apuntan al mismo valor en la memoria y que, por tanto, son
  **referencias al mismo valor**.

- En general, si dos datos tienen el mismo !PYTHON(id), decimos que son
  **idénticos**, porque en realidad son _el mismo dato_.

:::: columns

::: column

```python
>>> id('hola') == id('hola')
True
>>> x = 'hola'
>>> y = 'hola'
>>> id(x) == id(y)
True
```

:::

::: column

```python
>>> x = [1, 2, 3, 4]
>>> y = [1, 2, 3, 4]
>>> id(x) == id(y)
False
>>> y = x
>>> id(x) == id(y)
True
```

:::

::::

### !PYTHON(is)

- Otra forma más directa de comprobar si dos datos son realmente el mismo dato
  en memoria (es decir, si son **idénticos**) es usar el operador !PYTHON(is),
  que comprueba si los dos datos tienen la misma **identidad**:

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is) ::= !NT(valor1) !T(is) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

- Es un operador relacional que devuelve !PYTHON(True) si !NT(valor1) y
  !NT(valor2) tienen la misma **identidad** (es decir, si son **el mismo dato
  en memoria** y, por tanto, son **idénticos**) y !PYTHON(False) en caso
  contrario.

- En la práctica, equivale a hacer
  !PYTHON(id)`(`!NT(valor1)`)` `==` !PYTHON(id)`(`!NT(valor2)`)`.

---

- Lo normal es usar el !PYTHON(is) con variables y, en tal caso, devuelve
  !PYTHON(True) si los datos que almacenan las variables son realmente el mismo
  dato.

- No es correcto usarlo con literales inmutables (y el intérprete lo avisa con
  un !PYTHON(SyntaxWarning)), ya que, en tal caso, devuelve siempre
  !PYTHON(True).

  En cambio, con literales mutables (como !PYTHON([])) devuelve siempre
  !PYTHON(False).

- También existe el operador !PYTHON(is not), que es el contrario al
  !PYTHON(is) y cuya sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is_not) ::= !NT(valor1) !T(is) !T(not) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

  El operador !PYTHON(is not) es un operador relacional que, aplicado a dos
  valores, devolverá !PYTHON(True) si los valores **no** son idénticos.

---

```python
>>> x = 500
>>> y = 500
>>> x is y
False
>>> x is not y
True
>>> y = x
>>> x is y
True
>>> 500 is 500
<stdin>:1: SyntaxWarning: "is" with a literal. Did you mean "=="?
True
>>> x = 'hola'
>>> y = 'hola'
>>> x is y
True
>>> x is not y
False
```

# Cambios de estado ocultos

## Funciones puras

- Las **funciones puras** son aquellas que cumplen que:

  - su valor de retorno depende únicamente del valor de sus argumentos, y

  - calculan su valor de retorno sin provocar cambios de estado observables en
    el exterior de la función.

- Una llamada a una función pura se puede sustituir libremente por su valor de
  retorno sin afectar al resto del programa (es lo que se conoce como
  **transparencia referencial**).

- Las funciones *puras* son las únicas que existen en programación funcional.

## Funciones impuras

- Por contraste, una función se considera **impura**:

  - si su valor de retorno depende de algo más que de sus argumentos, o

  - si provoca cambios de estado observables en el exterior de la función.

    En éste último caso decimos que la función provoca **efectos laterales**.

- Toda función que provoca efectos laterales es impura, pero no todas las
  funciones impuras provocan efectos laterales (puede ser impura porque su
  comportamiento se vea afectado por los efectos laterales provocados por otras
  partes del programa).

## Efectos laterales

- Un **efecto lateral** (_side effect_) es cualquier cambio de estado provocado
  por una parte del programa (por ejemplo, una función) que puede observarse
  desde otras partes del mismo, las cuales podrían verse afectadas por ese
  efecto de una manera poco evidente o impredecible.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Una función puede provocar efectos laterales, o bien verse afectada por
  efectos laterales provocados por otras partes del programa.

  En cualquiera de estos casos, tendríamos una función **impura**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los casos típicos de efectos laterales en una función son:

  - Cambiar el valor de una variable global.

  - Cambiar el estado de un argumento mutable.

  - Realizar una operación de entrada/salida.

---

- En un lenguaje imperativo **se pierde la transparencia referencial**, ya que
  ahora el valor de una función puede depender no sólo de los valores de sus
  argumentos, sino también además de los valores de las variables libres que
  ahora pueden cambiar durante la ejecución del programa:

  ```python
  >>> suma = lambda x, y: x + y + z
  >>> z = 2
  >>> suma(3, 4)
  9
  >>> z = 20
  >>> suma(3, 4)
  27
  ```

- Por tanto, cambiar el valor de una variable global (en cualquier parte del
  programa) es considerado un **efecto lateral**, ya que puede alterar el
  comportamiento de otras partes del programa de formas a menudo impredecibles
  o poco evidentes.

---

- Cuando el efecto lateral lo produce la propia función también estamos
  perdiendo transparencia referencial, pues en tal caso no podemos sustituir
  libremente la llamada a la función por su valor de retorno, ya que ahora **la
  función hace _algo más_ que calcular dicho valor**, y ese _algo_ es un efecto
  observable fuera de la función.

- Por ejemplo, una función que imprime por la pantalla o escribe en un archivo
  del disco está provocando un efecto observable fuera de la función, por lo
  que tampoco es una función pura y, por tanto, en ella no se cumple la
  transparencia referencial.

- Lo mismo pasa con las funciones que modifican algún argumento mutable. Por
  ejemplo:

  ```python
  >>> ultimo = lambda x: x.pop()
  >>> lista = [1, 2, 3, 4]
  >>> ultimo(lista)
  4
  >>> ultimo(lista)
  3
  >>> lista
  [1, 2]
  ```

---

- Los efectos laterales hacen que sea muy difícil razonar sobre el
  funcionamiento del programa, porque las funciones impuras no pueden verse
  como simples correspondencias entre los datos de entrada y el resultado de
  salida, sino que además hay que tener en cuenta los **efectos ocultos** que
  producen en otras partes del programa.

- Por ello, se debe **evitar**, siempre que sea posible, escribir funciones
  impuras.

- Ahora bien: muchas veces, la función que se desea escribir tiene efectos
  laterales porque esos son, precisamente, los efectos deseados.

  Por ejemplo, una función que actualice los salarios de los empleados en una
  base de datos, a partir del salario base y los complementos.

- En ese caso, es importante **documentar** adecuadamente la función para que,
  quien desee usarla, sepa perfectamente qué efectos produce más allá de
  devolver un resultado.

## Entrada y salida

- Nuestro programa puede comunicarse con el exterior realizando **operaciones
  de entrada/salida (E/S)**.

- Las operaciones de E/S se consideran **efectos laterales** porque:

  - pueden producir cambios en el exterior, o

  - pueden hacer que el resultado de una función dependa de los datos leídos
    del exterior y, por tanto, ya no sólo dependería de sus argumentos.

- Interpretamos la palabra _exterior_ en un sentido amplio; por ejemplo:

  - El teclado.

  - La pantalla.

  - Un archivo del disco duro.

  - Otro ordenador de la red.

---

- Una función (que es un _subprograma_) puede comunicarse con su exterior
  principalmente mediante el paso de argumentos y la devolución de su valor de
  retorno, aunque sabemos que también puede interactuar con el exterior
  mediante efectos laterales como el uso de variables globales, argumentos
  mutables, etcétera.

  El exterior de una función es el resto del programa del que forma parte.

- Análogamente, un programa puede comunicarse con su exterior mediante
  operaciones de lectura en la entrada y operaciones de escritura en la salida,
  que son efectos laterales.

  !DOT(exterior-programa.svg)(Comunicación con el exterior)(width=60%)(width=55%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ExteriorE [label = "Entrada del exterior\n(Consola, archivos,\nlínea de órdenes, GUI...)", shape = plaintext, fillcolor = transparent];
  ExteriorS [label = "Salida al exterior\n(Consola, archivos, GUI...)", shape = plaintext, fillcolor = transparent];
  Argumentos [shape = plaintext, fillcolor = transparent];
  Resultado [label = "Valor de retorno", shape = plaintext, fillcolor = transparent];

  Argumentos -> Función -> Resultado

  ExteriorE -> Programa -> ExteriorS
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Gracias a las operaciones de E/S, nuestro programa puede interactuar con el
  usuario, solicitarle datos y proporcionarle resultados.

---

- En Python (así como en otros lenguajes de programación), la E/S de
  información desde y hacia el exterior se realiza por medio de **flujos** (del
  inglés, _streams_), que son _secuencias_ de bytes o de caracteres:

  !DOT(flujos.svg)(Ejemplo de un programa que saluda)(width=80%)(width=80%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fontname = "monospace"]
  E [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{\\n|e|p|e|P}"]
  S [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{\\n|e|p|e|P| |a|l|o|H}"]
  E -> Programa -> S
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Esos flujos actúan como «colas» de elementos que:

  - En la entrada, están a la espera de ser consumidos por el programa.

  - En la salida, se van encolando a medida que el programa los va generando y
    volcando al exterior.

---

- Dependiendo de las características del flujo de entrada, hay dos
  posibilidades:

  a. El programa sólo podrá acceder al primer elemento de la cola.

  a. El programa podrá moverse libremente por el flujo este y acceder a
     cualquier elemento del mismo, sin importar la posición en la que esté el
     elemento dentro del flujo.

- Asimismo, dependiendo de las características del flujo de salida, también hay
  dos posibilidades:

  a. El programa sólo podrá escribir al final de la cola.

  a. El programa podrá escribir elementos libremente en cualquier posición
     dentro del flujo.

- Finalmente, algunos flujos pueden actuar como flujo de entrada y de salida al
  mismo tiempo y, en tal caso, el programa podría leer y escribir datos sobre
  el mismo flujo.

### Entrada y salida por consola

- Por _consola_ entendemos de forma genérica la pantalla y el teclado del
  ordenador.

- Por tanto, la E/S por consola se refiere a las operaciones de lectura de
  datos por el teclado y escritura a la pantalla.

- Mientras no se diga lo contrario, el S.O. conecta la consola a dos flujos
  llamados **_entrada estándar_** y **_salida estándar_**, de forma que el
  teclado está conectado a la entrada estándar y la pantalla a la salida
  estándar.

- Esos flujos se pueden _redireccionar_ a otros archivos o dispositivos
  usando las redirecciones de la _shell_: `<`, `>` o `|`:

  ```console
  $ python programa.py < entrada.txt
  $ python programa.py > salida.txt
  ```

---

- En Python, esos dos flujos se pueden manipular mediante los objetos
  !PYTHON(sys.stdin) y !PYTHON(sys.stdout), respectivamente.

- También existe el flujo !PYTHON(sys.stderr) que representa la **_salida
  estándar de errores_** del S. O.

- El intérprete ya abre automáticamente los flujos !PYTHON(sys.stdin),
  !PYTHON(sys.stdout) y !PYTHON(sys.stderr) nada más arrancar y los conecta a
  la entrada estándar, la salida estándar y la salida estándar de errores,
  respectivamente.

### !PYTHON(print)

- La función !PYTHON(print) imprime (*escribe*) por la salida (normalmente la
  pantalla) el valor de una o varias expresiones.

- Produce un efecto lateral porque cambia el exterior del programa, afectando
  al estado de un dispositivo de salida.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(print)`(`!NT{expresión}(`,` !NT{expresión})\* [`, sep=`!NT(expresión)][`, end=`!NT(expresión)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El `sep` es el *separador* y su valor por defecto es !PYTHON{' '} (un
  espacio).

- El `end` es el *terminador* y su valor por defecto es !PYTHON('\n') (el
  carácter de nueva línea).

- Las expresiones se convierten en cadenas antes de imprimirse.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23)
  hola pepe 23
  ```

#### Paso de argumentos por palabras clave

- Normalmente, los argumentos se pasan a los parámetros posicionalmente (lo que
  se denomina **paso de argumentos posicional**).

- Según este método, los argumentos se asignan a los parámetros
  correspondientes según la posición que ocupan en la llamada a la función (el
  primer argumento se asigna al primer parámetro, el segundo al segundo
  parámetro y así sucesivamente).

- En Python también existe el **paso de argumentos por palabra clave**, donde
  cada argumento se asigna a su parámetro indicando en la llamada el nombre del
  parámetro y el valor de su argumento correspondiente separados por un `=`,
  como si fuera una asignación.

- Esta técnica se usa en la función !PYTHON(print) para indicar el separador o
  el terminador de la lista de expresiones a imprimir.

---

- Si se combinan ambas técnicas en una misma llamada, los argumentos pasados
  por palabas clave se ponen al final.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23, sep='*')
  hola*pepe*23
  >>> print('hola', 'pepe', 23, end='-')
  hola pepe 23-
  ```

#### El valor !PYTHON(None)

- Es importante resaltar que la función !PYTHON(print) **no devuelve** el valor
  de las expresiones, sino que las **imprime** (provoca el efecto lateral de
  cambiar la pantalla haciendo que aparezcan nuevos caracteres).

- Por tanto, no es lo mismo hacer:

  ```python
  >>> 'Hola mundo'
  'Hola mundo'
  ```

  que hacer:

  ```python
  >>> print('Hola mundo')
  Hola mundo
  ```

- La función !PYTHON(print) como tal no devuelve ningún valor, pero como en
  Python todas las funciones deben devolver *algún* valor, en realidad lo que
  ocurre es que !PYTHON(print) **devuelve un valor !PYTHON(None)**.

- !PYTHON(None) es un valor especial que significa «**ningún valor**» y se
  utiliza principalmente para casos en los que no tiene sentido que una función
  devuelva un valor determinado, como es el caso de !PYTHON(print).

---

- Pertenece a un tipo de datos especial llamado !PYTHON(NoneType) cuyo único
  valor posible es !PYTHON(None), y para comprobar si un valor es !PYTHON(None)
  se usa !NT(valor)\  !PYTHON(is None).
 
  Sólo existe un único valor !PYTHON(None) en el montículo, que se crea justo
  al arrancar el intérprete.

- Podemos comprobar que, efectivamente, !PYTHON(print) devuelve !PYTHON(None):

  ```python
  >>> print('hola', 'pepe', 23) is None
  hola pepe 23  # ésto es lo que imprime print
  True          # ésto es el resultado de comprobar si el valor de print es None
  ```

- Otra forma, usando variables:

  ```python
  >>> x = print('hola', 'pepe', 23)
  hola pepe 23  # ésto es lo que imprime print
  >>> x is None
  True          # ésto es el resultado de comprobar si el valor de x es None
  ```

### !PYTHON(input)

- La función !PYTHON(input) *lee* datos introducidos desde la entrada
  (normalmente el teclado) y devuelve el valor del dato introducido, que
  siempre es una **cadena** a la cual se le ha eliminado el posible salto de
  línea final.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(input)`(`[_prompt_`:` !PYTHON(str)]`) -> `\  !PYTHON(str)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> nombre = input('Introduce tu nombre: ')
  Introduce tu nombre: Ramón
  >>> print('Hola,', nombre)
  Hola, Ramón
  ```

---

- En primer lugar, provoca el *efecto lateral* de alterar el estado del
  dispositivo de salida imprimiendo el *prompt*.

- Además, provoca el *efecto lateral* de alterar el estado del dispositivo de
  entrada, ya que se espera a que desde el exterior se introduzca el dato
  solicitado consumiendo los caracteres que haya en la entrada hasta el salto
  de línea.

- Eso hace que sea *impura* por partida triple: provoca dos efectos laterales y
  puede devolver un resultado distinto cada vez que se la llama.

## Ejecución de _scripts_!ifdef(HTML)(&nbsp;)() por lotes

- A partir de ahora, ya podemos escribir programas que se comuniquen
  directamente con el usuario mediante la entrada y salida por consola.

- Por tanto, ya no necesitamos ejecutar las sentencias dentro de una sesión en
  el intérprete interactivo y podemos pasarle nuestros programas a los usuarios
  para que lo ejecuten.

- En Python, los programas se almacenan en archivos llamados _scripts_.

- Los usuarios ejecutan los programas directamente desde el sistema operativo,
  llamando al intérprete por lotes y pasándole el nombre del _script_ que desea
  ejecutar.

- Por ejemplo, para ejecutar el _script_ `programa.py`, el usuario escribiría
  lo siguiente en un terminal del sistema operativo:

  ```console
  $ python programa.py
  ```

- Observar que no se usa ninguna opción en la orden; solamente el nombre del
  archivo.

---

- Nosotros, los programadores, durante el desarrollo del programa podemos
  ejecutarlo directamente dentro del entorno integrado de desarrollo (IDE).

- Por ejemplo, desde Visual Studio Code podemos ejecutar el _script_ actual sin
  salirnos del editor usando una de las siguientes opciones:

  - Pulsando en el icono del triángulo verde situado en la esquina superior
    derecha de la ventana del editor:

    !ifdef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(icono-ejecutar-vscode.png)()(width=8%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    !ifdef(BEAMER)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}\hspace{-3.2em}![](!IMAGES/icono-ejecutar-vscode.png){width=8%}\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    !ifdef(LATEX)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}\hspace{-2.2em}![](!IMAGES/icono-ejecutar-vscode.png){width=8%}\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  - Pulsando la tecla `F1` y escribiendo:

    `>Python: Run Python File in Terminal`

    en el panel de comandos que aparece.

- En cualquiera de los dos casos, Visual Studio Code abre un terminal integrado
  y ejecuta ahí dentro el comando `python programa.py` como si lo hubiéramos
  escrito nosotros desde el sistema operativo.

!EJERCICIO

@. Explicar las diferencias entre estas tres formas de ejecutar el intérprete.
   Indicar en qué casos es conveniente usar cada una:

    a. `$ python`{.console}

    b. `$ python script.py`{.console}

    c. `$ python -i script.py`{.console}

### Argumentos de la línea de órdenes

- El usuario del programa puede pasarle argumentos directamente desde la línea
  de órdenes del sistema operativo al arrancar el programa con el intérprete
  por lotes.

- Para acceder a esos argumentos desde el programa, puede usarse el atributo
  !PYTHON(argv) del módulo !PYTHON(sys).

- !PYTHON(sys.argv) es una lista que el intérprete rellena automáticamente con
  los argumentos usados por el usuario del _script_ al ejecutarlo desde la
  línea de órdenes.

- El primer elemento de la lista (es decir, !PYTHON(sys.argv[0])) siempre
  contiene el nombre del _script_.

- Los restantes elementos (!PYTHON(sys.argv[1]), !PYTHON(sys.argv[2]),
  etcétera) contendrán los argumentos pasados al _script_, en el orden en el
  que aparecen en la línea de órdenes.

---

- Por ejemplo, un programa puede saludar al usuario dirigiéndose a él por su
  nombre, el cual tendrá que pasarlo mediante la línea de órdenes de la
  siguiente forma:

  ```console
  $ python saluda.py Ricardo
  ```

- Al ejecutar el _script_ `saluda.py`, el nombre del _script_ aparecerá en
  !PYTHON(sys.argv[0]) y el primer argumento enviado al mismo (en este caso, el
  nombre del usuario `Ricardo`) aparecerá en !PYTHON(sys.argv[1]):

  ```python
  import sys
  print('¡Hola,', sys.argv[1])
  ```

- Si el usuario no le pasa ningún argumento en la línea de órdenes,
  !PYTHON(sys.argv[1]) no existirá y se producirá un error !PYTHON(IndexError)
  al intentar acceder a él:

  ```python
  $ python saluda.py
  Traceback (most recent call last):
    File "saluda.py", line 2, in <module>
      print('¡Hola,', sys.argv[1])
  IndexError: list index out of range
  ```

---

- El siguiente programa suma dos números indicados por el usuario mediante la
  línea de órdenes.

- En este caso, hay que tener en cuenta que los argumentos siempre se pasan
  como cadenas, así que habría que convertirlos previamente a números:

  ```python
  import sys
  x = float(sys.argv[1])
  y = float(sys.argv[2])
  print('La suma de', x, '+', y, 'es', x + y)
  ```

- Un ejemplo de ejecución de este programa sería:

  ```console
  $ python suma.py 4 3
  La suma de 4.0 + 3.0 es 7.0
  ```

## Entrada y salida por archivos

- Como ya sabemos, toda la comunicación con el exterior se lleva a cabo a
  través de **flujos**, que son secuencias de bytes o caracteres.

- Por tanto, cuando queramos leer y/o escribir datos en un archivo, lo haremos
  también a través de un flujo de bytes o de caracteres.

- Para ello, deberemos seguir los siguientes pasos, en este orden:

  #. Abrir el archivo en el modo adecuado con !PYTHON(open).

  #. Realizar las operaciones deseadas sobre el archivo.

  #. Cerrar el archivo con !PYTHON(close).

- Mientras el archivo está abierto, disponemos de un **puntero** que _apunta_ a
  la posición actual de lectura o escritura, es decir, a la posición donde se
  hará la siguiente operación de lectura o escritura con el archivo.

- Ese puntero indica la posición actual dentro del flujo de caracteres o bytes
  a través del cual accedemos al archivo.

### !PYTHON(open)

- La función !PYTHON(open) abre un archivo y devuelve un objeto que lo
  representa.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(open)`(`_nombre_`:` !PYTHON(str) [`, ` _modo_`:` !PYTHON(str)]`)` `->` _archivo_
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El _nombre_ es una cadena que contiene el nombre del archivo a abrir.

- El _modo_ es otra cadena que contiene caracteres que describen de qué forma
  se va a usar el archivo.

- El valor devuelto es un objeto que representa al archivo abierto y cuyo tipo
  depende del modo en el que se ha abierto el archivo.

- Hay dos modos principales de abrir un archivo: en **modo texto** (en el que
  se leen y escriben _cadenas_) y en **modo binario** (en el que se leen y
  escriben _bytes_) y luego existen modos secundarios en función de lo que se
  vaya a hacer con el archivo.

- Los valores posibles de _modo_ aparecen en las siguientes tablas.

##### Modo texto {.unnumbered .unlisted}

---------------------------------------------------------------------------------------------------------------------------------
  Modo    Significado                                                                        El puntero se coloca...            
--------  ---------------------------------------------------------------------------------- ------------------------------------
 `'r'`    Abre sólo para lectura de texto.                                                   Al principio.                      
                                                                                                                                
 `'r+'`   Abre para lectura/escritura de texto.                                              Al principio.                      
                                                                                                                                
 `'w'`    Abre sólo para escritura de texto. Vacía y sobreescribe el archivo si ya           Al principio.                      
          existe. Si no existe, lo crea y lo abre sólo para escritura.                                                          
                                                                                                                                
 `'w+'`   Abre para lectura/escritura de texto. Vacía y sobreescribe el archivo si ya        Al principio.                      
          existe. Si no existe, lo crea y lo abre para lectura/escritura.                                                       
                                                                                                                                
 `'a'`    Abre para añadir texto. Si el archivo no existe, lo crea y lo abre sólo            Al final si el archivo ya existe.  
          para escritura.                                                                                                       
                                                                                                                                
 `'a+'`   Abre para lectura/añadir en modo texto. Si el archivo no existe, lo crea y lo      Al final si el archivo ya existe.  
          abre para lectura/escritura.                                                                                          
---------------------------------------------------------------------------------------------------------------------------------

##### Modo binario {.unnumbered .unlisted}

---------------------------------------------------------------------------------------------------------------------------------
  Modo    Significado                                                                        El puntero se coloca...            
--------  ---------------------------------------------------------------------------------- ------------------------------------
 `'rb'`   Abre sólo para lectura en binario.                                                 Al principio.                      
                                                                                                                                
 `'rb+'`  Abre para lectura/escritura en binario.                                            Al principio.                      
                                                                                                                                
 `'wb'`   Abre sólo para escritura en binario. Vacía y sobreescribe el archivo si ya         Al principio.                      
          existe. Si no existe, lo crea y lo abre sólo para escritura.                                                          
                                                                                                                                
 `'wb+'`  Abre para lectura/escritura en binario. Vacía y sobreescribe el archivo si ya      Al principio.                      
          existe. Si no existe, lo crea y lo abre para lectura/escritura.                                                       
                                                                                                                                
 `'ab'`   Abre para añadir en binario. Si el archivo no existe, lo crea y lo abre sólo       Al final si el archivo ya existe.  
          para escritura.                                                                                                       
                                                                                                                                
 `'ab+'`  Abre para lectura/añadir en binario. Si el archivo no existe, lo crea y lo abre    Al final si el archivo ya existe.  
          para lectura/escritura.                                                                                               
---------------------------------------------------------------------------------------------------------------------------------

---

- Resumen básico:

  - Si no se pone `'b'` (modo binario), se entiende que es `'t'` (modo texto).

  - El modo predeterminado es `'r'` (abrir para lectura en modo texto, sinónimo
    de `'rt'`).

  - Los modos `'a'`, `'ab'`, `'a+'` y `'a+b'` abren el archivo si ya existía
    previamente, o lo crean nuevo si no existía.

  - Los modos `'w'`, `'wb'`, `'w+'` y `'w+b'` abren el archivo y lo vacía
    (borra su contenido) si ya existía previamente, o lo crean nuevo si no
    existía.

  - Los modos `'r+'` y `'r+b'` abren el archivo sin borrarlo.

  - El modo `'x'` abre el archivo en modo exclusivo, produciendo un error si el
    archivo ya existía.

---

- Normalmente, los archivos se abren en **modo texto**, lo que significa que se
  leen y se escriben cadenas (valores de tipo !PYTHON(str)) desde y hacia el
  archivo, las cuales se codifican según una codificación específica que
  depende de la plataforma.

  Por ejemplo, los saltos de línea se escriben como `\n` en Unix o `\r\n` en
  Windows, y se leen siempre como `\n`.

- Al añadir una `b` en el modo se abre el archivo en **modo binario**. En tal
  caso, los datos se leen y se escriben en forma de objetos de tipo
  !PYTHON(bytes).

  El modo binario es el que debe usarse cuando se trabaje con archivos que no
  contengan texto (datos binarios _crudos_).

- Ejemplo:

  ```python
  f = open('salida.txt', 'w')
  ```

---

- El tipo de dato que devuelve !PYTHON(open) depende de cómo se ha abierto el
  archivo:

  - Si se ha abierto en **modo texto**, devuelve un !PYTHON(io.TextIOWrapper).

  - Si se ha abierto en **modo binario**, entonces depende:

    - En modo **sólo lectura**, devuelve un !PYTHON(io.BufferedReader).

    - En modo **sólo escritura o añadiendo al final**, devuelve un
      !PYTHON(io.BufferedWriter).

    - En modo **lectura/escritura**, devuelve un !PYTHON(io.BufferedRandom).

- !PYTHON(io) es el módulo que contiene los elementos básicos para manipular
  flujos.

### !PYTHON(close)

- El método !PYTHON(close) cierra un archivo previamente abierto por
  !PYTHON(open), finalizando la sesión de trabajo con el mismo.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.close())
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Siempre hay que cerrar un archivo previamente abierto para:

  - asegurarse de que los cambios realizados se vuelcan al archivo a través del
    sistema operativo, y

  - liberar inmediatamente los recursos del sistema que pudiera estar
    consumiendo.

- Una vez que se ha cerrado el archivo ya no se podrá seguir usando:

  ```python
  >>> f.close()
  >>> f.read()
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ValueError: I/O operation on closed file.
  ```

---

- Podemos comprobar si un archivo ya se ha cerrado consultando su atributo
  !PYTHON(closed):

  ```python
  >>> f = open('archivo.txt', 'r')
  >>> f.closed
  False
  >>> f.close()
  >>> f.closed
  True
  ```

- Observa que **no es un método** (no lleva paréntesis), **sino un _atributo_**
  que contiene un valor lógico que el propio objeto modifica al cambiar su
  estado de abierto a cerrado o viceversa.

### !PYTHON(read)

- Para leer de un archivo, se puede usar el método !PYTHON(read) sobre el
  objeto que devuelve la función !PYTHON(open).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.read)`(`[_tamaño_`:` !PYTHON(int)]`) -> `\  !PYTHON(str) | !PYTHON(bytes)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El método devuelve una cadena (tipo !PYTHON(str)) si el archivo se abrió en
  modo texto, o un objeto de tipo !PYTHON(bytes) si se abrió en modo binario.

- El archivo contiene un **puntero interno** que indica hasta dónde se ha leído
  en el mismo.

- Cada vez que se llama al método !PYTHON(read), se mueve ese puntero para que
  en posteriores llamadas se continúe leyendo desde ese punto.

- Si se alcanza el final del archivo, se devuelve la cadena vacía
  (!PYTHON('')).

---

- El parámetro _tamaño_ es opcional:

  - Si se omite o es negativo, se devuelve todo lo que hay desde la posición
    actual del puntero hasta el final del archivo.

  - En caso contrario, se leerán y devolverán _como mucho_ tantos caracteres
    (en modo texto) o bytes (en modo binario) como se haya indicado.

---

- Ejemplos de lectura de todo el archivo:

  ```python
  >>> f = open('entrada.txt', 'r')
  >>> f.read()
  'Este es el contenido del archivo.\n'
  >>> f.read()
  ''
  ```

- Ejemplos de lectura del archivo en varios trozos:

  ```python
  >>> f = open('entrada.txt', 'r')
  >>> f.read(4)
  'Este'
  >>> f.read(4)
  ' es '
  >>> f.read(4)
  'el c'
  >>> f.read()
  'ontenido del archivo\n'
  >>> f.read()
  ''
  ```

### !PYTHON(readline)

- El método !PYTHON(readline) también sirve para leer de un archivo y también
  se ejecuta sobre el objeto que devuelve !PYTHON(open) (y que representa al
  archivo abierto).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.readline)`(`[_tamaño_`:` !PYTHON(int)]`) -> `\  !PYTHON(str) | !PYTHON(bytes)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- !PYTHON(readline) devuelve una línea del archivo en forma de cadena (si el
  archivo se abrió en **modo texto**) o un valor de tipo !PYTHON{bytes} (si se
  abrió en **modo binario**), dejando el carácter de salto de línea (`\n`) al
  final.

- El salto de línea sólo se omite cuando es la última línea del archivo y éste
  no acaba en salto de línea.

- Si devuelve una cadena vacía (!PYTHON('')), significa que se ha alcanzado el
  final del archivo.

- Si se devuelve una cadena formada sólo por `\n`, significa que es una línea
  en blanco (una línea que sólo contiene un salto de línea).

---

- El método empieza a leer desde la posición actual del puntero interno del
  archivo y cambia la posición del mismo.

- El parámetro _tamaño_ es opcional:

  - Si se omite o es negativo, se devuelve todo desde la posición actual del
    puntero hasta el final de la línea.

  - En caso contrario, se leerán y devolverán _como mucho_ tantos caracteres
    (en modo texto) o bytes (en modo binario) como se haya indicado.

!EJEMPLOS

```python
>>> f = open('entrada.txt', 'r')
>>> f.readline()
'Esta es la primera línea.\n'
>>> f.readline()
'Esta es la segunda.\n'
>>> f.readline()
'Y esta es la tercera.\n'
>>> f.readline()
''
>>> f = open('entrada.txt', 'r')
>>> f.readline(4)
'Esta'
>>> f.readline(4)
' es '
>>> f.readline()
'la primera línea.\n'
>>> f.readline()
'Esta es la segunda.\n'
>>> f.readline()
'Y esta es la tercera.\n'
>>> f.readline()
''
```

### !PYTHON(readlines)

- El método !PYTHON{readlines} (en plural, no confundir con !PYTHON(readline)
  en singular) también sirve para leer de un archivo y también se ejecuta sobre
  el objeto que devuelve !PYTHON(open), pero en lugar de su versión en
  singular, **lee _varias_ líneas del archivo de una sola vez**.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.readlines)`(`[_tamaño_`:` !PYTHON(int)]`)` `->` !PYTHON(list[str|bytes])
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- !PYTHON(readlines) devuelve una lista de cadenas de caracteres o de bytes
  (según como se haya abierto el archivo, en modo texto o binario).

- El método empieza a leer desde la posición actual del puntero interno del
  archivo y cambia la posición del mismo.

- Las líneas conservan el carácter de salto de línea (`\n`) al final. El salto
  de línea sólo se omite cuando es la última línea del archivo y éste no acaba
  en salto de línea.

---

- Si devuelve una lista vacía (!PYTHON([])), significa que el archivo está
  vacío.

- Si uno de los elementos está formada sólo por `\n`, significa que es una
  línea en blanco (una línea que sólo contiene un salto de línea).

- El parámetro _tamaño_ es opcional, y se puede usar para controlar la cantidad
  de líneas leídas:

  - Si se omite o es negativo, se leerá desde la posición actual del puntero
    hasta el final del archivo, devolviendo cada línea separada en un elemento
    de la lista.

  - En caso contrario, se leerán y devolverán el menor número de líneas que
    sean necesarias para leer el número de caracteres (en modo texto) o bytes
    (en modo binario) indicado, desde la posición actual del puntero.

!EJEMPLOS

```python
>>> f = open('entrada.txt', 'r')
>>> f.readlines()
['Esta es la primera línea.\n', 'Esta es la segunda.\n',
 'Y esta es la tercera.\n']
>>> f.readlines()
[]
>>> f = open('entrada.txt', 'r')
>>> f.readlines(5)
['Esta es la primera línea.\n']
>>> f = open('entrada.txt', 'r')
>>> f.read(4)
'Esta'
>>> f.readlines()
[' es la primera línea.\n', 'Esta es la segunda.\n',
 'Y esta es la tercera.\n']
```

### !PYTHON(write)

- El método !PYTHON(write) sirve para escribir en un archivo y se ejecuta sobre
  el objeto que devuelve !PYTHON{open} (y que representa al archivo abierto).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.write)`(`_contenido_`:` !PYTHON(str) | !PYTHON(bytes)`)` `->` !PYTHON(int)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El método escribe el _contenido_ en el !NT(archivo). Ese contenido debe ser
  una _cadena_ de caracteres si el archivo se abrió en **modo texto**, o un
  _valor de tipo_ !PYTHON(bytes) si se abrió en **modo binario**.

- Al escribir, modifica el puntero interno del archivo.

- Devuelve el número de caracteres o de bytes que se han escrito, dependiendo
  de si se abrió en modo texto o en modo binario.

---

- También se puede usar !PYTHON(print) para escribir en un archivo.

- En la práctica, no hay mucha diferencia entre usar !PYTHON(print) y usar
  !PYTHON(write).

- Hacer:

  ```python
  >>> f = open('archivo.txt', 'r+')
  >>> f.write('Hola Manolo\n')
  ```

  equivale a hacer:

  ```python
  >>> f = open('archivo.txt', 'r+')
  >>> print('Hola', 'Manolo', file=f)
  ```

- Hay que tener en cuenta los separadores y los saltos de línea que introduce
  !PYTHON(print).

- !PYTHON(write) NO escribe el carácter de salto de línea al final, cosa que sí
  hace !PYTHON{print} (salvo que le digamos lo contrario).

- !PYTHON(print) escribe en el flujo !PYTHON(sys.stdout) mientras no se diga
  lo contrario.

---

- Si el archivo se ha abierto en un modo `'a'` o `'a+'`, el puntero empezará
  estando al **final del archivo** y la escritura **siempre** se realizará a
  partir de ese punto, aunque previamente hayamos leído algo o hayamos movido
  el puntero explícitamente mediante !PYTHON(seek):

  ```python
  >>> f = open('entrada.txt', 'r')   # Abrimos el archivo para ver su contenido
  >>> f.readlines()                  # Comprobamos que contiene las líneas originales
  ['Esta es la primera línea.\n',
   'Esta es la segunda.\n',
   'Y esta es la tercera.\n']
  >>> f.close()
  >>> f = open('entrada.txt', 'a+')  # Lo volvemos a abrir en lectura/añadir
  >>> f.read(4)                      # El puntero está situado al final, y...
  ''                                 # ... si leemos algo, allí no hay nada
  >>> f.write('Prueba\n')            # Escribimos siete caracteres al final
  7
  >>> f.close()                      # Cerramos el archivo para guardar los cambios
  >>> f = open('entrada.txt', 'r')   # Volvemos a abrir el archivo
  >>> f.readlines()                  # Comprobamos que se ha escrito al final...
  ['Esta es la primera línea.\n',    # ... del archivo, y no en la posición 4...
   'Esta es la segunda.\n',          # ... como cabría haber esperado
   'Y esta es la tercera.\n',
   'Prueba\n']
  ```

---

- Si el archivo se ha abierto en un modo `'w'`, `'w+'` o `'r+'`, el puntero
  empezará estando al **principio del archivo** y la escritura se realizará en
  la posición del puntero.

- Pero **si leemos algo del archivo antes de escribir en él, la escritura se
  hará _al final_** del archivo (como si lo hubiésemos abierto con un modo
  `'a+'`) a menos que primero movamos el puntero explícitamente mediante
  !PYTHON(seek):

  ```python
  >>> f = open('entrada.txt', 'r')   # Abrimos el archivo para ver su contenido
  >>> f.readlines()                  # Comprobamos que contiene las líneas originales
  ['Esta es la primera línea.\n',
   'Esta es la segunda.\n',
   'Y esta es la tercera.\n']
  >>> f.close()
  >>> f = open('entrada.txt', 'r+')  # Lo volvemos a abrir en lectura/escritura
  >>> f.read(4)                      # Leemos cuatro caracteres (desde el principio)
  'Esta'
  >>> f.write('Prueba\n')            # Escribimos siete caracteres
  7
  >>> f.close()                      # Cerramos el archivo para guardar los cambios
  >>> f = open('entrada.txt', 'r')   # Volvemos a abrir el archivo
  >>> f.readlines()                  # Comprobamos que se ha escrito al final...
  ['Esta es la primera línea.\n',    # ... del archivo, y no en la posición 4...
   'Esta es la segunda.\n',          # ... como cabría haber esperado
   'Y esta es la tercera.\n',
   'Prueba\n']
  ```

### !PYTHON(writelines)

- El método !PYTHON(writelines) escribe una lista de líneas en un archivo, por
  lo que, en cierta forma, es el contrario de !PYTHON(readlines).

- Igualmente, se ejecuta sobre el objeto que devuelve !PYTHON{open} (y que
  representa al archivo abierto).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.writelines)`(`_lineas_`:` !PYTHON(list[str|bytes])`)` `->` !PYTHON(None)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El parámetro _lineas_ es el contenido a escribir en el archivo, y debe ser
  una lista de _cadenas_ si el archivo se abrió en **modo texto**, o de
  _valores de tipo_ !PYTHON(bytes) si se abrió en **modo binario**.

- Todo lo comentado anteriormente para el método !PYTHON(write) sobre su
  comportamiento en función del modo de apertura del archivo, se aplica también
  a !PYTHON(writelines).

!EJEMPLOS

```python
>>> f = open('entrada.txt', 'r')
>>> f.readlines()
['Esta es la primera línea.\n', 'Esta es la segunda.\n',
 'Y esta es la tercera.\n']
>>> f.close()
>>> f = open('salida.txt', 'w')
>>> f.writelines(['Primera línea de salida.txt.\n','Segunda línea.\n'])
>>> f.close()
>>> f = open('salida.txt', 'r')
>>> f.readlines()
['Primera línea de salida.txt.\n','Segunda línea.\n']
```

- Al igual que !PYTHON(write), el método !PYTHON(writelines) NO escribe el
  **salto de línea** al final de cada cadena, así que tendremos que
  introducirlo nosotros mismos.

### !PYTHON(seek) y !PYTHON(tell)

- El método !PYTHON(seek) **sitúa el puntero interno** del archivo en una
  determinada posición.

- El método !PYTHON(tell) **devuelve la posición actual** del puntero interno.

- Sus signaturas son:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.seek)`(`_offset_`:` !PYTHON(int)`)` `->` !PYTHON(int)

!NT(archivo)!PYTHON(.tell)`()` `->` !PYTHON(int)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El _offset_ es la posición a la que se desea mover el puntero, empezando por
  0 desde el comienzo del archivo.

- Además de mover el puntero, el método !PYTHON(seek) devuelve la nueva
  posición del puntero.

  Pero no olvidemos que si el archivo se ha abierto en modo _añadir_ (`'a'` o
  `'a+'`), la escritura se hará siempre al final del archivo, sin importar cuál
  sea la posición actual del puntero.

!EJEMPLOS

```python
>>> f = open('entrada.txt', 'r+')    # Abre en modo lectura/escritura
>>> f.tell()                         # El puntero está al principio
0
>>> f.readline()                     # Lee una línea de texto
'Esta es la primera línea.\n'
>>> f.tell()                         # Se ha movido el puntero
27
>>> f.seek(0)                        # Vuelve a colocarlo al principio
0
>>> f.readline()                     # Por tanto, se lee la misma línea
'Esta es la primera línea.\n'
>>> f.seek(0)                        # Vuelve a colocarlo al principio
0
>>> f.write('Cambiar')               # Escribe desde el principio
7
>>> f.tell()
7
>>> f.seek(0)
0
>>> f.readline()                     # Se ha cambiado la primera línea
'Cambiar la primera línea.\n'
```

---

```python
>>> f = open('entrada.txt', 'a+')    # Abre en modo lectura/añadir
>>> f.tell()                         # El puntero está al final
69
>>> f.readline()                     # Allí no hay nada
''
>>> f.seek(0)                        # Movemos el puntero al principio
0
>>> f.tell()                         # El puntero se ha movido
0
>>> f.readline()                     # Por tanto, se lee la primera línea
'Esta es la primera línea.\n'
>>> f.tell()                         # El puntero se ha movido
27
>>> f.seek(0)                        # Vuelve a colocarlo al principio
0
>>> f.write('Prueba\n')              # Siempre se escribe al final
7
>>> f.tell()                         # El puntero está al final
76
>>> f.readlines()                    # Allí no hay nada
[]
>>> f.seek(0)                        # Movemos el puntero al principio
0
>>> f.readlines()                    # Leemos todas las líneas
['Esta es la primera línea.\n',
 'Esta es la segunda.\n',
 'Y esta es la tercera.\n',
 'Prueba\n']                         # Se ha escrito al final
```

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

::: column

- Algoritmo imperativo que usa saltos incondicionales con etiquetas:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
**escribir** \"Esto se hace\"
**saltar** a la etiqueta _fin_
**escribir** \"Esto no se hace\"
**etiqueta** _fin_
**escribir** \"Aquí se acaba\"
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El mismo algoritmo con números de línea:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1. **inicio**
2. **escribir** \"Esto se hace\"
3. **saltar** a la línea 5
4. **escribir** \"Esto no se hace\"
5. **escribir** \"Aquí se acaba\"
6. **fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Representado como diagrama de flujo:

!IMGP(salto-incondicional.!EXT)()(width=60%)(width=30%)

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
  print('Esto se hace')
  goto .fin
  print('Esto se salta')
  label .fin
  print('Aquí se acaba')
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
  $primero \longleftarrow 2$
$ultimo \longleftarrow 25$
$i \longleftarrow primero$
**etiqueta** _inicio_
**si** $i = ultimo$ **saltar** a la etiqueta _fin_
**escribir** $i$
$i \longleftarrow i + 1$
**saltar** a la etiqueta _inicio_
**etiqueta** _fin_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

  i = primero

  label .inicio
  if i == ultimo: goto .fin

  print(i, end=' ')
  i += 1
  goto .inicio

  label .fin
  """

  exec(with_goto(compile(CODIGO, '', 'exec')))
  ```

---

- También existe el paquete experimental `goto-plus`, que funciona de forma
  similar pero usando números de línea en lugar de etiquetas.

- Instalación:

  ```console
  $ pip install goto-plus
  ```

- Ejemplo:

  ```{.python .number-lines}
  from goto_plus import goto, gotoconfig

  gotoconfig(__file__)

  j = 0
  j += 1
  print(j)
  if j < 10: goto(6)
  ```

!BIBLIOGRAFIA
