!define(IMAGES)(images)
!define(WIDTH)(width=!ifdef(LATEX)(60%)(80%))

!define(IMG)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

![!2](!IMAGES/!1){!ifdef(LATEX)(!4)(!3) !WIDTH}

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(IMGP)
~~~~~~~~~~~~~~~~~~~~~~~
!IMG(!1)(!2)(!3 .plain)(!4)
~~~~~~~~~~~~~~~~~~~~~~~

!define(UML)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\Begin{center}

!ifeq(!3)()(!UML2(!1)(!2))(!UML3(!1)(!2)(!3))

\End{center}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale 2.5
skinparam backgroundColor transparent
!2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(UML3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!uml(!IMAGES/!1 {!WIDTH .plain})(!2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scale 2.5
skinparam backgroundColor transparent
!3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
