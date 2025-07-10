---
title:
- |
  Ejercicios de\
  Programación imperativa (II)
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

#. Escribe un programa que salude al usuario con el mensaje «Hola. Encantado de
   conocerle.».

#. Escribe un programa que pida un número al usuario y a continuación lo
   muestre.

#. Escribe un programa que pida al usuario su edad y muestre la que tendrá el
   año que viene.

#. Escribe un programa que pida el año actual y el de nacimiento del usuario.
   Debe calcular su edad, suponiendo que en el año en curso el usuario ya ha
   cumplido años.

#. Escribir un programa que pida dos números al usuario: _a_ y _b_. Deberá
   mostrar `Sí` si ambos números son iguales y `No` en caso contrario.

#. Escribe un programa que solicite al usuario su edad y le indique si es mayor
   de edad (mediante un mensaje `Sí` o `No`).

#. Escribe un programa que solicite al usuario un número y le indique si es par
   (mediante un mensaje `Sí` o `No`).

#. Escribe un programa que calcule la media aritmética de dos notas enteras.
   Hay que teneren cuenta que la media puede contener decimales.

#. Escribe un programa que calcule la longitud y el área de una circunferencia.
   Para ello, el usuario debe introducir el radio (que puede contener
   decimales).

   Recordemos: \begin{align*} longitud & = 2\pi \cdot radio \\ \acute{a}rea & =
   \pi \cdot radio^2 \end{align*}

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

#. Escribir un programa que calcule la media de cinco valores numéricos reales
   (tipo !PYTHON(float)) introducidos por teclado.

#. Escribir un programa que guarde en una lista diez cadenas introducidas por
   teclado y luego las muestre en orden inverso a como se han introducido,
   desde la última cadena introducida hasta la primera.

   _Indicación_: Usar el método `append` sobre la lista y luego un _bucle_ que
   recorra la lista desde el último elemento hasta el primero.

#. Crear el archivo de texto «`numeros_reales.txt`» en el directorio de trabajo
   actual que contenga una sola línea de texto con números reales separados por
   espacios. A continuación, escribir un programa que abre ese archivo, lea los
   números que contiene y calcule la suma y la media aritmética, mostrando los
   resultados por pantalla.

#. Crear un archivo de texto con una colección de números reales, uno por
   línea. A continuación, escribir un programa que:

   a. Abra el archivo para lectura.
   a. Lea todas sus líneas.
   a. Muestre finalmente la suma de todos ellos.

#. Escribir un programa que duplique el contenido de un archivo cuyo nombre se
   pide al usuario. El archivo copia tendrá el mismo nombre con el prefijo
   «`copia_de_`».

#. Escribir un programa que solicite al usuario el nombre de un archivo de
   texto y muestre su contenido en pantalla. Si no se proporciona ningún nombre
   de archivo, el programa usará por defecto `prueba.txt`.

#. Hacer el mismo ejercicio anterior, pero recogiendo el nombre del archivo
   desde la línea de órdenes del sistema operativo. (_Indicación_: usar
   !PYTHON(sys.argv)).

#. Escribir un programa que pida al usuario su nombre y su edad. Esos datos
   deben guardarse en el archivo `datos.txt`. Si ese archivo existe, debe
   añadirse al final en una nueva línea, y en caso de no existir, debe crearse.

#. Escribir un programa que lea dos listas de números enteros no ordenados de
   sendos archivos con un número por línea, los reúna en una lista única y los
   guarde en orden creciente en un tercer archivo, de nuevo uno por línea.

#. Escribir un programa que lea un archivo de texto llamado `carta.txt`.
   Tenemos que contar los caracteres, las líneas y las palabras. Para
   simplificar, supondremos que cada palabra está separada de otra por un único
   espacio en blanco o por un salto de línea.

#. En el archivo `numeros.txt` disponemos de una serie de números (uno por
   línea). Diseñar un programa que procese el archivo y nos muestre el menor y
   el mayor.

