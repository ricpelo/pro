---
title: Programación estructurada
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997
---

# Aspectos teóricos de la programación estructurada

## Programación estructurada

- La programación estructurada es una técnica de programación cuyo objetivo es,
  esencialmente, la obtención de programas fiables y fácilmente mantenibles.

- Su estudio puede dividirse en dos partes bien diferenciadas:

  - Por una parte, el estudio conceptual se centra en ver qué se entiende por
    programa estructurado para estudiar con detalle sus características
    fundamentales.

  - Por otra parte, dentro del enfoque práctico se presentará la metodología de
    refinamientos sucesivos que permite construir programas estructurados paso
    a paso, detallando cada vez más sus acciones componentes.

- Las ideas que dieron lugar a la programación estructurada ya fueron expuestas
  por E. W. Dijkstra en 1965, aunque el fundamento teórico está basado en los
  trabajos de Böhm y Jacopini publicados en 1966.

---

- La programación estructurada surge como respuesta a los problemas que
  aparecen cuando se programa sin una disciplina y unos límites que marquen la
  creación de programas claros y correctos.

- Un programador disciplinado crearía programas fáciles de leer. Por ejemplo,
  el siguiente programa que calcula el producto de dos números:

  !IMGP(producto.png)()(width=90%)(width=100%)

---

- En cambio, un programador indisciplinado crearía programas más difíciles de
  leer:

  !IMGP(confuso.png)()(width=50%)(width=70%)

- Si un programa se escribe de cualquier manera, aun siendo correcto desde el
  punto de vista de su funcionamiento, puede resultar engorroso, críptico,
  ilegible y casi imposible de modificar.

---

- Lo que hay que hacer, en primer lugar, es impedir que el programador pueda
  escribir programas de cualquier manera, y para ello hay que restringir sus
  opciones a la hora de construir programas de forma que el diagrama resultante
  sea fácil de leer, entender y mantener.

- Ese diagrama, una vez terminado, debe estar construido combinando sólo unos
  pocos tipos de bloques y cumpliendo una serie de restricciones. 

## Programa restringido

- Un **programa restringido** es aquel que se construye combinando únicamente
  los tres siguientes bloques:

:::: columns

::: column

- **Acción**, que sirve para representar una instrucción (por ejemplo: de
  lectura, escritura, asignación...).

- **Condición**, que sirve para bifurcar el flujo del programa dependiendo del
  valor (verdadero o falso) de una expresión lógica.

- **Agrupamiento**, que sirve, como su nombre indica, para agrupar lı́neas de
  flujo con distintas procedencias.

:::

::: column

!IMGP(accion.png)(Acción)(width=50%)(width=30%)

!IMGP(condicion.png)(Condición)(width=50%)(width=30%)

!IMGP(agrupamiento.png)(Agrupamiento)(width=40%)(width=20%)

:::

::::

## Programa propio

- Se dice que un programa restringido es un **programa propio** (o
  **_limpio_**) si reúne las tres condiciones siguientes:

  1. Todo bloque posee un único punto de entrada y otro único punto de salida.

  2. Para cualquier bloque, existe al menos un camino desde la entrada hasta él
     y otro camino desde él hasta la salida.

  3. No existen bucles infinitos.

- Estas condiciones restringen el concepto de programa de modo que sólo se
  permite trabajar con aquéllos que están diseñados mediante el uso apropiado
  del agrupamiento y sin bloques superfluos o formando bucles sin salida.

---

- Este es un ejemplo de un programa que no es propio por no tener una única
  salida:

  !IMGP(condicion-no-propio.png)()(width=50%)(width=40%)

- Agrupando las salidas se obtiene un programa propio:

  !IMGP(seleccion.png)()(width=50%)(width=50%)

---

- Aquí se observa otro programa que no es propio, ya que existen bloques (los
  *A*, *C* y *q*) que no tienen un camino hasta la salida; si el programa
  llegara hasta esos bloques se bloquearía, pues no es posible terminar la
  ejecución:

!IMGP(diagrama-no-propio.png)()(width=90%)(width=70%)

---

- Aquí aparece un programa que contiene bloques inaccesibles desde la entrada
  del diagrama:

!IMGP(diagrama-inaccesibles.png)()(width=80%)(width=50%)

## Estructura

- Una **estructura** es una construcción sintáctica (o un bloque constructivo)
  que se puede **anidar completamente** dentro de otra.

- Eso significa que, dadas dos estructuras cualesquiera, o una está incluida
  completamente dentro de la otra, o no se tocan en absoluto.

- Por tanto, los bordes de dos estructuras nunca pueden cruzarse:

!SALTOLARGOBEAMER

:::: columns

::: column

!DOT(estructura-si.svg)(Estructuras)(width=70%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fillcolor = transparent]
rankdir = "TB"
A
subgraph cluster0 {
    C
    B
    subgraph cluster1 {
        D
        subgraph cluster2 {
            E
        }
    }
}
F
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(estructura-no.png)(Estas no son estructuras)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [layout = neato]
A [pos="-0.5,0.0!", fillcolor = transparent]
B [pos="0.0,-0.2!", fillcolor = transparent]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Programa estructurado

- Un **programa estructurado** es un programa construido combinando las
  siguientes estructuras (llamadas **estructuras de control**):

  - La **secuencia** de dos acciones *A* y *B*.

  - La **selección** entre dos acciones *A* y *B* dependiendo de un predicado
    *p*.

  - La **iteración**, que repite una acción *A* dependiendo del valor de verdad
    de un predicado de control *p*.

- A su vez, tanto *A* como *B* pueden ser, o bien acciones simples, o bien una
  cualquiera de las estructuras anteriores, **recursivamente**.

---

:::: columns

::: column

!IMGP(secuencia.png)(Secuencia)(width=100%)(width=50%)

!IMGP(seleccion.png)(Selección)(width=100%)(width=50%)

!IMGP(iteracion.png)(Iteración)(width=80%)(width=50%)

:::

::: column

- En pseudocódigo:

  - Secuencia:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    $A$
$B$
~~~~~~~~~~~~~~~~~~~~~~~

  - Selección:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    **si** $p$ **entonces**
      $A$
**sino**
      $B$
~~~~~~~~~~~~~~~~~~~~~~~

  - Iteración:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    **mientras** $p$ **hacer**
      $A$
~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Cada una de las acciones que aparecen en una estructura pueden ser, a su vez,
  estructuras.

  - Esto es así porque se considera que una estructura es, también, una acción
    (*compuesta*, a diferencia de las acciones *simples*).

  - Por tanto, una estructura puede aparecer en cualquier parte donde se espere
    una acción.

- Resumiendo, en un programa podemos tener **dos tipos de acciones**:

  - **Acciones _simples_**

  - **Estructuras de control**, que son acciones *compuestas* formadas a su vez
    por otras acciones (que podrán ser, a su vez, simples o compuestas,
    recursivamente).

- Por consiguiente, todo programa puede verse como una única acción, simple o
  compuesta por otras.

---

- Un programa estructurado equivalente al del ejemplo anterior, pero mucho más
  claro, sería:

:::: columns

::: {.column width=70%}

!IMGP(claro.png)()(width=70%)(width=60%)

:::

::: {.column width=30%}

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~
**inicio**
**leer** $a$
**leer** $b$
**mientras** $a \neq b$ **hacer**
      **si** $a < b$ **entonces**
            $b \leftarrow b - a$
      **sino**
            $a \leftarrow a - b$
**escribir** $a$
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Ventajas de los programas estructurados

- Las principales **ventajas de los programas estructurados** frente a los no
  estructurados son:

  - Son más fáciles de entender, ya que básicamente se pueden leer de arriba
    abajo de estructura en estructura como cualquier otro texto sin tener que
    estar continuamente saltando de un punto a otro del programa.

  - Es más fácil demostrar que son correctos, ya que las estructuras anidadas
    pueden verse como cajas negras, lo que facilita trabajar a diferentes
    niveles de abstracción.

  - Se reducen los costes de mantenimiento.

  - Aumenta la productividad del programador.

  - Los programas quedan mejor documentados internamente.

## Teorema de Böhm-Jacopini

- El **teorema de Böhm-Jacopini**, también llamado **teorema de la
  estructura**, garantiza que todo programa propio se puede estructurar.

- Se enuncia formalmente así:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Teorema de la estructura:**

  Todo programa propio es equivalente a un programa estructurado.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto, los programas estructurados son suficientemente expresivos como
  para expresar cualquier programa razonable.

- Y además, por su naturaleza estructurada resultan programas más sencillos y
  claros.

- En consecuencia, no hay excusa para no estructurar nuestros programas.

# Estructuras básicas de control

## Secuencia

- La estructura secuencial en Python consiste sencillamente en poner cada
  sentencia una tras otra al mismo nivel de indentación.

- No requiere de ninguna otra sintaxis particular ni palabras clave.

- Una secuencia de sentencias actúa sintácticamente como si fuera una sola
  sentencia; por lo tanto, en cualquier lugar del programa donde se pueda poner
  una sentencia, se puede poner una secuencia de sentencias (que actuarían como
  una sola formando un bloque).

- Esto es así porque, como vimos, toda acción puede ser simple o compuesta (una
  estructura) y, por tanto, **toda estructura es también una sentencia** (actúa
  como si fuera una única sentencia pero compuesta por otras).

- Por tanto, en cualquier parte donde se pueda poner una sentencia, se puede
  poner una estructura.

---

!CAJA
~~~~~~~~~~~~~~~~~
**Concepto fundamental:**

En Python, la **estructura** del programa viene definida por la **indentación**
del código.
~~~~~~~~~~~~~~~~~

---

- Ejemplo:

  ```python
  x = 1
  y = 2
  f = lambda a, b: a + b
  z = f(x + y)
  ```

  Estas cuatro sentencias, al estar todas al mismo nivel de indentación, actúan
  como una sola sentencia en bloque y se ejecutan en orden de arriba abajo.

## Selección

- La selección (o estructura alternativa) tiene varias sintaxis en Python:

:::: columns

::: column

- Selección simple:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !T(if) !NT(condición)!T(:)
      !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~

- Selección doble:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !T(if) !NT(condición)!T(:)
      !NT(sentencia)
!T(else)!T(:)
      !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Selección múltiple:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !T(if) !NT(condición)!T(:)
      !NT(sentencia)
[!T(elif) !NT(condición)!T(:)
      !NT(sentencia)]
[!T(else)!T(:)
      !NT(sentencia)]
  ~~~~~~~~~~~~~~~~~~~~

:::

::::

---

:::: columns

::: {.column width=40%}

- Ejemplos:

```python
if 4 == 3:
    print('Son distintos')
    x = 5

if 4 == 3:
    print('Son distintos')
    x = 5
else:
    print('Son iguales')
    x = 9
```

:::

::: {.column width=60%}

```python
if x < 2:
    print('Es menor que dos')
elif x <= 9:
    print('Está comprendido entre 2 y 9')
    x = 5
elif x < 12:
    print('Es mayor que 9 y menor que 12')
else:
    print('Es mayor o igual que 12')
```

:::

::::

## Iteración

- La iteración (estructura *iterativa* o *repetitiva*) en Python tiene la
  siguiente sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !T(while) !NT(condición)!T(:)
      !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~

- A esta estructura se la llama **bucle _while_** o, simplemente, **bucle**.

- La !NT(sentencia) es el **cuerpo** del bucle.

- Cada ejecución del cuerpo del bucle se denomina **iteración**.

## Otras sentencias de control

### `break`

- La sentencia `break` finaliza el bucle que la contiene.

- El flujo de control del programa pasa a la sentencia inmediatamente posterior
  al cuerpo del bucle.

- Si la sentencia `break` se encuentra dentro de un bucle anidado (un bucle
  dentro de otro bucle), finalizará el bucle más interno.

  ```python
  i = 0
  s = "string"
  while i < len(s):
      val = s[i]
      i += 1
      if val == "i":
          break
      print(val)

  print("Fin")
  ```

  produce:

  ```
  s
  t
  r
  Fin
  ```

### `continue`

- La sentencia `continue` se usa para saltarse el resto del código dentro de un
  bucle en la iteración actual.

- El bucle no finaliza sino que continúa con la siguiente iteración.

  ```python
  i = 0
  s = "string"
  while i < len(s):
      val = s[i]
      i += 1
      if val == "i":
          continue
      print(val)

  print("Fin")
  ```

  produce:

  ```
  s
  t
  r
  n
  g
  Fin
  ```

### Excepciones

- Incluso aunque una sentencia o expresión sea sintácticamente correcta, puede
  provocar un error cuando se intente ejecutar o evaluar.

- Los errores detectados durante la ejecución del programa se denominan
  **excepciones** y no tienen por qué ser incondicionalmente fatales si se
  capturan y se gestionan adecuadamente.

- En cambio, la mayoría de las excepciones no son gestionadas por el programa
  y, por consiguiente, provocan mensajes de error y la terminación de la
  ejecución del programa.

---

- Por ejemplo:

  ```python
  >>> 10 * (1 / 0)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ZeroDivisionError: division by zero
  >>> 4 + spam * 3
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'spam' is not defined
  >>> '2' + 2
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: Can't convert 'int' object to str implicitly
  ```

- La última línea del mensaje de error indica qué ha ocurrido.

- Hay distintos tipos de excepciones y ese tipo se muestra como parte del
  mensaje: los tipos del ejemplo anterior son `ZeroDivisionError`, `NameError`
  y `TypeError`.

- El resto de la línea proporciona detalles sobre el tipo de excepción y qué lo
  causó.

#### Gestión de excepciones

- Es posible escribir programas que gestionen excepciones concretas.

- Para ello se utiliza una estructura de control llamada `try/except`.

- La sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(try:)
      !NT(sentencia)
\(!T(except) [!NT(excepcion) [!T(as) !NT(identificador)]]!T(:)
      !NT(sentencia))+
[!T(else:)
      !NT(sentencia)]
[!T(finally:)
      !NT(sentencia)]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(excepcion) ::= !NT(nombre_excepcion)
                  | !T{(}!NT{nombre_excepcion}(!T(,) !NT(nombre_excepcion))*!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Su funcionamiento es el siguiente:

  - Se intenta ejecutar el bloque de sentencias del `try`.

  - Si durante su ejecución no se levanta ninguna excepción, se saltan los
    `except` y se ejecutan las sentencias del `else` (si existe).

  - Si se levanta alguna excepción, se busca (por orden de arriba abajo) algún
    `except` que cuadre con el tipo de excepción que se la lanzado y, si se
    encuentra, se ejecutan sus sentencias asociadas.

  - Finalmente, y en cualquier caso (se haya levantado alguna excepción o no),
    se ejecutan las sentencias del `finally` (si existe).

---

- Por ejemplo, el siguiente programa pide al usuario que introduzca un número
  entero por la entrada. Si el dato introducido es correcto (es un número
  entero), lo muestra a la salida multiplicado por tres y dice que la cosa
  acabó bien. Si no, muestra un mensaje de advertencia:

  ```python
  try:
      x = int(input("Introduzca un número entero: "))
      print(x * 3)
  except ValueError:
      print("¡Vaya! No ha introducido un número entero.")
  else:
      print("La cosa ha acabado bien.")
  finally:
      print("Fin")
  ```

- En cualquiera de los dos casos, siempre acaba diciendo `Fin`.

# Metodología de la programación estructurada

## Diseño descendente por refinamiento sucesivo

- El diseño descendente es la técnica que permite descomponer un problema
  complejo en problemas más sencillos, realizándose esta operación de forma
  sucesiva hasta llegar al mínimo nivel de abstracción en el cual se pueden
  codificar directamente las operaciones en un lenguaje de programación
  estructurado.

- Con esta técnica, los programas se crean en distintos niveles de
  refinamiento, de forma que cada nuevo nivel define la solución de forma más
  concreta y subdivide las operaciones en otras menos abstractas.

- Los programas se diseñan de lo general a lo particular por medio de sucesivos
  refinamientos o descomposiciones que nos van acercando a las instrucciones
  finales del programa. 

- El último nivel permite la codificación directa en un lenguaje de
  programación.

---

!IMGP(refinamiento.png)(Diseño descendente por refinamiento sucesivo)(width=60%)(width=40%)

## Recursos abstractos

- Descomponer un programa en términos de recursos abstractos consiste en
  descomponer una determinada acción compleja en un número de acciones mas
  simples, capaces de ser ejecutadas por un ordenador, y que constituirán sus
  instrucciones.

- Es el complemento perfecto para el diseño descendente y el que nos
  proporciona el método a seguir para obtener un nuevo nivel de refinamiento a
  partir del anterior.

---

- Se basa en suponer que, en cada nivel de refinamiento, todos los elementos
  (instrucciones, expresiones, funciones, etc.) que aparecen en la solución
  están ya disponibles directamente en el lenguaje de programación, aunque no
  sea verdad.

- Esos elementos o recursos se denominan abstractos porque los podemos usar
  directamente en un determinado nivel de refinamiento sin tener que saber cómo
  funcionan realmente por dentro, o incluso si existen realmente. Nosotros
  suponemos que sí existen y que hacen lo que tienen que hacer sin preocuparnos
  del cómo.

- En el siguiente refinamiento, aquellos elementos que no estén implementados
  ya directamente en el lenguaje se refinarán, bajando el nivel de abstracción
  y acercándonos cada vez más a una solución que sí se pueda implementar en el
  lenguaje.

- El refinamiento acaba cuando la solución se encuentra completamente definida
  usando los elementos del lenguaje de programación (ya no hay recursos
  abstractos).

## Ejemplo

- Supongamos que queremos escribir un programa que muestre una tabla de
  multiplicar de tamaño $n \times n$.

- Por ejemplo, para $n = 10$ tendríamos:

  $$\begin{matrix}
  1 & 2 & 3 & \cdots & 10 \\
  2 & 4 & 6 & \cdots & 20 \\
  3 & 6 & 9 & \cdots & 30 \\
  \vdots & \vdots & \vdots & \ddots & \vdots \\
  10 & 20 & 30 & \cdots & 100
  \end{matrix}$$

---

- Una primera versión (burda) del programa podría ser:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  **leer $n$**
  **construir la tabla de $n \times n$**
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde el programa se plantea como una secuencia de dos acciones: preguntar el
  tamaño de la tabla deseada y construir la tabla propiamente dicha.

- La instrucción **leer $n$** ya está suficientemente refinada (se puede
  traducir a un lenguaje de programación) pero la segunda no (por tanto, es un
  recurso abstracto).

---

- La construcción de la tabla se puede realizar fácilmente escribiendo en una
  fila los múltiplos de 1, en la fila inferior los múltiplos de 2, y así
  sucesivamente hasta que lleguemos a los múltiplos de $n$.

- Por tanto, el siguiente paso es refinar la instrucción abstracta **construir
  la tabla de $n \times n$**, creando un nuevo nivel de refinamiento:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  **leer $n$**
  # construir la tabla de $n \times n$:
  $i \leftarrow 1$
  **mientras** $i \leq n$:
        **escribir la fila de $i$**
        $i \leftarrow i + 1$
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde ahora aparece la acción **escribir la fila de $i$**, que escribe cada
  una de las filas de la tabla, y que habrá que refinar porque no se puede
  traducir directamente al lenguaje de programación.

---

- En este (último) nivel refinamos la acción que nos falta, quedando:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  **leer $n$**
  _{ construir la tabla de $n \times n$: }_
  $i \leftarrow 1$
  **mientras** $i \leq n$:
        _{ escribir la fila de $i$: }_
        $j \leftarrow 1$
        **mientras** $j \leq n$:
              **escribir** $i \times j$
              $j \leftarrow j + 1$
        **escribir** un salto de línea
        $i \leftarrow i + 1$
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ese programa es directamente traducible a Python:

  ```python
  n = int(input('Introduce el número: '))
  i = 1
  while i <= n:
      j = 1
      while j <= n:
          print(i * j, end=' ')
          j += 1
      print()
      i += 1
  ```

- O mejor aún:

  ```python
  try:
      n = int(input('Introduce el número: '))
      i = 1
      while i <= n:
          j = 1
          while j <= n):
              print(f'{i * j:>3}', end=' ')
              j += 1
          print()
          i += 1
  except ValueError:
      print('Número incorrecto')
  ```

# Funciones imperativas

## Definición de funciones imperativas

- En programación imperativa también podemos definir funciones.

- Al igual que ocurre en programación funcional, una función en programación
  imperativa es una construcción sintáctica que acepta argumentos y produce un
  resultado.

- Pero a diferencia de lo que ocurre en programación funcional, una función en
  programación imperativa contiene **sentencias**.

- Las funciones en programación imperativa conforman los bloques básicos que
  nos permiten **descomponer un programa en partes** que se combinan entre sí.

- Todavía podemos construir funciones mediante expresiones lambda, pero las
  funciones imperativas tienen ventajas:

  - Podemos escribir **sentencias** dentro de las funciones imperativas.

  - Podemos escribir funciones que no devuelvan ningún resultado porque su
    cometido es provocar algún efecto lateral.

---

- La **definición** de una función imperativa tiene la siguiente sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(def) !NT(nombre)!T{(}[!NT(parámetros)]!T{)}!T(:)
      !NT(cuerpo)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- donde:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(cuerpo) ::= !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  def saluda(persona):
      print('Hola', persona)
      print('Encantado de saludarte')

  def despide():
      print('Hasta luego, Lucas')
  ```

---

- La definición de una función imperativa es una **sentencia compuesta**, es
  decir, una **estructura** (como las estructuras de control `if`, `while`,
  etc.).

- Por tanto, puede aparecer en cualquier lugar del programa donde pueda haber
  una sentencia.

- Como en cualquier otra estructura, las sentencias que contiene (las que van
  en el **cuerpo** de la función) van **indentadas** (o *sangradas*) dentro de
  la definición de la función.

- Por tanto (de nuevo como en cualquier otra estructura), el final de la
  función se deduce al encontrarse una sentencia **menos indentada** que el
  cuerpo, o bien el final del *script*.

## Llamadas a funciones imperativas 

- Cuando se llama a una función imperativa, ocurre lo siguiente (en este
  orden):

  1. Como siempre que se llama a una función, se crea un nuevo marco en el
     entorno (que contiene los parámetros así como las ligaduras y variables
     locales a su ámbito) y se almacena en la pila de control su registro de
     activación.

  2. Se pasan los argumentos de la llamada a los parámetros de la función.
  
     Recordemos que en Python se sigue el orden aplicativo (primero se evalúan
     los argumentos y después se pasan a los parámetros correspondientes).

  3. El flujo de control del programa se transfiere al bloque de sentencias que
     forman el cuerpo de la función y se ejecuta éste.

---

- Cuando se finaliza la ejecución de las sentencias que forman el cuerpo de la
  función:

  1. Se genera su valor de retorno (en breve veremos cómo).

  2. Se saca su registro de activación de la pila.
  
  3. Se devuelve el control de la ejecución a la línea de código que llamó a la
     función.

  4. Se sustituye, en dicha línea, la llamada a la función por su valor de
     retorno.

  5. Se continúa la ejecución del programa desde ese punto.

---

- Por ejemplo:

  ```python
  def saluda(persona):
      print('Hola', persona)
      print('Encantado de saludarte')

  def despide():
      print('Hasta luego, Lucas')

  saluda('Pepe')
  print('El gusto es mío')
  saluda('Juan')
  despide()
  print('Sayonara, baby')
  ```

- Produce la siguiente salida:

  ```
  Hola Pepe
  Encantado de saludarte
  El gusto es mío
  Hola Juan
  Encantado de saludarte
  Hasta luego, Lucas
  Sayonara, baby
  ```

[Ver ejecución paso a paso en Pythontutor](http://pythontutor.com/visualize.html#code=def%20saluda%28persona%29%3A%0A%20%20%20%20print%28'Hola',%20persona%29%0A%20%20%20%20print%28'Encantado%20de%20saludarte'%29%0A%0Adef%20despide%28%29%3A%0A%20%20%20%20print%28'Hasta%20luego,%20Lucas'%29%0A%0Asaluda%28'Pepe'%29%0Aprint%28'El%20gusto%20es%20m%C3%ADo'%29%0Asaluda%28'Juan'%29%0Adespide%28%29%0Aprint%28'Sayonara,%20baby'%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target="\_blank"}

---

:::: columns

::: column

- Una función puede llamar a otra. Por ejemplo, el siguiente programa:

  ```python
  def saluda(persona):
      print('Hola', persona)
      quiensoy()
      print('Encantado de saludarte')

  def despide():
      print('Hasta luego, Lucas')

  def quiensoy():
      print('Me llamo Ricardo')

  saluda('Pepe')
  print('El gusto es mío')
  saluda('Juan')
  despide()
  print('Sayonara, baby')
  ```

:::

::: column

- Produce la siguiente salida:

  ```
  Hola Pepe
  Me llamo Ricardo
  Encantado de saludarte
  El gusto es mío
  Hola Juan
  Me llamo Ricardo
  Encantado de saludarte
  Hasta luego, Lucas
  Sayonara, baby
  ```

:::

::::

[Ver ejecución paso a paso en Pythontutor](http://pythontutor.com/visualize.html#code=def%20saluda%28persona%29%3A%0A%20%20%20%20print%28'Hola',%20persona%29%0A%20%20%20%20quiensoy%28%29%0A%20%20%20%20print%28'Encantado%20de%20saludarte'%29%0A%0Adef%20despide%28%29%3A%0A%20%20%20%20print%28'Hasta%20luego,%20Lucas'%29%0A%0Adef%20quiensoy%28%29%3A%0A%20%20%20%20print%28'Me%20llamo%20Ricardo'%29%0A%0Asaluda%28'Pepe'%29%0Aprint%28'El%20gusto%20es%20m%C3%ADo'%29%0Asaluda%28'Juan'%29%0Adespide%28%29%0Aprint%28'Sayonara,%20baby'%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target=\_blank}

---

- La función debe estar definida antes de poder llamarla.

- Eso significa que el intérprete de Python debe ejecutar el `def` de una
  función antes de que el programa pueda llamar a esa función.

- Por ejemplo, el siguiente programa lanzaría el error «*NameError: name 'hola'
  is not defined*» en la línea 1:

  ```{.python .number-lines}
  hola()

  def hola():
      print('hola')
  ```

- En cambio, este funcionaría perfectamente:

  ```{.python .number-lines}
  def hola():
      print('hola')

  hola()
  ```

## Paso de argumentos

- En el marco de la función llamada se almacenan, entre otras cosas, los
  valores de los parámetros de la función.

- Al principio, los parámetros contendrán los valores de los argumentos que se
  hayan pasado a la función al llamar a la misma.

- Existen distintos mecanismos de paso de argumentos, dependiendo del lenguaje
  de programación utilizado. 

- Los más conocidos son los llamados **paso de argumentos _por valor_** y
  **paso de argumentos _por referencia_**.

- En Python existe un único mecanismo de paso de argumentos llamado **paso de
  argumentos _por asignación_**, que en la práctica resulta bastante sencillo.

- Consiste en suponer que **el argumento _se asigna_ al parámetro**
  correspondiente, teniendo en cuenta todo lo relacionado con los *alias* de
  variables, inmutabilidad, mutabilidad, etcétera.

---

- Por ejemplo:

  ```{.python .number-lines}
  def saluda(persona):
      print('Hola', persona)
      print('Encantado de saludarte')

  saluda('Manolo')  # Saluda a Manolo
  x = 'Juan'
  saluda(x)         # Saluda a Juan
  ```

- En la línea 5 se asigna a `persona` el valor `Manolo` (como si se hiciera
  `persona = Manolo`).

- En la línea 7 se asigna a `persona` el valor de `x`, como si se hiciera
  `persona = x`, lo que sabemos que crea un *alias* (que no afectaría ya que el
  valor pasado es una cadena y, por tanto, inmutable).

---

- En caso de pasar un argumento mutable:

  ```python
  def cambia(l):
      print(l)
      l.append(99)

  lista = [1, 2, 3]
  cambia(lista)     # Imprime [1, 2, 3]
  print(lista)      # Imprime [1, 2, 3, 99]
  ```

- La función es capaz de **cambiar el estado de la lista que se ha pasado como
  argumento** ya que, al llamar a la función, el argumento `lista` se pasa a la
  función **asignándola** al parámetro `l`, haciendo que ambas variables sean
  *alias* una de la otra (se refieren al mismo objeto) y, por tanto, la función
  está modificando la misma variable que se ha pasado como argumento (`lista`).

## La sentencia `return`

- Para devolver el resultado de la función al código que la llamó, hay que usar
  una sentencia `return`.

- Cuando el intérprete encuentra una sentencia `return` dentro de una función:

  - se finaliza la ejecución de la función,
  
  - se devuelve el control al punto del  programa en el que se llamó a la
    función y
  
  - la función devuelve como resultado el valor de retorno definido en la
    sentencia `return`.

---

- Por ejemplo:

  ```{.python .number-lines}
  def suma(x, y):
      return x + y

  a = int(input('Introduce el primer número: '))
  b = int(input('Introduce el segundo número: '))
  resultado = suma(a, b)
  print('El resultado es:', resultado)
  ```

- La función se define en las líneas 1--2. El intérprete lee la definición de
  la función pero no ejecuta las sentencias de su cuerpo en ese momento (lo
  hará cuando se *llame* a la función).

- En la línea 6 se llama a la función `suma` pasándole como argumentos los
  valores de `a` y `b`, asignándoseles a `x` e `y`, respectivamente.

- Dentro de la función, se calcula la suma `x + y` y la sentencia `return`
  finaliza la ejecución de la función, devolviendo el control al punto en el
  que se la llamó (la línea 6) y haciendo que su valor de retorno sea el valor
  calculado en la suma anterior (el valor de la expresión que acompaña al
  `return`).

---

- El valor de retorno de la función sustituye a la llamada a la función en la
  expresión en la que aparece dicha llamada, al igual que ocurre con las
  expresiones lambda.

- Por tanto, una vez finalizada la ejecución de la función, la línea 6 se
  reescribe sustituyendo la llamada a la función por su valor.

- Si, por ejemplo, suponemos que el usuario ha introducido los valores `5` y
  `7` en las variables `a` y `b`, respectivamente, tras finalizar la ejecución
  de la función tendríamos que la línea 6 quedaría:

  ```python
  resultado = 12
  ```

  y la ejecución del programa continuaría por ahí.

---

- También es posible usar la sentencia `return` sin devolver ningún valor.

- En ese caso, su utilidad es la de finalizar la ejecución de la función en
  algún punto intermedio de su código.

- Pero en Python todas las funciones devuelven algún valor.

- Lo que ocurre en este caso es que la función devuelve el valor `None`:

:::: columns

::: column

```python
def hola():
  print('Hola')
  return
  print('Adiós')  # aquí no llega

hola()
```

imprime:

!SALTOBEAMER

```
Hola
```

:::

::: column

```python
def hola():
  print('Hola')
  return
  print('Adiós')

x = hola()  # devuelve None
print(x)
```

imprime:

!SALTOBEAMER

```
Hola
None
```

:::

::::

---

- Cuando se alcanza el final del cuerpo de una función sin haberse ejecutado
  antes ninguna sentencia `return`, es como si la última sentencia del cuerpo
  de la función fuese un `return` sin valor de retorno.

- Por ejemplo:

  ```python
  def hola():
      print('Hola')
  ```

  equivale a:

  ```python
  def hola():
      print('Hola')
      return
  ```

- Esa última sentencia `return` nunca es necesario ponerla ya que la ejecución
  de una función termina automáticamente (y retorna al punto donde se la llamó)
  cuando ya no quedan más sentencias que ejecutar en su cuerpo.

## Ámbito de variables

- La función `suma` se podría haber escrito así:

  ```python
  def suma(x, y):
      res = x + y
      return res
  ```

  y el efecto final habría sido el mismo.

- La variable `res` que aparece en el cuerpo de la función es una **variable
  local** y sólo existe dentro de la función. Por tanto, esto sería incorrecto:

  ```{.python .number-lines}
  def suma(x, y):
      res = x + y
      return res

  resultado = suma(4, 3)
  print(res)  # da error
  ```

  Fuera de la función, la variable `res` no está definida en el entorno (que
  está formado sólo por el marco global) y por eso da error en la línea 6.

---

- Eso significa que se crea un nuevo marco en el entorno que contendrá, en
  principio, los parámetros, las variables locales y las ligaduras locales a la
  función.

  ```{.python .number-lines}
  def suma(x, y):
      res = x + y
      return res

  resultado = suma(4, 3)
  print(resultado)
  ```

!SALTOLARGOBEAMER

:::: columns

::: {.column width=40%}

!DOT(funcion-entorno-fuera.svg)(Entorno en la línea 6)(width=70%)(width=25%)                                 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                       
compound = true
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    suma [shape = plaintext, fillcolor = transparent]
    resultado [shape = plaintext, fillcolor = transparent]
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    suma -> v1 -> función
    resultado -> v2 -> 7
}
E [shape = point]
E -> suma [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          

:::

::: {.column width=60%}

!DOT(funcion-entorno-dentro.svg)(Entorno dentro de la función `suma`)(width=100%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR, splines = ortho]
node [fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
3 -> suma [lhead = cluster0, ltail = cluster1, minlen = 2]
y [shape = plaintext, fillcolor = transparent]
suma [shape = plaintext, fillcolor = transparent]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    suma -> v1 -> función
}
subgraph cluster1 {
    label = <Marco de <u>suma</u>>
    bgcolor = white
    4 [shape = circle, width = 0.3, fixedsize = shape]
    3 [shape = circle, width = 0.3, fixedsize = shape]
    v5 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v4 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v3 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    res [shape = plaintext, fillcolor = transparent]
    y -> v3 -> 3
    x -> v4 -> 4
    res -> v5
}
E [shape = point]
E -> x [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Variables locales

- Al igual que pasa con las expresiones lambda, las definiciones de funciones
  generan un nuevo ámbito.

- Tanto los **parámetros** como las **variables** y las **ligaduras** que se
  crean en el cuerpo de la función son **locales** a ella, y por tanto sólo
  existen dentro de ella.

  Su **ámbito** es **el cuerpo de la función** a la que pertenecen.
  
- Los **parámetros** se pueden usar libremente en cualquier parte del cuerpo de
  la función porque ya se les ha asignado un valor.
  
- En cambio, se produce un error `UnboundLocalError` si se intenta usar una
  **variable local** antes de asignarle un valor:

  ```python
  >>> def hola():
  ...     print(x)  # x es una variable local pero aún no tiene valor asignado
  ...     x = 1     # aquí es donde empieza a tener un valor
  ...
  >>> hola()
  UnboundLocalError: local variable 'x' referenced before assignment
  ```

### Variables globales

- Desde dentro de una función es posible usar variables globales, ya que se
  encuentran en el **entorno** de la función.

- Se puede **acceder** al valor de una variable global directamente:

  ```python
  x = 4
  
  def prueba():
      print(x)

  prueba()  # imprime 4
  ```

---

- Pero para poder **modificar** una variable global es necesario que la función
  la declare previamente como *global*.

- De no hacerlo así, el intérprete supondría que el programador quiere crear
  una variable local que tiene el mismo nombre que la global:

  ```python
  x = 4

  def prueba():
      x = 5  # esta variable es local

  prueba()
  print(x)  # imprime 4
  ```

- Como en Python no existen las *declaraciones* de variables, el intérprete
  tiene que **_averiguar_ por sí mismo qué ámbito tiene una variable**.

- Lo hace con una regla muy sencilla:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si hay una **asignación** a una variable **dentro** de una función, esa
  variable se considera **local**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- El siguiente código genera un error «*UnboundLocalError: local variable 'x'
  referenced before assignment*». ¿Por qué?

  ```python
  x = 4

  def prueba():
      x = x + 4
      print(x)

  prueba()
  ```

- Como la función asigna un valor a `x`, Python considera que `x` es local.

- Pero en la expresión `x + 4`, la variable `x` aún no tiene ningún valor
  asignado, por lo que genera un error «*variable local `x` referenciada antes
  de ser asignada*».

#### `global`

- Para informar al intérprete que una determinada variable es global, se usa la
  sentencia `global`:

  ```python
  x = 4

  def prueba():
      global x  # informa que la variable x es global
      x = 5     # cambia el valor de la variable global x

  prueba()
  print(x)  # imprime 5
  ```

---

- Las reglas básicas de uso de la sentencia `global` en Python son:

  #. Cuando se crea una variable dentro de una función (asignándole un valor),
     por omisión es local.

  #. Cuando se define una variable fuera de una función, por omisión es global
     (no hace falta usar la sentencia `global`).

  #. Se usa la sentencia `global` para cambiar el valor de una variable global
     dentro de una función.

  #. El uso de la sentencia `global` fuera de una función no tiene ningún
     efecto.

  #. La sentencia `global` debe aparecer *antes* de que se use la variable
     global correspondiente.

#### Efectos laterales

- Cambiar el estado de una variable global es uno de los ejemplos más claros y
  conocidos de los llamados **efectos laterales**.

- Recordemos que una función tiene (o *provoca*) efectos laterales cuando
  provoca cambios de estado observables desde el exterior de la función, más
  allá de devolver su valor de retorno. Típicamente:

  - Cuando cambia el valor de una variable global

  - Cuando cambia un argumento mutable

  - Cuando realiza una operación de entrada/salida

- Una función que provoca efectos laterales es una **función impura**, a
  diferencia de las **funciones puras**, que no tienen efectos laterales.

- Una función también puede ser **impura** si su valor de retorno depende de
  algo más que de sus argumentos (p. ej., de una variable global).

---

- Un ejemplo de **función impura** (con un efecto lateral provocado por una
  operación de entrada/salida) podría ser:

  ```python
  def suma(x, y):
      res = x + y
      print('La suma vale', res)
      return res

  resultado = suma(4, 3) + suma(8, 5)
  print(resultado)
  ```

  Cualquiera que no sepa cómo está construida internamente la función `suma`,
  se podría pensar que lo único que hace es calcular la suma de dos números,
  pero resulta que también imprime un mensaje en la salida, por lo que el
  resultado final que se obtiene no es el que se esperaba:

  ```
  La suma vale 7
  La suma vale 13
  20
  ```

---

- Las llamadas a la función `suma` no se pueden sustituir por su valor de
  retorno correspondiente. Es decir, que no es lo mismo hacer:

  ```python
  resultado = suma(4, 3) + suma(8, 5)
  ```

  que hacer:

  ```python
  resultado = 7 + 13
  ```

  porque en el primer caso se imprimen cosas por pantalla y en el segundo no.

- Por tanto, la función `suma` no cumple la **transparencia referencial**.

---

- El que una función necesite **acceder al valor de una variable global**
  supone otra forma de **perder transparencia referencial**, ya que la
  convierte en **impura** porque su valor de retorno podría depender de algo
  más que de sus argumentos (en este caso, de la variable global).

- En consecuencia, la función podría producir **resultados distintos en
  momentos diferentes** ante los mismos argumentos:

  ```python
  def suma(x, y):
      res = x + y + z  # impureza: depende del valor de una variable global
      return res

  z = 5
  print(suma(4, 3))  # imprime 12
  z = 2
  print(suma(4, 3))  # imprime 9
  ```

---

- Igualmente, el **uso de la sentencia `global`** supone otra forma más de
  **perder transparencia referencial**, puesto que, gracias a ella, una función
  puede cambiar el valor de una variable global, lo que la convertiría en
  **impura** porque podría provocar un **efecto lateral** (la modificación de
  la variable global).

- En consecuencia, la función podría producir **resultados distintos en
  momentos diferentes** ante los mismos argumentos:

  ```python
  def suma(x, y):
      global z
      res = x + y + z  # impureza: depende del valor de una variable global
      z = z + 1        # efecto lateral: cambia una variable global
      return res

  z = 0
  print(suma(4, 3))  # imprime 7
  print(suma(4, 3))  # la misma llamada a función ahora imprime 8
  ```

## Funciones locales a funciones

- En Python es posible definir **funciones locales** a una función.

- Las funciones locales también se denominan **funciones internas** o
  **funciones anidadas**.

- Una función local se define **dentro** de otra función y, por tanto, sólo
  existe dentro de la función en la que se ha definido.

- Su **ámbito** es el cuerpo de la función donde se ha definido (la función que
  la contiene), pero al igual que pasa con las variables locales, sólo se
  pueden usar (llamar) después de haberse definido, es decir, después de
  haberse ejecutado el `def` de la función interna.

- Evita la superpoblación de funciones en el ámbito más externo cuando sólo
  tiene sentido su uso en un ámbito más interno.

---

- Por ejemplo:

  ```python
  def fact(n):
      def fact_iter(n, acc):
          if n == 0:
              return acc
          else:
              return fact_iter(n - 1, acc * n)
      return fact_iter(n, 1)

  print(fact(5))

  # daría un error porque fact_iter no existe en el ámbito global:
  print(fact_iter(5, 1))  
  ```

- La función `fact_iter` es local a la función `fact`. No se puede usar desde
  fuera de `fact`.

- Tampoco se puede usar dentro de `fact` *antes* de haberse definido.

---

- Lo siguiente daría un error porque intentamos usar `fact_iter` antes de haber
  definido:

  ```python
  def fact(n):
      print(fact_iter(1, 1))  # error: se usa antes de definirse
      def fact_iter(n, acc):  # aquí es donde empieza su definición
          if n == 0:
              return acc
          else:
              return fact_iter(n - 1, acc * n)
      return fact_iter(n, 1)
  ```

---

- Las funciones locales definen un nuevo ámbito.

- Ese nuevo ámbito crea un nuevo marco en el entorno.

- Y ese nuevo marco se conecta con el marco del ámbito que lo contiene, es
  decir, el marco de la función que contiene a la local.

### `nonlocal`

- Una función local puede **acceder** al valor de las variables locales a la
  función que la contiene.
  
- En cambio, cuando una función local quiere **modificar** el valor de una
  variable local a la función que la contiene, debe declararla previamente como
  **no local** con la sentencia `nonlocal`.

- Es algo similar a lo que ocurre con las variables globales.

---

  ```python
  def fact(n):
      def fact_iter(acc):
          nonlocal n
          n = n - 1
          if n == 0:
              return acc
          else:
              return fact_iter(acc * n)
      return fact_iter(n)

  print(fact(5))
  ```

- La función local `fact_iter` puede acceder a la variable `n`, que es local a
  la función `fact` (para ello no es necesario declararla previamente como **no
  local**).

- Como la variable `n` está declarada **no local** en `fact_iter`, también
  puede modificarla.

- De esta forma, ya no es necesario pasar el valor de `n` como argumento a la
  función `fact_iter` y puede modificarla directamente.

## *Docstrings*

- Python implementa un mecanismo muy sencillo y elegante para documentar partes
  del código basado en cadenas llamadas **_docstrings_** (*cadenas de
  documentación*).

- En funciones, únicamente tenemos que insertar una cadena en la primera línea
  del cuerpo:

  ```python
  def hola(arg):
    """
    Este es el docstring de la función.
    """
    print("Hola", arg, "!")

  hola("Héctor")
  ```

- Las reglas de estilo dictan que esa cadena debe escribirse con triples
  comillas.

---

- Para consultar la documentación se usa la función `help` pasándole como
  argumento la función a consultar:

  ```python
  >>> help(hola)
  Help on function hola in module __main__:

  hola()
    Este es el docstring de la función.
  ```

- También se puede documentar un script añadiendo un *docstring* al principio
  del mismo (en la primera línea):

  ```python
  """Este es el docstring del script"""

  def despedir():
      """Este es el docstring de la función despedir"""
      print("¡Adiós! Me despido desde la función despedir()")

  def saludar():
      """Este es el docstring de la función saludar"""
      print("¡Hola! Te saludo desde la función saludar()")
  ```

!BIBLIOGRAFIA
