---
title: Programación estructurada
author: Ricardo Pérez López
!DATE
---

# Funciones definidas por el usuario

## Definición de funciones con nombre

- En programación imperativa también podemos definir funciones.

- Al igual que ocurre en programación funcional, una función en programación
  imperativa es una construcción sintáctica que acepta argumentos y produce un
  resultado.

- Pero a diferencia de lo que ocurre en programación funcional, una función en
  programación imperativa es una **secuencia de sentencias**.

- Las funciones en programación imperativa conforman los bloques básicos que
  nos permiten **descomponer un programa en partes** que se combinan entre sí.

- Todavía podemos construir funciones mediante expresiones lambda, pero Python
  nos proporciona otro mecanismo para definir funciones en estilo imperativo:
  las **funciones con nombre**.

---

- La sintaxis para definir una función con nombre es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !T(def) !NT(nombre)!T{(}[!NT(parámetros)]!T{)}!T(:)
      !NT(sentencia)+
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  def saluda(persona):
      print('Hola', persona)
      print('Encantado de saludarte')

  def despide():
      print('Hasta luego, Lucas')
  ```

- Notas importantes:

  - Tiene que haber, al menos, *una* sentencia.

  - Las sentencias van **indentadas** (o *sangradas*) dentro de la definición
    de la función, con el mismo nivel de indentación.

  - El final de la función se deduce al encontrarse una sentencia con un
    **nivel de indentación superior** (en el caso de arriba, otro `def`).

---

!CAJA
~~~~~~~~~~~~~~~~~
**Conclusión:**

En Python, la **estructura** del programa viene definida por la **indentación**
del código.
~~~~~~~~~~~~~~~~~

## Paso de argumentos

- Existen distintos mecanismos de paso de argumentos, dependiendo del lenguaje
  de programación utilizado. 

- Los más conocidos son los llamados **paso de argumentos _por valor_** y
  **paso de argumentos _por referencia_**.

- En Python existe un único mecanismo de paso de argumentos llamado **paso de
  argumentos _por asignación_** o también, a veces, **paso de argumentos _por
  nombre_**.

- En la práctica resulta bastante sencillo.

- Consiste en suponer que **el argumento _se asigna_ al parámetro**
  correspondiente, con toda la semántica relacionada con los *alias* de
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
  valor pasado es una cadena, y por tanto inmutable).

---

- En caso de pasar un argumento mutable:

  ```{.python .number-lines}
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

  a = input('Introduce el primer número: ')
  b = input('Introduce el segundo número: ')
  resultado = suma(a, b)
  print('El resultado es:', resultado)
  ```

- La función se define en las líneas 1--2. El intérprete lee la definición de
  la función pero no ejecuta sus sentencias en ese momento (lo hará cuando se
  *llame* a la función).

- En la línea 6 se llama a la función `suma` pasándole como argumentos los
  valores de `a` y `b`, asignándose a `x` e `y`, respectivamente.

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

  ```
  Hola
  None
  ```

:::

::::

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

  Da error porque la variable `res` no está definida en el ámbito actual.

### Variables locales

- Al igual que pasa con las expresiones lambda, las definiciones de funciones
  generan un nuevo ámbito.

- Tanto los parámetros como las variables que se definan en el cuerpo de la
  función son **locales** a ella, y por tanto sólo existen dentro de ella.

- Eso significa que se crea un nuevo marco en el entorno, que contendrá, en
  principio, los parámetros y las variables locales a la función.

\vspace{2em}

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

!DOT(funcion-entorno-dentro.svg)(Entorno dentro de la función)(width=100%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR, splines = ortho]
node [fontname = "monospace"]
x [shape = plaintext, fillcolor = transparent]
3 -> suma [lhead = cluster0, ltail = cluster1, minlen = 2]
y [shape = plaintext, fillcolor = transparent]
suma [shape = plaintext, fillcolor = transparent]
resultado [shape = plaintext, fillcolor = transparent]
subgraph cluster0 {
    label = "Marco global"
    bgcolor = "white"
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    suma -> v1 -> función
    resultado -> v2
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

### Variables globales

- Desde dentro de una función es posible usar variables globales.

- Pero para ello es necesario que la función la declare previamente como
  *global* antes de usarla.

- De no hacerlo así, el intérprete supondría que el programador se refiere a
  una variable local que tiene el mismo nombre que la global:

  ```python
  x = 4

  def prueba():
      x = 5  # esta variable es local

  prueba()
  print(x)  # imprime 4
  ```

#### `global`

- Para declarar una variable como global, se usa la sentencia `global`:

  ```python
  x = 4

  def prueba():
      global x  # se declara que la variable x es global
      x = 5     # cambia el valor de la variable global x

  prueba()
  print(x)  # imprime 5
  ```

---

- Las reglas básicas de uso de la sentencia `global` en Python son:

  #. Cuando se crea una variable dentro de una función, por omisión es local.

  #. Cuando se define una variable fuera de una función, por omisión es global
     (no hace falta usar la sentencia `global`).

  #. Se usa la sentencia `global` para consultar y cambiar el valor de una
     variable global dentro de una función.

  #. El uso de la sentencia `global` fuera de una función no tiene ningún
     efecto.

  #. La sentencia `global` debe aparecer *antes* de que se use la variable
     global correspondiente.

#### Efectos laterales

- Cambiar el estado de una variable global es uno de los ejemplos más claros y
  conocidos de los llamados **efectos laterales**.

- Una función tiene (o *provoca*) efectos laterales cuando cambia el estado del
  exterior de la función. Típicamente:

  - Cuando cambia el valor de una variable global

  - Cuando cambia un argumento mutable

  - Cuando realiza una operación de entrada/salida

- Una función que provoca efectos laterales es una **función impura**, a
  diferencia de una **función pura**, que no tiene efectos laterales.

---

- Los efectos laterales provocan que sea muy difícil razonar sobre el
  funcionamiento del programa, puesto que las funciones impuras no pueden verse
  como simples **cajas negras** que reciben datos de entrada y devuelven una
  salida, sino que además hay que tener en cuenta los **efectos ocultos** que
  producen en otras partes del programa:

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
  pero también muestra un mensaje a la salida.

  Al final, el resultado que se obtiene no es el que se esperaba:

  ```
  La suma vale 7
  La suma vale 13
  20
  ```

---

- Además, **impiden la transparencia referencial**, ya que la misma función,
  invocada con los mismos argumentos, puede producir resultados distintos en
  momentos diferentes:

  ```python
  def suma(x, y):
      global z
      res = x + y + z
      z = z + 1
      return res

  z = 0
  print(suma(4, 3))  # imprime 7
  print(suma(4, 3))  # la misma llamada a función ahora imprime 8
  ```

---

- Por todo lo anterior, se debe evitar, siempre que sea posible, escribir
  funciones impuras (o sea, que provoquen efectos laterales).
  
- Ahora bien: muchas veces, la función que se desea escribir tiene efectos
  laterales porque esos son, precisamente, los efectos deseados.

  - Por ejemplo, una función que actualice los salarios de los empleados en una
    base de datos, a partir del salario base y los complementos.

- En ese caso, es importante documentar adecuadamente la función para que,
  quien desee usarla, sepa perfectamente qué efectos produce más allá de
  devolver un resultado.

## Declaraciones de tipos

### Declaraciones de tipo de argumento

### Declaraciones de tipo de devolución

## Funciones locales a funciones

### `nonlocal`

## *Docstrings*

# Teorema de Böhm-Jacopini

# Estructuras básicas de control

## Concepto de estructura

## Secuencia

## Selección

## Iteración

# Metodología de la programación estructurada

## Recursos abstractos

## Diseño descendente

## Refinamiento sucesivo

# Captura de excepciones

