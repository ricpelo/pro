---
title: Ejercicios de programación imperativa y estructurada
author:
- |
  Ricardo Pérez López\
  IES Doñana
include-before:
- |
  \ifdefined\Highlighting
    \DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\},fontsize=\footnotesize}
  \fi
---

#. Encontrar el valor de la variable `valor` después de la ejecución de las
   siguientes sentencias:

   #.
      ```python
      valor = 4.0 * 5
      ```

   #.
      ```python
      x = 3.0
      y = 2.0
      valor = x ** y - y
      ```

   #.
      ```python
      valor = 5
      x = 3
      valor = valor * x
      ```

#. ¿Cuál es la diferencia entre `[1, 2, 3]` y `[[1, 2, 3]]`?

#. Explicar la diferencia entre el operador ternario:

   !NT(valor) !T(if) !NT(condición) !T(else) !NT(valor)

   y la estructura de control:

   | !T(if) !NT(condición):
   |      !NT(sentencia)

#. Escribir un programa que pida al usuario su edad y que imprima el mensaje
   «`¡Qué joven!`» si es menor de 25 años.

#. Escribir un programa que pida al usuario su edad y que imprima el mensaje
   «`¡Qué joven!`» si es menor de 25 años y «`¡Qué mayor!`» en caso contrario.

#. Escribir un programa que pida al usuario su edad y que imprima el mensaje
   «`¡Qué joven!`» si es menor de 25 años y «`No está mal.`» si tiene entre 25
   y 40 años.

#. Escribir un programa que pida al usuario su edad y que imprima el mensaje
   «`¡Qué joven!`» si es menor de 25 años, «`No está mal.`» si tiene entre 25 y
   40 años y «`¡Qué mayor!`» si tiene más de 40 años.

#. Escribir un programa que muestre por pantalla la tabla de multiplicar de un
   número comprendido entre 0 y 10, introducido por teclado.

#. Dado el siguiente código:

   ```{.python .number-lines}
   n = int(input('¿Hasta dónde llego?: '))
   i = 0
   while i < n:
      print('Aquí la i vale', i)
      i += 2
   ```

   se pide:

   #. Contar cuántas sentencias hay.

   #. Por cada una de ellas, indicar si son simples o compuestas.

   #. Por cada sentencia compuesta, indicar de qué tipo de estructura se trata.

   #. Deducir cuántas veces se ejecuta la sentencia de la línea 4 en función
      del valor de la variable `n`.

   #. ¿Es posible provocar un bucle infinito al ejecutar ese programa?

#. Escribir un programa que calcule la media de cinco valores numéricos reales
   (tipo !PYTHON(float)) introducidos por teclado.

#. Escribir un programa que guarde en una lista diez cadenas introducidas por
   teclado y luego las muestre en orden inverso a como se han introducido,
   desde la última cadena introducida hasta la primera.

   _Indicación_: Usar el método `append` sobre la lista y luego un bucle que
   recorra la lista desde el último elemento hasta el primero.

#. Escribir un programa que calcule el máximo común divisor de dos números
   enteros introducidos por teclado, usando:

   #. La función !PYTHON(math.gcd).

   #. Bucles.

#. Escribir un programa que determine si un número entero introducido por
   teclado es primo o compuesto.

   _Indicación_: Un número primo es aquel que sólo puede dividirse exactamente
   por sí mismo y por 1.

#. Escribir un programa que gestione datos almacenados en una lista, de forma
   que muestre un menú con las siguientes opciones:

       1. Añadir un elemento a la lista.
       2. Cambiar el valor de un elemento de la lista.
       3. Eliminar un elemento de la lista.
       4. Eliminar todos los elementos de la lista.
       5. Mostrar los elementos de la lista.
       0. Salir del programa.

   El programa deberá pedir la información necesaria para cada opción elegida
   por el usuario.

#. Los datos de los empleados de una empresa se almacenan en una lista de
   tuplas, donde cada tupla representa a un empleado de la siguiente forma:

   ```python
   (nombre, apellidos, salario)
   ```

   En el programa, los cuatro empleados que tiene la empresa se almacenan en la
   siguiente lista:

   ```python
   empleados = [('María', 'González', 1800.23),
                ('Javier', 'Ruiz', 1630.50),
                ('Jesús', 'Pérez', 2100.42),
                ('Rosa', 'Muñoz', 2240.78)]
   ```

   Se pide escribir un programa que modifique la lista de `empleados`
   incrementando en un 10 % el salario de cada empleado y muestre por pantalla
   el salario total de los empleados de la empresa.

