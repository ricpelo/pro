---
title: Programación estructurada
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997
---

# Aspectos teóricos de la programación estructurada

## Programación estructurada

- La **programación estructurada** es un paradigma de programación
  **imperativa** que se apoya en tres pilares fundamentales:

  - **Estructuras básicas:** los programas se escriben usando sólo unos pocos
    componentes constructivos básicos que se combinan entre sí mediante
    composición.

  - **Recursos abstractos:** los programas se escriben sin tener en cuenta
    inicialmente el ordenador que lo va a ejecutar ni las instrucciones de las
    que dispone el lenguaje de programación que se va a utilizar.

  - **Diseño descendente por refinamiento sucesivo:** los programas se escriben
    de arriba abajo a través de una serie de niveles de abstracción de menor a
    mayor complejidad, pudiéndose verificar la corrección del programa en cada
    nivel.

- Su **objetivo** es **conseguir programas fiables y fácilmente mantenibles**.

---

- Su estudio puede dividirse en dos partes bien diferenciadas:

  - Por una parte, el **estudio conceptual** se centra en ver qué se entiende
    por «programa estructurado» para estudiar con detalle sus características
    fundamentales.

  - Por otra parte, dentro del **enfoque práctico** se presentará una
    metodología que permite construir programas estructurados paso a paso,
    detallando cada vez más las instrucciones que lo componen.

- Las ideas que dieron lugar a la programación estructurada ya fueron expuestas
  por **E. W. Dijkstra** en 1965, aunque el fundamento teórico está basado en
  los trabajos de **Böhm y Jacopini** publicados en 1966.

<!--
- Posteriormente, Dijkstra se basó en los trabajos previos de Hoare y Floyd para establecer una metodología disciplinada y sistemática de programación en la cual los programas se escriben al mismo tiempo que se va demostrando su corrección, en un estilo formal y riguroso.
-->

---

- La programación estructurada surge como respuesta a los problemas que
  aparecen cuando se programa sin una disciplina y unos límites que marquen la
  creación de programas claros y correctos.

- Un programador _disciplinado_ crearía programas fáciles de leer en los que
  resulta relativamente fácil demostrar su corrección.

- Por ejemplo, el siguiente programa que calcula el producto de dos números:

!IMGP(producto.!EXT)()(width=95%)(width=100%)

---

:::: columns

::: {.column width=45%}

- En cambio, un programador _indisciplinado_ crearía programas más difíciles de
  leer y, por tanto, de demostrar que son correctos.

- Este programa resuelve el mismo problema que el anterior, pero mediante
  saltos contínuos y líneas que se cruzan, lo que resulta en un programa más
  complicado de seguir.

:::

::: {.column width=55%}

!IMGP(confuso.!EXT)()(width=100%)(width=70%)

:::

::::

---

- Esos dos programas son **equivalentes**, lo que significa que producen el
  mismo resultado y los mismos efectos ante los mismos datos de entrada, aunque
  lo hacen de distinta forma.

- Pero el primer programa es **mucho más fácil de leer y modificar** que el
  segundo, aunque los dos resuelvan el mismo problema.

- Si un programa se escribe de cualquier manera, aunque funcione correctamente,
  puede resultar engorroso, críptico, ilegible, casi imposible de modificar y
  de comprobar su corrección.

- Por tanto, lo que hay que hacer es **impedir que el programador pueda
  escribir programas de cualquier manera**, y para ello hay que **restringir
  sus opciones** a la hora de construir programas, de forma que el programa
  resultante sea fácil de leer, entender, mantener y verificar.

- Ese programa, una vez terminado, debe estar construido combinando sólo unos
  pocos tipos de componentes y cumpliendo una serie de restricciones.

## Programa restringido

- Un **programa restringido** es aquel que se construye combinando únicamente
  los tres siguientes componentes constructivos:

- **Sentencia**, que sirve para representar una instrucción (por ejemplo: de
  lectura, escritura, asignación...).

- **Condición**, que sirve para bifurcar el flujo del programa hacia un camino
  u otro dependiendo del valor de una expresión lógica.

- **Agrupamiento**, que sirve para agrupar lı́neas de flujo que procedan de
  distintos caminos.

:::: columns

::: {.column width=33%}

!IMGP(sentencia.!EXT)(Sentencia)(width=80%)(width=30%)

:::

::: {.column width=33%}

!IMGP(condicion.!EXT)(Condición)(width=80%)(width=30%)

:::

::: {.column width=33%}

!IMGP(agrupamiento.!EXT)(Agrupamiento)(width=70%)(width=20%)

:::

::::

## Programa propio

- Se dice que un programa restringido es un **programa propio** si reúne las
  tres **condiciones** siguientes:

  1. Posee un único punto de entrada y un único punto de salida.

  2. Para cualquiera de sus componentes, existe al menos un camino desde la
     entrada hasta él y otro camino desde él hasta la salida.

  3. No existen bucles infinitos.

- Esto permite que **un programa propio pueda formar parte de otro programa
  mayor**, apareciendo allí donde pueda haber una sentencia.

- Cuando varios programas propios se combinan para formar uno solo, el
  resultado es también un programa propio.

- Estas condiciones **restringen aún más el concepto de _programa_**, de modo
  que sólo serán válidos aquellos que estén diseñados mediante el uso apropiado
  del agrupamiento (con una sola entrada y una sola salida) y sin componentes
  superfluos o formando bucles sin salida.

---

- Este es un ejemplo de un programa que no es propio porque **no tiene una
  única salida**:

  !IMGP(condicion-no-propio.!EXT)()(width=45%)(width=40%)

- **Agrupando** las salidas se obtiene un programa propio:

  !IMGP(seleccion.!EXT)()(width=50%)(width=40%)

---

- Ese programa propio ahora puede formar parte de otro programa mayor, ya que,
  al tener una sola entrada y una sola salida, puede actuar como una sentencia
  y aparecer allí donde pueda haber una sentencia:

!IMGP(programa-propio-dentro-de-otro.!EXT)()(width=90%)(width=70%)

---

- Aquí se observa otro programa que no es propio, ya que **existen componentes
  (los *A*, *C* y *q*) que no tienen un camino hasta la salida**; si el
  programa llegara hasta esos componentes se quedaría bloqueado en un ciclo sin
  fin, pues no es posible terminar la ejecución:

!IMGP(diagrama-no-propio.!EXT)()(width=90%)(width=70%)

---

- Aquí aparece un programa que tampoco es propio porque contiene **componentes
  inaccesibles** desde la entrada del diagrama:

!IMGP(diagrama-inaccesibles.!EXT)()(width=50%)(width=40%)

## Estructura

- Las **estructuras** son construcciones sintácticas que pueden **anidarse
completamente** unas dentro de otras.

- Eso significa que, dadas dos estructuras cualesquiera, o una está incluida
  completamente dentro de la otra, o no se tocan en absoluto.

- Por tanto, los bordes de dos estructuras nunca pueden cruzarse:

!SALTOLARGOBEAMER

:::: columns

::: column

!DOT(estructura-si.svg)(Estructuras)(width=90%)(width=60%)
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

!DOT(estructura-no.svg)(Estas no son estructuras)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [layout = neato]
A [pos="-0.5,0.0!", fillcolor = transparent]
B [pos="0.0,-0.2!", fillcolor = transparent]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las estructuras forman los componentes constructivos básicos de cualquier
  programa estructurado.

- Por tanto, un programa estructurado se crea combinando entre sí varias
  estructuras.

- Sintácticamente, una estructura es una unidad compuesta por varias sentencias
  que actúan como una sola.

- Toda estructura, por tanto, representa una **sentencia compuesta** que actúa
  como un miniprograma propio y, por tanto, con un único punto de entrada y un
  único punto de salida.

## Programa estructurado

- Un **programa estructurado** es un programa construido combinando las
  siguientes estructuras (llamadas **estructuras de control**):

  #. La **estructura secuencial**, **_secuencia_** o **bloque** de una, dos o
  más sentencias *A*, *B*, *C*, etcétera.

     Los lenguajes que permiten la creación de bloques, incluyendo bloques
     dentro de otros bloques, se denominan **lenguajes estructurados en
     bloques**.

  #. La **estructura alternativa** o **_selección_** entre dos sentencias *A* y
     *B* dependiendo de un predicado *p*.

  #. La **estructura repetitiva** o **_iteración_**, que repite una sentencia
     *A* dependiendo del valor lógico de un predicado *p*.

- Las estructuras de control son **sentencias compuestas** que contienen, a su
  vez, otras sentencias.

---

:::: columns

::: column

!IMGP(secuencia.!EXT)(Secuencia)(width=100%)(width=50%)

!SALTO

!IMGP(seleccion.!EXT)(Selección)(width=100%)(width=50%)

!SALTO

!IMGP(iteracion.!EXT)(Iteración)(width=100%)(width=50%)

:::

::: column

- En pseudocódigo:

  - Secuencia:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    $A$
$B$
~~~~~~~~~~~~~~~~~~~~~~~

    !SALTO

  - Selección:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    **si** $p$ **entonces**
      $A$
**sino**
      $B$
~~~~~~~~~~~~~~~~~~~~~~~

    !SALTO

  - Iteración:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~
    **mientras** $p$ **hacer**
      $A$
~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Cada una de las sentencias que aparecen en una estructura (las indicadas
  anteriormente como _A_ y _B_) pueden ser, a su vez, estructuras.

  - Esto es así porque una estructura también es una sentencia (que en este
    caso sería una sentencia *compuesta* en lugar de una sentencia *simple*).

  - Por tanto, una estructura puede aparecer en cualquier lugar donde se espere
    una sentencia.

- Resumiendo, en un programa podemos tener **dos tipos de sentencias**:

  - **Sentencias _simples_**.

  - **Estructuras de control**, que son sentencias **_compuestas_** formadas a
    su vez por otras sentencias (que podrán ser, a su vez, simples o
    compuestas, recursivamente).

- Por consiguiente, **todo programa puede verse como una única sentencia**,
  simple o compuesta por otras.

---

- Esto tiene una consecuencia más profunda: si un programa es una sentencia,
  también puede decirse que cada sentencia es como un programa en sí mismo.

- Como las estructuras de control también son sentencias, **cada estructura de
  control es como un _miniprograma_ dentro del programa**.

- Ese miniprograma debe cumplir las propiedades de los programas propios (los
  programas que no son propios no nos interesan).

- Por eso, las estructuras:

  #. Siempre tienen un único punto de entrada y un único punto de salida.

  #. Tienen un camino desde la entrada a cada sentencia de la estructura, y un
     camino desde cada una de ellas hasta la salida.

  #. No debe tener bucles infinitos.

---

- Un programa estructurado equivalente al del ejemplo anterior, pero mucho más
  claro, sería:

:::: columns

::: {.column width=65%}

!IMGP(claro.!EXT)()(width=90%)(width=80%)

:::

::: {.column width=35%}

Los cuadrados de trazo discontinuo representan las estructuras que forman el
programa.

!SALTO

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~
**leer** $a$
**leer** $b$
**mientras** $a !NEQ b$ **hacer**
      **si** $a < b$ **entonces**
            $b \longleftarrow b - a$
      **sino**
            $a \longleftarrow a - b$
**escribir** $a$
~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

### Ventajas de los programas estructurados

- Las principales **ventajas de los programas estructurados** frente a los no
  estructurados son:

  - Son más fáciles de entender, ya que básicamente **se pueden leer de arriba
    abajo** de estructura en estructura como cualquier otro texto sin tener que
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

- Y además, por su naturaleza estructurada resultan programas más sencillos,
  claros y fáciles de entender, mantener y verificar.

- En consecuencia, no hay excusa para no estructurar nuestros programas.

# Estructuras básicas de control en Python

## Secuencia

- La **secuencia** (o _estructura secuencial_) en Python consiste sencillamente
  en poner cada sentencia una tras otra **al mismo nivel de indentación**.

- No requiere de ninguna otra sintaxis particular ni palabras clave.

- **Una secuencia de sentencias actúa sintácticamente como si fuera una sola
  sentencia**; por lo tanto, en cualquier lugar del programa donde se pueda
  poner una sentencia, se puede poner una secuencia de sentencias (que
  actuarían como una sola formando un **bloque**).

- Esto es así porque, como vimos, toda sentencia puede ser simple o compuesta
  (una estructura) y, por tanto, **toda estructura es también una sentencia**
  (actúa como si fuera una única sentencia pero compuesta por otras de forma
  recursiva).

- Por tanto, en cualquier lugar donde se pueda poner una sentencia, se puede
  poner una estructura.

---

:::: columns

::: column

- La sintaxis es, sencillamente:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(secuencia) ::=
!NT(sentencia)
!NT(sentencia)\*
  ~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Las sentencias deben empezar todas en el mismo nivel de indentación (misma
  posición horizontal o _columna_).

- Puede haber líneas en blanco entre las sentencias del mismo bloque.

:::

::::


!CAJA
~~~~~~~~~~~~~~~~~
**Concepto fundamental:**

En Python, la **estructura** del programa viene definida por la **indentación**
del código.

Por tanto, las instrucciones que aparecen consecutivamente una tras otra en el
mismo nivel de indentación (es decir, las que empiezan en la misma columna en
el archivo fuente) pertenecen a la misma estructura.
~~~~~~~~~~~~~~~~~

---

- Ejemplo:

  ```python
  x = 1
  y = 2
  f = lambda a, b: a + b
  z = f(x + y)
  ```

  Estas cuatro sentencias, al estar todas consecutivas en el mismo nivel de
  indentación, actúan como una sola sentencia en bloque (forman una estructura
  _secuencial_) y se ejecutan en orden de arriba abajo.

- A partir de ahora, tenemos que una sentencia puede ser simple o compuesta (es
  decir, una estructura), y esa sentencia compuesta puede ser una secuencia:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia) ::= !NT(sentencia_simple) | !NT(estructura)
!NT(estructura) ::= !NT(secuencia)
!NT(secuencia) ::=
!NT(sentencia)
!NT(sentencia)\*
~~~~~~~~~~~~~~~~~~~~

## Selección

:::: columns

::: {.column width=40%}

- La **selección** (o _estructura alternativa_) en Python tiene la siguiente
  sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(selección) ::=
!T(if) !NT(condición)!T(:)
      !NT(sentencia)
[!T(elif) !NT(condición)!T(:)
      !NT(sentencia)]*
[!T(else)!T(:)
      !NT(sentencia)]
  ~~~~~~~~~~~~~~~~~~~~

- También se la llama «**sentencia !PYTHON(if)**».

:::

::: {.column width=60%}

- Ejemplos:

  ```python
  if 4 == 3:
      print('Son distintos')
      x = 5
  ```

  ```python
  if 4 == 3:
      print('Son distintos')
      x = 5
  else:
      print('Son iguales')
      x = 9
  ```

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

---

- La estructura alternativa está formada por una sucesión de cláusulas que
  asocian una condición con una sentencia.

- Las cláusulas van marcadas con !PYTHON(if:), !PYTHON(elif:) o !PYTHON(else:).

- Las condiciones se van comprobando de arriba abajo, en el orden en que
  aparecen, de forma que primero se comprueba la condición del !PYTHON(if:) y
  después las diferentes !PYTHON(elif:), si las hay.

- En el momento en que se cumple una de las condiciones, se ejecuta su
  sentencia correspondiente y se sale de la estructura alternativa (no se sigue
  comprobando más).

- Si no se cumple ninguna condición y hay una cláusula !PYTHON(else:), se
  ejecutará la sentencia de ésta.

- Si no se cumple ninguna condición y no hay cláusula !PYTHON(else:), no se
  ejecuta ninguna sentencia.

- Puede haber cláusulas !PYTHON(elif:) y no haber !PYTHON(else:).

---

- En el siguiente código:

  ```{.python .number-lines}
  a = 4
  b = 3
  if a != b:
      print('Son distintos')
      x = 5
  else:
      print('Son iguales')
  ```

  tenemos las siguientes estructuras, anidadas una dentro de la otra:

  #. Una _secuencia_ formada por un bloque de tres sentencias: las asignaciones
     !PYTHON(a = 4) y !PYTHON(b = 3) y la sentencia !PYTHON(if ... else) que va
     desde la línea 3 hasta la 7.

  #. La _selección_ !PYTHON(if ... else).

  #. Una _secuencia_ formada por las sentencias de las líneas 4--5.

- Recordemos: cada estructura es una sentencia en sí misma, y contiene a otras
  sentencias (que pueden ser simples u otras estructuras).

---

- Aquí se ven representadas visualmente las estructuras que forman el código
  fuente del programa:

  !IMGP(estructuras-de-control-if.!EXT)(Representación de las distintas estructuras que forman el código)(width=50%)(width=40%)

- Se aprecia claramente que hay tres estructuras (dos secuenciales y una
  alternativa) y cinco sentencias simples (las asignaciones y los
  !PYTHON(print)), por lo que hay ocho sentencias en total.

---

- Ahora nuestra gramática se amplía:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia) ::= !NT(sentencia_simple) | !NT(estructura)
!NT(estructura) ::= !NT(secuencia) | !NT(selección)
!NT(selección) ::=
!T(if) !NT(condición)!T(:)
      !NT(sentencia)
[!T(elif) !NT(condición)!T(:)
      !NT(sentencia)]*
[!T(else)!T(:)
      !NT(sentencia)]
~~~~~~~~~~~~~~~~~~~~

## Iteración

- La **iteración** (o _estructura iterativa_ o _repetitiva_) en Python tiene la
  siguiente sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(iteración) ::=
!T(while) !NT(condición)!T(:)
      !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~

- A esta estructura también se la llama «**sentencia !PYTHON(while)**»,
  «**bucle !PYTHON(while)**» o, simplemente, «**bucle**».

- También se dice que la !NT(sentencia) es el «**cuerpo**» del bucle.

---

- La estructura repetitiva asocia una condición a una sentencia, de forma que
  lo primero que se hace nada más entrar en la estructura es comprobar la
  condición:

  - **Si la condición no se cumple**, se salta la sentencia y se sale de la
    estructura, pasando a la siguiente sentencia que haya tras el bucle.

  - **Si la condición se cumple**, se ejecuta la sentencia y se vuelve otra vez
    al principio de la estructura, donde se volverá a comprobar si la condición
    se cumple.

    Este ciclo ciclo de «_comprobación y ejecución_» se repite una y otra vez
    hasta que se compruebe que la condición ya no se cumple, momento en el que
    se saldrá del bucle.

- Cada vez que se ejecuta el cuerpo del bucle decimos que se ha producido una
  **iteración** o **paso** del bucle.

- Es importante observar que la comprobación de la condición se hace justo al
  principio de cada iteración, es decir, justo antes de ejecutar la sentencia
  en la iteración actual.

!EJEMPLOS

:::: columns

::: column

- El siguiente código:

  ```python
  x = 0
  while x < 5:
      print(x)
      x += 1
  print('Fin')
  ```

  genera la siguiente salida:

  ```
  0
  1
  2
  3
  4
  Fin
  ```

:::

::: column

!IMGP(estructuras-de-control-while1.!EXT)(Estructuras en el código)(width=60%)(width=20%)

:::

::::

---

!ifdef(LATEX)(\newpage)

```python
salida = False
while not salida:
    x = input('Introduce un número: ')
    if x == '2':
        salida = True
    print(x)
```

!IMGP(estructuras-de-control-while2.!EXT)(Estructuras en el código)(width=60%)(width=50%)

---

- Si la condición se cumple siempre y nunca evalúa a !PYTHON(False), la
  ejecución nunca saldrá del bucle y tendremos lo que se denomina un **bucle
  infinito**.

- Generalmente, los bucles infinitos indican un fallo en el programa y, por
  tanto, hay que evitarlos en la medida de lo posible.

  Sólo en casos muy particulares resulta lógico y conveniente tener un bucle
  infinito.

- Por ejemplo, los siguientes bucles serían infinitos:

  ```python
  while True:
      print("Hola")
  ```

  ```python
  i = 0
  while i >= 0:
      print("Hola")
      i += 1
  ```

---

- Ahora ampliamos de nuevo nuestra gramática, esta vez con la estructura de
  iteración (o sentencia !PYTHON(while)):

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia) ::= !NT(sentencia_simple) | !NT(estructura)
!NT(estructura) ::= !NT(secuencia) | !NT(selección) | !NT(iteración)
!NT(iteración) ::=
!T(while) !NT(condición)!T(:)
      !NT(sentencia)
~~~~~~~~~~~~~~~~~~~~

!ifdef(LATEX)(\newpage)

## Otras sentencias de control

### !PYTHON(break)

- La sentencia !PYTHON(break) finaliza el bucle que la contiene.

- El flujo de control del programa pasa a la sentencia inmediatamente posterior
  al cuerpo del bucle.

- Si la sentencia !PYTHON(break) se encuentra dentro de un bucle anidado (un
  bucle dentro de otro bucle), finalizará el bucle más interno.

  ```python
  j = 0
  s = "string"
  while j < len(s):
      val = s[j]
      j += 1
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

### !PYTHON(continue)

- La sentencia !PYTHON(continue) se usa para saltarse el resto del código
  dentro de un bucle en la iteración actual.

- El bucle no finaliza sino que continúa con la siguiente iteración.

  ```python
  j = 0
  s = "string"
  while j < len(s):
      val = s[j]
      j += 1
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
  mensaje: los tipos del ejemplo anterior son !PYTHON(ZeroDivisionError),
  !PYTHON(NameError) y !PYTHON(TypeError).

- El resto de la línea proporciona detalles sobre el tipo de excepción y qué lo
  causó.

#### Gestión de excepciones

- Es posible escribir programas que gestionen excepciones concretas.

- Para ello se utiliza una estructura de control llamada
  !PYTHON(try ... except).

- La sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(gestión_excepciones) ::=
!T(try:)
      !NT(sentencia)
\(!T(except) [!NT(excepcion) [!T(as) !NT(identificador)]]!T(:)
      !NT(sentencia))!MAS()
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

  - Se intenta ejecutar el bloque de sentencias del !PYTHON(try).

  - Si durante su ejecución no se levanta ninguna excepción, se saltan los
    !PYTHON(except) y se ejecutan las sentencias del !PYTHON(else) (si existe).

  - Si se levanta alguna excepción, se busca (por orden de arriba abajo) algún
    !PYTHON(except) que cuadre con el tipo de excepción que se ha lanzado y, si
    se encuentra, se ejecutan sus sentencias asociadas.

  - Finalmente, y en cualquier caso (se haya levantado alguna excepción o no),
    se ejecutan las sentencias del !PYTHON(finally) (si existe).

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

---

- Y volvemos a ampliar de nuevo nuestra gramática:

!ALGO
~~~~~~~~~~~~~~~~~~~~
!NT(sentencia) ::= !NT(sentencia_simple) | !NT(estructura)
!NT(estructura) ::= !NT(secuencia)
                        | !NT(selección)
                        | !NT(iteración)
                        | !NT(gestión_excepciones)
!NT(gestión_excepciones) ::=
!T(try:)
      !NT(sentencia)
\(!T(except) [!NT(excepcion) [!T(as) !NT(identificador)]]!T(:)
      !NT(sentencia))!MAS()
[!T(else:)
      !NT(sentencia)]
[!T(finally:)
      !NT(sentencia)]
~~~~~~~~~~~~~~~~~~~~

### Gestores de contexto

- A veces un programa necesita trabajar con recursos externos:

  - Archivos locales.

  - Conexiones a bases de datos.

  - Conexiones de red.

- Trabajar con esos recursos siempre implica los siguientes pasos:

  #. Abrir el recurso (solicitar la apertura o la conexión al sistema
     operativo).

  #. Usar el recurso.

  #. Cerrar el recurso (solicitar su cierre o su desconexión al sistema
     operativo).

---

- Por ejemplo, al trabajar con archivos hay que:

  #. Abrir el archivo con !PYTHON(f = open(...)).

  #. Usar el archivo con !PYTHON(f.read(...)), !PYTHON(f.write(...)), etc.

  #. Cerrar el archivo con !PYTHON(f.close()).

- La **cantidad de recursos abiertos** al mismo tiempo está **limitada** por el
  sistema operativo o el intérprete.

  Por ejemplo, si intentamos abrir demasiados archivos a la vez, el intérprete
  nos devolverá el error: `OSError: [Errno 24] Too many open files`.

- Además, cada recurso abierto consume, a su vez, recursos del sistema
  operativo o del intérprete (memoria, descriptores internos, etcétera).

- Por ello, es importante **acordarse de cerrar el recurso** una vez hayamos
  terminado de trabajar con él, para que el sistema operativo o el intérprete
  pueda liberar los recursos que está consumiendo y éstos se puedan reutilizar.

---

- Para ello, se puede usar un !PYTHON(try ... finally):

  ```python
  f = open('hola.txt', 'w')
  try:
      f.write('¡Hola, mundo!')
  finally:
      f.close()
  ```

  Esto garantiza que el archivo se cerrará aunque el !PYTHON(f.write(...))
  levante una excepción.

- Los gestores de contexto son un mecanismo más cómodo y elegante para trabajar
  con recursos y asegurarse de que se cierran al final.

- Para ello, se usa la sentencia !PYTHON(with ... as), cuya sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(gestor_contexto) ::=
!T(with) !NT(expresión) [!T(as) !NT(identificador)]!T(:)
      !NT(sentencia)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El siguiente código es equivalente al anterior:

  ```python
  with open('hola.txt', 'w') as f:
      f.write('¡Hola, mundo!')
  ```

---

- La sentencia !PYTHON(with ... as) es una estructura de control que hace lo
  siguiente:

  #. Evalúa la !NT(expresión), que deberá devolver un **gestor de recursos**.

     Los gestores de recursos son objetos que responden a los métodos
     !PYTHON(__enter__) y !PYTHON(__exit__).

  #. Llama al método !PYTHON(__enter__) sobre el objeto, el cual debe abrir y
     devolver el recurso.

  #. Ese recurso se asigna a la variable del !PYTHON(identificador).

  #. Ejecuta la !PYTHON(sentencia) que, por supuesto, puede ser simple o
     compuesta.

  #. Cuando termina de ejecutar la sentencia, llama al método !PYTHON(__exit__)
     sobre el objeto inicial, el cual se encargará de cerrar el recurso.

- Por tanto, al salir de la estructura de control !PYTHON(with ... as), se
  garantiza que el recurso asignado a !PYTHON(f) está cerrado.

---

- Eso significa que, en el siguiente código, la última llamada al método
  !PYTHON(write) fallará al no estar abierto el recurso:

  ```python
  >>> with open('hola.txt', 'w') as f:
  ...    f.write('¡Hola, mundo!')
  ...
  13
  >>> f.write('Esto fallará')
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ValueError: I/O operation on closed file.
  ```

# Metodología de la programación estructurada

## Diseño descendente por refinamiento sucesivo

- El diseño descendente es la técnica que consiste en descomponer un problema
  complejo en problemas más sencillos, realizándose esta operación de forma
  sucesiva hasta llegar al máximo nivel de detalle en el cual se pueden
  codificar directamente las operaciones en un lenguaje de programación
  estructurado.

- Con esta técnica, los programas se crean en distintos niveles de
  refinamiento, de forma que cada nuevo nivel define la solución de forma más
  concreta y subdivide las operaciones en otras más detalladas.

- Los programas se diseñan de lo general a lo particular por medio de sucesivos
  refinamientos o descomposiciones que nos van acercando a las instrucciones
  finales del programa. 

- El último nivel permite la codificación directa en un lenguaje de
  programación.

---

!IMGP(refinamiento.png)(Diseño descendente por refinamiento sucesivo)(width=60%)(width=45%)

## Recursos abstractos

- Descomponer un programa en términos de recursos abstractos consiste en
  descomponer una determinada sentencia compleja en sentencias mas simples,
  capaces de ser ejecutadas por un ordenador, y que constituirán sus
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

  donde el programa se plantea como una secuencia de dos sentencias: preguntar
  el tamaño de la tabla deseada y construir la tabla propiamente dicha.

- La sentencia «**leer $n$**» ya está suficientemente refinada (se puede
  traducir a un lenguaje de programación) pero la segunda no (por tanto, es un
  recurso abstracto).

- Podríamos traducir ya la sentencia «**leer $n$**» al lenguaje de
  programación, o podríamos esperar a tener todas las sentencias refinadas y
  traducirlas todas a la vez. En este caso, lo haremos de la primera forma.

---

- La construcción de la tabla se puede realizar fácilmente escribiendo en una
  fila los múltiplos de 1, en la fila inferior los múltiplos de 2, y así
  sucesivamente hasta que lleguemos a los múltiplos de $n$.

- Por tanto, el siguiente paso es refinar la sentencia abstracta «**construir
  la tabla de $n \times n$**», creando un nuevo nivel de refinamiento:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  **leer $n$**
  _{ construir la tabla de $n \times n$: }_
  $i \longleftarrow 1$
  **mientras** $i \leq n$ **hacer**
        **escribir la fila de $i$**
        $i \longleftarrow i + 1$
**fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde ahora aparece la sentencia «**escribir la fila de $i$**», que escribe
  cada una de las filas de la tabla, y que habrá que refinar porque no se puede
  traducir directamente al lenguaje de programación.

---

- En este (último) nivel refinamos la sentencia que nos falta, quedando:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **inicio**
  **leer $n$**
  _{ construir la tabla de $n \times n$: }_
  $i \longleftarrow 1$
  **mientras** $i \leq n$ **hacer**
        _{ escribir la fila de $i$: }_
        $j \longleftarrow 1$
        **mientras** $j \leq n$ **hacer**
              **escribir** $i \times j$
              $j \longleftarrow j + 1$
        **escribir** un salto de línea
        $i \longleftarrow i + 1$
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

## Programación procedimental

- A un bloque de sentencias que realiza una tarea específica se le puede dar un
  **nombre**.

- De esta forma se crearía una única **unidad de código empaquetado que
  actuaría bajo ese nombre como una caja negra**, de manera que, para poder
  usarla, bastaría con **_llamarla_ invocando su nombre** sin tener que conocer
  sus detalles internos de funcionamiento.

- A este tipo de «_bloques con nombre_» se les denomina **subrutinas**,
  **subprogramas** o **procedimientos**.

---

- Los procedimientos nos ayudan a:

  - Descomponer el problema principal en subproblemas más pequeños que se
    pueden resolver por separado de una forma más o menos independiente del
    resto.

  - Ocultar la complejidad de partes concretas de un programa bajo capas de
    abstracción con diferentes niveles de detalle.

  - Desarrollar el programa mediante sucesivos refinamientos de cada nivel de
    abstracción.

- En definitiva, los procedimientos son **abstracciones**.

- La **_llamada_** o **_invocación_** a un procedimiento es una sentencia
  simple pero que provoca la ejecución de un bloque de sentencias.

- Por tanto, podría considerarse que **un procedimiento es una sentencia
  compuesta que actúa como una sentencia simple**.

---

- La **programación procedimental** es un paradigma de programación imperativa
  basada en los conceptos de **procedimiento** y **llamada a procedimientos**.

- En este paradigma, un programa imperativo está compuesto principalmente por
  procedimientos (bloques de sentencias con nombre) que se llaman entre sí.

- Los procedimientos pueden tener parámetros a través de los cuales reciben sus
  datos de entrada, caso de necesitarlos.

- A su vez, los procedimientos pueden devolver un resultado, de ser necesario.

- Los procedimientos, además, tienen su propio ámbito local y (dependiendo del
  lenguaje de programación usado) también podrían acceder a otros ámbitos no
  locales dentro del entorno, como el ámbito global.

---

- Cada lenguaje de programación procedimental establece sus propios mecanismos
  de creación de procedimientos.

- En Python, los procedimientos son las denominadas **funciones imperativas**.

- En los lenguajes orientados a objetos, los procedimientos serían los
  **métodos**, que son funciones imperativas que se ejecutan sobre objetos.

- Estudiaremos ahora cómo crear y usar funciones imperativas en Python.

- Al ser Python un lenguaje orientado a objetos además de procedimental, en su
  momento veremos también cómo crear métodos haciendo uso de funciones
  imperativas.

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
  !NT(definición_función) ::=
!T(def) !NT(nombre)!T{(}[!NT(lista_parámetros)]!T{)}!T(:)
      !NT(cuerpo)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- donde:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(lista_parámetros) ::= !T(identificador) [!T(,) !T(identificador)]\*
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
  decir, una **estructura** (como las estructuras de control !PYTHON(if),
  !PYTHON(while), etcétera).

- Por tanto, puede aparecer en cualquier lugar del programa donde pueda haber
  una sentencia.

- Como en cualquier otra estructura, las sentencias que contiene (las que van
  en el **cuerpo** de la función) van **indentadas** (o *sangradas*) dentro de
  la definición de la función.

- Por tanto (de nuevo, como en cualquier otra estructura), el final de la
  función se deduce al encontrarse una sentencia **menos indentada** que el
  cuerpo, o bien el final del *script*.

---

- La definición de una función es una sentencia ejecutable que, como cualquier
  otra definición, **crea una ligadura** entre un identificador (el nombre de
  la función) y **una variable que almacenará una referencia a la función**
  dentro del montículo.

- La definición de una función **no ejecuta el cuerpo de la función**. El
  cuerpo se ejecutará únicamente cuando se llame a la función, al igual que
  ocurría con las expresiones lambda.

- Esa definición se ejecuta en un determinado ámbito (normalmente, el ámbito
  global) y, por tanto, su ligadura y su variable **se almacenarán en el marco
  del ámbito donde se ha definido la función** (normalmente, el marco global).

- Asimismo, **el cuerpo de una función imperativa define un ámbito**, al igual
  que ocurría con las expresiones lambda.

---

!IMGP(ambitos-funciones-imperativas.!EXT)(El cuerpo de una función define un ámbito)(width=100%)(width=50%)

---

- Nuestra gramática se vuelve a ampliar para incluir las definiciones de
  funciones imperativas como un caso más de sentencia compuesta:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia) ::= !NT(sentencia_simple) | !NT(estructura)
!NT(estructura) ::= !NT(secuencia)
                             | !NT(selección)
                             | !NT(iteración)
                             | !NT(gestión_excepciones)
                             | !NT(definición_función)
!NT(definición_función) ::=
!T(def) !NT(nombre)!T{(}[!NT(lista_parámetros)]!T{)}!T(:)
      !NT(sentencia)
~~~~~~~~~~~~~~~~~~~~

## Llamadas a funciones imperativas 

- Cuando se llama a una función imperativa, ocurre lo siguiente (en este
  orden):

  1. Como siempre que se llama a una función, se crea un nuevo marco en el
     entorno (que contiene las ligaduras y variables locales a su ámbito,
     incluyendo sus parámetros) y se almacena en la pila de control.

  2. Se pasan los argumentos de la llamada a los parámetros de la función, de
     forma que los parámetros toman los valores de los argumentos
     correspondientes.
  
     Recordemos que en Python se sigue el orden aplicativo (o evaluación
     estricta): primero se evalúan los argumentos y después se pasan a los
     parámetros correspondientes.

  3. El flujo de control del programa se transfiere al bloque de sentencias que
     forman el cuerpo de la función y se empieza a ejecutar éste.

---

- Cuando se terminan de ejecutar las sentencias que forman el cuerpo de la
  función:

  1. Se genera su valor de retorno (en breve veremos cómo).

  2. Se saca su marco de la pila.
  
  3. Se devuelve el control de la ejecución a la sentencia que llamó a la
     función.

  4. Se sustituye, en dicha sentencia, la llamada a la función por su valor de
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

[Ver ejecución paso a paso en Pythontutor](http://pythontutor.com/visualize.html#code=def%20saluda%28persona%29%3A%0A%20%20%20%20print%28'Hola',%20persona%29%0A%20%20%20%20print%28'Encantado%20de%20saludarte'%29%0A%0Adef%20despide%28%29%3A%0A%20%20%20%20print%28'Hasta%20luego,%20Lucas'%29%0A%0Asaluda%28'Pepe'%29%0Aprint%28'El%20gusto%20es%20m%C3%ADo'%29%0Asaluda%28'Juan'%29%0Adespide%28%29%0Aprint%28'Sayonara,%20baby'%29&cumulative=false&curInstr=0&heapPrimitives=true&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target="\_blank"}

---

Una función puede llamar a otra.

:::: columns

::: column

- Por ejemplo, este programa:

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

[Ver ejecución paso a paso en Pythontutor](http://pythontutor.com/visualize.html#code=def%20saluda%28persona%29%3A%0A%20%20%20%20print%28'Hola',%20persona%29%0A%20%20%20%20quiensoy%28%29%0A%20%20%20%20print%28'Encantado%20de%20saludarte'%29%0A%0Adef%20despide%28%29%3A%0A%20%20%20%20print%28'Hasta%20luego,%20Lucas'%29%0A%0Adef%20quiensoy%28%29%3A%0A%20%20%20%20print%28'Me%20llamo%20Ricardo'%29%0A%0Asaluda%28'Pepe'%29%0Aprint%28'El%20gusto%20es%20m%C3%ADo'%29%0Asaluda%28'Juan'%29%0Adespide%28%29%0Aprint%28'Sayonara,%20baby'%29&cumulative=false&curInstr=0&heapPrimitives=true&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target=\_blank}

---

- La función debe estar definida antes de poder llamarla.

- Eso significa que el intérprete de Python debe ejecutar el !PYTHON(def) de
  una función antes de que el programa pueda llamar a esa función.

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
  parámetros de la función.

- Al entrar en la función, los parámetros contendrán los valores de los
  argumentos que se hayan pasado a la función al llamar a la misma.

- Existen distintos mecanismos de paso de argumentos, dependiendo del lenguaje
  de programación utilizado. 

- Los más conocidos son los llamados **paso de argumentos _por valor_** y
  **paso de argumentos _por referencia_**.

- En Python existe un único mecanismo de paso de argumentos llamado **paso de
  argumentos _por asignación_**, que en la práctica resulta bastante sencillo:

  Lo que hace el intérprete es **_asignar_ el argumento al parámetro**, como si
  hiciera internamente !NT(parámetro) `=` !NT(argumento), por lo que se aplica
  todo lo relacionado con los _alias_ de variables, mutabilidad, etc.

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

- En la línea 5 se llama a `saluda` asignándole al parámetro !PYTHON(persona)
  el valor !PYTHON('Manolo') (como si se hiciera !PYTHON(persona = Manolo)).

- En la línea 7 se llama a `saluda` asignándole al parámetro !PYTHON(persona)
  el valor de !PYTHON(x), como si se hiciera !PYTHON(persona) `=` !PYTHON(x),
  lo que sabemos que crea un *alias*.

  En este caso, la creación del alias no nos afectaría, ya que el valor pasado
  como argumento es una cadena y, por tanto, inmutable.

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

- La función es capaz de **cambiar el estado interno de la lista que se ha
  pasado como argumento** porque:
  
  - Al llamar a la función, el argumento !PYTHON(lista) se pasa a la función
    **asignándola** al parámetro !PYTHON(l) como si hubiera hecho
    !PYTHON(l) `=` !PYTHON(lista).
  
  - Eso hace que ambas variables sean *alias* una de la otra (se refieren al
    mismo objeto lista).
  
  - Por tanto, la función está modificando el valor de la variable
    !PYTHON(lista) que se ha pasado como argumento.

## La sentencia !PYTHON(return)

- Para devolver el resultado de la función al código que la llamó, hay que usar
  una sentencia !PYTHON(return).

- Cuando el intérprete encuentra una sentencia !PYTHON(return) dentro de una
  función, ocurre lo siguiente (en este orden):

  #. Se genera el valor de retorno de la función, que será el valor de la
     expresión que aparece en la sentencia !PYTHON(return).

  #. Se finaliza la ejecución de la función, sacando su marco de la pila.
  
  #. Se devuelve el control a la sentencia que llamó a la función.
  
  #. En esa sentencia, se sustituye la llamada a la función por su valor de
     retorno (el calculado en el paso 1 anterior).

  #. Se continúa la ejecución del programa desde ese punto.

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

- En la línea 6 se llama a la función !PYTHON(suma) pasándole como argumentos
  los valores de !PYTHON(a) y !PYTHON(b), asignándolos a !PYTHON(x) e
  !PYTHON(y), respectivamente.

- Dentro de la función, en la sentencia !PYTHON(return) se calcula la suma
  !PYTHON(x) `+` !PYTHON(y) y se finaliza la ejecución de la función,
  devolviendo el control al punto en el que se la llamó (la línea 6) y haciendo
  que su valor de retorno sea el valor calculado en la suma anterior (el valor
  de la expresión que acompaña al !PYTHON(return)).

---

- El valor de retorno de la función sustituye a la llamada a la función en la
  expresión en la que aparece dicha llamada, al igual que ocurre con las
  expresiones lambda.

- Por tanto, una vez finalizada la ejecución de la función, la línea 6 se
  reescribe sustituyendo la llamada a la función por su valor.

- Si, por ejemplo, suponemos que el usuario ha introducido los valores
  !PYTHON(5) y !PYTHON(7) en las variables !PYTHON(a) y !PYTHON(b),
  respectivamente, tras finalizar la ejecución de la función tendríamos que la
  línea 6 quedaría:

  ```python
  resultado = 12
  ```

  y la ejecución del programa continuaría ejecutando la sentencia tal y como
  está ahora.

---

- También es posible usar la sentencia !PYTHON(return) sin devolver ningún
  valor.

- En ese caso, su utilidad es la de finalizar la ejecución de la función en
  algún punto intermedio de su código.

- Pero en Python todas las funciones devuelven algún valor.

- Lo que ocurre en este caso es que la función devuelve el valor !PYTHON(None).

- Por tanto, la sentencia !PYTHON(return) sin valor de retorno equivale a hacer
  !PYTHON(return None).

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
  antes ninguna sentencia !PYTHON(return), es como si la última sentencia del
  cuerpo de la función fuese un !PYTHON(return) sin valor de retorno.

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

- Esa última sentencia !PYTHON(return) nunca es necesario ponerla, ya que la
  ejecución de una función termina automáticamente (y retorna al punto donde se
  la llamó) cuando ya no quedan más sentencias que ejecutar en su cuerpo.

## Ámbito de variables

- La función !PYTHON(suma) se podría haber escrito así:

  ```python
  def suma(x, y):
      res = x + y
      return res
  ```

  y el efecto final habría sido el mismo.

- La variable !PYTHON(res) que aparece en el cuerpo de la función es una
  **variable local** y sólo existe dentro de la función. Por tanto, esto sería
  incorrecto:

  ```{.python .number-lines}
  def suma(x, y):
      res = x + y
      return res

  resultado = suma(4, 3)
  print(res)  # da error
  ```

  Fuera de la función, la variable !PYTHON(res) no está definida en el entorno
  (que está formado sólo por el marco global) y por eso da error en la línea 6.

---

- Eso significa que se crea un nuevo marco en el entorno que contendrá, al
  menos, los parámetros, las variables locales y las ligaduras locales a la
  función.

  ```{.python .number-lines}
  def suma(x, y):
      res = x + y
      return res

  resultado = suma(4, 3)
  print(resultado)
  ```

- Ese marco es, por tanto, el **espacio de nombres** donde se almacenará todo
  lo que sea local a la función.

!SALTOLARGOBEAMER

:::: columns

::: {.column width=60%}

!DOT(funcion-entorno-dentro.svg)(Entorno dentro de la función `suma`)(width=80%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
4 [shape = circle]
3 [shape = circle]
7 [shape = circle]
lambda [shape = circle, label = "λ"]
y [shape = plaintext, fillcolor = transparent]
suma [shape = plaintext, fillcolor = transparent]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    suma [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>suma|<f1>⬤}"]
}
suma:f1 -> lambda
subgraph cluster1 {
    label = <Marco de <font face="monospace">suma(4, 3)</font>>
    bgcolor = white
    x [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>x|<f1>⬤}"]
    y [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>y|<f1>⬤}"]
    res [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>res|<f1>⬤}"]
}
x:f1 -> 4
y:f1 -> 3
res:f1 -> 7
x -> suma [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=40%}

!DOT(funcion-entorno-fuera.svg)(Entorno en la línea 6)(width=80%)(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                       
compound = true
7 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    node [fontname = "monospace"]
    suma [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>suma|<f1>⬤}"]
    resultado [shape = record, fillcolor = white, width = 0.5, height = 0.3, label = "{<f0>resultado|<f1>⬤}"]
}
suma:f1 -> lambda
resultado:f1 -> 7
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> suma [lhead = cluster0]
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
  
- En cambio, se produce un error !PYTHON(UnboundLocalError) si se intenta usar
  una **variable local** antes de asignarle un valor:

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
  x = 4          # esta variable es global
  
  def prueba():
      print(x)   # accede a la variable 'x' global, que vale 4

  prueba()       # imprime 4
  ```

---

- Pero para poder **modificar** una variable global es necesario que la función
  la declare previamente como *global*.

- De no hacerlo así, el intérprete supondría que el programador quiere crear
  una variable local que tiene el mismo nombre que la global:

  ```python
  x = 4          # esta variable es global

  def prueba():
      x = 5      # crea una variable local

  prueba()
  print(x)       # imprime 4
  ```

- Como en Python no existen las *declaraciones* de variables, el intérprete
  tiene que **_averiguar_ por sí mismo qué ámbito tiene una variable**.

- Lo hace con una regla muy sencilla:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si hay una **asignación** a una variable en cualquier lugar **dentro** de una
  función, esa variable se considera **local** a la función.
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

- Como la función !PYTHON(prueba) asigna un valor a !PYTHON(x), Python
  considera que !PYTHON(x) es local a la función.

- Pero en la expresión !PYTHON(x + 4), la variable !PYTHON(x) aún no tiene
  ningún valor asignado, por lo que genera un error «*variable local `x`
  referenciada antes de ser asignada*».

#### !PYTHON(global)

- Para informar al intérprete que una determinada variable es global, se usa la
  sentencia !PYTHON(global):

  ```python
  x = 4

  def prueba():
      global x  # informa que la variable 'x' es global
      x = 5     # cambia el valor de la variable global 'x'

  prueba()
  print(x)  # imprime 5
  ```

- La sentencia !PYTHON(global x) es una **declaración** que informa al
  intérprete de que la variable `x` debe buscarla únicamente en el marco
  global y que, por tanto, debe saltarse los demás marcos que haya en el
  entorno.

---

- Si la variable global no existe en el momento de realizar la asignación, se
  crea. Por tanto, una función puede crear nuevas variables globales usando
  !PYTHON(global):

  ```python
  def prueba():
      global y  # informa que la variable 'y' (que aún no existe) es global
      y = 9     # se crea una nueva variable global 'y' que antes no existía

  prueba()
  print(y)  # imprime 9
  ```

---

- Las reglas básicas de uso de la sentencia !PYTHON(global) en Python son:

  - Cuando se crea una variable **dentro** de una función (asignándole un
    valor), por omisión es **local**.

  - Cuando se crea una variable **fuera** de una función, por omisión es
    **global** (no hace falta usar la sentencia !PYTHON(global)).

  - Se usa la sentencia !PYTHON(global) para cambiar el valor de una variable
    global _dentro_ de una función (si la variable global no existía
    previamente, se crea durante la asignación).

  - El uso de la sentencia !PYTHON(global) _fuera_ de una función no tiene
    ningún efecto.

  - La sentencia !PYTHON(global) debe aparecer *antes* de que se use la
    variable global correspondiente.

#### Efectos laterales

- Cambiar el estado de una variable global es uno de los ejemplos más claros y
  conocidos de los llamados **efectos laterales**.

- Recordemos que **una función tiene (o provoca) efectos laterales cuando
  provoca cambios de estado observables desde el exterior de la función**, más
  allá de calcular y devolver su valor de retorno.

- Por ejemplo:

  - Cuando cambia el valor de una variable global.

  - Cuando cambia un argumento mutable.

  - Cuando realiza una operación de entrada/salida.

  - Cuando llama a otras funciones que provocan efectos laterales.

- Los efectos laterales hacen que el comportamiento de un programa sea más
  difícil de predecir.

---

- La pureza o impureza de una función tienen mucho que ver con los efectos
  laterales.

- Una función es **pura** si, desde el punto de vista de un observador externo,
  el único efecto que produce es calcular su valor de retorno, el cual sólo
  depende del valor de sus argumentos.

- Por tanto, una función es **impura** si cumple al menos una de las siguientes
  condiciones:

  - **Provoca efectos laterales**, porque está haciendo algo más que calcular
    su valor de retorno.

  - Su valor de retorno depende de algo más que de sus argumentos (p. ej., de
    una variable global).

- En una expresión, no podemos sustituir libremente una llamada a una función
  impura por su valor de retorno.

- Por tanto, decimos que una función impura no cumple la **transparencia
  referencial**.

---

- El siguiente es un ejemplo de **función impura**, ya que, además de calcular
  su valor de retorno, provoca el **efecto lateral** de ejecutar una
  **operación de entrada/salida** (la función !PYTHON(print)):

  ```python
  def suma(x, y):
      res = x + y
      print('La suma vale', res)
      return res
  ```

- Cualquiera que desee usar la función !PYTHON(suma), pero no sepa cómo está
  construida internamente, podría pensar que lo único que hace es calcular la
  suma de dos números, pero resulta que **también imprime un mensaje en la
  salida**, por lo que el resultado que se obtiene al ejecutar el siguiente
  programa no es el que cabría esperar:

:::: columns

::: column

- Programa:

  ```python
  resultado = suma(4, 3) + suma(8, 5)
  print(resultado)
  ```

:::

::: column

- Resultado:

  ```
  La suma vale 7
  La suma vale 13
  20
  ```

:::

::::

---

- No podemos sustituir libremente en una expresión las llamadas a la función
  !PYTHON(suma) por sus valores de retorno correspondientes.

- Es decir, no es lo mismo hacer:

  ```python
  resultado = suma(4, 3) + suma(8, 5)
  ```

  que hacer:

  ```python
  resultado = 7 + 13
  ```

  porque en el primer caso se imprimen cosas por pantalla y en el segundo no.

- Por tanto, la función !PYTHON(suma) es **impura** porque **no cumple la
  _transparencia referencial_**, y no la cumple porque provoca un **efecto
  lateral**.

---

- Si una función necesita **acceder al valor de una variable global**, también
  **pierde la transparencia referencial**, ya que la convierte en **impura**
  porque su valor de retorno puede depender de algo más que de sus argumentos
  (en este caso, del valor de la variable global).

- En consecuencia, la función podría producir **resultados distintos en
  momentos diferentes** ante los mismos argumentos:

  ```python
  def suma(x, y):
      res = x + y + z  # impureza: depende del valor de una variable global (z)
      return res

  z = 5
  print(suma(4, 3))  # imprime 12
  z = 2
  print(suma(4, 3))  # imprime 9
  ```

- En este caso, la función es **impura** porque, aunque no provoca efectos
  laterales, sí puede verse afectada por los efectos laterales que provocan
  otras partes del programa cuando modifican el valor de la variable global
  !PYTHON(z).

---

- Igualmente, el **uso de la sentencia !PYTHON(global)** supone otra forma más
  de **perder transparencia referencial** porque, gracias a ella, una función
  puede cambiar el valor de una variable global, lo que la convertiría en
  **impura** ya que provoca un **efecto lateral** (la modificación de la
  variable global).

- En consecuencia, esa misma función podría producir **resultados distintos en
  momentos diferentes** ante los mismos argumentos:

  ```python
  def suma(x, y):
      global z
      res = x + y + z  # impureza: depende del valor de una variable global
      z += 1           # efecto lateral: cambia una variable global
      return res

  z = 0
  print(suma(4, 3))  # imprime 7
  print(suma(4, 3))  # la misma llamada a función ahora imprime 8
  ```

---

- O también podría afectar a otras funciones que dependan del valor de la
  variable global.

- En ese caso, **ambas funciones serían impuras: la que provoca el efecto
  lateral y la que se ve afectada por ella**.

- Por ejemplo, las siguientes dos funciones son **impuras**, cada una por un
  motivo:

  ```python
  def cambia(x):
      global z
      z += x              # efecto lateral: cambia una variable global

  def suma(x, y):
      return x + y + z    # impureza: depende del valor de una variable global

  z = 0
  print(suma(4, 3))       # imprime 7
  cambia(2)               # provoca un efecto lateral
  print(suma(4, 3))       # ahora imprime 9
  ```

  `cambia` provoca un efecto lateral y `suma` depende de una variable global.

---

- Aunque los efectos laterales resultan indeseables en general, a veces es
  precisamente el efecto que deseamos.

- Por ejemplo, podemos diseñar una función que modifique los elementos de una
  lista en lugar de devolver una lista nueva:

  ```python
  def cambia(lista, indice, valor):
      lista[indice] = valor         # modifica el argumento recibido

  l = [1, 2, 3, 4]
  cambia(l, 2, 99)                  # cambia l
  print(l)                          # imprime [1, 2, 99, 4]
  ```

- Si la función no pudiera cambiar el interior de la lista que recibe como
  argumento, tendría que crear una lista nueva, lo que resultaría menos
  eficiente en tiempo y espacio:

  ```python
  def cambia(lista, indice, valor):
      nueva = lista[:]              # hace una copia de la lista
      nueva[indice] = valor         # modifica la copia
      return nueva                  # devuelve la copia

  l = [1, 2, 3, 4]
  print(cambia(l, 2, 99))           # imprime [1, 2, 99, 4]
  ```

## Funciones locales a funciones

- En Python es posible definir **funciones locales** a una función.

- Las funciones locales también se denominan **funciones internas** o
  **funciones anidadas**.

- Una función local se define **dentro** de otra función y, por tanto, sólo
  existe dentro de la función en la que se ha definido.

- Su **ámbito de definición** es el cuerpo de la función donde se ha definido,
  es decir, la función que la contiene.

- Pero al igual que pasa con las variables locales, la función sólo se pueden
  usar (llamar) después de haberse definido, es decir, después de haberse
  ejecutado el !PYTHON(def) de la función interna.

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

- La función !PYTHON(fact_iter) es local a la función `fact`.

- Por tanto, no se puede usar fuera de `fact`, ya que sólo existe en el ámbito
  de la función `fact` (es decir, en el cuerpo de la función `fact`).

---

- Tampoco se puede usar `fact_iter` dentro de `fact` *antes* de definirla:

  ```{.python .number-lines}
  def fact(n):
      print(fact_iter(n, 1))  # error: se usa antes de definirse
      def fact_iter(n, acc):  # aquí es donde empieza su definición
          if n == 0:
              return acc
          else:
              return fact_iter(n - 1, acc * n)
  ```

- Esto ocurre porque la sentencia !PYTHON(def) crea una ligadura entre
  `fact_iter` y su valor (la función), pero esa ligadura sólo empieza a existir
  cuando se ejecuta la sentencia !PYTHON(def), y no antes.

- Es importante recordar la diferencia entre el _ámbito de una ligadura_ y el
  _ámbito de creación de la ligadura_:

  - El **ámbito de creación de la ligadura** entre `fact_iter` y su valor es el
    cuerpo de la función `fact`.

  - El **ámbito de la ligadura** empieza en la línea 3 y acaba al final del
    ámbito de `fact` (no existe antes de la línea 3).

---

- Como cualquier otra función, las funciones locales también definen un nuevo
  ámbito.

- Ese nuevo ámbito está anidado dentro del ámbito de la función en la que se
  define.

  En el ejemplo anterior, el ámbito de `fact_iter` está contenido en el ámbito
  de `fact`.

- Como cualquier otro ámbito, ese nuevo ámbito crea un nuevo marco en el
  entorno.

- Y ese nuevo marco apunta al marco del ámbito que lo contiene, es decir, el
  marco de la función que contiene a la local.

  En el ejemplo anterior, el marco de `fact_iter` apunta al marco de `fact`, el
  cual a su vez apunta al marco global.

### !PYTHON(nonlocal)

- Una función local puede **acceder** al valor de las variables locales a la
  función que la contiene, ya que se encuentran dentro de su ámbito (aunque en
  otro marco).
  
- En cambio, cuando una función local quiere **modificar** el valor de una
  variable local a la función que la contiene, debe declararla previamente como
  **no local** con la sentencia !PYTHON(nonlocal).

- De lo contrario, al intentar cambiar el valor de la variable, el intérprete
  crearía una nueva variable local a la función actual, que haría sombra a la
  variable que queremos modificar y que pertenece a otra función.

- Es algo similar a lo que ocurre con la sentencia !PYTHON(global) y las
  variables globales, pero en ámbitos intermedios.

- La sentencia !PYTHON(nonlocal n) es una **declaración** que informa al
  intérprete de que la variable `n` debe buscarla en el entorno saltándose el
  marco de la función actual y el marco global.

---

  ```{.python .number-lines}
  def fact(n):
      def fact_iter(acc):
          nonlocal n
          if n == 0:
              return acc
          else:
              acc *= n
              n -= 1
              return fact_iter(acc)
      return fact_iter(1)

  print(fact(5))
  ```

- La función local `fact_iter` puede acceder a la variable `n`, ya que es una
  variable local a la función `fact` y, por tanto, está en el entorno de
  `fact_iter` (para eso no hace falta declararla como **no local**).

- Como, además, `n` está declarada **no local** en `fact_iter` (con
  la instrucción !PYTHON(nonlocal n) de la línea 3), la función `fact_iter`
  también puede modificar esa variable y no hace falta recibirla como argumento.

- Esa instrucción le indica al intérprete que, a la hora de buscar `n` en el
  entorno de `fact_iter`, debe saltarse el marco de `fact_iter` y el marco
  global y, por tanto, debe empezar a buscar en el marco de `fact`. 

<!--

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

-->

!SECCIONEJERCICIOS

@. Considérese la siguiente fórmula (debida a Herón de Alejandrı́a), que expresa
   el valor de la superficie S de un triángulo cualquiera en función de sus
   lados, a, b y c: $$S = \sqrt{\frac{a+b+c}{2}\left(\frac{a+b+c}{2}-a\right)\left(\frac{a+b+c}{2}-b\right)\left(\frac{a+b+c}{2}-c\right)}$$

    Escribir una función que obtenga el valor $S$ a partir de $a$, $b$ y $c$,
    evitando el cálculo repetido del semiperı́metro, $sp = \frac{a+b+c}{2}$, y
    almacenando el resultado finalmente en la variable S.

@. Escribir tres funciones que impriman las siguientes salidas en función de la
   cantidad de líneas que se desean (`␣` es un espacio en blanco):

        *****     ␣*         ␣␣␣␣*␣␣␣␣
        *****     ␣␣*        ␣␣␣***␣␣␣
        *****     ␣␣␣*       ␣␣*****␣␣
        *****     ␣␣␣␣*      ␣*******␣
        *****     ␣␣␣␣␣*     ␣␣␣␣*␣␣␣␣

---

@. Convertir una cantidad de tiempo (en segundos, $\mathbb{Z}$) en la
   correspondiente en horas, minutos y segundos, con arreglo al siguiente
   formato:

    3817 segundos = 1 horas, 3 minutos y 37 segundos

@. Escribir un programa que, en primer lugar, lea los coeficientes $a_2$ ,
   $a_1$ y $a_0$ de un polinomio de segundo grado $$a_2x^2 + a_1x + a_0$$ y
   escriba ese polinomio. Y, en segundo, lea el valor de $x$ y escriba qué
   valor toma el polinomio para esa $x$.

    Para facilitar la salida, se supondrá que los coeficientes y $x$ son
    enteros. Por ejemplo, si los coeficientes y $x$ son 1, 2, 3 y 2,
    respectivamente, la salida puede ser:

        1x^2 + 2x + 3
        p(2) = 9

---

@. Escribir un programa apropiado para cada una de las siguientes tareas:

    a. Pedir los dos términos de una fracción y dar el valor de la división
       correspondiente, a no ser que sea nulo el hipotético denominador, en
       cuyo caso se avisará del error.

    b. Pedir los coeficientes de una ecuación de segundo grado y dar las dos
       soluciones correspondientes, comprobando previamente si el discriminante
       es positivo o no.

    c. Pedir los coeficientes de la recta $ax + by + c = 0$ y dar su pendiente
       y su ordenada en el origen en caso de que existan, o el mensaje
       apropiado en otro caso.

    d. Pedir un número natural $n$ y dar sus divisores.

---



@. Escribir un programa que lea un carácter, correspondiente a un dígito
   hexadecimal:

    !CENTRAR
    ~~~~~~~~~~~~~~~~~~~~~~~
    `0`, `1`, ..., `9`, `A`, `B`, ..., `F`
    ~~~~~~~~~~~~~~~~~~~~~~~

    y lo convierta en el valor decimal correspondiente:

    !CENTRAR
    ~~~~~~~~~~~~~~~~~~~~~~~
    `0`, `1`, ..., `9`, `10`, `11`, ..., `15`
    ~~~~~~~~~~~~~~~~~~~~~~~

@. Para hallar en qué fecha cae el Domingo de Pascua de un `anyo` cualquiera,
   basta con hallar las cantidades `a` y `b` siguientes:

    ```python
    a = (19 * (anyo % 19) + 24) % 30
    b = (2 * (anyo % 4) + 4 * (anyo % 7) + 6 * a + 5) % 7
    ```

    y entonces, ese Domingo es el *22 de marzo + `a` + `b` días*, que podrı́a
    caer en abril. Escriba un programa que realice estos cálculos, produciendo
    una entrada y salida claras.

---

@. Escribir una función para hallar $\binom{n}{k}$, donde $n$ y $k$ son datos
   enteros positivos,

    a. mediante la fórmula $\frac{n!}{(n-k)!k!}$

    b. mediante la fórmula $\frac{n(n-1)\cdots(k+1)}{(n-k)!}$

    ¿Qué ventajas presenta la segunda con respecto a la primera?

!BIBLIOGRAFIA
