---
title: Ejercicios de tipos de datos recursivos
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

#. La función `elem` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{elem(!VAR(e), !VAR(t\,): tuple) -> bool})
   !POST
   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   \texttt{elem(!VAR(e), !VAR(t))} = \begin{cases}\texttt{True} & \text{si \emph{e} está en \emph{t}}\\\texttt{False} & \text{en caso contrario}\end{cases}
   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

#. La función `cuantos` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{cuantos(!VAR(e), !VAR(t\,): tuple) -> int})
   !POST(\texttt{cuantos(!VAR(e), !VAR(t))} = \text{el número de veces que aparece \emph{e} en \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

#. La función `quita` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{quita(!VAR(e), !VAR(t\,): tuple) -> tuple})
   !POST(\texttt{quita(!VAR(e), !VAR(t))} = \text{una tupla igual que \emph{t} pero sin los \emph{e}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

#. La función `sustituye` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(\texttt{True})
   !SIGNAT(\texttt{sustituye(!VAR(a), !VAR(b), !VAR(t\,): tuple) -> tuple})
   !POST
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     \texttt{sustituye(!VAR(a), !VAR(b), !VAR(t))} = \text{una tupla igual que \emph{t} pero}
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
   !SIGNAT(\texttt{ultimo(!VAR(t\,): tuple)})
   !POST(\texttt{ultimo(!VAR(t))} = \text{el último elemento de \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

#. La función `enesimo` tiene la siguiente especificación:

   !ESPEC
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   !PRE(t \neq \texttt{()} \land 0 \leq n < \texttt{len(!VAR(t))})
   !SIGNAT(\texttt{enesimo(!VAR(n\,): int, !VAR(t\,): tuple)})
   !POST(\texttt{enesimo(!VAR(n), !VAR(t))} = \text{el \emph{n}-ésimo elemento de \emph{t}})
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Escribir una función recursiva que satisfaga dicha especificación.

\newpage

# Soluciones

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
