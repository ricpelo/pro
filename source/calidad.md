---
title: Calidad
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate
---

# Pruebas

## Desarrollo conducido por pruebas

- El **desarrollo conducido por pruebas** o **TDD** (del inglés, _test-driven
  development_) es una práctica de ingeniería de software que agrupa otras dos
  prácticas:

  - Escribir las pruebas primero (_test first development_).

  - Refactorización (_refactoring_).

- Para escribir las pruebas generalmente se utilizan **pruebas unitarias**
  (_unit test_).

- El propósito del desarrollo guiado por pruebas es lograr un código limpio que
  funcione.

- La idea es que los requisitos sean traducidos a pruebas, de este modo, cuando
  las pruebas pasen se garantizará que el software cumple con los requisitos
  que se han establecido.

### Ciclo de desarrollo

- En primer lugar se debe definir una lista de requisitos y después se ejecuta
  el siguiente ciclo de siete pasos:

  #. **Elegir un requisito:** Se elige el que nos dará mayor conocimiento del
     problema y que además sea fácilmente implementable.

  #. **Escribir una prueba:** Se comienza escribiendo una prueba para el
     requisito, para lo cual el programador debe entender claramente las
     especificaciones de la funcionalidad a implementar.

  #. **Verificar que la prueba falla:** Si la prueba no falla es porque el
     requisito ya estaba implementado o porque la prueba es errónea.

---

  4. **Escribir la implementación:** Se escribe el código más sencillo que haga
     que la prueba funcione.

  #. **Ejecutar las pruebas automatizadas:** Se verifica si todo el conjunto de
     pruebas se pasa correctamente.

  #. **Refactorizar:** Se modifica el código para hacerlo más mantenible con
     cuidado de que sigan pasando todas las pruebas.

  #. **Actualizar la lista de requisitos:** Se tacha el requisito implementado
     y se agregan otros nuevos si hace falta.

---

- Todo este ciclo se resume en que, por cada requisito, hay que hacer:

  #. **Rojo:** el test falla

  #. **Verde:** se pasa el test

  #. **Refactorizar:** se mejora el código

!BIBLIOGRAFIA
