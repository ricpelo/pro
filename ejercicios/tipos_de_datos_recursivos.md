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
title: Ejercicios de tipos de datos recursivos
subtitle: Programación --- DAW
date: Curso !CURSO
---

\renewcommand{\arraystretch}{1.5}

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

   Escribir una función recursiva que satisfaga dicha especificación y que
   genere un proceso:

   #. recursivo.

   #. iterativo.

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
