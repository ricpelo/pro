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

#. Hallar el valor de la variable `valor` después de la ejecución de las
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

#. Dada la siguiente tupla:

    ```python
    a = (0, 11, 22, 33, 44, 55, 66, 77, 88, 99)
    ```

    ¿Qué valor devuelven las siguientes expresiones?

    #. !PYTHON(a[0:7:1])

    #. !PYTHON(a[0:7:2])

    #. !PYTHON(a[0:7])

    #. !PYTHON(a[2:7:1])

    #. !PYTHON(a[7:2:1])

    #. !PYTHON(a[7:2:-1])

    #. !PYTHON(a[:7:1])

    #. !PYTHON(a[5::1])

    #. !PYTHON(a[:-5:-1])

    #. !PYTHON(a[-5::-1])

    #. !PYTHON(a[5:-1:1])

    #. !PYTHON(a[-1:5:-1])

#. ¿Cuál es la diferencia entre `[1, 2, 3]` y `[[1, 2, 3]]`?

#. Crear una lista llamada inventario que contenga los siguientes elementos en
   orden: !PYTHON("espada"), !PYTHON("escudo"), !PYTHON("poción"),
   !PYTHON("mapa").

    #. Obtener el primer elemento de la lista.

    #. Obtener el último elemento utilizando índices negativos.

    #. Obtener el tercer elemento.

#. Dada la siguiente lista con las calificaciones de un examen:

   ```python
   calificaciones = [8.5, 4.0, 9.2, 6.0, 7.5]
   ```

    #. Obtener la calificación del primer estudiante y la del último.

    #. Calcular la suma del primer y el último elemento.

    #. Calcular la nota media.

#. Crear una lista llamada agenda con tres actividades: !PYTHON("estudiar"),
   !PYTHON("cenar"), !PYTHON("dormir").

   Se observa que la primera actividad debería ser !PYTHON("comprar").
   Modificar el elemento correspondiente mediante su índice para que la lista
   pase a ser !PYTHON(["comprar", "cenar", "dormir"]).

#. Crear una lista vacía llamada `peliculas`.

    #. Utilizar el método `append` para añadir tres nuevas películas, de una en
    una.

    #. Utilizar el método `pop` para eliminar la última película que se añadió
    en el paso anterior.

    #. Obtener la longitud de la misma usando !PYTHON(len).

#. Supongamos una fila de personas en el cine representada por una lista:

   ```python
   fila = ["Ana", "Carlos", "Bea"]
   ```

    #. Llega una nueva persona llamada David que se cuela en la segunda
       posición (índice 1). Utilizar el método `insert` para colocarla.

    #. ¿Cómo queda la fila al final?

#. Dada la siguiente lista de números:

   ```python
   numeros = [10, 20, 30, 40, 50, 60, 70, 80]
   ```

   Utilizar la técnica del _slicing_ para obtener:

    #. Los tres primeros elementos (!PYTHON([10, 20, 30])).

    #. Los elementos centrales (!PYTHON([30, 40, 50, 60])).

    #. Los dos últimos elementos de la lista usando índices negativos en el
    _slicing_.

#. Crear una lista con los siguientes precios desordenados: !PYTHON(15.5),
   !PYTHON(2.0), !PYTHON(8.3), !PYTHON(41.0), !PYTHON(1.5).

    #. Utilizar el método `sort` para ordenar los precios de menor a mayor.

    #. Utilizar el método `reverse` para invertir el orden (dejándolo de mayor
       a menor).

    #. ¿Cómo queda la lista al final de cada paso?

#. Definir las listas:

   ```python
   equipo_a = ["Ana", "Luis"]
   equipo_b = ["Sofía", "Marcos"]
   ```

    #. Unirlas en una sola lista llamada `gran_equipo`.

    #. Crear una lista llamada `silencio` que repita la palabra !PYTHON("shh")
       cinco veces.

#. Escribe un programa que salude al usuario con el mensaje «`Hola. Encantado
   de conocerle.`».

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

#. Escribir un programa que calcule la media de cinco valores numéricos reales
   (tipo !PYTHON(float)) introducidos por teclado.
