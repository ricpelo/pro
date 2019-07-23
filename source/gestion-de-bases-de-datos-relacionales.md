---
title: Gestión de bases de datos relacionales
author: Ricardo Pérez López
!DATE
---

# Componentes de acceso a datos

## Clase `PDO`

### `__construct(string $dsn [, string $username [, string $password [, array $options ]]])`

### `PDOStatement query(string $statement)`

### `int exec(string $statement)`

### `PDOStatement prepare(string $statement [, array $driver_options = array() ])`

## Clase `PDOStatement`

### `mixed fetch([ int $fetch_style ])`

### `mixed fetchAll([ int $fetch_style ])`

### `mixed fetchColumn([ int $column_number = 0 ])`

### `bool execute ([ array $input_parameters ])`

### `int rowCount(void)`

## Correspondencias de tipos entre SQL y PHP

# Establecimiento de conexiones

# Recuperación de información

## Ejecución de consultas

## Selección de registros

## Uso de parámetros

# Manipulación de la información

## Altas, bajas y modificaciones

