---
title: Fundamentos
author: Ricardo Pérez López
!DATE
---

- Una **colección** es un grupo de objetos llamados **elementos** o
  **componentes**.

- Las colecciones no tienen ninguna restricción especial. Por tanto, los
  elementos de una colección:

  - Pueden aparecer varias veces en una colección (estar _repetidos_), o pueden
    no hacerlo.

  - Pueden estar situados en un orden concreto dentro de una colección (estar
    _ordenados_), o pueden no estarlo.

- Los dos grandes tipos de colecciones son los **conjuntos** y las
  **secuencias**.

- Un **conjunto** es una colección de elementos que cumple lo siguiente:

  - Sus elementos **no están ordenados** según un orden concreto. Por tanto, no
    se puede hablar del «_primer elemento_», «_segundo elemento_», etcétera.

    Debido a eso, decimos que los elementos de un conjunto están
    _desordenados_.

  - Sus elementos **no pueden estar repetidos**. Por tanto, si un elemento está
    en un conjunto, sólo puede estarlo una vez.

    Debido a eso, decimos que los elementos de un conjunto son **únicos**.

- En definitiva, de un elemento de un conjunto sólo tiene sentido preguntarse
  si pertenece o no pertenece al conjunto, no cuantas veces está ni en qué
  posición.

- Por contra, una **secuencia** es una colección de elementos que cumple lo
  siguiente:

  - Sus elementos **están ordenados** según un determinado orden. Por tanto
    (dependiendo de la cantidad de elementos que contenga), hay un elemento
    situado en primer lugar, otro situado en segundo lugar, y así
    sucesivamente.

  - Sus elementos **pueden estar repetidos**. Por tanto, el mismo elemento
    puede aparecer varias veces en la misma secuencia, en distintas posiciones.

- Una **variable** es un símbolo que representa un valor que puede cambiar. Por
  ejemplo: $X$, $x$, $a$, $total$.

- Una **constante** es un símbolo que representa un valor que nunca cambia. Por
  ejemplo: $1$, $($, $=$, $\pi$.

- Muchas veces, el que un símbolo sea constante o variable depende del contexto
  y del acuerdo al que se haya llegado. Por ejemplo, el símbolo $+$ puede
  representar varias cosas según el momento.

- Una **fórmula** es una secuencia de símbolos (números, letras y caracteres
  especiales) que tiene que cumplir unas reglas de formación determinadas por
  un **lenguaje formal**. En Matemáticas, las fórmulas también se denominan
  **expresiones matemáticas** y sirven para representar formalmente un concepto
  o una idea.

- En Matemáticas, la expresión $a = b$ representa que $a$ y $b$ son la misma
  cosa.  En tal caso, decimos que $a$ y $b$ son **iguales**.

- Si no son la misma cosa, decimos que son **distintos** y se representa con la
  expresión $a \neq b$.

- Una **proposición**, **aserción** o **aserto** es la expresión de que ocurre
  un suceso. Si el suceso ocurre realmente, decimos que la proposición es
  **verdadera** y, en caso contrario, decimos que es **falsa**.

- Si siempre que una proposición $J$ es verdadera, también lo es otra
  proposición $K$, decimos que $J$ **implica** $K$, y se escribe: $$J \implies
  K \quad\text{(implicación lógica)}$$

- Cuando no sólo $J$ implica $K$, sino que además $K$ implica $J$, se dice que
  las proposiciones $J$ y $K$ son **lógicamente equivalentes**. En ese caso,
  decimos que el suceso de $J$ ocurre si y sólo si ocurre el de $K$. Se
  escribe: $$J \iff K \quad\text{(equivalencia lógica)}$$

- Por ejemplo, las proposiciones $$J = \text{hoy es martes}$$ y $$K =
  \text{mañana es miércoles}$$ son equivalentes.

- Si un elemento $a$ pertenece a un conjunto $C$, se escribe $a \in C$. De lo
  contrario, se escribe $a \notin C$.

- Dos conjuntos son **iguales** si tienen exactamente los mismos elementos.

- Los conjuntos se pueden representar de varias formas:

  - **Gráficamente:** mediante un **diagrama de Venn**.

  - **Con una expresión:** en general, una expresión encerrada entre **llaves**
    $\{ \}$ representa un conjunto.

    Normalmente, las variables que representan conjuntos se escriben con
    mayúsculas ($A$, $B$, $C$, ...) mientras que las letras minúsculas suelen
    representar elementos.

    A su vez, los conjuntos se pueden representar:

    - **Por extensión:** indicando sus elementos encerrados entre llaves y
      separados por comas: $$C = \{\lambda, 4, \star, 23.7\}$$ $C$ se compone
      exactamente de esos cuatro elementos.

      $$C = \{\lambda, 4, \star, 23.7, \ldots\}$$ $C$ se compone de esos cuatro
      elementos y de algunos más.

      Normalmente, los puntos suspensivos se utilizan cuando resulta evidente
      cuáles son los elementos que no aparecen indicados expresamente. Por
      ejemplo: $$C = \{1, 2, 3, \ldots\}$$ es el conjunto de todos los números
      naturales desde el 1 en adelante.

      También se pueden utilizar los puntos suspensivos para expresar un rango
      de valores. Por ejemplo: $$C = \{1, 2, 3, \ldots, 10\}$$ es el conjunto
      de los números naturales comprendidos entre 1 y 10.

    - **Por comprensión:** según alguna propiedad que cumplen los elementos.
      Por ejemplo: $$C = \{a \mid \text{$a$ es un número primo menor que
      10}\}$$ es el conjunto $\{2, 3, 5, 7\}$.

    - **Por definición inductiva**: indicando un método que permite obtener los
      elementos de un conjunto de forma progresiva (de «abajo» a «arriba») a
      partir de los anteriores. Por ejemplo, para representar el conjunto de
      los números naturales podemos seguir las siguientes reglas:

      1. $0$ es un número natural.
      2. Si $n$ es un número natural, también lo es $n+1$.
      3. Sólo son números naturales los obtenidos siguiendo las reglas 1 y 2.

- Existen varios conjuntos muy importantes en Matemáticas, tanto que tienen su
  propio símbolo especial para poder referirnos a ellos:

  $\mathbb{N} = \{0, 1, 2, \ldots\}$: el conjunto de los números naturales.

  $\mathbb{N^+} = \{1, 2, \ldots\}$: el conjunto $\mathbb{N}$ menos el cero.

  $\mathbb{Z} = \{\ldots, -2, -1, 0, 1, 2, \ldots\}$: el conjunto de los
  números enteros.

  $\mathbb{Q}$: el conjunto de los números racionales.

  $\mathbb{R}$: el conjunto de los números reales.

- El **cardinal** de un conjunto es el número de elementos que tiene. El
  cardinal de un conjunto $C$ se representa $|C|$. Un conjunto puede ser
  **finito** o **infinito**.

  Por ejemplo, si $C = \{2, 3, 5, 7\}$, entonces $|C| = 4$ y, por tanto, es un
  conjunto _finito_. En cambio, $|\mathbb{N}| = \infty$ y, por tanto, es un
  conjunto _infinito_.

- Un conjunto $A$ se dice que es un **subconjunto** de un conjunto $B$ si cada
  elemento de $A$ lo es también de $B$. En tal caso, se escribe: $$A \subseteq
  B$$

- Claramente, siempre se cumple que $A \subseteq A$.

- Cuando $A \subseteq B$ y $B$ posee algún elemento que no es de $A$ (o sea,
  que $A \neq B$), se dice que $A$ es un **subconjunto propio** de $B$ y se
  escribe: $$A \subset B$$

- Está claro que $A \subseteq B, B \subseteq A \iff A = B$.

- Llamaremos **par** o **pareja** de dos elementos $a$ y $b$ (y lo escribiremos
  como $\langle a,b\rangle$) a una **sucesión** de dos objetos $a$ y $b$, donde
  $a$ está señalado como primero y $b$ como segundo. Por tanto, en general se
  cumple que $\langle a, b\rangle \neq \langle b, a\rangle$.

- Igualmente, llamamos **terna** de tres elementos $a$, $b$ y $c$ (y lo
  escribimos como $\langle a, b, c\rangle$) a una sucesión de tres objetos,
  donde $a$ está considerado como primero, $b$ como segundo y $c$ como tercero.

- Siguiendo así, podemos definir **cuaterna**, **quíntupla**, **séxtupla**, ...
  y, en general, **enetupla**, **$n$-tupla** o, simplemente, **tupla**.

- Una 1-tupla $\langle a\rangle$ se puede escribir simplemente $a$.

- En Matemáticas, las **secuencias** se pueden escribir mediante **tuplas**.

- El **producto cartesiano** de $A$ por $B$ es el conjunto de todos los pares
  $\langle a, b\rangle$ que se pueden formar tales que $a \in A$ y $b \in B$.
  Se escribe: $$A \times B$$

- Igualmente, se define el producto cartesiano de $E_1 \times E_2 \times \cdots
  \times E_n$ como el conjunto formado por las $n$-tuplas $\langle e_1, e_2,
  \ldots, e_n\rangle$ tales que $e_1 \in E_1, e_2 \in E_2, \ldots, e_n \in
  E_n$.

- El producto cartesiano de $A$ por sí mismo, $A \times A$, se puede escribir
  como $A^2$. Igualmente, el producto cartesiano de $n$ conjuntos iguales a E
  se suele escribir $E^n$ si no hay lugar a confusión. Está claro que $E^1 =
  E$.

- Una **relación** $R$ definida sobre los conjuntos $E_1, E_2, \ldots, E_n$ es
  un subconjunto del producto cartesiano $E_1 \times E_2 \times \cdots \times
  E_n$: $$R \subseteq E_1 \times E_2 \times \cdots \times E_n$$

- Por tanto, una relación es un conjunto de tuplas formadas con los elementos
  de los conjuntos sobre los que se define la relación.

- Las relaciones, en definitiva, lo que hacen es _asociar_ entre sí elementos
  de varios conjuntos.

- El valor de $n$ representa el **grado** de una relación.

- Si $n = 1$, tenemos una relación 1-aria, que se puede considerar como un
  subconjunto de $E_1$.

- El caso más importante es el de $n = 2$, es decir, el de las _relaciones
  binarias_.

- Por supuesto, no es necesario que todos los conjuntos sobre los que se define
  una relación sean distintos. De hecho, muchas de las relaciones más
  interesantes que existen son las que relacionan a un conjunto consigo mismo.

- Por ejemplo, la relación binaria $R$ definida así: $$R = \{ \langle a,
  b\rangle \mid a \in \mathbb{N}, b \in \mathbb{N}, a < b \}$$

- Una relación binaria R definida sobre un conjunto $E$ (es decir, que
  relaciona a $E$ consigo mismo) se dice que es **reflexiva**, o que tiene la
  propiedad reflexiva, si para todo elemento $a$ de $E$ se cumple que $\langle
  a, a\rangle \in E$.

  Formalmente, esta propiedad se puede escribir así: $$R \subseteq E \times E
  \text{ es reflexiva} \iff \forall a \in E : \langle a, a\rangle \in R$$

  El símbolo $\forall$ se lee «_para todo_».

- Se dice que $R$ es **simétrica** o que posee la propiedad simétrica, cuando
  se cumple: $$\forall a \in E, b \in E : \langle a, b\rangle \in R \implies
  \langle b, a\rangle \in R$$

- Se dice que $R$ es **antisimétrica** o que posee la propiedad antisimétrica,
  cuando se cumple: $$\forall a \in E, b \in E : \langle a, b\rangle \in R,
  \langle b, a\rangle \in R \implies a = b$$

- Se dice que $R$ es **transitiva** o que posee la propiedad transitiva, cuando
  se cumple: $$\forall a \in E, b \in E, c \in E : \langle a, b\rangle \in
  R, \langle b, c\rangle \in R \implies \langle a, c\rangle \in R$$

!BIBLIOGRAFIA
