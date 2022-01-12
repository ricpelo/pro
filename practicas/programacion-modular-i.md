---
title:
- |
  Prácticas de\
  Programación modular (I)
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

@. Consulta la **librería estándar de Python** en la documentación oficial para
   hacerte una idea general de las posibilidades que ofrecen los módulos
   predefinidos del lenguaje:

    [`https://docs.python.org/3/library/index.html`](https://docs.python.org/3/library/index.html)

@. Importa el módulo `math` en un programa que necesite la función `math.gcd`
   para calcular el **máximo común divisor** de dos números:

    #. Usando !PYTHON(import math)

    #. Usando !PYTHON(from math import gcd)

    #. Usando !PYTHON(from math import *)

    ¿Cuál es la diferencia entre las tres opciones? ¿Cuál es más conveniente?
    ¿Qué inconvenientes presenta la última opción?

@. Usa el módulo `random` para escribir programas que necesiten mostrar un
   comportamiento aleatorio:

    #. La función `random.randint(`_a_`, `_b_`)` devuelve un número entero
       aleatorio entre _a_ y _b_. Úsala para escribir un programa que juegue a
       que el usuario tenga que adivinar un número entre 1 y 100.

    #. La función `random.shuffle(`_x_`)` ordena aleatoriamente la secuencia
    _x_. Úsala para escribir un programa que pida al usuario cinco cadenas y
    que luego las imprima en un orden aleatorio.

@. Escribe un módulo llamado `fibonacci.py` que contenga las siguientes
   funciones:

    - Una función `fib` que calcule el $n$-ésimo término de la sucesión de
      Fibonacci de forma recursiva.

    - Una función `fib_iter` que calcule lo mismo pero de forma iterativa
      llamando a otra función `_fib_aux` (ojo, que empieza por `_`), que es la
      que realmente lleva a cabo el proceso iterativo.

    #. Usar el módulo en otro llamado `principal.py` importándolo mediante:

       ```python
       from fibonacci import *
       ```

       ¿Cuáles son las funciones que se acaban importando de esta manera? ¿Por
       qué?

    #. El módulo debe probarse a sí mismo al ejecutarse desde la línea de
       órdenes del sistema operativo (\underline{y sólo entonces}):

       #. Si se ejecuta sin argumentos en la línea de órdenes, deberá comprobar
          que `fib(8)` y `fib_iter(8)` se calculan correctamente, mostrando un
          mensaje que indique si el cálculo ha sido correcto o no. Por ejemplo:

          ```console
          $ python fibonacci.py
          fib(8) vale 21 (correcto)
          fib_iter(8) vale 37 (incorrecto)
          ```

       #. Si se ejecuta con un argumento en la línea de órdenes, deberá usarse
          como el argumento de la función `fib` y mostrar por pantalla el
          resultado de la función. Por ejemplo:

          ```console
          $ python fibonacci.py 7
          13
          ```

    #. ¿Cuál es la **interfaz** del módulo?

    #. ¿Cuál es la **implementación** del módulo?
