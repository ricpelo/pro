---
title: Programación orientada a objetos
author: Ricardo Pérez López
!DATE
---

# Introducción

## Recapitulación

- Recordemos lo que hemos aprendido hasta ahora:

  - La **abstracción de datos** nos permite definir tipos de datos complejos
    llamados **tipos abstractos de datos** (*TAD*), que se representan
    únicamente mediante las **operaciones** que manipulan esos datos y con
    **independencia de su implementación**.

  - Las funciones pueden tener **estado interno** usando funciones de orden
    superior y variables no locales.
    
  - Una función puede representar un dato.
  
  - Un dato puede tener estado interno usando el estado interno de la función
    que lo representa.

---

- Además:

  - El **paso de mensajes** agrupa las operaciones que actúan sobre ese dato
    dentro de una función que responde a diferentes mensajes **despachando** a
    otras funciones dependiendo del mensaje recibido. 

  - La función que representa al dato **encapsula su estado interno junto con
    las operaciones** que lo manipulan en *una sola unidad sintáctica* que
    oculta sus detalles de implementación.

- En conclusión:

  !CAJA
  ~~~~~~~~~~~~~~~~~
  Una función, por tanto, puede implementar un tipo abstracto de datos.
  ~~~~~~~~~~~~~~~~~

## La metáfora del objeto

- Al principio, distinguíamos entre funciones y datos: las funciones realizan
  operaciones sobre los datos y éstos esperan pasivamente a que se opere con
  ellos.

- Cuando empezamos a representar a los datos con funciones, vimos que los datos
  también pueden encapsular **comportamiento**.

- Esos datos ahora representan información, pero también **se comportan** como
  las cosas que representan.

- Por tanto, los datos ahora saben cómo reaccionar ante los mensajes que
  reciben cuando las demás partes del programa les envían mensajes.

- Esta forma de ver a los datos como objetos activos que se relacionan entre sí
  y que son capaces de reaccionar y cambiar su estado interno en función de los
  mensajes que reciben, da lugar a todo un nuevo paradigma de programación
  llamado **orientación a objetos** o **programación orientada a objetos**.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Definición:**

La **programación orientada a objetos** es un paradigma de programación en el
que los programas son vistos como formados por entidades llamadas **objetos**
que recuerdan su propio **estado interno** y que se comunican entre sí
mediante el **paso de mensajes** que se intercambian con la finalidad de:

- cambiar sus estados internos,
- compartir información y
- solicitar a otros objetos el procesamiento de dicha información.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- La **programación orientada a objetos** (también llamada **OOP**, del inglés
  *Object-Oriented Programming*) es un método para organizar programas que
  reúne muchas de las ideas vistas hasta ahora.

- Al igual que las funciones en la abstracción de datos, los objetos imponen
  barreras de abstracción entre el uso y la implementación de los datos.

- Al igual que los diccionarios y funciones de despacho, los objetos responden
  a peticiones que otros objetos le hacen en forma de mensajes para que se
  comporte de determinada manera.

- Los objetos tienen un estado interno local al que no se puede acceder
  directamente desde el entorno global, sino que debe hacerse por medio de las
  operaciones que proporciona el objeto.

- A efectos prácticos, por tanto, los objetos son datos abstractos.

---

- El sistema de objetos de Python proporciona una sintaxis cómoda para promover
  el uso de estas técnicas de organización de programas.
  
- Gran parte de esta sintaxis se comparte entre otros lenguajes de programación
  orientados a objetos.

- Ese sistema de objetos ofrece algo más que simple comodidad:

  - Proporciona una nueva metáfora para diseñar programas en los que varios
    agentes independientes interactúan dentro del ordenador.
  
  - Cada objeto agrupa el estado local y el comportamiento de una manera que
    abstrae la complejidad de ambos.
  
  - Los objetos se comunican entre sí y se obtienen resultados útiles como
    consecuencia de su interacción.
  
  - Los objetos no sólo transmiten mensajes, sino que también comparten el
    comportamiento entre otros objetos del mismo tipo y heredan características
    de otros tipos relacionados.

- El paradigma de la programación orientada a objetos tiene su propio
  vocabulario que apoya la metáfora del objeto.

## Perspectiva histórica


## Lenguajes orientados a objetos


# Conceptos básicos


## Clase

- Una **clase** es una construcción sintáctica que los lenguajes de
  programación orientados a objetos proporcionan como *azúcar sintáctico* para
  **implementar tipos abstractos de datos** de una forma cómoda y directa sin
  necesidad de usar funciones de orden superior, estado local o diccionarios de
  despacho.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~
En programación orientada a objetos:

- Se habla siempre de **clases** y no de *tipos abstractos de datos*.

- Una **clase** es la **implementación de un tipo abstracto de datos**.

- Las clases definen **tipos de datos** de pleno derecho en el lenguaje de
  programación.

~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Recordemos el ejemplo del tema anterior en el que implementamos el tipo
  abstracto de datos **Depósito** mediante la siguiente **función**:

:::: columns

::: column

```python
def deposito(fondos):
    def retirar(cantidad):
        nonlocal fondos
        if cantidad > fondos:
            return 'Fondos insuficientes'
        fondos -= cantidad
        return fondos

    def ingresar(cantidad):
        nonlocal fondos
        fondos += cantidad
        return fondos

    def saldo():
        return fondos

    def despacho(mensaje):
        if mensaje == 'retirar':
            return retirar
        elif mensaje == 'ingresar':
            return ingresar
        elif mensaje == 'saldo':
            return saldo
        else:
            raise ValueError('Mensaje incorrecto')

    return despacho
```

:::

::: column

- Ese mismo TAD se puede implementar como una **clase** de la siguiente forma:

```python
class Deposito:
    def __init__(self, fondos):
        self.fondos = fondos

    def retirar(self, cantidad):
        if cantidad > self.fondos:
            return 'Fondos insuficientes'
        self.fondos -= cantidad
        return self.fondos

    def ingresar(self, cantidad):
        self.fondos += cantidad
        return self.fondos

    def saldo(self):
        return self.fondos
```

- Más tarde estudiaremos los detalles técnicos que diferencian ambas
  implementaciones.

:::

::::

## Objeto

- Un **objeto** representa un **dato abstracto** de la misma manera que una
  *clase* representa un *tipo abstracto de datos*.

- Es decir: un objeto es un caso particular de una clase, motivo por el que
  también se le denomina **instancia de una clase**.

- Un objeto es **un dato que pertenece al tipo definido por la clase** de la
  que es instancia.

  También se puede decir que «**el objeto _pertenece_ a la clase**» aunque sea
  más correcto decir que «**es _instancia_ de la clase**».

- El proceso de crear un objeto a partir de una clase se denomina **instanciar
  la clase** o **instanciación**.

- En un lenguaje orientado a objetos *puro*, todos los datos que manipula el
  programa son objetos y, por tanto, instancias de alguna clase.

- Existen lenguajes orientados a objetos *impuros* o *híbridos* en los que
  coexisten objetos con otros datos que no son instancias de clases.

---

- Python es considerado un lenguaje orientado a objetos **puro**, ya que en
  Python todos los datos son objetos.

- Por ejemplo, en Python:

  - El tipo `int` es una clase.
  
  - El entero `5` es un objeto, instancia de la clase `int`.

- Java es un lenguaje orientado a objetos **impuro**, ya que un programa Java
  manipula objetos pero también manipula otros datos llamados *primitivos*, que
  no son instancias de ninguna clase sino que pertenecen a un *tipo primitivo*
  del lenguaje.

- Por ejemplo, en Java:

  - El tipo `String` es una clase, por lo que la cadena "Hola" es un objeto.

  - El tipo `int` es un tipo primitivo del lenguaje, por lo que el número `5`
    no es ningún objeto, sino un dato primitivo.

---

- En Python podemos instanciar una clase (creando así un nuevo objeto) llamando
  a la clase como si fuera una función, del mismo modo que con la
  implementación funcional que hemos estado usando hasta ahora:

  ```python
  >>> dep = Deposito(100)
  >>> dep
  <__main__.Deposito object at 0x7fba5a16d978>
  ```

---

### La antisimetría dato-objeto

- Se da una curiosa contra-analogía entre los conceptos de dato y objeto:

  - Los objetos ocultan sus datos detrás de abstracciones y exponen las
    funciones que operan con esos datos.

  - Las estructuras de datos exponen sus datos y no contienen funciones
    significativas.

- Son definiciones virtualmente opuestas y complementarias.

## Identidad


## Estado


## Propiedad

- Las variables de estado que almacenan el estado interno del objeto se
  denominan, en terminología orientada a objetos, **propiedades** o
  **atributos** del objeto.

- Las propiedades se implementan como *variables locales* al objeto.

- Cada vez que se crea un objeto, se le asocia un marco que contiene las
  propiedades del mismo.

- En Python es posible acceder directamente al estado interno de un objeto (o,
  lo que es lo mismo, al valor de sus propiedades), cosa que, en principio,
  podría considerarse una violación del principio de ocultación de información
  y del concepto mismo de abstracción de datos.

- No obstante, en la práctica puede resultar útil y, de hecho, dentro de la
  definición de una clase es necesario hacerlo así para poder acceder al valor
  de una propiedad de la misma.

## Paso de mensajes

- El paso de mensajes se realiza ahora invocando 

## Método


## Encapsulación


## Herencia


## Polimorfismo


# Uso básico de objetos


## Instanciación


### `new`


### `instanceof`


## Propiedades


### Acceso y modificación


## Referencias


## Clonación de objetos


## Comparación de objetos


## Destrucción de objetos


### Recolección de basura


## Métodos


## Constantes


# Clases básicas


## Cadenas


### Inmutables


#### `String`


### Mutables


#### `StringBuffer`


#### `StringBuilder`


#### `StringTokenizer`


### Conversión a `String`


## *Arrays*


## Clases *wrapper*


### Conversiones de empaquetado/desempaquetado (*boxing*/*unboxing*)


# Lenguaje UML


## Diagramas de clases


## Diagramas de objetos


## Diagramas de secuencia


