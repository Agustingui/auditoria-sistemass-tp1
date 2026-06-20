# Trabajo Práctico N.º 1 - Trazabilidad e Integridad de la Información

## Materia - Alumno

Auditoría de Sistemas - Agustín Solís

## Descripción del Proyecto

Se utilizó un sistema de gestión de clientes desarrollado en PHP mediante el framework CodeIgniter 4. Sobre este proyecto se implementaron mecanismos de trazabilidad e integridad de la información para cumplir con los requisitos establecidos en el trabajo práctico.

---

# Implementación de la Trazabilidad

La trazabilidad fue implementada mediante una tabla específica denominada:

```sql
auditoria_concesionaria
```

Esta tabla almacena información sobre todas las operaciones realizadas sobre los registros de clientes.

## Datos registrados

Para cada acción se almacenan:

* Fecha y hora de la operación.
* Tipo de acción realizada.
* Identificador del registro afectado.

## Estructura utilizada

| Campo       | Descripción                  |
| ----------- | ---------------------------- |
| id          | Identificador único          |
| fecha_hora  | Fecha y hora de la operación |
| accion      | Tipo de acción realizada     |
| registro_id | ID del cliente afectado      |

---

## Registro de inserciones

Cuando se crea un nuevo cliente, el sistema:

1. Guarda el cliente.
2. Obtiene el ID generado.
3. Registra una auditoría con la acción INSERT.

Ejemplo:

```php
$modeloAuditoria->insert([
    'fecha_hora' => date('Y-m-d H:i:s'),
    'accion' => 'INSERT',
    'registro_id' => $idCliente,
]);
```

---

## Registro de modificaciones

Cuando un usuario modifica los datos de un cliente, se registra automáticamente una auditoría con la acción UPDATE.

Ejemplo:

```php
$modeloAuditoria->insert([
    'fecha_hora' => date('Y-m-d H:i:s'),
    'accion' => 'UPDATE',
    'registro_id' => $id,
]);
```

---

## Registro de eliminación lógica

La eliminación de clientes se realiza mediante Soft Delete.

En lugar de eliminar físicamente el registro, se actualiza el campo:

```php
'borrado' => 1
```

Posteriormente se registra la acción:

```php
'SOFT DELETE'
```

Ejemplo:

```php
$modeloAuditoria->insert([
    'fecha_hora' => date('Y-m-d H:i:s'),
    'accion' => 'SOFT DELETE',
    'registro_id' => $id,
]);
```

---

# Implementación de la Integridad de la Información

Para verificar que los registros no hayan sido modificados directamente desde la base de datos, se implementó un mecanismo de integridad basado en hash SHA-256.

## Generación del hash

Cada vez que se crea o modifica un cliente se genera un hash utilizando los datos:

* Nombre
* Teléfono

Ejemplo:

```php
$hash = hash('sha256', $nombre . $telefono);
```

El valor generado se almacena en el campo:

```sql
hash
```

de la tabla clientes.

---

## Verificación de integridad

Se desarrolló una función denominada:

```php
integridad()
```

Esta función:

1. Obtiene todos los registros.
2. Recalcula el hash utilizando los datos actuales.
3. Compara el hash calculado con el hash almacenado.
4. Determina si el registro mantiene su integridad.

Ejemplo:

```php
$hashCalculado = hash(
    'sha256',
    $cliente['nombre'] . $cliente['telefono']
);
```

Comparación:

```php
$hashCalculado === $cliente['hash']
```

---

## Resultado de la validación

Si ambos hashes coinciden:

```text
integro
```

Si son diferentes:

```text
alterado
```

Esto permite detectar modificaciones realizadas directamente sobre la base de datos sin utilizar el sistema de gestión.

---

# Tecnologías Utilizadas

* PHP
* CodeIgniter 4
* MySQL
* HTML5
* CSS3

---

# Replicación de la Base de Datos            

El repositorio incluye un archivo `.sql` que contiene la estructura necesaria para recrear las tablas utilizadas por el sistema.

---

# Licencia

Este proyecto se distribuye bajo licencia MIT.
