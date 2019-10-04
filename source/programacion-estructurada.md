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

---

- Tal y como sucede con las expresiones lambda, las definiciones de funciones
  generan un nuevo ámbito.

- Tanto los parámetros como las variables que se definan en el cuerpo de la
  función son **locales** a ella, y por tanto sólo existen dentro de ella.

- Eso significa que se crea un nuevo marco en el entorno, que contendrá al
  menos los parámetros y las variables locales a la función.

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

#### `global`

#### Efectos laterales

### Variables locales

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

