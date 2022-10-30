---
title:
- |
  Ejercicios de\
  Programación funcional (II)
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

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
   !SIGNAT(\texttt{potencia(!VAR(a):\,int,\;!VAR(b):\,int)\;->\;\,int})
   !POST(\texttt{potencia(!VAR(a),\;!VAR(b))}=a^{b})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   #. Implementar la función de forma no recursiva.

   #. Implementar la función de forma recursiva.

#. La función `repite` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(n \geq 0)
   !SIGNAT(\texttt{repite(!VAR(s):\,str,\;!VAR(n):\,int)\;->\;\,str})
   !POST(\texttt{repite(!VAR(s),\;!VAR(n))}=s\texttt{ * }n)
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

#. La función `elem` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{elem(!VAR(e),\;!VAR(t):\,tuple)\;->\;\,bool})
   !POST
   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   \texttt{elem(!VAR(e),\;!VAR(t))} = \begin{cases}\texttt{True} & \text{si \emph{e} está en \emph{t}}\\\texttt{False} & \text{en caso contrario}\end{cases}
   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

#. La función `cuantos` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{cuantos(!VAR(e),\;!VAR(t):\,tuple)\;->\;\,int})
   !POST(\texttt{cuantos(!VAR(e),\;!VAR(t))} = \text{el número de veces que aparece \emph{e} en \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

#. La función `quita` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{quita(!VAR(e),\;!VAR(t):\,tuple)\;->\;\,tuple})
   !POST(\texttt{quita(!VAR(e),\;!VAR(t))} = \text{una tupla igual que \emph{t} pero sin los \emph{e}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

#. La función `sustituye` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{sustituye(!VAR(a),\;!VAR(b),\;!VAR(t):\,tuple)\;->\;\,tuple})
   !POST
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     \texttt{sustituye(!VAR(a),\;!VAR(b),\;!VAR(t))} = \text{una tupla igual que \emph{t} pero}
   & \text{sustituyendo los \emph{a} por \emph{b}}
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

#. La función `ultimo` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(t \neq \texttt{()})
   !SIGNAT(\texttt{ultimo(!VAR(t):\,tuple)})
   !POST(\texttt{ultimo(!VAR(t))} = \text{el último elemento de \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

#. La función `enesimo` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(t \neq \texttt{()} \land 0 \leq n < \texttt{len(!VAR(t))})
   !SIGNAT(\texttt{enesimo(!VAR(n):\,int,\;!VAR(t):\,tuple)})
   !POST(\texttt{enesimo(!VAR(n),\;!VAR(t))} = \text{el \emph{n}-ésimo elemento de \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

\newpage

# Soluciones {.unnumbered .unlisted}

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
       !SIGNAT(\texttt{suma\_lenta(!VAR(a):\,int,\;!VAR(b):\,int)\;->\;\,int})
       !POST(\texttt{suma\_lenta(!VAR(a),\;!VAR(b))} = a + b)
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       suma_lenta = lambda a, b: b if a == 0 else suma_lenta(ant(a), sig(b))
       ```

#.   

    #. !ESPECINLINE
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       !PRE(n \geq 0)
       !SIGNAT(\texttt{suma\_digitos(!VAR(n):\,int)\;->\;\,int})
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
       !SIGNAT(\texttt{voltea(!VAR(n):\,int)\;->\;\,int})
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
       !SIGNAT(\texttt{par\_positivo(!VAR(n):\,int)\;->\;\,bool}) \\[-1.2em]
       !POST
       ~~~~~~~~~~~~~~~~~~~~~~~~~~
       \texttt{par\_positivo(!VAR(n))} = \begin{cases}\texttt{True} & \text{si \emph{n} es par}\\\texttt{False} & \text{en caso contrario}\end{cases}
       ~~~~~~~~~~~~~~~~~~~~~~~~~~
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    #.
       ```python
       par_positivo = lambda n: True if n == 0 else \
                                not par_positivo(n - 1)
       ```

#. 

   #. !ESPECINLINE
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      !PRE(\texttt{True})
      !SIGNAT(\texttt{par(n:\,int)\;->\;\,bool}) \\[-1.2em]
      !POST
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      \texttt{par(!VAR(n))} = \begin{cases}\texttt{True} & \textrm{si \emph{n} es par }\\ \texttt{False} & \textrm{en caso contrario}\end{cases}
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   #.
      ```python
      par = lambda n: True if n == 0 else \
                      not par(abs(n) - 1)
      ```

   #.
      ```python
      impar = lambda n: not par(n)
      ```

#. 

    ```python
    elem = lambda e, t: False if t == () else \
                        True if t[0] == e else \
                        elem(e, t[1:])
    ```

#.  
    Definimos:

    ```python
    aux = lambda a, b: 1 if a == b else 0
    ```

    #.
       ```python
       cuantos = lambda e, t: 0 if t == () else \
                              aux(e, t[0]) + cuantos(e, t[1:])
       ```

    #.
       ```python
       cuantos = lambda e, t: cuantos_it(e, t, 0)
       cuantos_it = lambda e, t, acc: acc if t == () else \
                                      cuantos_it(e, t[1:], acc + aux(e, t[0]))
       ```

#.  
    Definimos:

    ```python
    aux = lambda a, b: () if a == b else (b,)
    ```

    #.
       ```python
       quita = lambda e, t: () if t == () else \
                            aux(e, t[0]) + quita(e, t[1:])
       ```

    #.
       ```python
       quita = lambda e, t: quita_it(e, t, ())
       quita_it = lambda e, t, acc: acc if t == () else \
                                    quita_it(e, t[1:], acc + aux(e, t[0]))
       ``` 

#.  
    Definimos:

    ```python
    aux = lambda a, b, t: (b,) if a == t else (t,)
    ```

    #.
       ```python
       sustituye = lambda a, b, t: () if t == () else \
                                   aux(a, b, t[0]) + sustituye(a, b, t[1:])
       ```

    #.
       ```python
       sustituye = lambda a, b, t: sustituye_it(a, b, t, ())
       sustituye_it = lambda a, b, t, acc: \
           acc if t == () else \
           sustituye_it(a, b, t[1:], acc + aux(a, b, t[0]))
       ``` 

#. 

    ```python
    ultimo = lambda t: t[0] if t[1:] == () else ultimo(t[1:])
    ```

#. 

    ```python
    enesimo = lambda n, t: t[0] if n == 0 else enesimo(n - 1, t[1:])
    ```
