---
title:
- |
  Ejercicios de\
  Entrada y salida por archivos
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

