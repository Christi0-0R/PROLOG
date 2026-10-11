# 10 Ejercicios de Lisp

## Descripción

El programa reúne 10 ejercicios que practican las estructuras de control de Common Lisp: `if`, `when`, `unless`, `case`, `cond`, `typecase` y los operadores lógicos `and`, `or` y `not`. Cada ejercicio valida datos de entrada (edades, contraseñas, roles, promedios, solicitudes, etc.) y responde con un mensaje según las condiciones que se cumplan. Al final se integra todo en un pequeño sistema de crédito escolar que usa una estructura (`defstruct`).

## Funciones auxiliares

Para no repetir código, hay dos funciones que imprimen mensajes y regresan un valor:

```lisp
(defun reportar-error (mensaje)
    (format t "Error: ~A~%" mensaje)
    nil
)

(defun reportar-ok (mensaje)
    (format t "~A~%" mensaje)
    t
)
```

`reportar-error` imprime el mensaje con el prefijo "Error:" y regresa `nil` (falso). `reportar-ok` imprime el mensaje y regresa `t` (verdadero). Así, las demás funciones pueden usarlas tanto para mostrar texto como para indicar si la operación fue exitosa.

## Ejercicio 1: Validar edad para el cine (`if` anidados)

La función `validar_edad_cine` clasifica una edad con varios `if` anidados. Primero revisa que sea entero, luego que sea mayor que 0 y menor que 120, y finalmente asigna la clasificación:

- Mayor de 18: `B15/C (adultos)`
- Menor de 13: `AA (infantil)`
- Cualquier otro caso: `B (adolescentes)`

Si la edad no es entero, es negativa o no es realista, imprime el mensaje correspondiente.

> **Observación:** con la condición `(> ?edad 18)`, una persona de exactamente 18 años cae en "adolescentes". Si se quiere que 18 sea adulto, habría que usar `>=`.

## Ejercicio 2: Avisos de contraseña (`when`)

`avisar-password` usa tres `when` independientes, por lo que puede imprimir varios avisos a la vez:

```lisp
(when (< (length clave) 8)
    (format t "Aviso: clave muy corta (< 8)~%"))
```

Los avisos son: clave menor a 8 caracteres, clave demasiado común (`"12345678"` o `"password"`) y clave sin mayúsculas (cuando es igual a su versión en minúsculas).

> **Observación:** `num` y `pass` se crean con `setq` sin declararlas, lo que genera variables globales. Sería mejor usar `let`.

## Ejercicio 3: Procesar solicitud (`unless`)

`procesar-solicitud` valida los datos con `unless`. Si una condición no se cumple, sale de inmediato con `return-from` y reporta el error:

1. El nombre debe ser texto y no estar vacío.
2. El correo debe ser texto y contener `@`.
3. Se deben aceptar los términos.

Si todo está bien, reporta que la solicitud fue procesada. El parámetro `edad` se ignora con `(declare (ignore edad))`.

## Ejercicio 4: Permisos por rol (`case`)

`permiso-por-rol` recibe un rol y muestra sus permisos con un `case`:

| Rol | Permiso |
|---|---|
| `admin` | Crear usuarios y materias |
| `docente` | Calificar y pasar lista |
| `alumno` | Consultar calificaciones |
| `padre` | Ver boleta de sus hijos |
| Otro | Error: rol no reconocido |

## Ejercicio 5: Semáforo de promedio (`cond`)

`semaforo-promedio` primero verifica que el promedio sea numérico y esté entre 0 y 100. Después usa `cond` para clasificarlo:

| Promedio | Resultado |
|---|---|
| Menor a 60 | ROJO: Reprobado |
| 60 a 79 | AMARILLO: Regular |
| 80 a 89 | VERDE: Bien |
| 90 o más | ORO: Excelencia |

## Ejercicio 6: Alta de usuario (`and`, `or`, `not`, `if`)

`alta-usuario` da de alta a un usuario solo si se cumplen todas estas condiciones al mismo tiempo (`and`):

- El usuario es texto de más de 4 caracteres.
- La contraseña es texto de al menos 8 caracteres.
- La edad es mayor a 13.
- El país es MX, CO o AR (`or`).
- El usuario no está bloqueado (`not`).

Si todo se cumple, imprime "Usuario dado de alta"; si no, "Alta rechazada".

> **Observación:** este ejercicio aparece **dos veces** idéntico en el código. La segunda definición simplemente reemplaza a la primera, así que se puede eliminar una.

## Ejercicio 7: Clasificar triage (`typecase`)

`clasificar-triage` se comporta distinto según el tipo de dato que recibe:

- **Número:** se interpreta como temperatura (menor a 35 hipotermia, menor a 37.5 normal, menor a 39 fiebre, y desde 39 fiebre alta).
- **Texto:** se interpreta como color de triage (`rojo`, `naranja` o `verde`); cualquier otro da error.
- **Lista:** debe tener 2 elementos, un nombre (texto) y una temperatura (número). Imprime el nombre y se llama a sí misma con la temperatura (recursividad).
- **Otro tipo:** error "Tipo no soportado".

## Ejercicio 8: Cotizar envío (`case`, `unless`, `when`)

`cotizar-envio` busca el servicio con un `case` y guarda en una lista el costo base, el peso máximo y el nombre:

| Código | Costo | Peso máx. | Servicio |
|---|---|---|---|
| `est` | 80 | 20 | Estandar |
| `exp` | 160 | 10 | Express |
| `noc` | 220 | 5 | Nocturno |
| `int` | 450 | 15 | Internacional |

Con `unless` valida que el código exista y que el peso sea válido y no exceda el máximo. Con `when` suma un recargo de 40 si la entrega es en zona de riesgo. Al final muestra el servicio y el costo final.

## Ejercicio 9: Validación de registro completo

`validar-registro` combina todas las estructuras anteriores en una sola validación:

1. **`unless`:** se deben aceptar los términos y la edad debe ser entera.
2. **`if` / `when`:** menores de 13 se rechazan; entre 13 y 17 solo pueden usar el plan `campus`.
3. **`case` (rol):** asigna un prefijo a la cuenta (`a/` alumno, `d/` docente, `s/` admin).
4. **`case` (plan):** asigna la cuota mensual (`libre` 0, `pro` 99, `campus` 0).
5. **`when`:** si el rol es admin, avisa que se revise la bitácora de auditoría; si la contraseña es débil, llama a `avisar-password`.

Al final imprime la cuenta (por ejemplo `a/juan`) y la cuota mensual.

## Ejercicio 10: Sistema de crédito escolar

Este ejercicio usa una estructura `solicitante` con los campos: nombre, promedio, materias reprobadas, beca, monto, historial y semestre.

```lisp
(defstruct solicitante
    nombre promedio materias-reprobadas
    beca monto historial semestre)
```

Está dividido en varias funciones:

- **`validar-solicitante`:** revisa que cada campo tenga un valor válido (promedio entre 0 y 100, semestre entre 1 y 10, historial `limpio`, `atrasos` o `desconocido`, etc.).
- **`categoria-monto`:** clasifica el monto como `bajo` (menos de 2000), `medio` (menos de 8000) o `alto`.
- **`penalizacion-historial`:** regresa 0 para `limpio`, 1 para `desconocido`, 2 para `atrasos` y 99 para cualquier otro valor.
- **`decidir-credito`:** toma la decisión con un `cond`:
  - **Rechazado** si tiene más de 3 materias reprobadas, promedio menor a 70 o penalización de 99.
  - **Aprobado** si tiene promedio de 85 o más, historial limpio y monto bajo o beca.
  - **Revisión** en cualquier otro caso.

  Si el solicitante tiene beca y no fue rechazado, también imprime "Prioridad: solicitante becado".
- **`ronda-credito`:** recorre una lista de solicitantes con `dolist` y decide el crédito de cada uno.

Un historial desconocido nunca cuenta como limpio, por lo que tener beca no es suficiente para aprobar el crédito automáticamente.
