!comment(DEFINICIONES GENERALES)
!comment(======================)

!define(IMAGES)(images)
!define(WIDTH)(width=!ifdef(LATEX)(60%)(80%))

!comment(MACROS DE USO GENERAL)
!comment(=====================)

!comment(!IMG(archivo)[(texto)][(estilo Beamer)][(estilo Latex)])

!define(IMG)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

![!2](!IMAGES/!1){!ifdef(LATEX)(!4)(!3) !WIDTH}

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment(!IMGP(archivo)[(texto)][(estilo Beamer)][(estilo Latex)])

!define(IMGP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
!IMG(!1)(!2)(!3 .plain)(!4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment(!UML(archivo)[(texto)][(estilo Beamer)][(estilo Latex)](definición))

!define(UML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

!ifne(!5)()(!UML5(!1)(!2)(!3)(!4)(!5))(!ifne(!4)()(!UML4(!1)(!2)(!3)(!4))(!ifne(!3)()(!UML3(!1)(!2)(!3))(!UML2(!1)(!2))))

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment(LAS SIGUIENTES MACROS SON AUXILIARES, NO PARA USO GENERAL)

!define(UML2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UMLCOMMON
!2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UMLCOMMON
!3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!3 !WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UMLCOMMON
!4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML5)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!ifdef(LATEX)(!4)(!3) !WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!UMLCOMMON
!5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UMLCOMMON)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale 2
skinparam backgroundColor transparent
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
