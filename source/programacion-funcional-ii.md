---
title: Programación funcional (II)
author: Ricardo Pérez López
!DATE
nocite: |
  @blanco_calculo_2009, @abelson_structure_1996, @van-roy_concepts_2004
---

# Definiciones

## Definiciones

- Introduciremos ahora en nuestro lenguaje una nueva instrucción (técnicamente
  es una **sentencia**) con la que vamos a poder hacer **definiciones**.

- A esa sentencia la llamaremos **definición**, y expresa el hecho de que **un
  _nombre_ representa un _valor_**.

- Las definiciones tienen la siguiente sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(definición) ::= !T(identificador)\ \ !T(=)\ \ !NT(expresión)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  x = 25
  ```

  A partir de ese momento, el identificador !PYTHON(x) representa el valor
  !PYTHON(25) (por lo que la expresión !PYTHON(x) vale !PYTHON(25)).

  Y si !PYTHON(x) vale !PYTHON(25), la expresión !PYTHON(2 + x * 3) vale
  !PYTHON(77).

## Identificadores y ligaduras (*binding*!ifdef(HTML)(&nbsp;)())

- Los **identificadores** son los nombres o símbolos que representan a los
  elementos del lenguaje.

- Cuando hacemos una definición, lo que hacemos es asociar un identificador con
  un valor.

- Esa asociación se denomina **ligadura** (o **_binding_**).

- Por esa razón, también se dice que **una definición crea una ligadura**.

- También decimos que el identificador está **ligado** (**_bound_**).

- Lo representaremos gráficamente así:

  !DOT(ligadura.svg)()(width=30%)(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  25 [shape = circle]
  x [shape = plaintext, fillcolor = transparent]
  x -> 25
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En Python (a diferencia de lo que ocurre en un **lenguaje funcional _puro_**)
  las ligaduras empiezan a existir en el momento en que se ejecuta su
  definición, no antes.

### Ligaduras irrompibles

- En un **lenguaje funcional _puro_**, un identificador ya ligado no se puede
  ligar a otro valor. Por ejemplo, lo siguiente daría un error en un lenguaje
  funcional puro:

  ```python
  x = 4  # ligamos el identificador x al valor 4
  x = 7  # intentamos ligar x al valor 7, pero ya está ligado al valor 4
  ```

!DOT(rebinding.svg)()(width=20%)(width=15%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
4 [shape = circle]
7 [shape = circle]
x [shape = plaintext, fillcolor = transparent]
x -> 4 [style = dashed, color = grey]
x -> 7
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En consecuencia, **las ligaduras** entre nombres y valores **no se pueden
  romper**, de forma que un nombre, una vez ligado a un valor, **no se puede
  volver a ligar a otro valor distinto** durante la ejecución del programa
  (efecto que se conoce como _rebinding_).

- En la práctica, eso significa que el nombre representa un **dato
  _constante_**.

---

- Que las ligaduras sean irrompibles son un requisito necesario para alcanzar
  la **transparencia referencial**.

- Si hago:

  ```python
  x = "Hola"
  ```

  en un lenguaje funcional puro, luego no puedo hacer:

  ```python
  x = "Hala"
  ```

  porque eso sería hacer un _rebinding_ y provocaría que, de nuevo, la
  expresión !PYTHON(x) tuviera distintos valores según el momento, lo que va en
  contra de la transparencia referencial.

- Python no es un lenguaje funcional puro, por lo que sí se permite volver a
  ligar el mismo identificador a otro valor distinto.

  - Al hacer esto, se estaría perdiendo el valor anterior.

  - Así que, por ahora, el _rebinding_ está prohibido para nosotros (**no lo
    hagamos**).

---

- Lo que sí se puede hacer es:

  ```python
  x = 25
  y = x
  ```

- En este caso estamos ligando a !PYTHON(y) el mismo valor que tiene
  !PYTHON(x), algo perfectamente válido en un lenguaje funcional.

- Lo que hace el intérprete en este caso no es crear dos valores !PYTHON(25) en
  memoria (sería un gasto inútil de memoria), sino que !PYTHON(x) e !PYTHON(y)
  _comparten_ el único valor !PYTHON(25) que existe:

  !DOT(ligadura-compartida.svg)()(width=20%)(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  25 [shape = circle]
  x [shape = plaintext, fillcolor = transparent]
  y [shape = plaintext, fillcolor = transparent]
  x -> 25
  y -> 25
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto:

  ```python
  >>> x = 25
  >>> y = x
  >>> y
  25
  ```

---

- El **nombre** de una **función** es un identificador que está ligado a la
  función correspondiente (que en programación funcional es un valor como
  cualquier otro).

- Por ejemplo, !PYTHON(max) es un identificador ligado a la función que
  devuelve el máximo de dos números (que representaremos aquí como **λ**):

  !DOT(ligadura-funcion-max.svg)()(width=25%)(width=22%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  lambda [shape = circle, label = "λ"]
  max [shape = plaintext, fillcolor = transparent]
  max -> lambda
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Así que ese valor se puede ligar a otro identificador y, de esta forma, ambos
  identificadores compartirían el mismo valor (y, por tanto, representarían a
  la misma función). Por ejemplo:

:::: columns

::: column

```python
>>> maximo = max
>>> maximo(3, 4)
4
```

:::

::: column

!DOT(ligadura-funcion-max-maximo.svg)()(width=55%)(width=23%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
lambda [shape = circle, label = "λ"]
max [shape = plaintext, fillcolor = transparent, width = 0.1]
maximo [shape = plaintext, fillcolor = transparent]
max -> lambda
maximo -> lambda
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Inmutabilidad

- Para alcanzar la transparencia referencial, también es necesario que **los
  objetos** de datos que manipula el programa (es decir, los valores) **no
  tengan un estado interno** que pueda cambiar durante la ejecución del
  programa.

- Eso se consigue haciendo que los valores sean **inmutables**.

- Por ejemplo, en Python las cadenas son inmutables porque, una vez creadas,
  no se pueden cambiar los caracteres que la forman.

  Si hago !PYTHON(x = "Hola"), luego no puedo cambiar el interior de esa cadena
  (por ejemplo, cambiando la !PYTHON('o') por una !PYTHON('a')), porque
  entonces la expresión !PYTHON(x) tendría distintos valores dependiendo del
  momento en el que se evalúe, lo que va en contra de la transparencia
  referencial.

---

- Eso significa que en programación funcional tampoco estaría permitido hacer
  cosas como esta:

  ```python
  import math
  math.constante = 405
  ```

  ya que entonces estaríamos **creando una nueva ligadura dentro del objeto**
  que representa al módulo `math`, lo que en la práctica supone que estamos
  **cambiando el estado interno de ese objeto** y, por tanto, estaría **dejando
  de ser inmutable**.

- Recordemos que **los módulos son objetos** y, como tales, **son valores**
  como cualquier otro.

- En cambio, sí sería correcto hacer algo así:

  ```python
  import math
  constante = 405
  ```

  ya que ahí no se está cambiando el estado interno de ningún valor.

### Reglas léxicas

- Cuando hacemos una definición debemos tener en cuenta ciertas cuestiones
  relativas al identificador:

  - ¿Cuál es la **longitud máxima** de un identificador?

  - ¿Qué **caracteres** se pueden usar?

  - ¿Se distinguen **mayúsculas** de **minúsculas**?

  - ¿Coincide con una palabra clave o reservada?

    - **Palabra clave**: palabra que forma parte de la sintaxis del lenguaje.

    - **Palabra reservada**: palabra que no puede emplearse como identificador.

- En Python, los identificadores pueden ser combinaciones de letras minúsculas
  y mayúsculas (y distingue entre ellas), dígitos y subrayados (`_`), no pueden
  empezar por un dígito, no pueden coincidir con una palabra reservada y pueden
  tener cualquier longitud.

### Tipo de un identificador

- Cuando un identificador está ligado a un valor, a efectos prácticos el
  identificador actúa como si fuera el valor.

- Como cada valor tiene un tipo de dato asociado, también podemos hablar del
  **tipo de un identificador**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de un identificador** es el tipo del dato con el que está ligado.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si un identificador no está ligado, no tiene sentido preguntarse qué tipo
  tiene.

### Anotaciones de tipo en definiciones

- Las **anotaciones de tipo** (en inglés, _type hints_) en Python son una
  característica **opcional** que permite indicar qué tipo de datos se espera
  que tenga un identificador.

- En otros lenguajes (sobre todo, de tipado estático) se denominan
  _declaraciones de tipo_.

- Sirven principalmente como documentación y para herramientas de análisis
  estático (como mypy, Pyright o Pyre) que comprueban tipos antes de ejecutar
  el código, pero no son comprobadas en tiempo de ejecución por Python.

- Si incorporamos las anotaciones de tipo en las sentencias de definición, la
  sintaxis de las mismas queda así:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(definición) ::= !T(identificador) [!T(:) !NT(tipo)] \ \ !T(=)\ \ !NT(expresión)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

  siendo !NT(tipo) una expresión que represente un tipo del lenguaje.

---

- Por ejemplo:

  ```python
  edad: int = 50
  nombre: str = "Ana"
  precio: float = 19.95
  activo: bool = True
  ```

- Hay que tener en cuenta que el intérprete no comprueba en ningún momento que
  el tipo anotado a un identificador se corresponda realmente con el tipo del
  valor ligado a dicho identificador.

- Eso significa que lo siguiente, aunque incorrecto, se ejecutaría sin ningún
  error por parte del intérprete:

  ```python
  edad: str = 50
  ```

- El uso de anotaciones de tipo, en cambio, mejora la legibilidad del código y
  permite la comprobación con herramientas externas, las cuales sí podrían
  detectar la línea anterior como incorrecta mediante un análisis estático (sin
  ejecutar) del código.

## Espacios de nombres

- Ciertas estructuras o construcciones sintácticas del programa definen lo que
  se denomina **espacios de nombres**.

- Un **espacio de nombres** (del inglés, _namespace_) es una correspondencia
  entre nombres y valores; es decir, es un **conjunto de ligaduras**.

- Su función es, por tanto, **almacenar ligaduras y permitir varias ligaduras
  con el mismo nombre** en distintas partes del programa.

- En un espacio de nombres, **un identificador sólo puede tener como máximo una
  ligadura**. En cambio, el mismo identificador puede estar ligado a diferentes
  valores en diferentes espacios de nombres.

- Por eso decimos que una ligadura es **local** al espacio de nombres donde se
  almacena, o que tiene un **almacenamiento local** a ese espacio de nombres.

- Los espacios de nombres pueden estar **_anidados_**, es decir, que puede
  haber espacios de nombres dentro de otros espacios de nombres, ya que también
  pueden estarlo las estructuras sintácticas que los definen.

---

- Algunos espacios de nombres provienen de estructuras estáticas (o sea, que
  vienen definidas en tiempo de compilación) y otras provienen de estructuras
  dinámicas (definidas en tiempo de ejecución).

- Por tanto, podemos tener **espacios de nombres _estáticos_** y **espacios de
  nombres _dinámicos_**.

- En Java, las clases y los paquetes son _espacios de nombres estáticos_, que
  el compilador gestiona a través de su _tabla de símbolos_.

---

- Por otra parte, durante la ejecución de un programa se pueden ir creando
  ciertas estructuras en memoria que representan _espacios de nombres
  dinámicos_.

  Los ejemplos más comunes de estas estructuras son:

  - Los **marcos** que se crean al ejecutar _scripts_ de Python y al invocar
    funciones (o métodos) definidas por el programador en Python y Java.

  - Los **objetos** de Python.

  - Las **clases** de Python (que también son objetos).

  - Los **módulos** de Python (que también son objetos).


!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Los marcos y los objetos son los únicos espacios de nombres que existen en
  Python.

- Por tanto, todos los espacios de nombres en Python son dinámicos.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Un espacio de nombres muy importante en Python es el que incluye las
  definiciones predefinidas del lenguaje (funciones !PYTHON(max) o
  !PYTHON(sum), tipos como !PYTHON(str) o !PYTHON(int), etc.)

- Ese espacio de nombres se denomina !PYTHON(__builtins__) y viene implementado
  en forma de _módulo_ que se importa automáticamente en cada sesión
  interactiva o cada vez que se arranca un programa Python.

- Pero sabemos que también podemos usar directamente las definiciones que
  contiene, por lo que el efecto es como si Python ejecutara las siguientes
  dos sentencias nada más entrar en el intérprete:

  ```python
  import __builtins__
  from __builtins__ import *
  ```

- Esto no es exactamente así en realidad, pero por ahora haremos como si así
  fuera, por simplicidad.

## Marcos (*frames*!ifdef(HTML)(&nbsp;)())

- Un **marco** (del inglés, _frame_) es una estructura que se crea en memoria
  para **representar la ejecución o _activación_ de un _script_ de Python o una
  función o método definido por el programador** en Python o Java.

- Los marcos son **espacios de nombres** y, entre otras cosas, almacenan las
  ligaduras que se definen dentro de ese _script_, función o método.

- Los marcos son conceptos **_dinámicos_**:

  - Se crean y se destruyen a medida que la ejecución del programa pasa por
    ciertas partes del mismo.

  - Van almacenando nuevas ligaduras conforme se van ejecutando nuevas
    instrucciones que crean las ligaduras.

---

- Por ahora, el único marco que existe en nuestros programas es el llamado
  **_marco global_**, también llamado **espacio de nombres global**.

- El marco global se crea en el momento en que **se empieza a ejecutar el
  programa** y existe durante toda la ejecución del mismo (sólo se destruye al
  finalizar la ejecución del programa).

- Si se está trabajando en una sesión con el intérprete interactivo, el marco
  global **se crea justo al empezar la sesión** y existe durante toda la sesión
  (sólo se destruye al salir de la misma).

  Por tanto, las definiciones que se ejecutan directamente en una sesión
  interactiva con el intérprete, crean ligaduras que se almacenan en el marco
  global.

---

- Es importante aclarar que, en un programa escrito en un lenguaje funcional
  puro, no importa el orden en el que aparezcan las definiciones, por lo que se
  podría usar un nombre antes de que aparezca su definición en el código fuente
  del programa.

- Por ejemplo, en un lenguaje funcional puro como Haskell podríamos escribir lo
  siguiente:

  ```haskell
  a = 2 + b
  b = 5
  ```

  y funcionaría perfectamente, aunque en la primera línea de código estemos
  usando un nombre que se define después en el código fuente, en la segunda
  línea.

- Eso es debido a que los lenguajes funcionales puros no dependen del orden de
  ejecución de las instrucciones.

- En cambio, Python no es un lenguaje funcional puro, así que el orden de
  ejecución de las instrucciones sí que importa.

---

- Por ejemplo, si iniciamos una sesión con el intérprete interactivo y justo a
  continuación tecleamos lo siguiente:

  ```{.python .number-lines}
  >>> x
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  >>> x = 25
  >>> x
  25
  ```

  - Aquí estamos trabajando con el *marco global* (el único marco que existe
    hasta ahora para nosotros).

  - En la línea 1, el identificador !PYTHON(x) aún no está ligado, por lo que
    su uso genera un error (el marco global no contiene hasta ahora ninguna
    ligadura para !PYTHON(x)).

  - En la línea 6, en cambio, el identificador puede usarse sin error ya que ha
    sido ligado previamente en la línea 5 (el marco global ahora contiene una
    ligadura para !PYTHON(x) con el valor 25).

---

- Los marcos son espacios de nombres dinámicos, que se van creando y
  destruyendo durante la ejecución del programa.

- Igualmente, las ligaduras que contiene también se van creando y destruyendo a
  medida que se van ejecutando las instrucciones que forman el programa.

- Si tenemos la siguiente sesión interactiva:

  ```{.python .number-lines}
  >>> 2 + 3
  5
  >>> x = 4
  >>> y = 3
  >>> z = y
  ```

  Según hasta donde hayamos ejecutado, el marco global contendrá lo siguiente:

:::: columns

::: column

!DOT(marco-lineas12.svg)(Marco global en las líneas 1--2)(width=25%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, label = ""] 
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(marco-linea3.svg)(Marco global en la línea 3)(width=40%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent] 
}
x -> 4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

:::: columns

::: column

!DOT(marco-linea4.svg)(Marco global en la línea 4)(width=40%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 [shape = circle]
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
}
x -> 4
y -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(marco-linea5.svg)(Marco global en la línea 5)(width=40%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 [shape = circle]
4 [shape = circle]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent]
    y [shape = plaintext, fillcolor = transparent]
    z [shape = plaintext, fillcolor = transparent]
}
x -> 4
y -> 3
z -> 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Hemos visto que una ligadura es una asociación entre un identificador y un
  valor.

- También hemos visto que los espacios de nombres almacenan ligaduras, y que un
  marco es un espacio de nombres.

- Por tanto, **los marcos almacenan ligaduras, pero _NO_ almacenan los
  valores** a los que están asociados los identificadores de esas ligaduras.

- Por eso hemos dibujado a los valores fuera de los marcos en los diagramas
  anteriores.

- Los valores se almacenan en una zona de la memoria del intérprete conocida
  como el **montículo**.

- En cambio, los marcos se almacenan en otra zona de la memoria conocida como
  la **pila de control**, la cual estudiaremos mejor más adelante.

<!--

---

- En realidad, además del marco global, existe otro espacio de nombres muy
  importante que incluye las definiciones predefinidas del lenguaje (funciones
  !PYTHON(max) o !PYTHON(sum), tipos como !PYTHON(str) o !PYTHON(int), etc.).

- Ese espacio de nombres se denomina !PYTHON(__builtins__).

- Las definiciones contenidas en el espacio de nombres !PYTHON(__builtins__)
  están disponibles directamente en la sesión de trabajo o en cualquier punto
  del programa.

-->

## Evaluación de expresiones con identificadores

- Podemos usar un identificador ligado dentro de una expresión, siempre que la
  expresión resulte ser válida según las reglas del lenguaje.

- El identificador representa a su valor ligado y se evalúa a dicho valor en
  cualquier expresión donde aparezca ese identificador:

  ```python
  >>> x = 25
  >>> 2 + x * 3
  77
  ```

- Intentar usar en una expresión un identificador no ligado provoca un error de
  tipo !PYTHON{NameError} (*nombre no definido*):

  ```python
  >>> y
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'y' is not defined
  ```

### Resolución de identificadores

- Durante la evaluación de una expresión, para cada uno de los diferentes
  identificadores que aparecen en ella, habrá que comprobar si ese
  identificador está ligado y a qué valor.

  - Si no está ligado, es un error de _nombre no definido_.

  - En caso contrario, tendrá que determinar a qué valor está ligado para poder
    sustituir, en la expresión, cada aparición del identificador por su valor.

- Para ello, habrá que buscar una ligadura con ese identificador en uno o
  varios espacios de nombres.

- El proceso de localizar (si es que existe) la ligadura adecuada que liga a un
  identificador con su valor, se denomina **resolución del identificador**.

- En general, al proceso de determinar con qué valores están ligados los
  identificadores de un programa se le denomina **resolución de
  identificadores** o **resolución de nombres**.

---

- Los espacios de nombres donde se buscan las ligaduras para ese identificador
  dependerán del _contexto_ en el que se está intentando resolver dicho
  identificador.

- Por ejemplo, en el siguiente código:

  ```python
  >>> x = 4
  >>> x
  4
  ```

  se busca una ligadura para `x` en el marco global.

- En cambio, si se intenta acceder a un atributo de un objeto:

  ```python
  >>> import math
  >>> math.pi
  3.141592653589793
  ```

  se busca una ligadura para `pi` en el espacio de nombres asociado al módulo
  `math`.

---

- La resolución de identificadores es un proceso que usa mecanismos distintos
  dependiendo de si el lenguaje es interpretado o compilado:

  - Si es un **lenguaje interpretado** (como Python): el intérprete usa un
    concepto llamado **entorno** en tiempo de ejecución para localizar la
    ligadura.

    En tal caso, hablamos de **resolución de nombres _dinámica_**.

  - Si es un **lenguaje compilado** (como Java): el compilador determina, en
    tiempo de compilación, si una ligadura es accesible haciendo uso del
    concepto de **ámbito** y, en caso afirmativo, deduce en qué espacio de
    nombres está la ligadura.

    En tal caso, hablamos de **resolución de nombres _estática_**.

- En general, la resolución de identificadores puede ser una tarea complicada
  ya que puede involucrar muchos conceptos como espacios de nombres, ámbitos,
  entornos, reglas de visibilidad, sombreado, sobrecargas... muchos de los
  cuales aún no hemos estudiado.

# *Scripts*

## *Scripts*

- Cuando tenemos muchas definiciones o muy largas, resulta tedioso tener que
  introducirlas una y otra vez cada vez que abrimos una nueva sesión con el
  intérprete interactivo.

- Lo más cómodo es teclearlas todas una sola vez dentro un archivo que luego
  cargaremos desde dentro del intérprete.

- Ese archivo se llama **_script_** y, por ahora, contendrá una lista de las
  definiciones que nos interese usar en nuestras sesiones interactivas con el
  intérprete.

- Al cargar el _script_, se ejecutarán sus instrucciones una tras otra casi de
  la misma forma que si las estuviéramos tecleando nosotros directamente en
  nuestra sesión con el intérprete, en el mismo orden.

- Llegado el momento, los _scripts_ contendrán el código fuente de nuestros
  programas y los ejecutaremos desde el intérprete por lotes.

---

- Los nombres de archivo de los *scripts* en Python llevan extensión `.py`.

- Para cargar un *script* en nuestra sesión tenemos dos opciones:

  #. Usar la orden !PYTHON(from) dentro de la sesión actual.

     Por ejemplo, para cargar un *script* llamado `definiciones.py`, usaremos:

     ```python
     >>> from definiciones import *
     ```

     Observar que en el !PYTHON(from) se pone el nombre del script pero **sin
     la extensión `.py`**.

  #. Iniciar una nueva sesión con el intérprete interactivo indicándole que
     cargue el _script_ mediante la opción `-i` en la línea de órdenes del
     sistema operativo:

     ```console
     $ python -i definiciones.py
     >>>
     ```

     En este caso **sí** se pone el nombre completo del script, **con la
     extensión `.py`**.

---

- A partir de ese momento, en el intérprete interactivo podremos usar las
  definiciones que se hayan cargado desde del _script_.

- Por ejemplo, si el _script_ `definiciones.py` tiene el siguiente contenido:

  ```python
  x = 25
  j = 14
  ```

- Al cargar el _script_ (usando cualquiera de las dos opciones que hemos visto
  anteriormente) se ejecutarán sus instrucciones (las dos definiciones) y, en
  consecuencia, se crearán en el marco global las ligaduras
  `x` → `25` y `j` → `14`:

  ```python
  >>> x                                   # antes de cargar el script, da error
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'x' is not defined
  >>> from definiciones import *          # aquí cargamos el script, y ahora
  >>> x                                   # la x sí está ligada a un valor
  25
  ```

---

- Una limitación importante que hay que tener en cuenta es que **el _script_
  sólo puede usar definiciones que se hayan creado en el mismo _script_**
  (exceptuando las definiciones predefinidas del lenguaje).

- Por ejemplo, si tenemos el siguiente _script_ llamado `prueba.py`:

  ```python
  j = w + 1
  ```

  donde se intenta ligar a `j` el valor ligado a `w` más uno, lo siguiente no
  funcionará:

  ```python
  >>> w = 3
  >>> from prueba import *
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "/home/ricardo/python/prueba.py", line 1, in <module>
      j = w + 1
  NameError: name 'w' is not defined
  ```

- Aunque `w` esté ligado a un valor al cargar el _script_, éste no podrá
  acceder a esa ligadura y da error de «_nombre no definido_».

- Cuando estudiemos la programación modular entenderemos por qué.

# Documentación interna

## Identificadores significativos

- Se recomienda usar identificadores descriptivos.

  Es mejor usar:

  ```python
  ancho = 640
  alto = 400
  superficie = ancho * alto
  ```

  que

  ```python
  x = 640
  y = 400
  z = x * y
  ```

  aunque ambos programas sean equivalentes en cuanto al efecto que producen y
  el resultado que generan.

- Si el identificador representa varias palabras, se puede usar el carácter de
  guión bajo (`_`) para separarlas y formar un único identificador:

  ```python
  altura_triangulo = 34.2
  ```

## Comentarios

- Los comentarios en Python empiezan con el carácter `#` y se extienden hasta
  el final de la línea.

- Los comentarios pueden aparecer al comienzo de la línea o a continuación de
  un espacio en blanco o una porción de código.

- Los comentarios no pueden ir dentro de un literal de tipo cadena.

  Un carácter `#` dentro de un literal cadena es sólo un carácter más.

  ```python
  # este es el primer comentario
  spam = 1  # y este es el segundo comentario
            # ... y este es el tercero
  texto = "# Esto no es un comentario porque va entre comillas."
  ```

---

- Cuando un comentario ocupa varias líneas, se puede usar el «truco» de poner
  una cadena con triples comillas:

  ```python
  x = 1
  """
  Esta es una cadena
  que ocupa varias líneas
  y que actúa como comentario.
  """
  y = 2
  ```

- Python evaluará la cadena pero, al no usarse dentro de ninguna expresión ni
  ligarse a ningún identificador, simplementa la ignorará (como un comentario).

# Resumen {.unnumbered .unlisted}

## Resumen {.unnumbered .unlisted}

- Resumiendo, los conceptos fundamentales sobre los que se asienta la
  programación funcional son:

  - Casi todas las instrucciones son expresiones, no sentencias.
  - Las definiciones son las únicas sentencias de un programa funcional.
  - Transparencia referencial.
  - Ausencia de efectos laterales.
  - Funciones puras.
  - El valor de una expresión no depende de nada ajeno a la misma, sólo de las
    subexpresiones que la forman.
  - Ligaduras irrompibles.
  - Inmutabilidad.
  - Las funciones también son valores.
  - Ejecutar un programa es evaluar una expresión.
  - No importa el orden en el que se ejecuten las instrucciones.
  - No importa el orden en el que se evalúen las subexpresiones de una
    expresión.

---

- Y otros dos conceptos fundamentales que aún no hemos estudiado pero que
  veremos en breve:

  - Abstracciones lambda.

  - Funciones de orden superior.

!BIBLIOGRAFIA
