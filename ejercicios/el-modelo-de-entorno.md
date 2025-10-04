---
title:
- |
  Ejercicios de\
  El modelo de entorno
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

#. Dado el siguiente programa:

   ```python
   producto = lambda x, y: x * y
   cuenta = lambda x: x.count('a')
   resultado = producto(2, 3) + cuenta('Amapola')
   ```

   Se pide:

   #. Explicar brevemente qué hace el programa.

   #. Determinar los ámbitos que hay en el código fuente.

   #. Indicar:

      #. Los parámetros.

      #. Las ligaduras locales, y de qué ámbito son locales.

      #. Las ligaduras globales.

   #. Trazar su ejecución paso a paso, indicando el contenido de la pila, el
      entorno y las ligaduras que se van creando y destruyendo durante la
      ejecución.
