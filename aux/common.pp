!comment
~~~~~~~~~~~~~~~~~~~~~~
DEFINICIONES GENERALES
~~~~~~~~~~~~~~~~~~~~~~

!define(DATE)(date: IES Doñana, curso !CURSO)
!define(IMAGES)(images)
!define(SCRIPTS)(scripts)
!define(WIDTH)(width=!ifdef(LATEX)(60%)(80%))
!define(DIAGRAM)(node_modules/diagrams/bin/diagrams.js)
!define(UMLCOMMON)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale 2
skinparam backgroundColor transparent
skinparam defaultFontName Lato
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(DOTCOMMON)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  graph [rankdir = LR, bgcolor = "transparent", fontname = "Lato", fontsize = 14 ];
  node [shape = rectangle, fillcolor = "white", style = "filled", fontname = "Lato", fontsize = 13 ];
  edge [fontname = "Lato", fontsize = 12 ];
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~
MACROS DE USO GENERAL
~~~~~~~~~~~~~~~~~~~~~

!define(SALTO)(!ifndef(LATEX)(<br>\vspace{1em}))
!define(SALTOHTML)(!ifdef(HTML)(<br>))
!define(SALTOLARGO)(!ifndef(LATEX)(<br>\vspace{2em}))
!define(SALTOBEAMER)(!ifdef(BEAMER)(\vspace{1em}))
!define(SALTOLARGOBEAMER)(!ifdef(BEAMER)(\vspace{2em}))

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Macros para hacer producciones en notación EBNF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(NT)(!COLOR(teal)(!ifdef(HTML)(⟨*!1*⟩)(⟨\textit{!PYNT(!1)}⟩)))
!define(T)(**`!1`**)
!define(MAS)(!ifdef(HTML)($^+$)(\textsuperscript{+}))

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
El color puede ser:
red, blue, teal, orange, brown, purple, magenta, cyan, yellow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(COLOR)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifdef(HTML)([!2]{style="color:!1"})(\textcolor{!1}{!2})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(SECCIONEJERCICIOS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ejercicios {.unnumbered .unlisted}

## Ejercicios {.unnumbered .unlisted}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(EJERCICIOS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##### Ejercicios {.unnumbered .unlisted}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(EJERCICIO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##### Ejercicio {.unnumbered .unlisted}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(EJEMPLOS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##### Ejemplos {.unnumbered .unlisted}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(EJEMPLO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##### Ejemplo {.unnumbered .unlisted}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FIN)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!RESPUESTAS

!BIBLIOGRAFIA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(BIBLIOGRAFIA)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bibliografía {.unnumbered .unlisted}

!ifdef(BEAMER)(\raggedright)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(CAJA)
~~~~~~~~~~~~~~~~~~
!ifndef(HTML)
~~~~~~~~~~~~~
\Begin{caja}
\setlength{\parskip}{1.2ex}
!1\End{caja}
~~~~~~~~~~~~~
~~~~~~~~~~~~~
::: caja
!1:::
~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~

!define(CAJACENTRADA)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifndef(HTML)
~~~~~~~~~~~~~
\Begin{caja}
\Begin{center}
\setlength{\parskip}{1.2ex}
!1\End{center}\End{caja}
~~~~~~~~~~~~~
~~~~~~~~~~~~~
::: {.caja .centered}
!1:::
~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(ALGO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{caja}\raggedright\small
   !PYALGO(!1)\End{caja}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(CENTRAR)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifndef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}
!1\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~
::: centered
  !1:::
~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(BREAK)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifdef(BEAMER)
~~~~~~~~~~~~~~~~~~
```

---

```!ifdef(!1)(!1)(php)
~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PYTHON)(`!1`{.python})
!define(JAVA)(`!1`{.java})

!define(QUIZ)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!SCRIPTS/quiz.php !ifdef(HTML)(html)(!ifdef(LATEX)(latex)(beamer)) "!PYQUOTE(!1)")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(RESPUESTAS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifndef(HTML)
~~~~~~~~~~~~~~~~~~~~
# Respuestas a las preguntas {.unnumbered .unlisted}

#### Respuestas a las preguntas {.unnumbered .unlisted .allowframebreaks}

\shipoutAnswer
~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMG(archivo)[(texto)][(estilo Beamer)][(estilo Latex)]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(IMG)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!CENTRARFIG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
![!2](!IMAGES/!1){!ifdef(LATEX)(!4)(!3) !WIDTH}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(archivo)[(texto)][(estilo Beamer)][(estilo Latex)])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(IMGP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMG(!1)(!2)(!3 .plain)(!4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(EXT)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifdef(HTML)(svg)(pdf)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UML(archivo)[(texto)][(estilo Beamer)][(estilo Latex)](definición)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!CENTRARFIG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifne(!5)()(!UML5(!1)(!2)(!3)(!4)(!5))(!ifne(!4)()(!UML4(!1)(!2)(!3)(!4))(!ifne(!3)()(!UML3(!1)(!2)(!3))(!UML2(!1)(!2))))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!DOT(archivo)[(texto)][(estilo Beamer)][(estilo Latex)](definición)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!CENTRARFIG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifne(!5)()(!DOT5(!1)(!2)(!3)(!4)(!5))(!ifne(!4)()(!DOT4(!1)(!2)(!3)(!4))(!ifne(!3)()(!DOT3(!1)(!2)(!3))(!DOT2(!1)(!2))))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ESPECIFICACIONES
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(ESPEC)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$$\left\{\begin{array}{ll}
  !1\end{array}\right.$$
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(ESPECINLINE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$\left\{\begin{array}{ll}
  !1\end{array}\right.$
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PRE)(\text{\textbf{Pre}}: & !1 \\!MASSEP)
!define(POST)(\text{\textbf{Post}}: & !PYPOST(!1))
!define(SIGNAT)(& !1 \\!MASSEP)
!define(VAR)(\(!ifdef(HTML)(!1)(\textcolor{black}{!1})\))
!define(OTRALINEA)(\\!MENOSSEP)
!define(NEQ)(!ifdef(HTML)(\mathrel{\char`≠})(\neq))
!define(SEP)(!MASSEP)
!define(MASSEP)(!ifdef(HTML)([0.5em])())
!define(MENOSSEP)(!ifndef(HTML)([-0.5em])([0.1em]))

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LAS SIGUIENTES MACROS SON AUXILIARES, NO PARA USO GENERAL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(CENTRARFIG)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifdef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::: centered
  !1:::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begingroup
  \centering
  !1
  \endgroup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})()
~~~~~~~~~~
!UMLCOMMON
!2
~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})(!2)
~~~~~~~~~~
!UMLCOMMON
!3
~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!3 !WIDTH .plain})(!2)
~~~~~~~~~~
!UMLCOMMON
!4
~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML5)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!ifdef(LATEX)(!4)(!3) !WIDTH .plain})(!2)
~~~~~~~~~~
!UMLCOMMON
!5
~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PYQUOTE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~~~~~~
x = r"""!1"""
print(x.replace('"', '\\"'))
~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PYNT)(!python3(print(r"""!1""".replace('_', '\\_'))))

!define(PYALGO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~~~~~~
x = r"""!1"""
# x = x.replace('\\', '\\\\')
print(' | ' + x.replace("\n", "\n| "))
~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PYPOST)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
x = r"""!1"""
print((r'!OTRALINEA' + '\n').join(x.rstrip().split('\n')).rstrip())
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!dot(!IMAGES/!1 {!WIDTH .plain})()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
  !DOTCOMMON
  !2
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!dot(!IMAGES/!1 {!WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
  !DOTCOMMON
  !3
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!dot(!IMAGES/!1 {!3 !WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
  !DOTCOMMON
  !4
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT5)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!dot(!IMAGES/!1 {!ifdef(LATEX)(!4)(!3) !WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
  !DOTCOMMON
  !5
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
