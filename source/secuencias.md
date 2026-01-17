---
title: Secuencias
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate
---

# Concepto de secuencia

## Definición

- Una **secuencia** $\underline{s}$ es un dato estructurado _iterable_ que
  cumple lo siguiente:

  #. Se le puede calcular su longitud (la cantidad de elementos que contiene)
     mediante la función !PYTHON(len).

  #. Cada elemento que contiene lleva asociado un número entero llamado
     **índice**, comprendido entre !PYTHON(0) y !PYTHON(len)`(`$s$`)`
     !PYTHON(- 1), que representa la posición que ocupa el elemento dentro de
     la secuencia.

  #. Permite el acceso eficiente a cada uno de sus elementos mediante
     indexación $s$`[`$i$`]`, siendo $i$ el índice del elemento.

---

- En una secuencia:

  - Los elementos se encuentran **ordenados** por su posición dentro de la
    secuencia.

  - Puede haber elementos **repetidos**.

- !JUNTA
  Las secuencias se dividen en:

  - **Inmutables**: cadenas (!PYTHON(str)), tuplas (!PYTHON(tuple)) y rangos
    (!PYTHON(range)).

  - **Mutables**: listas (!PYTHON(list))

## Operaciones comunes

- Todas las secuencias (ya sean cadenas, listas, tuplas o rangos) comparten un
  conjunto de **operaciones comunes**.

- Los rangos son una excepción, ya que sus elementos se crean a partir de una
  fórmula y, por eso, no admiten ni la concatenación ni la repetición.

- Las siguientes tablas recogen las operaciones comunes sobre secuencias.
  $\underline{s}$ y $\underline{t}$ son secuencias del mismo tipo,
  $\underline{i}$, $\underline{j}$ y $\underline{k}$ son
  enteros y $\underline{x}$ es un dato cualquiera que cumple con las
  restricciones que impone $\underline{s}$.

---

- Operadores:

  ------------------------------------------------------------------------------------------------------------------------------------------------
  Operación                     Resultado
  ----------------------------- ------------------------------------------------------------------------------------------------------------------
  $x\ $ !PYTHON(in) $\ s$       !PYTHON(True) si algún elemento de $\underline{s}$ es igual a $\underline{x}$

  $x\ $ !PYTHON(not)            !PYTHON(False) si algún elemento de $\underline{s}$ es igual a $\underline{x}$
  !PYTHON(in) $\ s$

  $s$ `+` $t$                   La concatenación de $\underline{s}$ y $\underline{t}$ (no va con rangos)

  $s$ `*` $k$ \                 (_Repetición_) Equivale a concatenar $\underline{s}$ consigo misma $\underline{k}$ veces
  $k$ `*` $s$                   (no va con rangos)

  $s$`[`$i$`]`                  (_Indexación_) El $\underline{i}$-ésimo elemento de $\underline{s}$, empezando por 0

  $s$`[`$i$`:`$j$`]`            Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$

  $s$`[`$i$`:`$j$`:`$k$`]`      Rodaja de $\underline{s}$ desde $\underline{i}$ hasta $\underline{j}$ con paso $\underline{k}$
  ------------------------------------------------------------------------------------------------------------------------------------------------

---

- Funciones y métodos:

  --------------------------------------------------------------------------------------------------------------------------
  Operación                                 Resultado
  ----------------------------------------- --------------------------------------------------------------------------------
  !PYTHON(len)`(`$s$`)`                     Longitud de $\underline{s}$

  !PYTHON(min)`(`$s$`)`                     El elemento más pequeño de $\underline{s}$

  !PYTHON(max)`(`$s$`)`                     El elemento más grande de $\underline{s}$

  !PYTHON(sorted)`(`$s$`)`                  Lista ordenada de los elementos de $\underline{s}$

  $s$!PYTHON(.index)`(`$x$                  El índice de la primera aparición de $\underline{x}$ en $\underline{s}$
  [`, ` $i$ [`, ` $j$ ] ]`)`                (desde el índice $\underline{i}$ inclusive y antes del $\underline{j}$)

  $s$!PYTHON(.count)`(`$x$`)`               Número total de apariciones de $\underline{x}$ en $\underline{s}$
  --------------------------------------------------------------------------------------------------------------------------

---

- !JUNTA
  Coste computacional en tiempo de ejecución:

  --------------------------------------------------------------------------------------------------------------------
  Operación                                 Coste
  ----------------------------------------- --------------------------------------------------------------------------
  $x\ $ !PYTHON(in) $\ s$ \                 $O(1)$ si $s$ es !PYTHON(set) o !PYTHON(range),
  $x\ $ !PYTHON(not)\  !PYTHON(in) $\ s$    $O($!PYTHON(len)`(`$s$`)`$)$ en los demás casos

  $s$ `+` $t$                               $O($!PYTHON(len)`(`$s$`)` + !PYTHON(len)`(`$t$`)`$)$

  $s$ `*` $k$ \                             $O(k\cdot{}$!PYTHON(len)`(`$s$`)`$)$
  $k$ `*` $s$

  $s$`[`$i$`]`                              $O(1)$

  $s$`[`$i$`:`$j$ [`:`$k$]`]`               $O($!PYTHON(len)`(`$s$`)`$)$

  !PYTHON(len)`(`$s$`)`                     $O(1)$

  !PYTHON(min)`(`$s$`)`                     $O($!PYTHON(len)`(`$s$`)`$)$

  !PYTHON(max)`(`$s$`)`                     $O($!PYTHON(len)`(`$s$`)`$)$

  !PYTHON(sorted)`(`$s$`)`                  $O($!PYTHON(len)`(`$s$`)`$\cdot\log($!PYTHON(len)`(`$s$`)`$))$

  $s$!PYTHON(.index)`(`$x$                  $O($!PYTHON(len)`(`$s$`)`$)$
  [`, ` $i$ [`, ` $j$ ] ]`)`

  $s$!PYTHON(.count)`(`$x$`)`               $O($!PYTHON(len)`(`$s$`)`$)$
  --------------------------------------------------------------------------------------------------------------------

---

- Además de estas operaciones, las secuencias admiten **comparaciones** con los
  operadores `==`, `!=`, `<`, `<=`, `>` y `>=`.

- Dos secuencias $\underline{s}$ y $\underline{t}$ son iguales ($\underline{s}$
  `==` $\underline{t}$) si:

  - Son del mismo tipo (!PYTHON(type)`(`$s$`)` `==` !PYTHON(type)`(`$t$`)`).

  - Tienen la misma longitud (!PYTHON(len)`(`$s$`)` `==`
    !PYTHON(len)`(`$t$`)`).

  - Contienen los mismos elementos en el mismo orden !SALTOHTML{}
    ($s$!PYTHON([0]) `==` $t$!PYTHON([0]), $s$!PYTHON([1]) `==`
    $t$!PYTHON([1]), etcétera).

- Por supuesto, las dos secuencias son distintas ($\underline{s}$ `!=`
  $\underline{t}$) si no son iguales.

---

- Se pueden comparar dos secuencias con los operadores `<`, `<=`, `>` y `>=`
  para comprobar si una es menor (o igual) o mayor (o igual) que la otra si:

  - Son del mismo tipo (si no son del mismo tipo, lanza una excepción).

  - No son rangos.

- Las comparaciones `<`, `<=`, `>` y `>=` se hacen lexicográficamente elemento
  a elemento, como en un diccionario.

- Por ejemplo, !PYTHON('adios') `<` !PYTHON('hola') porque `adios` aparece
  antes que `hola` en el diccionario.

- Con el resto de las secuencias se actúa igual que con las cadenas.

---

- Dadas dos secuencias $\underline{s}$ y $\underline{t}$, para ver si
  $\underline{s}$ `<` $\underline{t}$ se procede así:

  - Se empieza comparando el primer elemento de $\underline{s}$ con el primero
    de $\underline{t}$.

  - Si son iguales, se pasa al siguiente hasta encontrar algún elemento de
    $\underline{s}$ que sea distinto a su correspondiente de
    $\underline{t}$.

  - Si llegamos al final de $\underline{s}$ sin haber encontrado ningún
    elemento distinto a su correspondiente en $\underline{t}$, es porque
    $\underline{s}$ `==` $\underline{t}$.

  - Si $\underline{s}$ se termina pero $\underline{t}$ todavía sigue teniendo
    más elementos, se concluye que $\underline{s}$ `<` $\underline{t}$.

  - En cuanto se encuentre un elemento de $\underline{s}$ que no es igual a su
    correspondiente de $\underline{s}$, se comparan esos elementos y se
    devuelve el resultado de esa comparación.

- Los rangos no se pueden comparar con `<`, `<=`, `>` o `>=`.

---

- Ejemplos:

  ```python
  >>> (1, 2, 3) == (1, 2, 3)
  True
  >>> (1, 2, 3) != (1, 2, 3)
  False
  >>> (1, 2, 3) == (3, 2, 1)
  False
  >>> (1, 2, 3) < (3, 2, 1)
  True
  >>> (1, 2, 3) < (1, 2, 4)
  True
  >>> (1, 2, 3) < (1, 2, 4, 5)
  True
  >>> 'hola' < 'adios'
  False
  >>> range(0, 3) < range(3, 6)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: '<' not supported between instances of 'range' and 'range'
  ```

# Inmutables

## Cadenas (!PYTHON(str))

- Las **cadenas** son secuencias inmutables y *hashables* de caracteres.

- No olvidemos que en Python no existe el tipo *carácter*. En Python, un
  carácter es una cadena de longitud 1.

- Las cadenas literales se pueden crear:

  - Con comillas simples (!PYTHON(')) o dobles (!PYTHON(")):

    ```python
    >>> 'hola'
    'hola'
    >>> "hola"
    'hola'
    ```

  - !JUNTA
    Con triples comillas (!PYTHON(''') o !PYTHON(""")):

    ```python
    >>> """hola
    ... qué tal"""
    'hola\nqué tal'
    ```

- Las cadenas implementan todas las operaciones comunes de las secuencias,
  además de los métodos que se pueden consultar en !SALTOHTML{}
  [https://docs.python.org/3/library/stdtypes.html#string-methods](https://docs.python.org/3/library/stdtypes.html#string-methods)

### Formateado de cadenas

- Una **cadena formateada** (también llamada **_f-string_**) es una cadena
  literal que lleva un prefijo `f` o `F`.

- Estas cadenas contienen **campos de sustitución**, que son expresiones
  encerradas entre llaves.

- En realidad, las cadenas formateadas son expresiones evaluadas en tiempo de
  ejecución.

---

- Sintaxis:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(f_string) ::= (!NT(carácter_literal) | !T({{) | !T(}}) | !NT{sustitución})\*
  !NT(sustitución) ::= !T({)!NT(expresión) [!T(!)!NT(conversión)] [!T(:)!NT(especif)]!T(})
  !NT(conversión) ::= !T(s) | !T(r) | !T(a)
  !ifdef(HTML)
~~~~~~~~~~~~~~
!NT(carácter_literal) ::= !NT(cualquier carácter Unicode excepto </em>!T({)<em> o </em>!T[}]<em>)
~~~~~~~~~~~~~~
~~~~~~~~~~~~~~
!NT(carácter_literal) ::= !NT(cualquier carácter Unicode excepto \textbf{\texttt{\{}} o \textbf{\texttt{\}}})
~~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Las partes de la cadena que van fuera de las llaves se tratan literalmente,
  excepto las dobles llaves `{{` y `}}`, que son sustituidas por una sola
  llave.

- Una `{` marca el comienzo de un **campo de sustitución** (!NT{sustitución}),
  que empieza con una expresión.

- Tras la expresión puede venir un **conversión** (!NT{conversión}),
  introducida por una exclamación `!`.

- También puede añadirse un **especificador de formato** (!NT{especif}) después
  de dos puntos `:`.

- El campo de sustitución termina con una `}`.

---

- Las expresiones en un literal de cadena formateada son tratadas como
  cualquier otra expresión Python encerrada entre paréntesis, con algunas
  excepciones:

  - No se permiten expresiones vacías.

  - Las expresiones lambda deben ir entre paréntesis.

- Los campos de sustitución pueden contener saltos de línea pero no
  comentarios.

- Si se indica una conversión, el resultado de evaluar la expresión se
  convierte antes de aplicar el formateado.

  La conversión `!s` llama a la función !PYTHON(str) sobre el resultado, `!r`
  llama a !PYTHON(repr) y `!a` llama a !PYTHON(ascii).

- A continuación, el resultado es formateado usando la función !PYTHON(format).

- Finalmente, el resultado del formateado es incluido en el valor final de la
  cadena completa.

---

- La sintaxis general de un especificador de formato es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(especif) ::= [[!NT{relleno}\]!NT{alig}][!NT{signo}][!T(z)][!T(#)][!T(0)][!NT(ancho)][!NT(grupos)][!T(.)!NT(precision)][!NT(tipo)]
  !NT(relleno) ::= !NT(cualquier carácter)
  !NT(alig) ::= !T(<) | !T(>) | !T(=) | !T(^)
  !NT(signo) ::=  !T(+) | !T(-) | !NT(espacio)
  !NT(ancho) ::= !NT(dígito)!MAS
  !NT(grupos) ::= !T(_)(_) | !T(,)
  !NT(precision) ::= !NT(dígito)!MAS
  !NT(tipo) ::= !T(b) | !T(c) | !T(d) | !T(e) | !T(E) | !T(f) | !T(F) | !T(g) | !T(G) | !T(n) | !T(o) | !T(s) | !T(x) | !T(X) | !T(%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los especificadores de formato de nivel superior pueden incluir campos de
  sustitución anidados.

- Estos campos anidados pueden incluir, a su vez, sus propios campos de
  conversión y sus propios especificadores de formato, pero no pueden incluir
  más campos de sustitución anidados.

- Para más información, consultar [https://docs.python.org/3/library/string.html#format-specification-mini-language](https://docs.python.org/3/library/string.html#format-specification-mini-language)

---

- Ejemplos de cadenas formateadas:

  ```python
  >>> nombre = 'Pepe'
  >>> f'El nombre es: {nombre}'              # Se sustituye la variable por su valor
  'El nombre es: Pepe'
  >>> apellidos = 'Pérez'
  >>> f'El nombre es: {nombre} {apellidos}'  # Igual
  'El nombre es: Pepe Pérez'
  >>> f'El nombre es: {nombre + apellidos}'  # Se puede usar cualquier expresión
  'El nombre es: PepePérez'
  >>> f'Formato con anchura: {nombre:10}'    # Las cadenas se alinean a la izquierda
  'Formato con anchura: Pepe      '
  >>> f'Formato con anchura: {nombre:<10}'   # Igual que lo anterior
  'Formato con anchura: Pepe      '
  >>> f'Formato con anchura: {nombre:>10}'   # Alinea a la derecha
  'Formato con anchura:       Pepe'
  >>> f'Formato con anchura: {nombre:^10}'   # Alinea al centro
  'Formato con anchura:    Pepe   '
  ```

---

- Ejemplos de cadenas formateadas con números positivos:

  ```python
  >>> x, y = 400, 300
  >>> f'La suma de {x} y {y} es {x + y}' # Se puede usar cualquier expresión
  'La suma de 400 y 300 es 700'
  >>> f'Formato con anchura: {x:10}'     # Los números se alinean a la derecha
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:>10}'    # Igual que lo anterior
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:2}'      # Ancho demasiado pequeño, se ignora
  'Formato con anchura: 400'
  >>> f'Formato con anchura: {x:<10}'    # Alinea a la izquierda
  'Formato con anchura: 400       '
  >>> f'Formato con anchura: {x:>10}'    # Alinea a la derecha
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:^10}'    # Alinea al centro
  'Formato con anchura:    400    '
  >>> f'Formato con anchura: {x:=10}'    # En positivos no hay diferencia con >
  'Formato con anchura:        400'
  >>> f'Formato con anchura: {x:@<10}'   # Alinea a la izquierda, rellena con @
  'Formato con anchura: 400@@@@@@@'
  >>> f'Formato con anchura: {x:@>10}'   # Alinea a la derecha, rellena con @
  'Formato con anchura: @@@@@@@400'
  >>> f'Formato con anchura: {x:@^10}'   # Alinea al centro, rellena con @
  'Formato con anchura: @@@400@@@@'
  >>> f'Formato con anchura: {x:@=10}'   # En positivos no hay diferencia con >
  'Formato con anchura: @@@@@@@400'
  ```

---

- Ejemplos de cadenas formateadas con números negativos:

  ```python
  >>> z = -400
  >>> f'Formato con anchura: {z:10}'   # A la derecha, signo junto al nº
  'Formato con anchura:       -400'
  >>> f'Formato con anchura: {z:<10}'  # A la izquierda, signo junto al nº
  'Formato con anchura: -400      '
  >>> f'Formato con anchura: {z:>10}'  # A la derecha, signo junto al nº
  'Formato con anchura:       -400'
  >>> f'Formato con anchura: {z:^10}'  # Al centro, signo junto al nº
  'Formato con anchura:    -400   '
  >>> f'Formato con anchura: {z:=10}'  # A la derecha, signo junto al relleno
  'Formato con anchura: -      400'
  >>> f'Formato con anchura: {z:010}'  # A la derecha, signo junto al relleno
  'Formato con anchura: -000000400'
  >>> f'Formato con anchura: {z:0<10}' # A la izquierda, signo junto al nº
  'Formato con anchura: -400000000'
  >>> f'Formato con anchura: {z:0>10}' # A la derecha, signo junto al nº
  'Formato con anchura: 000000-400'
  >>> f'Formato con anchura: {z:0^10}' # Al centro, signo junto al nº
  'Formato con anchura: 000-400000'
  >>> f'Formato con anchura: {z:0=10}' # A la derecha, signo junto al relleno
  'Formato con anchura: -000000400'
  >>> f'Formato con anchura: {z:@<10}' # A la izquierda, signo junto al nº
  'Formato con anchura: -400@@@@@@'
  >>> f'Formato con anchura: {z:@>10}' # A la derecha, signo junto al nº
  'Formato con anchura: @@@@@@-400'
  >>> f'Formato con anchura: {z:@^10}' # Al centro, signo junto al nº
  'Formato con anchura: @@@-400@@@'
  >>> f'Formato con anchura: {z:@=10}' # A la derecha, signo junto al relleno
  'Formato con anchura: -@@@@@@400'
  ```

---

- Ejemplos de cadenas formateadas con números en coma flotante:

  ```python
  >>> from math import pi
  >>> f'El valor de pi es {pi:6.3}'     # Ancho 6, precisión 3
  'El valor de pi es   3.14'
  >>> f'El valor de pi es {pi:10.3}'    # Ancho 10, precisión 3
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:<10.3}'   # A la izquierda
  'El valor de pi es 3.14      '
  >>> f'El valor de pi es {pi:>10.3}'   # A la derecha
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:^10.3}'   # Al centro
  'El valor de pi es    3.14   '
  >>> f'El valor de pi es {pi:=10.3}'   # A la derecha
  'El valor de pi es       3.14'
  >>> f'El valor de pi es {pi:10.3f}'   # 3 dígitos en la parte fraccionaria
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {pi:<10.3f}'  # A la izquierda
  'El valor de pi es 3.142     '
  >>> f'El valor de pi es {pi:>10.3f}'  # A la derecha
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {pi:^10.3f}'  # Al centro
  'El valor de pi es   3.142   '
  >>> f'El valor de pi es {pi:=10.3f}'  # A la derecha
  'El valor de pi es      3.142'
  >>> f'El valor de pi es {-pi:=10.3f}' # Los negativos, igual que los enteros
  'El valor de pi es -    3.142'
  ```

---

- Más ejemplos:

  ```python
  >>> nombre = "Fred"
  >>> f"Dice que su nombre es {nombre!r}."
  "Dice que su nombre es 'Fred'."
  >>> f"Dice que su nombre es {repr(nombre)}."  # repr es equivalente a !r
  "Dice que su nombre es 'Fred'."
  >>> ancho = 10
  >>> precision = 4
  >>> value = decimal.Decimal("12.34567")
  >>> f"result: {value:{ancho}.{precision}}"  # campos anidados
  'result:      12.35'
  >>> import datetime
  >>> hoy = datetime.datetime(year=2017, month=1, day=27)
  >>> f"{hoy:%B %d, %Y}"  # usando especificador de formato de fecha
  'January 27, 2017'
  >>> numero = 1024
  >>> f"{numero:#0x}"  # usando especificador de formato de enteros
  '0x400'
  ```

### Expresiones regulares

- Las **expresiones regulares** constituyen un pequeño lenguaje muy
  especializado incrustado dentro de Python y disponible a través del módulo
  `re`.

- Usando este pequeño lenguaje es posible especificar **reglas sintácticas** de
  una forma distinta pero parecida a las _gramáticas EBNF_ (aunque con menos
  poder expresivo).

- Esas reglas sintácticas se pueden usar luego para **comprobar si una cadena
  _se ajusta a_ (o _encaja con_) un patrón**.

- Este patrón puede ser frases en español, o direcciones de correo electrónico
  o cualquier otra cosa.

- A continuación, se pueden hacer preguntas del tipo: *«¿Esta cadena se ajusta
  al patrón?»* o *«¿Hay algo que se ajuste al patrón en alguna parte de esta
  cadena?»*.

- También se pueden usar las *regexes* para **modificar** una cadena o
  **dividirla en partes** según el patrón indicado.

---

- Para información detallada sobre cómo crear y usar expresiones regulares,
  consultar:

  - Tutorial de introducción:

    [https://docs.python.org/3/howto/regex.html](https://docs.python.org/3/howto/regex.html)

  - Documentación del módulo `re`:

    [https://docs.python.org/3/library/re.html](https://docs.python.org/3/library/re.html)

---

- Una expresión regular especifica un conjunto de cadenas que coinciden con
  ella.

- Las funciones del módulo `re` permiten comprobar si una determinada cadena
  coincide con una expresión regular dada, o si una expresión regular dada
  coincide con una determinada cadena (que es básicamente lo mismo).

- El lenguaje de las expresiones regulares es relativamente pequeño y
  restringido, por lo que no es posible usarlo para realizar cualquier tipo de
  procesamiento de cadenas.

- Además, hay procesamientos que se pueden realizar con expresiones regulares
  pero las expresiones que resultan se vuelven muy complicadas.

- En estos casos, es mejor escribir directamente código Python ya que, aunque
  el código resultante pueda resultar más lento, probablemente resulte más
  fácil de leer.

---

- Las expresiones regulares pueden contener tanto _caracteres ordinarios_ como
  _caracteres especiales_.

- La mayoría de los **caracteres ordinarios**, como `A`, `a` o `0`, son las
  expresiones regulares más sencillas, las cuales simplemente encajan consigo
  mismas.

- Además, se pueden concatenar caracteres ordinarios, así que la expresión
  regular `hola` encaja con la cadena !PYTHON('hola').

---

- En concreto, se pueden crear expresiones regulares concatenando otras
  expresiones regulares.

- Si $A$ y $B$ son expresiones regulares, $AB$ también es una expresión
  regular, y las cadenas que encajan con ella serán todas las posibles cadenas
  que se pueden obtener concatenando las que encajan con $A$ y las que encajan
  con $B$.

- Por ejemplo:

  - La expresión regular `a` encaja con la cadena !PYTHON('a').

  - La expresión regular `b` encaja con la cadena !PYTHON('b').

  - Por tanto, la expresión regular `ab` encaja con la cadena !PYTHON('ab').

  - Y por ello, la expresión regular `hola` encaja con la cadena
    !PYTHON('hola').

---

- Además de usar caracteres ordinarios, en una expresión regular podemos usar
  otros caracteres, como `|` o `(`, que son **caracteres especiales**.

- A los caracteres especiales se les denomina **_metacaracteres_** y tienen
  un significado especial dentro de una expresión regular.

- Por ejemplo, representan clases de caracteres ordinarios o afectan a la
  forma en que se interpretan las expresiones regulares que los rodean.

- Gran parte del aprendizaje de las expresiones regulares consiste en saber
  qué metacaracteres existen y qué hacen.

---

- Los metacaracteres de las expresiones regulares en Python son los siguientes:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  `.` \ \  `^` \ \  `$` \ \  `*` \ \  `+` \ \  `?` \ \  `{` \ \  `}` \ \  `[` \ \  `]` \ \  `\` \ \  `|` \ \  `(` \ \  `)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En las siguientes secciones se estudiará el funcionamiento y significado
  especial de estos metacaracteres.

- Los básicos son:

  -----------------------------------------------------------------------------------------------------------------------------------
  Metacarácter  Encaja con                                              Ejemplo
  ------------  ------------------------------------------------------- -------------------------------------------------------------
  `.`           Cualquier carácter que                                  `ab.c` encaja con !PYTHON('abec') pero no con !PYTHON('abc')
                no sea un salto de línea.                             
                                                                      
  `^`           El principio de la cadena.                              `^ab` encaja con !PYTHON('abc') pero no con !PYTHON('dab')
                                                                      
  `$`           El final de la cadena.                                  `ab$` encaja con !PYTHON('dab') pero no con !PYTHON('abd')
  -----------------------------------------------------------------------------------------------------------------------------------

#### Clases de caracteres

- Los metacaracteres `[` y `]` se usan para especificar una **clase de
  caracteres**.

- Las clases de caracteres son conjuntos de caracteres que se desean hacer
  encajar con alguna cadena.

- Los caracteres se pueden enumerar individualmente. Por ejemplo:

  ```
  [abc]
  ```

  encaja con cualquiera de los caracteres !PYTHON('a'), !PYTHON('b') o
  !PYTHON('c').

- También se puede usar un _rango_ de caracteres, indicando dos caracteres
  separados por un guión («`-`»). Por ejemplo:

  ```
  [a-c]
  ```

  se corresponde con la misma clase de caracteres anterior (es decir, `[abc]`),
  por lo que expresa el mismo conjunto de caracteres y encaja exactamente con
  los mismos caracteres.

  La clase `[a-z]` representa todas las letras minúsculas.

---

- Los metacaracteres (excepto `\`) funcionan como caracteres ordinarios dentro
  de las clases de caracteres. Por ejemplo:

  ```
  [akm$]
  ```

  encaja con cualquiera de los caracteres !PYTHON('a'), !PYTHON('k'),
  !PYTHON('m') o !PYTHON('$').

  El carácter `$` es normalmente un metacarácter, pero pierde su significado
  especial dentro de una clase de caracteres.

- Si aparece un `^` como primer carácter dentro de la clase de caracteres, esto
  indica que se encaja con los caracteres que **no** aparecen dentro de la
  clase de caracteres.

---

- Se pueden encajar con los caracteres que **NO** aparecen dentro de la clase
  de caracteres, lo que se denomina **complementar** el conjunto de la clase de
  caracteres.

- Esto se indica colocando un `^` como primer carácter dentro de la clase de
  caracteres. Por ejemplo:

  ```
  [^5]
  ```

  encajará con cualquier carácter excepto el !PYTHON('5').

- Si el `^` aparece en cualquier otro sitio dentro de la clase de caracteres,
  perderá su significado especial. Por ejemplo:

  ```
  [5^]
  ``` 

  encaja con !PYTHON('5') o con !PYTHON('^').

#### Secuencias de barra invertida

- La barra invertida `\` va seguida de uno o varios caracteres para representar
  secuencias especiales.

- También se usa para quitar su significado especial a un metacarácter y que
  sea interpretado como un carácter ordinario.

  Por ejemplo, `\?` representa el carácter !PYTHON('?') como un carácter
  ordinario, y no el metacarácter `?` con su significado especial dentro de una
  expresión regular.

  Asimismo, la secuencia `\\` dentro de una expresión regular representa el
  carácter !ifdef(HTML)(<code style="color: teal">\'\\\'</code>)(\texttt{\textcolor{teal}{'\textbackslash{}'}})
  ordinario, sin significado especial.

---

- Una lista (incompleta) de secuencias especiales que comienzan por `\`:

  --------------------------------------------------------------------------
  Secuencia Encaja con                   Equivale a
  --------- ---------------------------- -----------------------------------
  `\d`      Cualquier dígito decimal.    `[0-9]`

  `\D`      Cualquier carácter que no    `[^0-9]`
            sea un dígito.

  `\s`      Cualquier carácter de        `[ \t\n\r\f\v]`
            espacio.

  `\S`      Cualquier carácter que no    `[^ \t\n\r\f\v]`
            sea un espacio.

  `\w`      Cualquier carácter           `[a-zA-Z0-9_]`
            alfanumérico.

  `\W`      Cualquier carácter no        `[^a-zA-Z0-9_]`
            alfanumérico.
  --------------------------------------------------------------------------

- Estas secuencias pueden ir dentro de una clase de caracteres. Por ejemplo,
  `[\s,.]` encaja con un espacio en blanco, una coma o un punto.

#### Repeticiones

- Los metacaracteres que expresan repeticiones son: `*`, `+`, `?`, `{` y `}`.

- El metacarácter `*` especifica que el carácter anterior puede encajar **cero
  o más veces**, en lugar de exactamente una vez. Por ejemplo:

  ```
  ca*t
  ```

  encaja con !PYTHON{'ct'} (ningún carácter !PYTHON('a')), !PYTHON{'cat'} (un
  carácter !PYTHON('a')), !PYTHON{'caat'} (dos caracteres !PYTHON('a')),
  !PYTHON{'caaat'} (tres caracteres !PYTHON('a')), y así sucesivamente.

---

- Las repeticiones son _ansiosas_, es decir, que el intérprete será _glotón_ y
  tratará de encajar con el mayor número posible de repeticiones.

  Si las últimas porciones del patrón no encajan, el intérprete dará marcha
  atrás y lo volverá a intentar con menos repeticiones.

- Por ejemplo, la siguiente expresión regular:

  ```
  a[bcd]*b
  ```

  encajaría con la cadena !PYTHON('abcbd') de dos formas:

  - $\underline{ab}$cbd

  - $\underline{abcb}$d

  De los dos encajes posibles, el intérprete se queda con el que la subcadena
  encajada es más larga.

---

- El metacarácter `+` especifica que el carácter anterior puede encajar **_una_
  o más veces**, a diferencia del `*` que encaja **_cero_ o más veces**. Por
  ejemplo:

  ```
  ca+t
  ```

  encaja con !PYTHON{'cat'} (un carácter !PYTHON('a')), !PYTHON{'caat'} (dos
  caracteres !PYTHON('a')), !PYTHON{'caaat'} (tres caracteres !PYTHON('a')), y
  así sucesivamente, pero **NO** con !PYTHON{'ct'} (ninguna !PYTHON('a')). 

- El metacarácter `?` encaja **una vez o ninguna**, por lo que se usa
  frecuentemente para indicar que algo es **opcional**. Por ejemplo:

  ```
  ab?c
  ```

  encaja con !PYTHON('ac') o con !PYTHON('abc').

---

- Los metacaracteres `{` y `}` se usan combinados para expresar el
  cuantificador `{`!COLOR(blue)($m$!ifdef(HTML)(`,`)(\texttt{,}))!COLOR(blue)($n$!ifdef(HTML)(`}`)(\texttt{\}})),
  donde $m$ y $n$ son números enteros.
 
- Este cuantificador indica que el carácter anterior debe repetirse entre $m$ y
  $n$ veces (como mínimo $m$ veces y como máximo $n$ veces).

- Por ejemplo:

  ```
  a/{1,3}b
  ```

  encaja con !PYTHON('a/b'), !PYTHON('a//b') y !PYTHON('a///b'), pero no con
  !PYTHON{'ab'} (porque no tiene ninguna !PYTHON('/')) ni con !PYTHON{'a////b'}
  (porque tiene cuatro !PYTHON('/'), o sea, más de tres).

---

- Tanto $m$ como $n$ pueden omitirse:

  - Si se omite $m$, se interpreta que el límite inferior es 0.

  - Si se omite $n$, se interpreta que el límite superior es infinito.

- El caso `{`$m$`}` indica que el carácter anterior debe repetirse exactamente
  $m$ veces. Por ejemplo:

  ```
  a/{2}b
  ```

  sólo encajará con !PYTHON('a//b').

- Se deduce que:

  - `{0,}` equivale a `*`

  - `{1,}` equivale a `+`

  - `{0,1}` equivale a `?`

#### Opcionalidad y agrupamiento

- El metacarácter `|` sirve para expresar que se debe encajar con una cosa
  **o bien** con otra. Por ejemplo:

  ```
  a|b
  ```

  encaja con !PYTHON('a') o con !PYTHON('b').

- Los metacaracteres `(` y `)` sirven para agrupar partes de una misma
  expresión regular, de forma que se interpreten como una sola. Por ejemplo:

  ```
  a(bc)?d
  ```

  encaja con !PYTHON('ad') y con !PYTHON('abcd'), ya que los paréntesis
  alrededor de `bc` hacen que esos dos caracteres actúen como una sola cosa
  desde el punto de vista del `?` que hay detrás. Eso hace que el `?` actúa
  sobre `bc` al completo, y no sólo sobre el `c`.

#### Métodos del módulo `re`

- Las expresiones regulares se deben compilar en **objetos patrón**, los cuales
  contienen métodos que permiten realizar operaciones tales como ajuste de
  patrones o sustituciones sobre cadenas.

- Para compilar una expresión regular se usa la función `compile` del módulo
  `re`. Por ejemplo:

  ```python
  >>> import re
  >>> p = re.compile('ab*')
  >>> p
  re.compile('ab*')
  ```

  A partir de ahora, `p` contiene el _objeto patrón_.

- La función `re.compile` también acepta un argumento opcional que sirve para
  activar ciertas características especiales. Por ejemplo:

  ```python
  p = re.compile('ab*', re.IGNORECASE)
  ```

---

- La expresión regular se pasa a `re.compile` en forma de cadena.

- Las cadenas literales en Python usan la barra invertida `\` como marca de
  inicio de una secuencia de escape, como `\n` o `\t`.

- Pero además, las expresiones regulares usan el carácter `\` para indicar
  secuencias especiales o quitar el significado expecial de los metacaracteres.

- Esto provoca que debamos _escapar_ la barra **dos veces**: una vez para la
  cadena literal de Python y otra para el motor de expresiones regulares.

- Esto se debe a que el código está pasando por dos niveles distintos de
  interpretación de las barras invertidas, y cada nivel _consume_ una barra.

---

- Por ejemplo, supongamos que queremos comprobar la aparición de la secuencia
  de caracteres `\section`.

- Si se escribe la cadena !PYTHON('\section'), Python intenta interpretar `\s`
  como una secuencia de escape.

- Como `\s` no es una secuencia de escape válida en Python, el intérprete lo
  deja como `\s`, pero ya ha intervenido.

- Para que la cadena contenga realmente `\section`, hay que escribir
  el literal !PYTHON('\\section').

  Es decir: para que aparezca una sola `\` en la cadena resultante, hay que
  poner `\\`.

---

- Pero en expresiones regulares, la barra `\` también se interpreta de forma
  especial. Por ejemplo: `\s` (espacio en blanco), `\d` (dígito) o `\w`
  (carácter alfanumérico).

- Por tanto, si se quiere que la expresión regular busque una barra invertida
  literal, debe escaparse también usando `\\`.

- Así que el motor de expresiones regulares necesita ver `\\section`.

- Combinando ambos niveles, y sabiendo que queremos que el motor de expresiones
  regulares vea `\\section`, debemos escribir como expresión regular la cadena
  !PYTHON('\\\\section').

-------------------------------------------------------------------------------  
Secuencia de caracteres           Representa
--------------------------------- ---------------------------------------------  
`\section`                        El texto que se desea comprobar

`\\section`                       Barras invertidas escapadas en un literal cadena de Python 
	
!PYTHON('\\\\section')            Barra invertida escapada para `re.compile()`
-------------------------------------------------------------------------------  

---

- En resumen: para encajar con una barra invertida literal, se debe escribir
  `\\\\` en la cadena Python que representa a la expresión regular, porque
  dicha expresión regular debe ser `\\`, y cada barra invertida debe indicarse
  como dos barras invertidas dentro de un literal cadena en Python.

- Esto hace que la expresión regular resultante resulte difícil de escribir y
  de entender, con gran cantidad de barras.

!UNUN(_Raw strings_)

- Para evitar en lo posible la necesidad de tantas barras inclinadas, la forma
  recomendada de escribir expresiones regulares es mediante el uso de _cadenas
  crudas_ o **_raw strings_**.

- Una _raw string_ es una cadena literal de Python que lleva un prefijo `r` o
  `R`.

- Las _raw strings_ se interpretan de forma que una barra inclinada `\` no se
  considera un carácter especial, sino un carácter más, como cualquier otro. 

- Por tanto, en una _raw string_, la `\` pierde su significado especial de
  «_comienzo de secuencia de escape_».

- Eso significa que cada `\` que se encuentra en una _raw string_ representa
  una simple `\`, sin más.

---

- Por ejemplo, en la siguiente cadena:

  ```python
  r'ab\ncd'
  ```

  la secuencia `\n` no representa un salto de línea, sino los dos caracteres
  `\` y `n` juntos.

- En consecuencia, la longitud de la cadena anterior es 6, y no 5, ya que `\n`
  se interpreta como dos caracteres separados, y no uno sólo.

- Eso significa también que no se necesitan escapar las `\` en una _raw
  string_ para que Python las trate literalmente como un carácter más.

---

- Por ejemplo, la expresión regular `^\d+$` reconoce el lenguaje de las cadenas
  formadas por números enteros (la aparición de uno o más dígitos en base
  diez).

- Esa expresión regular se puede escribir así:

  - Sin _raw strings_, hay que escapar la `\`:
    
    ```
    '^\\d+$'
    ```

  - Con _raw strings_, la `\` se escribe una sola vez:
    
    ```
    r'^\d+$'
    ```

- Si queremos que la expresión regular reconozca la secuencia de caracteres `\section`, podemos usar:

  ```python
  p = re.compile(r"\\section")
  ```

---

<!--
- Esto hace que debamos repetir el mismo carácter `\` varias veces al
  introducirlo en una cadena de Python.

- Por ejemplo, si queremos comprobar la aparición de la subcadena `\section`
  dentro de una cadena usando expresiones regulares, debemos empezar escapando
  la barra invertida poniéndola dos veces para que se interprete literalmente,
  así: `\\section`.

- Esa cadena se debe pasar a `re.compile`, pero para hacerlo en forma de cadena
  Python debemos volver a escapar cada una de las barras, así que realmente
  deberemos pasarle la cadena !PYTHON('\\\\section').

---

---

The solution is to use Python’s raw string notation for regular expressions; backslashes are not handled in any special way in a string literal prefixed with 'r', so r"\n" is a two-character string containing '\' and 'n', while "\n" is a one-character string containing a newline. Regular expressions will often be written in Python code using this raw string notation.

In addition, special escape sequences that are valid in regular expressions, but not valid as Python string literals, now result in a DeprecationWarning and will eventually become a SyntaxError, which means the sequences will be invalid if raw string notation or escaping the backslashes isn’t used.

Regular String
	

Raw string

"ab*"
	

r"ab*"

"\\\\section"
	

r"\\section"

"\\w+\\s+\\1"
	

r"\w+\s+\1"

---

-->

-------------------------------------------------------------------------------------------------
Métodos sobre objetos patrón  Finalidad                                                          
----------------------------- -------------------------------------------------------------------
`match()`                     Determina si la expresión regular encaja con el                    
                              comienzo de la cadena.                                             

`search()`                    Examina dentro de una cadena, buscando algún lugar                 
                              donde la expresión regular encaje con la cadena.                   

`fullmatch()`                 Comprueba si la expresión regular encaja con la cadena completa.

`findall()`                   Busca todas las subcadenas que encajen con la                      
                              expresión regular y las devuelve en una lista.                     

`finditer()`                  Busca todas las subcadenas que encajen con la                      
                              expresión regular y las devuelve en forma de iterador.             
-------------------------------------------------------------------------------------------------

---

- Ejemplos de uso:

  ```python
  >>> p = re.compile("a|(bc)+")
  >>> p.match('cbbc')                 # La cadena no comienza con algo que encaje
  >>> p.search('cbbc')                # La cadena contiene algo que encaja
  <re.Match object; span=(2, 4), match='bc'>
  >>> p.match('bcx')                  # La cadena comienza con algo que encaja
  <re.Match object; span=(0, 2), match='bc'>
  >>> p.fullmatch('bcx')              # La cadena completa no encaja
  >>> p.fullmatch('bc')               # La cadena completa sí encaja
  <re.Match object; span=(0, 2), match='bc'>
  ```

## Tuplas

- Las **tuplas** (!PYTHON(tuple)) son secuencias inmutables, usadas a menudo
  para representar colecciones de datos heterogéneos (o sea, de varios tipos).

- También se usan en aquellos casos en los que se necesita una secuencia
  inmutable de datos homogéneos (por ejemplo, para almacenar datos en un
  conjunto o un diccionario).

- Las tuplas se pueden crear así:

  - Si es una tupla vacía, con paréntesis vacíos: !PYTHON(())

  - Si sólo tiene un elemento, se pone una coma detrás:

    :::: columns

    ::: column

    $a$`,`

    :::

    ::: column

    `(`$a$`,)`

    :::

    ::::

  - Si tiene más de un elemento, se separan con comas:

    :::: columns

    ::: column

    $a$`,` $b$`,` $c$

    :::

    ::: column

    `(`$a$`,` $b$`,` $c$`)`

    :::

    ::::

  - Usando la función !PYTHON(tuple)`(`!NT{iterable}`)`.

---

- Observar que lo que construye la tupla es realmente la coma, no los
  paréntesis.

- Los paréntesis son opcionales, excepto en dos casos:

  - La tupla vacía: !PYTHON(())

  - Cuando son necesarios para evitar ambigüedad.

    Por ejemplo, `f(`$a$`,` $b$`,` $c$`)` es una llamada a una función con tres
    argumentos, mientras que `f((`$a$`,` $b$`,` $c$`))` es una llamada a una
    función con un único argumento que es una tupla de tres elementos.

- Las tuplas implementan todas las operaciones comunes de las secuencias.

- En general, las tuplas se pueden considerar como la versión inmutable de las
  listas.

- Además, las tuplas son *hashables* si sus elementos también lo son.

---

- En memoria, las tuplas se almacenan mediante una estructura de datos donde
  sus elementos se identifican mediante un índice, que es un número entero que
  indica la posición que ocupa el elemento dentro de la tupla.

- Por ejemplo, la siguiente tupla:

  ```python
  t = (1, 2, 3)
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(tupla_en_pythontutor.png)(Tupla almacenada en memoria)(width=50%)(width=50%)

## Rangos

- Ya vimos que los **rangos** (!PYTHON(range)) representan secuencias
  perezosas, inmutables y *hashables* de números enteros y se usan
  frecuentemente para hacer bucles que se repitan un determinado número de
  veces.

- Como secuencia, el tipo !PYTHON(range) es bastante especial, ya que es el
  único tipo de secuencia perezosa que existe en Python.

- Además, hay ciertas operaciones comunes a las secuencias que no se pueden
  realizar sobre rangos.

- En concreto, los rangos implementan **todas las operaciones de las
  secuencias, *excepto* la concatenación y la repetición**.

- Esto es debido a que los rangos sólo pueden representar secuencias que siguen
  un patrón muy estricto, y las repeticiones y las concatenaciones a menudo
  violan ese patrón.

---

- Los rangos se crean con la función !PYTHON(range), cuya signatura es:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  $\texttt{range(!VAR([)!VAR(start):\,int,!VAR(])\;!VAR(stop):\,int\;!VAR([),\;!VAR(step):\,int!VAR(]))\;->\;range}$
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde:

  - _start_ es el valor inicial (por defecto, 0).

  - _stop_ es el valor final (que no se alcanza, es decir, que el último valor
    de la secuencia es $(stop - 1$)).

  - _step_ es el paso, es decir, lo que se suma a un valor de la secuencia para
    obtener el siguiente (por defecto, 1).

- Ejemplos:

  ```python
  >>> range(10)         # => 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
  >>> range(1, 11)      # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  >>> range(0, 30, 5)   # => 0, 5, 10, 15, 20, 25
  >>> range(0, 10, 3)   # => 0, 3, 6, 9
  >>> range(0, -10, -1) # => 0, -1, -2, -3, -4, -5, -6, -7, -8, -9
  >>> range(0)          # => (vacío)
  >>> range(1, 0)       # => (vacío)
  ```

---

- Dos rangos son considerados **iguales** si representan la misma secuencia de
  valores, sin importar si tienen distintos valores de _start_, _stop_ o
  _step_.

- Por ejemplo:

  ```python
  >>> range(20) == range(0, 20)
  True
  >>> range(0, 20) == range(0, 20, 2)
  False
  >>> range(0, 3, 2) == range(0, 4, 2)
  True
  >>> range(0) == range(2, 1, 3)
  True
  ```

- Por otra parte, no es posible comparar dos rangos usando `<`, `<=`, `>` o
  `>=`:

  ```python
  >>> range(3) < range(2)
  Traceback (most recent call last):
    File "<python-input-0>", line 1, in <module>
      range(3) < range(2)
  TypeError: '<' not supported between instances of 'range' and 'range'
  ```

# Mutables

## Listas

- Las **listas** son secuencias *mutables*, usadas frecuentemente para
  representar colecciones de elementos heterogéneos.

- Al ser mutables, las listas **no** son *hashables*.

- Se pueden construir de varias maneras:

  - Usando corchetes vacíos para representar la lista vacía: !PYTHON([]).

  - Usando corchetes y separando los elementos con comas:

    `[`$a$`]`

    `[`$a$`,` $b$`,` $c$`]`

  - Usando la función !PYTHON(list) con las sintaxis !PYTHON(list()) o
    !PYTHON(list)`(`!NT{iterable}`)`.

---

- La función !PYTHON(list) construye una lista cuyos elementos son los mismos
  (y están en el mismo orden) que los elementos de !NT(iterable).

- !NT(iterable) puede ser:

  - una secuencia,

  - un contenedor sobre el que se pueda iterar, o

  - un iterador.

- Si se llama sin argumentos, devuelve una lista vacía.

- Por ejemplo:

  ```python
  >>> list('hola')
  ['h', 'o', 'l', 'a']
  >>> list((1, 2, 3))
  [1, 2, 3]
  ```

---

- En memoria, las listas se almacenan mediante una estructura de datos donde
  sus elementos se identifican mediante un índice, que es un número entero que
  indica la posición que ocupa el elemento dentro de la lista.

- Por ejemplo, la siguiente lista:

  ```python
  lst = [1, 2, 3]
  ```

  se almacenaría de la siguiente forma según lo representa la herramienta
  Pythontutor:

  !IMGP(lista_en_pythontutor.png)(Lista almacenada en memoria)(width=50%)(width=50%)

### Listas por comprensión

- También se pueden crear **listas por comprensión** usando la misma sintaxis
  de las **expresiones generadoras** pero encerrando la expresión entre
  corchetes en lugar de entre paréntesis.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(lista_comp) ::= !T{[}!NT{expresión} (!T(for) !NT(identificador) !T(in) !NT(secuencia) [!T(if) !NT{condición}])!MAS!T{]}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> [x ** 2 for x in [1, 2, 3]]
  [1, 4, 9]
  ```

- Como se ve, el resultado es directamente una lista, no un iterador.

- Por tanto, a diferencia de lo que pasa con las expresiones generadoras, **el
  resultado de una lista por comprensión no es perezoso**, cosa que habrá que
  tener en cuenta para evitar consumir más memoria de la necesaria o generar
  elementos que al final no sean necesarios.

---

- Por ejemplo, la siguiente expresión generadora:

  ```python
  res_gen = (x ** 2 for x in range(0, 10000000000000))
  ```

  es mucho más eficiente en tiempo y espacio que la lista por comprensión:

  ```python
  res_list = [x ** 2 for x in range(0, 10000000000000)]
  ```

  ya que la expresión generadora devuelve un **iterador** que irá generando los
  valores de uno en uno a medida que los vayamos recorriendo con
  !PYTHON(next(res_gen)).

  En cambio, la lista por comprensión genera todos los valores de la lista a la
  vez y los almacena todos juntos en la memoria.

- A cambio, la ventaja de tener una lista frente a tener un iterador es que
  podemos acceder directamente a cualquier elemento de la lista mediante la
  indexación.

---

- Las listas por comprensión, al igual que las expresiones generadoras,
  **determinan su propio _ámbito_**.

- Ese ámbito abarca toda la lista por comprensión, de principio a fin.

- Al recorrer el iterable, las variables van almacenando en cada iteración del
  bucle el valor del elemento que en ese momento se está visitando.

- Debido a ello, podemos afirmar que las variables que aparecen en en cada
  cláusula `for` de la lista por comprensión son **identificadores
  cuantificados**, ya que toman sus valores automáticamente y éstos están
  restringido a los valores que devuelva el iterable.

- Además, estos identificadores cuantificados son locales a la lista por
  comprensión, y sólo existen dentro de ella.

---

- Debido a lo anterior, esos identificadores cumplen estas dos propiedades:

  #. Se pueden renombrar (siempre de forma consistente) sin que la lista por
     comprensión cambie su significado.

     Por ejemplo, las dos listas por comprensión siguientes son equivalentes,
     puesto que producen el mismo resultado:

     ```python
     [x for x in (1, 2, 3)]
     ```

     ```python
     [y for y in (1, 2, 3)]
     ```

  #. No se pueden usar fuera de la lista por comprensión, ya que estarían fuera
     de su ámbito y no serían visibles.

     Por ejemplo, lo siguiente daría un error de nombre:

     ```python
     >>> e = [x for x in (1, 2, 3)]
     >>> x       # Intento acceder a la 'x' de la lista por comprensión
     Traceback (most recent call last):
       File "<stdin>", line 1, in <module>
     NameError: name 'x' is not defined
     ```

## Operaciones mutadoras

- En la siguiente tabla, $\underline{s}$ es una instancia de un tipo de
  secuencia mutable (por ejemplo, una lista), $\underline{t}$ es cualquier dato
  iterable y $\underline{x}$ es un dato cualquiera que cumple con las
  restricciones que impone $\underline{s}$:

!SALTO

-------------------------------------------------------------------------------------------
Operación                     Resultado
----------------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$          El elemento $i$-ésimo de $\underline{s}$ se sustituye
                              por $\underline{x}$

$s$`[`$i$`:`$j$`]`            La rodaja de $\underline{s}$ desde $\underline{i}$ hasta
`=` $t$                       $\underline{j}$ se sustituye por $\underline{t}$

$s$`[`$i$`:`$j$`:             Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$               por $\underline{t}$

!PYTHON(del) $\ s$`[`$i$`]`   Elimina el elemento $i$-ésimo de $\underline{s}$

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`]` \
`$j$`]`                       Equivale a hacer $s$`[`$i$`:`$j$`]` `=` `[]`

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`:`$k$`]`
`$j$`:`$k$`]`
-------------------------------------------------------------------------------------------

---

!SALTOBEAMER

-----------------------------------------------------------------------------------------------------------------------------------
Operación                         Resultado
--------------------------------- -------------------------------------------------------------------------------------------------
$s$!PYTHON(.append)`(`$x$`)`      Añade $\underline{x}$ al final de $\underline{s}$; es igual que !SALTOHTML
                                  $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` `[`$x$`]`

$s$!PYTHON(.clear())              Elimina todos los elementos de $\underline{s}$; es igual que !SALTOHTML
                                  !PYTHON(del) $\ s$!PYTHON([:])

$s$!PYTHON(.copy())               Crea una copia *superficial* de $\underline{s}$; es igual que $s$!PYTHON([:])

$s$!PYTHON(.extend)`(`$t$`)` \    Extiende $\underline{s}$ con el contenido de $\underline{t}$; es igual que !SALTOHTML
$s$ `+=` $t$                      $s$!PYTHON{[len}`(`$s$!PYTHON{):len}`(`$s$`)]` `=` $t$

$s$ `*=` $n$                      Modifica $\underline{s}$ repitiendo su contenido $\underline{n}$ veces

$s$!PYTHON(.insert)`(`$i$`, `     Inserta $\underline{x}$ en $\underline{s}$ en el índice $\underline{i}$; es igual que
$x$`)`                            $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$!PYTHON(.pop)`(`[ $i$ ]`)`     Extrae el elemento $\underline{i}$ de $\underline{s}$ y lo devuelve !SALTOHTML
                                  \(por defecto, $i$ vale !PYTHON(-1))

$s$!PYTHON(.remove)`(`$x$`)`      Quita el primer elemento de $\underline{s}$ que sea igual a $\underline{x}$

$s$!PYTHON(.reverse())            Invierte los elementos de $\underline{s}$

$s$!PYTHON(.sort())               Ordena los elementos de $\underline{s}$
-----------------------------------------------------------------------------------------------------------------------------------

---

- La **copia superficial** (a diferencia de la **_copia profunda_**) significa
  que sólo se copia el objeto sobre el que se aplica la copia, **no sus
  elementos**.

- Por tanto, al crear la copia superficial, se crea sólo un nuevo objeto, donde
  se copiarán las referencias de los elementos del objeto original.

- Esto influye, sobre todo, cuando los elementos de una colección mutable
  también son objetos mutables.

- Por ejemplo, si tenemos listas dentro de otra lista, y copiamos ésta última
  con !PYTHON(.copy()), la nueva lista compartirá elementos con la lista
  original:

  ```python
  >>> x = [[1, 2], [3, 4]]   # los elementos de «x» también son listas
  >>> y = x.copy()           # «y» es una copia de «x»
  >>> x is y
  False                      # no son la misma lista
  >>> x[0] is y[0]
  True                       # sus elementos no se han copiado,
  >>> x[0].append(9)         # sino que están compartidos por «x» e «y»
  >>> x
  [[1, 2, 99], [3, 4]]
  >>> y
  [[1, 2, 99], [3, 4]]
  ```

---

- El método !PYTHON(sort) permite ordenar los elementos de la secuencia de
  forma ascendente o descendente:

  ```python
  >>> x = [3, 6, 2, 9, 1, 4]
  >>> x.sort()
  >>> x
  [1, 2, 3, 4, 6, 9]
  >>> x.sort(reverse=True)
  >>> x
  [9, 6, 4, 3, 2, 1]
  ```

!BIBLIOGRAFIA
