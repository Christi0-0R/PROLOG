# 3 ejercicios en Lisp

## Descripción

El programa resuelve 3 problemas sencillos usando estructuras condicionales de Common Lisp (`if`, `cond`, `when` y `unless`). En cada uno se toma un dato de entrada (años de antigüedad, peso de la ropa o edad de una persona) y, según las condiciones que se cumplan, se calcula un resultado o se muestra un mensaje.

## Ejercicio 1: Sueldo según la antigüedad (`if` anidados)

Calcula el sueldo anual de un trabajador que cobra 40,000 euros al año, aplicando un aumento según los años que lleva en la empresa:

| Años en la empresa | Aumento |
|---|---|
| Menos de 3 | 3% |
| De 3 a menos de 5 | 5% |
| De 5 a menos de 10 | 7% |
| 10 o más | 10% |

La función `tiempo_trabajando` recibe los años y usa `if` anidados para elegir el porcentaje:

```lisp
(defun tiempo_trabajando (tiempo)

    (setq sueldo 40000)

    (if (< tiempo 3)
        (setq aumento (* sueldo (/ 3 100)))
        (if (< tiempo 5)
            (setq aumento (* sueldo (/ 5 100)))
            (if (< tiempo 10)
                (setq aumento (* sueldo (/ 7 100)))
                (setq aumento (* sueldo (/ 10 100)))
            )
        )
    )

    (setq total (+ sueldo aumento))
    (format t "Su sueldo anual es de ~A~%" total)
)
```

Primero se revisa el rango más bajo y, si no se cumple, se pasa al siguiente, hasta llegar al último caso (10 años o más). El aumento se calcula multiplicando el sueldo por el porcentaje y se suma al sueldo base para obtener el total.

Por ejemplo, con 12 años el aumento es de 4,000 y el programa imprime `Su sueldo anual es de 44000`.

> **Observación:** el enunciado no dice qué pasa con los casos exactos (por ejemplo, exactamente 5 años). En el código, 3 años recibe 5%, 5 años recibe 7% y 10 años recibe 10%.

## Ejercicio 2: Lavadora (`cond` y `when`)

Recibe el peso de la ropa en libras y dice el nivel de lavado y los litros de agua necesarios. Si pesa más de 30 libras, la lavadora no funciona.

### Cálculo de agua

```lisp
(defun calculo_agua(libras)
    (+ 30 (* libras 4))
)
```

La cantidad de agua se calcula con la fórmula `30 + (libras × 4)`.

> **Observación:** el enunciado no da una fórmula para el agua, así que esta es una fórmula supuesta.

### Nivel de lavado

```lisp
(defun definir_nivel(peso)
    (cond
        ((< peso 8) "Bajo")
        ((< peso 15) "Medio")
        ((< peso 22) "Alto")
        ( t "Maximo")
    )
)
```

El `cond` revisa cada rango en orden:

| Peso (libras) | Nivel |
|---|---|
| Menos de 8 | Bajo |
| De 8 a menos de 15 | Medio |
| De 15 a menos de 22 | Alto |
| 22 o más | Máximo |

El último caso `t` funciona como el "de lo contrario": se ejecuta cuando ninguna de las condiciones anteriores se cumple.

### Función principal

```lisp
(defun lavar()

    (format t "Ingrese el tamaño en libras de la ropa: ")
    (setq peso (read))

    (format t "Calculando el nivel del lavado . . . ~%")

    (setq agua (calculo_agua peso))

    (when (<= peso 30)
        (format t "Nivel de lavado: ~A~%" (definir_nivel peso))
        (format t "Cantidad de agua: ~A L~%" (calculo_agua peso))
    )

    (when (> peso 30)
        (format t "Peso excedido, el proceso no puede seguir, por favor, retire el exceso de ropa")
    )
)
```

Pide el peso con `read` y usa dos `when`:

- Si el peso es 30 o menos, muestra el nivel de lavado y los litros de agua.
- Si el peso es mayor a 30, muestra un mensaje de que se excedió el peso y que se retire ropa.

Por ejemplo, con 10 libras imprime `Nivel de lavado: Medio` y `Cantidad de agua: 70 L`.

> **Observación:** la variable `agua` se calcula pero no se usa; después se vuelve a llamar `calculo_agua` dentro del `format`. Se podría usar la variable `agua` directamente.

## Ejercicio 3: Fiesta de quince años (`when`, `unless` e `if`)

Según la edad de la persona, indica qué requisito le toca para entrar a la fiesta:

| Edad | Resultado |
|---|---|
| Menos de 15 | No puede entrar |
| Exactamente 15 | Entra gratis |
| Más de 15 | Entra solo si trae un regalo |

```lisp
(defun fiesta()

    (format t "Para ingresar a la fiesta de quince años, se ocupa saber su edad ~%")
    (format t "Ingrese su edad: ")
    (setq edad (read))

    (when (< edad 15)
        (format t "No puedes entrar a la fiesta.~%")
    )

    (unless (< edad 15)
        (if (= edad 15)
            (format t "Puedes entrar totalmente gratis~%")
            (format t "Puedes entrar si traes un regalo~%")
        )
    )
)
```

Funciona en dos partes que son opuestas entre sí:

1. **`when`:** si la edad es menor a 15, avisa que no puede entrar.
2. **`unless`:** si la edad **no** es menor a 15, entra al `if` interno. Ahí, si la edad es exactamente 15 entra gratis; si es mayor, debe traer un regalo.

## Resumen de estructuras usadas

| Estructura | Ejercicios | Para qué se usó |
|---|---|---|
| `if` | 1, 3 | Elegir entre dos opciones (anidados en el 1) |
| `cond` | 2 | Clasificar el peso en 4 niveles |
| `when` | 2, 3 | Ejecutar acciones solo si se cumple una condición |
| `unless` | 3 | Ejecutar acciones solo si **no** se cumple una condición |