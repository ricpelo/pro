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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(FLOWCHART)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!sh(!FLOWCHART_SH "!IMAGES/!1" "!2")
!ifdef(HTML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(!1)()(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMGP(!1)()(width=40%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LAS SIGUIENTES MACROS SON AUXILIARES, NO PARA USO GENERAL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
