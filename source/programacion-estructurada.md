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
  def cambia(lista):
      print(lista)
      lista.append(99)

  lista = [1, 2, 3]
  cambia(lista)     # Imprime [1, 2, 3]
  print(lista)      # Imprime [1, 2, 3, 99]
  ```


## La sentencia `return`

- Para devolver el resultado de la función al código que la llamó, hay que usar
  una sentencia `return`.

- Cuando el intérprete encuentra una sentencia `return` dentro de una función:

  - se finaliza la ejecución de la función,
  
  - se devuelve el control al punto del  programa en el que se llamó a la
    función y
  
  - se declara que la función devuelve como resultado el valor de retorno
    definido en la sentencia `return`.

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

- En la línea 6 se llama a la función `suma`

## Ámbito de variables

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

