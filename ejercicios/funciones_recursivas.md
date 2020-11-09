---
documentclass: scrartcl
header-includes:
- |
  \usepackage{biolinum}
  \usepackage[scaled=0.8]{beramono}
  \usepackage[libertine]{newtxmath}
  \definecolor{ttcolor}{RGB}{38,139,210}
  \let\Oldtexttt\texttt
  \renewcommand\texttt[1]{\textcolor{ttcolor}{\Oldtexttt{#1}}}
  \let\Oldmathtt\mathtt
  \renewcommand\mathtt[1]{\textcolor{ttcolor}{\Oldmathtt{#1}}}
fontfamily: libertinus
fontsize: 12pt
author:
- |
  Ricardo Pérez López\
  IES Doñana
title: Ejercicios de funciones recursivas
subtitle: Programación --- DAW
date: Curso !CURSO
---

\renewcommand{\arraystretch}{1.5}

#. Dada la siguiente función matemática:

   $$f(n)=\begin{cases}
   0 & \textrm{si }n=0\\
   1+2\cdot f(n-1) & \textrm{si }n>0
   \end{cases}$$
 
   calcular el valor de $f(3)$.

#. La función `potencia` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(b \geq 0)
   !SIGNAT(\texttt{potencia(!VAR(a\,): int, !VAR(b\,): int) -> int})
   !POST(\texttt{potencia(!VAR(a), !VAR(b))}=a^{b})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   #. Implementar la función de forma no recursiva.

   #. Implementar la función de forma recursiva.

#. La función `repite` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(n \geq 0)
   !SIGNAT(\texttt{repite(!VAR(s\,): str, !VAR(n\,): int) -> str})
   !POST(\texttt{repite(!VAR(s), !VAR(n))}=s\texttt{ * }n)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Implementar la función de forma recursiva.

#. La suma lenta es un algoritmo para sumar dos números para el que
   sólo necesitamos saber cuáles son el anterior y el siguiente de un
   número dado. El algoritmo se basa en la siguiente recurrencia:

   $$suma\_lenta(a,b)=\begin{cases}
   b & \textrm{si }a=0\\
   suma\_lenta(ant(a),sig(b)) & \textrm{si }a>0
   \end{cases}$$

   Suponiendo que tenemos las siguientes funciones `ant` y `sig`:

   ```python
   ant = lambda n: n - 1
   sig = lambda n: n + 1
   ```

   Se pide:

   #. Escribir su especificación.

   #. Implementar una función recursiva que satisfaga dicha
      especificación.

#. La función `suma_digitos` calcula la suma de los dígitos de un
   número entero:
 
   ```python
   suma_digitos(423) = 4 + 2 + 3 = 9
   suma_digitos(7) = 7
   ```

   Se pide:

   #.  Escribir su especificación.

   #.  Implementar una función recursiva que satisfaga dicha
       especificación.

   *Indicación*: Recordar que `n // 10`{.python} le quita el último dígito a
   $n$. Además, `n % 10`{.python} devuelve el último dígito de $n$.

#. La función `voltea` le da la vuelta a un número entero:

   ```python
   voltea(423) = 324
   voltea(7) = 7
   ```

   Se pide:

   #.  Escribir su especificación.

   #.  Implementar una función recursiva que satisfaga dicha
       especificación.

   *Indicación*: Usar la función `digitos` que devuelve la cantidad de
   dígitos que tiene un entero. Usar además la indicación del ejercicio
   anterior.

   \newpage

#. La función `par_positivo` determina si un número entero positivo es
   par:

   ```python
   par_positivo(0) = True
   par_positivo(1) = False
   par_positivo(27) = False
   par_positivo(82) = True
   ```

   Se pide:

   #.  Escribir su especificación.

   #.  Implementar una función recursiva que satisfaga dicha
       especificación.

#. La función `par` determina si un número entero (positivo o negativo)
   es par:

   ```python
   par(0) = True
   par(1) = False
   par(-27) = False
   ```

   Se pide:

   #.  Escribir su especificación.

   #.  Implementar una función recursiva que satisfaga dicha
       especificación.

   #.  ¿Cómo se podría implementar una función `impar` a partir de la
       función `par`?
 
# Soluciones

#. $f(3) \\
   = 1 + 2 \cdot f(2) \\
   = 1 + 2 \cdot (1 + f(1)) \\
   = 1 + 2 \cdot (1 + 2 \cdot (1 + 2 \cdot f(0))) \\
   = 1 + 2 \cdot (1 + 2 \cdot (1 + 2 \cdot 0)) \\
   = 1 + 2 \cdot (1 + 2 \cdot 1) \\
   = 1 + 2 \cdot 3 \\
   = 7$.

#.  

    #.
       ```python
       potencia = lambda a, b: a ** b
       ```

    #.
       ```python
       potencia = lambda a, b: 1 if b == 0 else a * potencia(a, b - 1)
       ```

#. 

   ```python
   repite = lambda s, n: '' if n == 0 else s + repite(s, n - 1)
   ```

#.   

    #. !ESPECINLINE
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       !PRE(a \geq 0)
       !SIGNAT(\texttt{suma\_lenta(!VAR(a\,): int, !VAR(b\,): int) -> int})
       !POST(\texttt{suma\_lenta(!VAR(a), !VAR(b))} = a + b)
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       suma_lenta = lambda a, b: b if a == 0 else suma_lenta(ant(a), sig(b))
       ```

#.   

    #. !ESPECINLINE
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       !PRE(n \geq 0)
       !SIGNAT(\texttt{suma\_digitos(!VAR(n\,): int) -> int})
       !POST(\texttt{suma\_digitos(!VAR(n))} = \text{la suma de los dígitos de \emph{n}})
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       suma_digitos = lambda n: n if n < 10 else (n % 10) + suma_digitos(n // 10)
       ```

#.   

    #. !ESPECINLINE
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       !PRE(n \geq 0)
       !SIGNAT(\texttt{voltea(!VAR(n\,): int) -> int})
       !POST(\texttt{voltea(!VAR(n))} = \text{el número \emph{n} con los dígitos al revés})
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       voltea = lambda n: n if n < 10 else \
                          (n % 10) * 10 ** (digitos(n) - 1) + voltea(n // 10)
       ```

#.   

    #. !ESPECINLINE
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       !PRE(n \geq 0)
       !SIGNAT(\texttt{par\_positivo(!VAR(n\,): int) -> bool}) \\[-1.2em]
       !POST
       ~~~~~~~~~~~~~~~~~~~~~~~~~~
       \texttt{par\_positivo(!VAR(n))} = \begin{cases}\texttt{True} & \text{si \emph{n} es par}\\\texttt{False} & \text{en caso contrario}\end{cases}
       ~~~~~~~~~~~~~~~~~~~~~~~~~~
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       par_positivo = lambda n: True if n == 0 else \
                                False if par_positivo(n - 1) else \
                                True
       ```

#. 

   #. !ESPECINLINE
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      !PRE(\texttt{True})
      !SIGNAT(\texttt{par(n: int) -> bool}) \\[-1.2em]
      !POST
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      \texttt{par(!VAR(n))} = \begin{cases}\texttt{True} & \textrm{si \emph{n} es par }\\ \texttt{False} & \textrm{en caso contrario}\end{cases}
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   #.
      ```python
      par = lambda n: True if n == 0 else \
                      False if par(abs(n) - 1) else \
                      True
      ```

   #.
      ```python
      impar = lambda n: not par(n)
      ```
