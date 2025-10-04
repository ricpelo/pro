---
title:
- |
  Ejercicios de\
  Programación funcional
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

#. Los médicos forenses utilizan la longitud de los huesos para determinar la
   altura de una persona, cuando la persona estaba viva.

   Por ejemplo, para los varones:
   $$\text{altura (en cm)} = 69.089 + 2.232 \times \text{longitud de la
   tibia}$$

   Para las mujeres, el valor es el siguiente:
   $$\text{altura (en cm)} = 61.412 + 2.317 \times \text{longitud de la
   tibia}$$

   A partir de los 30 años (inclusive), la altura de una persona decrece a una
   tasa de 0.06 cm por año.

   Escribir un programa que, dados los valores de la longitud de la tibia, el
   sexo y la edad del paciente, nos calcule la altura aproximada.

#. Escribir un programa que calcule el volumen de una esfera a partir de su
   radio, usando la siguiente fórmula: $$V = \frac{4}{3}\pi r^3$$

#. Escribir un programa que compruebe si tres datos de entrada tienen el mismo
   valor.

#. Escribir un programa que compruebe si cuatro datos de entrada tienen el
   mismo valor.

#. Escribir un programa que reciba dos datos de entrada y que los ordene de
   menor a mayor, indicando cuál es el primero y cuál el segundo.

#. Escribir un programa que reciba tres datos de entrada y que los ordene de
   menor a mayor, indicando cuál es el primero, cuál el segundo y cuál el
   tercero.

#. Escribir un programa que calcule el mínimo común múltiplo (_mcm_) de dos
   números enteros, de dos formas diferentes:

   #. Mediante la función `lcm` del módulo !PYTHON(math).

   #. Aprovechando la siguiente propiedad:
      $$a\cdot b = mcd(a,b)\cdot mcm(a,b)$$

#. Escribir un programa que quite todos los espacios en blanco que se
   encuentren dentro de una cadena. La salida será la cadena de entrada pero
   sin los espacios en blanco. Por ejemplo, ante la entrada
   !PYTHON("Esto es una prueba") la salida debería ser
   !PYTHON("Estoesunaprueba").

#. Escribir un programa que diga si dos cadenas son iguales sin tener en cuenta
   las mayúsculas y minúsculas. Por ejemplo, el programa debería decir que las
   cadenas !PYTHON("Hola") y !PYTHON("hoLa") son iguales.

#. Usando el método
   `maketrans`\footnote{\texttt{\url{https://docs.python.org/3/library/stdtypes.html\#str.maketrans}}}
   definido sobre las cadenas, escribir un programa que sustituya en una cadena
   las vocales acentuadas por sus correspondientes sin acentuar. Por ejemplo,
   si la entrada es la cadena !PYTHON("¡Ramón! ¡Cuánto tiempo! ¿Cómo estás?"),
   la salida deberá ser !PYTHON("¡Ramon! ¡Cuanto tiempo! ¿Como estas?").

#. Escribir un programa que diga si una cadena es un palíndromo.

   Un _palíndromo_ es una cadena que se lee igual de izquierda a derecha que al
   revés. Por ejemplo: «_Dábale arroz a la zorra el abad_».

   Deben ignorarse las tildes, las mayúsculas y los espacios en blanco. Para
   ello, hacer uso de las soluciones encontradas en los ejercicios anteriores.

