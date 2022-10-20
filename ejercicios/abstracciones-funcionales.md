---
title:
- |
  Ejercicios de\
  Abstracciones funcionales
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

#. Escribir en forma de función todos los programas solicitados en el boletín
   de ejercicios de «Programación funcional (I)». Para cada una de ellas, dar
   un ejemplo de uso.

#. Escribir una función que implemente la siguiente especificación:
   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(n \geq 0)
   !SIGNAT(\texttt{repite(!VAR(s):\,str,\;!VAR(n):\,int)\;->\;\,str})
   !POST(\texttt{repite(!VAR(s))}=\text{!VAR(s) repetido !VAR(n) veces})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Dar un ejemplo de uso.

#. Escribir una función que implemente la siguiente especificación:
   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{len(!VAR(c))} \geq 0)
   !SIGNAT(\texttt{es\_vocal(!VAR(c):\,str)\;->\;\,bool})
   !POST(\texttt{es\_vocal(!VAR(c))}=\text{!VAR(c) es una vocal, acentuada o no})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Dar un ejemplo de uso.

#. Escribir una función `calculadora` a la que se le pasan dos números reales y
   qué operación se desea realizar con ellos. Las operaciones disponibles son:
   sumar, restar, multiplicar o dividir. Éstas se especifican mediante un
   carácter: `'+'`, `'-'`, `'*'` o `'/'`, respectivamente. La función devolverá
   el resultado de la operación en forma de número real.

#. Escribir una función que calcule la distancia euclídea entre dos puntos
   $(x_1, y_1)$ y $(x_2, y_2)$, descrita por la siguiente especificación:
   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{distancia(!VAR(x_1):\,float,\;!VAR(y_1):\,float,\;!VAR(x_2):\,float,\;!VAR(y_2):\,float)\;->\;\,float})
   !POST(\texttt{distancia(!VAR(x_1),\;!VAR(y_1),\;!VAR(x_2),\;!VAR(y_2))}=\sqrt{(x_1-x_2)^2+(y_1-y_2)^2})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Dar un ejemplo de uso.

#. Escribir una función que reciba una cantidad de días, minutos y segundos, y
   que calcule y devuelva el número de segundos en los datos de entrada
   indicados. Dar un ejemplo de uso.

#. Escribir una función que reciba dos instantes de tiempo en forma de horas y minutos y que cumpla con la siguiente especificación:
   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(hora_1 \geq 0 \land minuto_1 \geq 0 \land hora_2 \geq 0 \land minuto_2 \geq 0)
   !SIGNAT(\texttt{distancia(!VAR(hora_1):\,int,\;!VAR(minuto_1):\,int,\;!VAR(hora_2):\,int,\;!VAR(minuto_2):\,int)\;->\;\,int})
   !POST(\texttt{distancia(!VAR(hora_1),\;!VAR(minuto_1),\;!VAR(hora_2),\;!VAR(minuto_2))}=
   & \text{la cantidad de minutos que existen de diferencia entre los dos instantes})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Dar un ejemplo de uso.

#. Dado el siguiente programa:

   ```python
   producto = lambda x, y: x * y
   cuenta = lambda x: x.count('a')
   resultado = producto(2, 3) + cuenta('Amapola')
   ```

   Se pide:

   #. Explicar brevemente qué hace el programa.

   #. Determinar los ámbitos que hay en el código fuente.

   #. Indicar:

      #. Los parámetros.

      #. Las ligaduras locales, y de qué ámbito son locales.

      #. Las ligaduras globales.

   #. Trazar su ejecución paso a paso, indicando el contenido de la pila, el
      entorno y las ligaduras que se van creando y destruyendo durante la
      ejecución.

