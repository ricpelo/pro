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

## Introducción

- Los **widgets** son los componentes visuales de la interfaz.

- Los más comunes son:

  - `Label`: muestra texto o imágenes
  - `Button`: botón pulsable
  - `Entry`: campo de texto de una sola línea
  - `Text`: área de texto multilínea
  - `Checkbutton`: casilla de verificación
  - `Radiobutton`: botón de opción (selección exclusiva)

## `Label`

- El widget `Label` se utiliza para **mostrar texto o imágenes**.

- No permite interacción directa por parte del usuario.

- Usos comunes:

  - Títulos y subtítulos.

  - Etiquetas descriptivas de otros widgets.

  - Mensajes informativos.

---

- Ejemplo:

  ```python
  label = tk.Label(root, text="Nombre:")
  label.pack()
  ```

- Con estilos:

  ```python
  label = tk.Label(
      root,
      text="Bienvenido",
      font=("Arial", 16),
      fg="white",
      bg="black"
  )
  label.pack()
  ```

## `Button`

- El widget `Button` representa un **botón pulsable** que ejecuta una función
  cuando se pulsa.

- Usos comunes:

    - Confirmar acciones.

    - Lanzar cálculos.

    - Cerrar ventanas.

- Ejemplo:

  ```python
  def saludar():
      print("Hola")

  button = tk.Button(root, text="Saludar", command=saludar)
  button.pack()
  ```

- Cambiar el texto dinámicamente:

  ```python
  button.config(text="Nuevo texto")
  ```

## `Entry`

- `Entry` es un **campo de texto de una sola línea**, pensado para introducir
  datos cortos.

  - Usos comunes:

    - Campos de formulario.

    - Búsquedas.

- Ejemplo:

  ```python
  entry = tk.Entry(root)
  entry.pack()
  ```

- Obtener y modificar su contenido:

  ```python
  texto = entry.get()
  entry.delete(0, tk.END)
  entry.insert(0, "Texto inicial")
  ```

## `Text`

- El widget `Text` permite **introducir y mostrar texto multilínea**.

- Usos comunes:

    - Editores de texto simples.

    - Cuadros de comentarios.

    - Visualización de _logs_.

- Ejemplo:

  ```python
  text = tk.Text(root, width=40, height=10)
  text.pack()
  ```

- Insertar y borrar contenido:

  ```python
  text.insert("1.0", "Hola
  ")
  text.delete("1.0", tk.END)
  ```

## `Checkbutton`

- `Checkbutton` representa una **casilla de verificación** que puede estar
  activada o desactivada.

- Usos comunes:

  - Opciones independientes.

  - Preferencias del usuario.

- Suele utilizarse junto con `BooleanVar` o `IntVar`.

- Ejemplo:

  ```python
  var = tk.BooleanVar()
  check = tk.Checkbutton(root, text="Aceptar condiciones", variable=var)
  check.pack()
  ```

- Consultar el estado:

  ```python
  print(var.get())  # True o False
  ```

## `Radiobutton`

- `Radiobutton` permite **seleccionar una opción entre varias**, siendo
  excluyentes entre sí.

- Usos comunes:

  - Selección de una sola alternativa.

  - Formularios.

- Todos los botones del grupo comparten la misma variable de control.

- Ejemplo:

    ```python
    opcion = tk.StringVar(value="A")

    rb1 = tk.Radiobutton(root, text="Opción A", variable=opcion, value="A")
    rb2 = tk.Radiobutton(root, text="Opción B", variable=opcion, value="B")

    rb1.pack()
    rb2.pack()
    ```

- Obtener la opción seleccionada:

  ```python
  print(opcion.get())
  ```

### Atributos comunes

- Muchos widgets de Tkinter comparten un conjunto de **atributos (u opciones)**
  que controlan su apariencia y comportamiento.

- Estos atributos pueden indicarse al crear el widget o modificarse
  posteriormente mediante el método `config()`.

#### Texto (`text`)

- El atributo `text` define el **contenido textual** que muestra el widget.

- Widgets habituales:

    - `Label`

    - `Button`

    - `Checkbutton`

    - `Radiobutton`

- Ejemplo:

  ```python
  label = tk.Label(root, text="Hola mundo")
  label.pack()
  ```

- Modificar el texto en tiempo de ejecución:

  ```python
  label.config(text="Nuevo texto")
  ```

#### Color (`fg` y `bg`)

- Los colores se controlan principalmente con:

    - `fg` o `foreground`: color del texto.

    - `bg` o `background`: color de fondo.

- Ejemplo:

  ```python
  button = tk.Button(
      root,
      text="Aceptar",
      fg="white",
      bg="green"
  )
  button.pack()
  ```

- Los colores pueden indicarse por nombre (`"red"`, `"blue"`) o en formato
  hexadecimal (`"#ff0000"`).

#### Fuente (`font`)

- El atributo `font` controla el **tipo de letra, tamaño y estilo**.

- Formato habitual:

  ```python
  font=(familia, tamaño, estilo)
  ```

- Ejemplo:

  ```python
  label = tk.Label(
      root,
      text="Título",
      font=("Arial", 18, "bold")
  )
  label.pack()
  ```

- Estilos comunes:

  - `"bold"`

  - `"italic"`

  - `"underline"`

#### Tamaño (`width` y `height`)

- Los atributos `width` y `height` definen el **tamaño del widget**, aunque su
  significado depende del tipo de widget:

  - En `Label`, `Button` y `Entry`: número de caracteres.

  - En `Text`: caracteres (ancho) y líneas (alto).

- Ejemplos:

  ```python
  entry = tk.Entry(root, width=30)
  entry.pack()
  ```

  ```python
  text = tk.Text(root, width=40, height=5)
  text.pack()
  ```

### Métodos útiles

- Muchos widgets proporcionan métodos para **acceder y modificar su
  contenido**, especialmente los widgets de entrada de texto.

#### `get`

- Obtiene el contenido actual del widget.

  ```python
  texto = entry.get()
  contenido = text.get("1.0", tk.END)
  ```

#### `insert`

- Inserta texto en una posición determinada, con la siguiente sintaxis:

  ```python
  insert(posición, texto)
  ```

  ```python
  entry.insert(0, "Texto inicial")
  text.insert("1.0", "Primera línea
  ")
  ```

#### `delete`

- Elimina contenido entre dos posiciones, con la siguiente sintaxis:

  ```python
  delete(inicio, fin)
  ```

  ```python
  entry.delete(0, tk.END)
  text.delete("1.0", tk.END)
  ```

!UNUN(Resumen práctico)

| Widget   | `get` | `insert` | `delete` |
|----------|:-----:|:--------:|:--------:|
| `Entry`  |  Sí   |    Sí    |    Sí    |
| `Text`   |  Sí   |    Sí    |    Sí    |

# *Layout*!ifdef(HTML)(&nbsp;)() y organización de la interfaz

## Introducción

- Tkinter no posiciona los widgets automáticamente. Para ello se usan
  **gestores de geometría**.

- En Tkinter, `pack`, `grid` y `place` son gestores de geometría (_geometry
  managers_).

- Su función es decidir dónde y cómo se colocan los widgets dentro de un
  contenedor (una ventana `Tk` o un `Frame`).

- Un widget no aparece en pantalla hasta que se le aplica alguno de estos
  métodos.

---

- Los gestores de geometría son el mecanismo que usa Tkinter para:

    - Asignar posición.

    - Asignar tamaño.

    - Reorganizar los widgets cuando la ventana cambia de tamaño.

- Cada contenedor (`Tk`, `Frame`, etc.) puede usar sólo un gestor de geometría
  a la vez.

## Geometría con `pack`, `grid` y `place`

- Los tres gestores de geometría en Tkinter son:

  - `pack`: organiza los widgets en bloques (arriba, abajo, izquierda,
    derecha).

  - `grid`: organiza los widgets en filas y columnas.

  - `place`: posicionamiento absoluto (coordenadas).

- Ejemplo con `pack`:

  ```python
  label.pack(side="top", fill="x")
  ```

- Ejemplo con `grid`:

  ```python
  label.grid(row=0, column=0)
  button.grid(row=1, column=0)
  ```

- No se deben mezclar distintos gestores de geometría **en el mismo
  contenedor**.

## Uso de `Frame` para dividir la ventana

- `Frame` es un contenedor que permite agrupar widgets y estructurar la
  interfaz.

  ```python
  frame = tk.Frame(root)
  frame.pack()

  label = tk.Label(frame, text="Dentro del frame")
  label.pack()
  ```

- Usar `Frame` facilita:

  - Interfaces más claras.

  - Reutilización de componentes.

  - Uso combinado de distintos gestores de geometría.

## Diseño *responsive*!ifdef(HTML)(&nbsp;)() básico

- Para que la interfaz se adapte al tamaño de la ventana:

  - Usar `fill` y `expand` con `pack`.

  - Configurar pesos con `grid_rowconfigure` y `grid_columnconfigure`.

- Ejemplo:

  ```python
  root.columnconfigure(0, weight=1)
  root.rowconfigure(0, weight=1)
  ```

# Eventos y funciones asociadas

## Introducción

- Tkinter funciona mediante **eventos** (acciones del usuario) y **callbacks**
  (funciones que se ejecutan como respuesta).

## Asociar funciones a eventos (*callbacks*)

- Un *callback* es una función que se pasa como argumento y se ejecuta cuando
  ocurre un evento.

  ```python
  def saludar():
      print("Hola")
  ```

### Uso de `command=`

- Muchos widgets (como `Button`) aceptan el parámetro `command`:

  ```python
  button = tk.Button(root, text="Saludar", command=saludar)
  button.pack()
  ```

- Se pasa la función **sin paréntesis**.

### Eventos con `bind`

- `bind` permite asociar funciones a eventos más generales:

  ```python
  def al_pulsar_tecla(event):
      print(event.keysym)

  root.bind("<Key>", al_pulsar_tecla)
  ```

- Algunos eventos comunes:

    - `<Button-1>`: pulsación del botón izquierdo del ratón.

    - `<Key>`: pulsación de cualquier tecla.

    - `<Return>`: pulsación de la tecla Enter.

## Variables de control

- Las **variables de control** enlazan el estado de un widget con una variable
  Python.

- Tipos habituales:

  - `StringVar`

  - `IntVar`

  - `DoubleVar`

  - `BooleanVar`

---

- Ejemplo:

  ```python
  var = tk.StringVar()
  entry = tk.Entry(root, textvariable=var)
  entry.pack()

  print(var.get())
  var.set("Nuevo valor")
  ```

- Son especialmente útiles con `Entry`, `Checkbutton` y `Radiobutton`.

!BIBLIOGRAFIA
