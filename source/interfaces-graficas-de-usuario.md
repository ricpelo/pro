---
title: Interfaces gráficas de usuario
author: Ricardo Pérez López
!DATE
nocite: |
  @roseman_tkdocs.com_nodate
---

# Introducción a Tkinter

## ¿Qué es Tkinter?

- Tkinter es la biblioteca estándar de Python para crear interfaces gráficas de
  usuario (GUI).

- Proporciona una forma sencilla de construir aplicaciones con ventanas,
  botones, etiquetas, campos de texto y otros elementos visuales.

- Es multiplataforma, lo que significa que las aplicaciones creadas con Tkinter
  pueden ejecutarse en diferentes sistemas operativos como GNU/Linux, Windows y
  macOS sin modificaciones importantes.

- Es relativamente fácil de aprender y usar, lo que la hace adecuada para
  principiantes en el desarrollo de interfaces gráficas.

## Instalación y primeras pruebas

- Tkinter forma parte de la biblioteca estándar de Python, por lo que debería
  encontrarse en cualquier instalación normal de Python.

  Esa es una de las principales ventajas que tiene respecto a otras bibliotecas
  de GUI como PyQt.

- Al ejecutar el siguiente comando:

  ```console
  $ python -m tkinter
  ```

  desde la línea de comandos del sistema operativo, se debería abrir una
  ventana que demuestre una interfaz Tk simple para saber si tkinter está
  instalado correctamente en su sistema.

- También muestra qué versión de Tcl/Tk está instalada para que pueda leer la
  documentación de Tcl/Tk específica de esa versión.

## Recursos y documentación

- Para saber más sobre Tkinter o resolver dudas técnicas puntuales, se pueden
  consultar los siguientes enlaces:

  - [Página de documentación oficial de Tkinter en `python.org`](https://docs.python.org/es/3.13/library/tkinter.html)

    Información técnica y oficial de Tkinter.

  - [TkDocs](https://tkdocs.com/)

    Es un extenso tutorial sobre como crear interfaces de usuario con Tkinter.
    Explica conceptos clave y muestra enfoques recomendados para usar la API
    moderna.

  - [Tkinter 8.5 reference: a GUI for Python](https://www.tkdocs.com/shipman/)

    Documentación de referencia sobre Tkinter 8.5 donde se detallan clases
    disponibles, métodos y opciones.

## Un primer ejemplo básico

- Un _Hola, mundo_ muy elemental en Tkinter podría ser el siguiente:

  ```python
  import tkinter as tk                        # Importa el módulo tkinter con el nombre tk
  raiz = tk.Tk()                              # Crea la ventana principal
  tk.Button(raiz, text="Hola, mundo").grid()  # Crea un botón dentro de la ventana principal
  raiz.mainloop()                             # Activa el bucle principal
  ```

- Este programa simplemente abre una ventana en la que se muestra un botón con
  el texto «`Hola, mundo`».

- El botón tiene el ancho justo para visualizar el texto que contiene, y la
  ventana tiene prácticamente el tamaño justo para contener el botón.

- Al pulsar ese botón no ocurre nada, y para salir del programa hay que
  finalizarlo cerrando la ventana o directamente terminando el proceso del
  intérprete.

## La ventana principal (`Tk`)

- La clase `Tk` representa la ventana principal de la aplicación, y esta es
  importante por varios motivos:

  - Toda aplicación Tkinter debe tener una ventana principal que sea instancia
    de `Tk` (y lo normal es que sólo sea exactamente una).

  - Las instancias de `Tk` son contenedores de elementos gráficos (también
    llamados _widgets_). Salvo casos excepcionales (como las ventanas de
    diálogo), los _widgets_ se deben visualizar siempre dentro de un contenedor
    y la instancia de `Tk` que creamos para nuestro programa nos sirve como
    contenedor principal de nuestra aplicación.

    Sin un contenedor, no podríamos visualizar _widgets_, así que la ventana
    principal es imprescindible en cualquier aplicación Tkinter.

- El funcionamiento de la interfaz gráfica realmente comienza cuando activamos
  el bucle principal de la ventana principal invocando su método `mainloop`.

## El bucle principal (*mainloop*!ifdef(HTML)(&nbsp;)())

- En interfaces gráficas, la ejecución del programa está dirigida por eventos
  (por ejemplo, pulsar un botón o elegir una opción en un menú) y no por un
  flujo lineal de instrucciones como en los programas de consola.

- El bucle principal (_mainloop_) de Tkinter es la función que pone en marcha
  la aplicación gráfica y la mantiene funcionando hasta que el usuario la
  cierra.

- El bucle principal se activa invocando el método `mainloop` sobre la
  instancia de `Tk` que representa la ventana principal de la aplicación.

- A partir de ese momento, el programa irá atendiendo los eventos que se vayan
  produciendo ejecutando el código encargado de _manejar_ o _gestionar_ dicho
  evento.

---

- Sus funciones principales son:

  - Inicia la gestión de eventos:

    Tkinter entra en un bucle infinito en el que espera la aparición de eventos
    (pulsaciones de los botones del ratón, pulsaciones de teclas,
    redimensionado de ventanas, etc.) y los gestiona según los manejadores de
    eventos que se hayan definido en el código.

  - Mantiene visible la ventana:

    Mientras `mainloop` está activo, la ventana de la aplicación se sigue
    mostrando y respondiendo a interacciones. Si no se llama a `mainloop`, la
    ventana puede crearse y cerrarse instantáneamente, porque el programa
    termina sin esperar eventos.

  - Es un bucle de eventos:

    Internamente, comprueba si hay nuevos eventos en la cola de eventos del
    sistema operativo y los procesa uno a uno, actualizando la interfaz cuando
    sea necesario.

---

- El bucle principal termina:

  - Cuando el usuario cierra la ventana principal, o

  - Si el programa llama explícitamente al método `quit` de la ventana
    principal para finalizarlo.

- Aspectos importantes a tener en cuenta:

  - El bucle principal es _bloqueante_:

    Cuando se llama a `mainloop`, no se ejecuta nada después de esa línea hasta
    que el bucle termina.

  - No se debe llamar varias veces:

    Normalmente, se llama una sola vez. Si se necesita reiniciar la ventana, se
    debe crear un nuevo `Tk` o usar `mainloop` tras finalizar la ejecución
    anterior, pero no se debe intentar mantener dos ejecuciones simultáneas de
    `mainloop`.

# Widgets básicos

## `Label`, `Button`, `Entry`, `Text`, `Checkbutton`, `Radiobutton`

## Atributos comunes: texto, color, fuente, tamaño

## Métodos útiles: `get`, `insert`, `delete`

# *Layout* y organización de la interfaz

## Geometría con `pack`, `grid` y `place`

## Uso de `Frame` para dividir la ventana

## Diseño *responsive* básico

# Eventos y funciones asociadas

## Asociar funciones a eventos (*callbacks*)

## Uso de `command=`

## Eventos con `bind`

## Variables de control (`StringVar`, `IntVar`, etc.)

!BIBLIOGRAFIA
