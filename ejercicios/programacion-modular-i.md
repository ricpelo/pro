---
title:
- |
  Ejercicios de\
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

    #. La función `random.randint(`_a_`, `_b_`))` devuelve un número entero
       aleatorio entre _a_ y _b_. Úsala para escribir un programa que juegue a
       que el usuario tenga que adivinar un número entre 1 y 100.

    #. La función `random.shuffle(`_x_`)` ordena aleatoriamente la secuencia
    _x_. Úsala para escribir un programa que pida al usuario cinco cadenas y
    que luego las imprima en un orden aleatorio.
