---
title: Relaciones entre clases Python
author: Ricardo Pérez López
!DATE
---

# Relaciones básicas

## Introducción

- Los objetos de un programa interactúan entre sí durante la ejecución del
  mismo, por lo que decimos que **los objetos se relacionan entre sí**.

- Las **relaciones entre objetos** pueden ser de varios tipos.

- Por ejemplo, cuando un objeto **envía un mensaje** a otro, tenemos un ejemplo
  de relación del tipo **usa** (el primer objeto «usa» al segundo).

- Otras veces, los objetos **contienen** a otros objetos, o bien **forman
  parte** de otros objetos.

- Finalmente, a veces las relaciones entre los objetos son meramente
  **conceptuales**:

  - Son relaciones que **no se reflejan** directamente **en el código fuente**
    del programa, sino que aparecen durante el **análisis** del problema a
    resolver o como parte del **diseño** de la solución, en las etapas de
    análisis y diseño del sistema.

---

- A la relación específica que se da entre dos objetos concretos se denomina
  **enlace**.

- Cuando una o varias instancias de una clase está relacionada con una o varias
  instancias de otra clase, también podemos decir que ambas clases están
  relacionadas.

- Una **relación entre clases** representa un conjunto de posibles relaciones
  entre instancias de esas clases (un **conjunto de _enlaces_**).

- Las relaciones entre clases se pueden representar gráficamente en los
  llamados **diagramas de clases**.

- Esos diagramas se construyen usando un **lenguaje de modelado** visual
  llamado **UML**, que se estudia con detalle en el módulo _Entornos de
  desarrollo_.

- Entre otras cosas, el lenguaje UML describe los distintos _tipos de
  relaciones entre clases_ que se pueden dar en un sistema orientado a objetos
  y cómo se representan y se identifican gráficamente.

---

!UML(ejemplo-diagrama-clases.png)(Ejemplo de diagrama de clases)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Usuario "1" -- "0..*" Tuit : escribe
Usuario "1..*" --o "0..*" Grupo : pertenece
Grupo "1" *-- "0..*" Discusión
Discusión "1" *--- "0..*" Tuit
class Usuario {
    -nombre: String
    -apellidos: String
}
class Grupo {
    -nombre: String
    -usuarios: Usuario[]
}
class Discusión {
    -título: String
}
class Tuit {
    -texto: String
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<!--*-->

---

- La **multiplicidad de una clase en una relación** representa la cantidad de
  instancias de esa clase que se pueden relacionar con una instancia de la otra
  clase en esa relación.

- El lenguaje UML también describe la sintaxis y la semántica de las posibles
  _multiplicidades_ que se pueden dar en una relación entre clases.

- Esas multiplicidades también aparecen en los diagramas de clases.

- Ejemplos de sintaxis:

  - $n$: exactamente $n$ instancias (siendo $n$ un número entero).

  - $*$: cualquier número de instancias.

  - $n..m$: de $n$ a $m$ instancias.

  - $n..*$: de $n$ instancias en adelante.

---

- En el módulo de _Programación_ sólo trabajaremos con las relaciones que se
  reflejen en el código fuente del programa y que, por tanto, formen parte del
  mismo.

- Por tanto, las **relaciones conceptuales** que se puedan establecer a nivel
  semántico durante el análisis o el diseño del sistema no se verán aquí y sólo
  se trabajarán en _Entornos de desarrollo_.

- En ese módulo también se estudia que los diagramas de clases son una forma de
  **modelar la estructura y el funcionamiento de un sistema**.

- Está relacionado también con el **modelo de datos** que se construye en el
  módulo de _Bases de datos_.

- Todos estos **artefactos** (código fuente, diagrama de clases y modelo de
  datos) representan puntos de vista distintos pero complementarios del mismo
  sistema.

## Asociación

- Una **asociación** simple es una relación _genérica_ que se establece entre
  dos clases.

- Se utiliza cuando se quiere representar el hecho de que las dos clases están
  relacionadas de alguna manera **distinta a la de otros tipos de relaciones
  más específicas** (dependencia, agregación, composición, generalización,
  etc.).

- Tiene más interés en el módulo de _Entornos de desarrollo_, ya que se usa
  principalmente durante el análisis y diseño preliminar del sistema.

- En _Programación_ tiene menos utilidad y casi siempre se puede sustituir por
  otro tipo de relación más específica.

- Las asociaciones suelen llevar nombre, ya que representan una relación
  conceptual y hay que aclarar cuál es (normalmente es un nombre asociado al
  **dominio del problema**).

- En ese sentido, se parecen mucho a las relaciones del **modelo
  Entidad-Relación** que se estudia en _Bases de datos_.

---

- Por ejemplo, si estamos construyendo una aplicación que simule una
  calculadora, podríamos tener las clases `Calculadora` y `Numero`.

- En ese caso, podríamos decir que se establece una _asociación_ entre las
  clases `Calculadora` y `Numero`: la calculadora _manipula_ números.

- Dicha asociación se puede representar así en un diagrama de clases, usando el
  lenguaje UML:

:::: columns

::: column

!UML(calculadora-asocia-numero.png)()(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Calculadora -- Numero : manipula
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- La asociación se llama _manipula_ y representa una relación que se da
  conceptualmente en el modelo que estamos haciendo de nuestra aplicación.

- No hay más pistas sobre qué quiere decir _manipular_ números.

- Puede ser útil durante el análisis pero no nos ayuda mucho en _Programación_.

:::

::::

## Dependencia

- Una **dependencia** es un tipo de relación que representa el hecho de que una
  clase depende de otra por algún motivo.

- Ese motivo se indica en la misma dependencia usando un **estereotipo**.

- Un _estereotipo_ es una etiqueta entre comillas («») que acompaña a la
  relación y que indica de qué tipo es, o bien aporta más información.

- En _Programación_ se puede usar, entre otras cosas, para representar el hecho
  de que una clase «usa» a la otra de alguna forma.

- Por ejemplo, cuando un método de una clase necesita acceder a una
  instancia de otra clase.

  En ese caso, esa instancia la puede recibir como argumento, o bien puede
  crearla y destruirla el propio método.

- También cuando una clase llama a un método de la otra clase.

---

- Siguiendo con el ejemplo anterior de la calculadora, si partimos del
  siguiente código:

  ```python
  class Calculadora:
      @staticmethod
      def suma(x, y):
          """Devuelve la suma de dos instancias de la clase Numero."""
          return x.get_valor() + y.get_valor()
  ```

- Aquí ya tenemos claro que se establece una _dependencia_ entre las clases
  `Calculadora` y `Numero`: la clase `Calculadora` _«usa»_ a la clase `Numero`.

---

- Esa dependencia se representa gráficamente así:

  !UML(calculadora-dependencia-numero.png)()(width=20%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Calculadora ..> Numero : <<usa>>
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En lugar del estereotipo _«usa»_, también podríamos haber usado el
  estereotipo _«llama»_, que representa el hecho de que la clase origen llama a
  algún método de la clase destino.

## Agregación

- La **agregación** es una relación que se establece entre una clase (la
  **agregadora**) y otra clase (la **agregada**).

- Representa la relación «**tiene**»: la agregadora _tiene_ a la agregada.

- Podríamos decir que la clase agregada **forma parte** de la agregadora, pero
  de una forma **débil**, ya que los objetos de la clase agregadora y de la
  clase agregada tienen su existencia propia, independiente unos de otros.

- Para ello, los objetos de la clase agregadora **almacenan referencias** a los
  objetos agregados.

---

- Por tanto:

  - La clase agregada puede formar parte de varias clases agregadoras.

  - Según sea el caso, un objeto de la clase agregada puede existir aunque no
    forme parte de ningún objeto de la clase agregadora.

  - La clase agregadora no tiene por qué ser la responsable de crear el objeto
    agregado.

  - Cuando se destruye un objeto de la clase agregadora, no es necesario
    destruir los objetos de la clase agregada.

---

- Por ejemplo:

:::: columns

::: column

- Los grupos tienen alumnos. Un alumno puede pertenecer a varios grupos, y un
  alumno existe por sí mismo aunque no pertenezca a ningún grupo.

- La clase `Grupo` «agrega» a la clase `Alumno` y contiene referencias a los
  alumnos del grupo.

:::

::: column

!UML(grupo-agrega-alumno.png)()(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Grupo "0..*" o--- "0..*" Alumno
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

```python
class Grupo:
    def __init__(self):
        self.__alumnos = []  # Guarda una lista de referencias a Alumnos

    def get_alumnos(self):
        return self.__alumnos

    def meter_alumno(self, alumno):
        self.__alumnos.append(alumno)

    def sacar_alumno(self, alumno):
        try:
            self.__alumnos.remove(alumno)
        except ValueError:
            raise ValueError("El alumno no está en el grupo")

daw1 = Grupo()           # Los objetos los crea...
pepe = Alumno()          # ... el programa principal, así que ...
juan = Alumno()          # ... ningún objeto crea a otro.
daw1.meter_alumno(pepe)  # Metemos en __alumnos una referencia a pepe
daw1.meter_alumno(juan)  # Metemos en __alumnos una referencia a juan
daw1.sacar_alumno(pepe)  # Eliminamos de __alumnos la referencia a pepe
daw2 = Grupo()           # Se crea otro grupo
daw2.meter_alumno(juan)  # juan está en daw1 y daw2 al mismo tiempo
```

## Composición

- La **composición** es una relación que se establece entre una clase (la clase
  **compuesta**) y otra clase (la clase **componente**).

- Representa la relación «**está compuesto por**»: la compuesta _está compuesta
  por_ sus componentes.

- También se puede decir que la clase componente **forma parte** de la clase
  compuesta, pero de una forma **fuerte**, ya que los objetos componentes sólo
  pueden existir como parte de un objeto compuesto.

- Para ello, los objetos de la clase compuesta **almacenan referencias** de los
  objetos compuestos, pero de manera que esas referencias no se pueden
  compartir entre varios objetos compuestos.

---

- Por tanto:

  - Un objeto componente sólo puede formar parte de un único objeto compuesto.

  - Un objeto de la clase componente sólo puede existir como parte de un objeto
    compuesto.

  - La clase compuesta es responsable de crear y almacenar todos sus objetos
    componentes.

  - Cuando se destruye un objeto compuesto, se deben destruir todos sus objetos
    componentes.

---

- Por ejemplo:

:::: columns

::: column

- En Twitter, una cuenta tiene una serie de tuits. Cada tuit debe pertenecer a
  una cuenta, pero no pueden pertenecer a más de una cuenta al mismo tiempo.
  Cuando se elimina una cuenta, se eliminan todos sus tuits.

- Junto al rombo relleno siempre habrá una multiplicidad de "1", ya que un
  componente sólo puede formar parte de un objeto compuesto.

:::

::: column

!UML(cuenta-se-compone-de-tuits.png)()(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cuenta "1" *--- "0..*" Tuit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

```python
class Tuit:
    def __init__(self, texto):
        self.__texto = texto
        self.__ident = id(self)

    def get_ident(self):
        return self.__ident

class Cuenta:
    def __init__(self):
        self.__tuits = []  # Guarda una lista de referencias a Tuits

    def get_tuits(self):
        return self.__tuits[:]

    def crear_tuit(self, texto):
        t = Tuit(texto)           # El tuit se crea dentro de la cuenta
        self.__alumnos.append(t)  # La cuenta almacena el tuit

    def eliminar_tuit(self, ident):
        for t in self.__tuits:
            if t.get_ident() == ident:
                self.__alumnos.remove(t)
        raise ValueError("No existe ningún tuit con ese id")

c1 = Cuenta()
c1.crear_tuit("Este módulo es muy bonito")
c1.crear_tuit("Me encanta DAW")
c2 = Cuenta()
c2.crear_tuit("Odio Programación")
```

---

- Resumen:

  ---------------------------------------------------------------
                                      Agregación     Composición
  --------------------------------- --------------- -------------
  Una parte puede pertenecer a...     Varios todos   Un todo
                                                     únicamente

  Una parte puede existir aunque          Sí             No
  no pertenezca a un todo.

  El todo es responsable de crear         No             Sí
  la parte.

  El todo es responsable de               No             Sí
  almacenar la parte.

  Cuando se destruye el todo, se          No             Sí
  debe destruir la parte.

  Multiplicidad en el todo.           Cualquiera         1
  --------------------------------------------------------------

# Herencia

## Generalización

- La relación de **generalización** es un tipo de relación que se da entre una
  clase (la **superclase** o **clase base**) y otra clase (la **subclase** o
  **clase derivada**).

- Representa la relación «**es un(a)**»: una instancia de la subclase también
  _es una_ instancia de la superclase.

- También se puede decir que:

  - La subclase _es una_ forma más especializada de la superclase.

  - La superclase _es una_ forma más general de la subclase.

- La práctica totalidad de los lenguajes orientados a objetos permiten definir
  clases derivadas a partir de otras clases, creando lo que se denominan
  **jerarquías de generalización**.

---

Por ejemplo:

- En un Instituto hay dos tipos de trabajadores: docentes y PAS (personal de
  administración y servicios).

:::: columns

::: column

- Ambos comparten características comunes pero también tienen otras que los
  diferencian.

- Todo docente «es un» trabajador, y todo PAS también «es un» trabajador.

- Pero no podemos decir que todo trabajador es un docente, ya que podría ser un
  PAS.

- Por tanto, podemos decir que tanto `Docente` como `PAS` son subclases de
  `Trabajador`.

:::

::: column

!UML(trabajador-generaliza-docente-pas.png)()(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Trabajador <|--- Docente
Trabajador <|--- PAS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Se puede usar la generalización para:

  - Cambiar o ampliar las características de una clase creando a partir de ella
    otra más especializada (una _subclase_ de la original).

  - Combinar las características de varias clases en una clase más general que
    agrupe los elementos comunes a todas ellas (una _superclase_ de las
    originales).

## Herencia

- A través de la relación de generalización, las subclases adquieren
  (_heredan_) las características de la superclase.

- A ese mecanismo se le denomina **herencia**.

- Son dos conceptos distintos pero interconectados:

  - La _generalización_ es la relación por la cual una clase se convierte en
    subclase de otra.

  - La _herencia_ es el mecanismo por el que una subclase adquiere
    características de la superclase.

- La herencia puede considerarse como un mecanismo de **reutilización de
  código** entre la superclase y la subclase, evitando repeticiones
  innecesarias.

## Modos

- Existen dos modos de generalización, en función de la cantidad de superclases
  que se le permite tener a una subclase dada:

  - **Generalización simple**: también llamada **herencia simple**, es cuando
    una subclase sólo puede tener una superclase.

  - **Generalización múltiple**: también llamada **herencia múltiple**, es
    cuando una subclase puede tener varias superclases (no sólo una).

- Hay lenguajes que sólo admiten herencia simple y lenguajes que admiten
  herencia múltiple.

- En concreto:

  - Python soporta la herencia múltiple.

  - Java sólo soporta la herencia simple.

### Simple

- En la herencia simple, una clase sólo puede subclase de una única superclase.

  Una clase puede ser superclase de muchas clases, pero en la herencia simple,
  sólo puede ser subclase de una única superclase.

:::: columns

::: column

- Por ejemplo, el caso de un docente que también es un trabajador, de forma que
  la clase `Docente` sólo es subclase de `Trabajador`.

:::

::: column

!UML(trabajador-generaliza-docente.png)()(width=35%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Trabajador <|-- Docente
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Ésto también sería herencia simple, ya que tenemos dos relaciones de
  generalización separadas pero ninguna clase es subclase de más de una
  superclase.

- Por tanto, lo que tenemos son dos herencias simples, no una herencia
  múltiple:

!UML[doble-herencia-simple.png][Una superclase con dos subclases (dos herencias simples)][width=30%]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A <|-- B
A <|-- C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


---

- Ésto, en cambio, no sería herencia simple, sino múltiple:

!UML[herencia-multiple.png][Una subclase con dos superclases (herencia múltiple)][width=30%]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A <|-- C
B <|-- C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Las relaciones de generalización pueden formar una cadena tan larga como sea
  necesaria.

- Por ejemplo, aquí tenemos **dos** relaciones de generalización simple:

:::: columns

::: column

!UML(trabajador-docente-investigador.png)()(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Trabajador <|-- Docente
Docente <|-- Investigador
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- `Trabajador` es **superclase _directa_** de `Docente` y **superclase
  _indirecta_** de `Investigador`.

- `Docente` es subclase (directa) de `Trabajador` y superclase (directa) de
  `Investigador`.

- `Investigador` es **subclase _directa_** de `Docente` y **subclase
  _indirecta_** de `Trabajador`.

:::

::::

---

- La forma de codificar la herencia en Python es especificar el nombre de la
  superclase (o superclases, si hubiera herencia múltiple) detrás del nombre de
  la subclase, entre paréntesis:

:::: columns

::: {.column width=60%}

```python
class Trabajador:
    """Trabajador es la superclase"""
    def set_nombre(self, nombre):
        self.__nombre = nombre

    def get_nombre(self):
        return self.__nombre

class Docente(Trabajador):
    """Docente es subclase de Trabajador"""
    def set_nrp(self, nrp):
        self.__nrp = nrp

    def get_nrp(self, nrp):
        return self.__nrp
```

:::

::: {.column width=40%}

- Con el código anterior, podemos crear instancias de las clases `Trabajador` y
  `Docente`:

```python
>>> t = Trabajador()
>>> t.set_nombre("Manolo")
>>> t.get_nombre()
'Manolo'
>>> d = Docente()
>>> d.set_nrp(273849)
>>> d.get_nrp()
273948
```

:::

::::

---

- Lo interesante del mecanismo de la herencia es que la subclase adquiere las
  características de la superclase, por lo que la clase `Docente` también
  dispone de los métodos `set_nombre()` y `get_nombre()` heredados de
  `Trabajador`:

:::: columns

::: {.column width=60%}

```python
class Trabajador:
    """Trabajador es la superclase"""
    def set_nombre(self, nombre):
        self.__nombre = nombre

    def get_nombre(self):
        return self.__nombre

class Docente(Trabajador):
    """Docente es subclase de Trabajador"""
    def set_nrp(self, nrp):
        self.__nrp = nrp

    def get_nrp(self, nrp):
        return self.__nrp
```

:::

::: {.column width=40%}

```python
>>> t = Trabajador()
>>> t.set_nombre("Manolo")
>>> t.get_nombre()
'Manolo'
>>> d = Docente()
>>> d.set_nrp(273849)
>>> d.get_nrp()
273948
>>> d.set_nombre("Juan")
>>> d.get_nombre()
'Juan'
```

:::

::::

- Es como si el código de los métodos `set_nombre()` y `get_nombre()` se
  hubiesen «copiado y pegado» dentro de la clase `Docente`.

---

- En realidad, el mecanismo funciona como una lista enlazada, más o menos como
  los entornos que hemos estudiado hasta ahora.

- Ya hemos visto en la unidad anterior que las **definiciones de las clases**
  se representan internamente mediante una estructura tipo **diccionario**.

- Esos diccionarios se conectan entre sí formando una **lista enlazada**, de
  forma que el diccionario que contiene la definición de la subclase **apunta**
  al diccionario de su **superclase directa**, siguiendo el camino que traza la
  relación de generalización.

- Esa lista será tan larga como sea necesario, y tendrá tantos diccionarios
  como clases haya en la cadena de herencia simple.

- De esta forma, la herencia va _propagando_ las características de la
  superclase a todas sus subclases (_directas_ e _indirectas_).

- En nuestro caso, el diccionario de `Docente` apunta al de `Trabajador`.

---

- Al llamar a un método sobre un objeto, el intérprete busca el método dentro
  del diccionario que contiene la definición de la clase del objeto:

  - Si encuentra el método, lo usa.

  - Si no lo encuentra, sigue subiendo por la lista enlazada localizando el
    siguiente diccionario (que será el que contenga la definición de su
    superclase directa), buscando ahí el método solicitado.

    El intérprete seguirá buscando en el resto de la lista hasta que encuentre
    el método o se acabe la lista de herencia, en cuyo caso dará un error
    `AttributeError` por método no encontrado.

!DOT(cadena-herencia-simple.svg)(Cadena de herencia simple)(width=40%)(width=45%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
subgraph cluster0 {
    label = <Clase <b>Trabajador</b>>
    bgcolor = white
    set_nombre [shape = plaintext, label = <<table border="0" cellborder="1"><tr><td>set_nombre</td><td>λ</td></tr></table>>]
    get_nombre [shape = plaintext, label = <<table border="0" cellborder="1"><tr><td>get_nombre</td><td>λ</td></tr></table>>]
}
subgraph cluster1 {
    label = <Clase <b>Docente</b>>
    bgcolor = white
    set_nrp [shape = plaintext, label = <<table border="0" cellborder="1"><tr><td>set_nrp</td><td>λ</td></tr></table>>]
    get_nrp [shape = plaintext, label = <<table border="0" cellborder="1"><tr><td>get_nrp</td><td>λ</td></tr></table>>]
}
set_nrp -> set_nombre [lhead = cluster0, ltail = cluster1, minlen = 2]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por eso podemos llamar al método `set_nombre()` sobre una instancia de la
  clase `Docente` aunque dicha clase no tenga definido ese método.

- Por el mecanismo de la herencia, el método lo hereda de su superclase
  `Trabajador`.

- En tiempo de ejecución, el intérprete busca el método recorriendo la cadena
  de herencia representada en la lista de diccionarios:

  - Primero lo busca en la definición de la clase `Docente`.

  - Como no lo encuentra, a continuación lo busca en la definición de la clase
    `Trabajador`.

  - Como ahora sí lo ha encontrado, lo ejecuta como si el método hubiese estado
    definido directamente en la clase `Docente`.

---

- Al igual que ocurre con los _métodos_, las **variables de clase** también se
  heredan de una clase a sus subclases:

  ```python
  class A:
      cadena = "Hola"

  class B(A):
      def saluda(self):
          print(B.cadena)

  b = B()
  b.saluda()  # Imprime "Hola"
  ```

### Múltiple

## Superclases y subclases

## Utilización de clases heredadas

# Polimorfismo

## Sobreescritura de métodos

## `super()`

## Sobreescritura de constructores

# Herencia vs. composición

