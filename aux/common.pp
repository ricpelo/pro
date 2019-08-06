!comment
~~~~~~~~~~~~~~~~~~~~~~
DEFINICIONES GENERALES
~~~~~~~~~~~~~~~~~~~~~~

!define(DATE)(date: IES Doñana, curso !CURSO)
!define(IMAGES)(images)
!define(SCRIPTS)(scripts)
!define(WIDTH)(width=!ifdef(LATEX)(60%)(80%))
!define(DIAGRAM)(node_modules/diagrams/bin/diagrams.js)
!define(FLOWCHART_SH)(!SCRIPTS/flowchart.sh)
!define(UMLCOMMON)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale 2
skinparam backgroundColor transparent
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~
MACROS DE USO GENERAL
~~~~~~~~~~~~~~~~~~~~~

!define(ALGO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{Shaded}
\raggedright
\small
!PYALGO(!1)
\End{Shaded}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(BREAK)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifdef(BEAMER)
~~~~~~~~~~~~~~~~~~
```

---

```!ifdef(!1)(!1)(php)
~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(QUIZ)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!SCRIPTS/quiz.php !ifdef(HTML)(html)(!ifdef(LATEX)(latex)(beamer)) "!PY(!1)")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(RESPUESTAS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifndef(HTML)
~~~~~~~~~~~~~~~~~~~~
# Respuestas a las preguntas

\shipoutAnswer
~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMG(archivo)[(texto)][(estilo Beamer)][(estilo Latex)]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(IMG)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

![!2](!IMAGES/!1){!ifdef(LATEX)(!4)(!3) !WIDTH}

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(archivo)[(texto)][(estilo Beamer)][(estilo Latex)])
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(IMGP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMG(!1)(!2)(!3 .plain)(!4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UML(archivo)[(texto)][(estilo Beamer)][(estilo Latex)](definición)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

!ifne(!5)()(!UML5(!1)(!2)(!3)(!4)(!5))(!ifne(!4)()(!UML4(!1)(!2)(!3)(!4))(!ifne(!3)()(!UML3(!1)(!2)(!3))(!UML2(!1)(!2))))

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!DOT(archivo)(texto)(definición)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(DOT)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

!dot(!IMAGES/!1 {.plain !WIDTH})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
  graph [rankdir = LR, size = "12!", bgcolor = "transparent", fontname = "Lato", fontsize = 14 ];
  node [shape = rectangle, fillcolor = "white", style = "filled", fontname = "Lato", fontsize = 13 ];
  edge [fontname = "Lato", fontsize = 12 ];
  !3
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!FLOWCHART(archivo)[(texto)][(estilo Beamer)][(estilo Latex)](definición)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifne(!5)()(!FLOWCHART5(!1)(!2)(!3)(!4)(!5))(!ifne(!4)()(!FLOWCHART4(!1)(!2)(!3)(!4))(!ifne(!3)()(!FLOWCHART3(!1)(!2)(!3))(!FLOWCHART2(!1)(!2))))
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LAS SIGUIENTES MACROS SON AUXILIARES, NO PARA USO GENERAL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!FLOWCHART_SH "!IMAGES/!1" "!2")
!IMGP(!1)()(width=40%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!FLOWCHART_SH "!IMAGES/!1" "!3")
!IMGP(!1)(!2)(width=40%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!FLOWCHART_SH "!IMAGES/!1" "!4")
!IMGP(!1)(!2)(!3 width=40%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART5)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!FLOWCHART_SH "!IMAGES/!1" "!5")
!IMGP(!1)(!2)(!3 width=40%)(!4 width=40%)
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

!define(PY)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~~~~~~
x = """!1"""
print(x.replace('"', '\\"'))
~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(PYALGO)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!python3
~~~~~~~~~~~~~~~
x = r"""!1"""
# x = x.replace('\\', '\\\\')
print('| ' + x.replace("\n", "\n| "))
~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
