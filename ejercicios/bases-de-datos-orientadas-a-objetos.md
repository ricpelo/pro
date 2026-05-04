---
title:
- |
  Ejercicios de\
  Bases de datos orientadas a objetos
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

#. Crea una pequeña aplicación que:

   #. Abra una base de datos ZODB.

   #. Cree una clase Persona con atributos nombre y edad.

   #. Inserte una instancia en la base de datos.

   #. Cierre la conexión y vuelva a abrirla para comprobar que los datos
      persisten.

   El objetivo es entender cómo funcionan:

     - `FileStorage`
    
     - `DB`
    
     - `connection.root()`
    
     - transacciones (`transaction.commit()`)

   Pistas:

    - Usa `persistent.Persistent` como clase base.

    - Guarda los objetos dentro del `root()` como si fuera un diccionario.

#. Amplía el ejercicio anterior para construir un pequeño sistema de gestión de
   personas:

   #. El `root()` debe contener un diccionario de personas, indexado por
      nombre.

   #. Implementa funciones para:

      - Añadir persona.

      - Eliminar persona.

      - Listar todas las personas.

   Asegúrate de que cada operación relevante hace _commit_.

   El objetivo es comprender cómo modelar estructuras persistentes y cómo
   afecta el _commit_.

   Extra: ¿Qué pasa si modificas un objeto pero no haces commit?

#. Diseña un pequeño sistema de biblioteca:

   #. Clases:

      - `Libro` (con atributos para título y autor).

      - `Usuario` (con atributo para nombre).

      - `Prestamo` (con atributos para usuario, libro y fecha).

   #. Requisitos:

      - Un usuario puede tener varios préstamos.

      - Los préstamos deben almacenarse en la base de datos.

      - Modificar un objeto (por ejemplo, añadir un préstamo a un usuario) debe
        persistir correctamente.

   #. Problema clave a explorar: ¿Qué ocurre si usas listas en lugar de
      `BTree`s?

   Los objetivos son:

   - Entender la detección de cambios en ZODB.

   - Comprender cuándo ZODB detecta modificaciones automáticamente y cuándo no.

