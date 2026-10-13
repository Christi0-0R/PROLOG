# Tarea 8: uso de car y cdr en Lisp

## Descripción

El programa extrae elementos específicos de distintas listas (incluyendo listas anidadas) usando únicamente las funciones `car` y `cdr`, sin abreviaturas como `cadr` o `caddr`. Estas dos funciones son la base del manejo de listas en Lisp:

- **`car`** regresa el primer elemento de una lista.
- **`cdr`** regresa la lista sin su primer elemento.

Para llegar a un elemento, se combinan de forma anidada y se leen **de adentro hacia afuera**.

```lisp
(car '(1 2 3)) ; 1
(cdr '(1 2 3)) ; (2 3)
(car (cdr '(1 2 3))) ; 2
```

## Cómo se obtiene un elemento

Para un elemento en la posición *n* de una lista simple, se aplica `cdr` *(n - 1)* veces para saltar los elementos anteriores y al final un `car` para tomarlo. Cuando el elemento está dentro de una sublista, primero se llega a la sublista (con `car`) y después se repite el proceso dentro de ella.

Ejemplo para obtener la `X` de `((A B C) (R (T X) (Z W)))`:

| Paso | Expresión | Resultado |
|---|---|---|
| 1 | `(cdr lista)` | `((R (T X) (Z W)))` |
| 2 | `(car ...)` | `(R (T X) (Z W))` |
| 3 | `(cdr ...)` | `((T X) (Z W))` |
| 4 | `(car ...)` | `(T X)` |
| 5 | `(cdr ...)` | `(X)` |
| 6 | `(car ...)` | `X` |

## Ejercicio 1: Lista simple de números

Lista: `(1 2 3 4 5 6 7 8 9 10)`. Se obtienen el 6, el 8 y el 10.

```lisp
(setq e1 '(1 2 3 4 5 6 7 8 9 10))

(car (cdr (cdr (cdr (cdr (cdr e1))))))
(car (cdr (cdr (cdr (cdr (cdr (cdr (cdr e1))))))))
(car (cdr (cdr (cdr (cdr (cdr (cdr (cdr (cdr (cdr e1))))))))))
```

| Elemento | Posición | `cdr` necesarios | `car` |
|---|---|---|---|
| 6 | 6 | 5 | 1 |
| 8 | 8 | 7 | 1 |
| 10 | 10 | 9 | 1 |

## Ejercicio 2: Lista con sublistas

Lista: `(1 2 (3 4) (A B C D))`. Se obtienen D, C, 4, 2 y A.

```lisp
(setq e2 '(1 2 (3 4) (A B C D)))

(car (cdr (cdr (cdr (car (cdr (cdr (cdr e2))))))))
(car (cdr (cdr (car (cdr (cdr (cdr e2)))))))
(car (cdr (car (cdr (cdr e2)))))
(car (cdr e2))
(car (car (cdr (cdr (cdr e2)))))
```

- **2:** está en la posición 2 de la lista principal, así que basta un `cdr` y un `car`.
- **4:** se llega a la sublista `(3 4)` con `(car (cdr (cdr e2)))`, y dentro de ella se toma el segundo elemento con `(car (cdr ...))`.
- **A, C, D:** se llega a la sublista `(A B C D)` con tres `cdr` y un `car`, y dentro de ella se avanza con más `cdr` según la letra.

## Ejercicio 3: Listas anidadas con varios niveles

Lista: `((A B C) (R (T X) (Z W)))`. Se obtienen W, Z, T, R, X y A.

```lisp
(setq e3 '((A B C) (R (T X) (Z W))))

(car (cdr (car (cdr (cdr (car (cdr e3)))))))
(car (car (cdr (cdr (car (cdr e3))))))
(car (car (cdr (car (cdr e3)))))
(car (car (cdr e3)))
(car (cdr (car (cdr (car (cdr e3))))))
(car (car e3))
```

La clave es notar que la segunda sublista `(R (T X) (Z W))` se obtiene con `(car (cdr e3))`. Desde ahí:

- **R** es su primer elemento.
- **`(T X)`** es el segundo elemento y **`(Z W)`** el tercero.
- **T, X** se sacan de `(T X)` y **Z, W** de `(Z W)`.

## Ejercicio 4: Lista con muchos niveles de paréntesis

Lista: `((((a b) (c d) (f g))))`. Se obtienen A, B, C, D, F y G.

```lisp
(setq e4 '((((a b) (c d) (f g)))))

(car (car (car (car e4))))
(car (cdr (car (car (car e4)))))
(car (car (cdr (car (car e4)))))
(car (cdr (car (cdr (car (car e4))))))
(car (car (cdr (cdr (car (car e4))))))
(car (cdr (car (cdr (cdr (car (car e4)))))))
```

Aquí la lista está envuelta en varios niveles de paréntesis. Con `(car (car e4))` se llega a `((a b) (c d) (f g))`, que ya es una lista de tres pares. A partir de ahí:

- `(car ...)` da `(a b)`, `(car (cdr ...))` da `(c d)` y `(car (cdr (cdr ...)))` da `(f g)`.
- Dentro de cada par se usa `car` para la primera letra y `(car (cdr ...))` para la segunda.

## Resumen de resultados

| Ejercicio | Lista | Elementos obtenidos |
|---|---|---|
| 1 | `(1 2 3 4 5 6 7 8 9 10)` | 6, 8, 10 |
| 2 | `(1 2 (3 4) (A B C D))` | D, C, 4, 2, A |
| 3 | `((A B C) (R (T X) (Z W)))` | W, Z, T, R, X, A |
| 4 | `((((a b) (c d) (f g))))` | A, B, C, D, F, G |

## Observaciones

- Lisp no distingue entre mayúsculas y minúsculas en los símbolos, por lo que en el ejercicio 4 los resultados aparecen en mayúsculas (`A`, `B`, etc.) aunque la lista esté escrita en minúsculas.
- Existen abreviaturas como `cadr` (`car` de `cdr`) o `caddr` (`car` de `cdr` de `cdr`), pero en este ejercicio se usó solo `car` y `cdr` como se pidió.