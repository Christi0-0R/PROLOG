# Cálculo de Áreas y Volúmenes con Lambda en Common Lisp

## Descripción

El programa muestra un menú con 10 figuras para calcular su área y 10 cuerpos geométricos para calcular su volumen. En esta versión, cada fórmula está escrita como una función anónima (`lambda`) que recibe sus datos como parámetros, y se ejecuta con `funcall` usando valores constantes en lugar de pedirlos al usuario con `read` y guardarlos con `setq`. De esta forma ya no se necesita una `defun` por cada figura: toda la lógica queda dentro del `case` del menú.

## Uso de lambda y funcall

Una `lambda` es una función sin nombre. Se escribe con sus parámetros y la fórmula, y `funcall` se encarga de ejecutarla con los valores que se le pasen:

```lisp
(funcall (lambda (lado) (* lado lado)) 10)
```

- `(lambda (lado) (* lado lado))` es la fórmula del área del cuadrado.
- `10` es el valor constante del lado.
- `funcall` conecta ambos y regresa el resultado (100).

Cuando la fórmula necesita varios datos, los valores se pasan en el mismo orden que los parámetros:

```lisp
(funcall (lambda (base altura) (* base altura)) 10 5)
```

Aquí `base` vale 10 y `altura` vale 5, por lo que el resultado es 50.

> **Nota:** los valores van directamente después de la `lambda`, sin paréntesis. Escribir `(10)` haría que Lisp intente ejecutar una función llamada 10 y marque error.

## El menú

La función `menu` imprime las 20 opciones y lee la opción elegida directamente dentro del `case`:

```lisp
(defun menu()
    (format t "Areas: ~%")
    (format t "1. Cuadrado~%")
    ...
    (format t "Volumenes: ~%")
    (format t "11. Cubo~%")
    ...
    (format t "Dame una opcion: ")

    (case (read)
        ...
        (otherwise (format t "Opcion invalida~%"))
    )
)
```

Como ya no se guarda la opción en una variable (`op`), se usa `(read)` como argumento del `case`. Si el número no corresponde a ninguna opción, el caso `otherwise` muestra "Opcion invalida".

## Estructura de cada opción

Cada caso del `case` imprime el resultado con `format` y calcula el valor con un `funcall` de la `lambda` correspondiente:

```lisp
(1 (format t "El area del cuadrado es ~A~%"
    (funcall (lambda (lado) (* lado lado)) 10)))
```

Todas las opciones siguen el mismo patrón: mensaje, `lambda` con la fórmula y valores constantes.

## Áreas (opciones 1 a 10)

| # | Figura | Parámetros | Fórmula | Valores usados | Resultado |
|---|---|---|---|---|---|
| 1 | Cuadrado | lado | lado × lado | 10 | 100 |
| 2 | Rectángulo | base, altura | base × altura | 10, 5 | 50 |
| 3 | Triángulo | base, altura | (base × altura) / 2 | 10, 5 | 25 |
| 4 | Círculo | radio | π × radio² | 5 | ≈ 78.54 |
| 5 | Rombo | diagonal mayor, diagonal menor | (D × d) / 2 | 10, 6 | 30 |
| 6 | Trapecio | base mayor, base menor, altura | ((B + b) × h) / 2 | 10, 6, 4 | 32 |
| 7 | Paralelogramo | base, altura | base × altura | 8, 5 | 40 |
| 8 | Pentágono | perímetro, apotema | (perímetro × apotema) / 2 | 30, 4 | 60 |
| 9 | Hexágono | perímetro, apotema | (perímetro × apotema) / 2 | 36, 5 | 90 |
| 10 | Elipse | semieje mayor, semieje menor | π × a × b | 6, 4 | ≈ 75.40 |

Por ejemplo, el trapecio se resuelve así:

```lisp
(6 (format t "El area del trapecio es ~A~%"
    (funcall (lambda (baseMa baseMe altura)
                (/ (* (+ baseMa baseMe) altura) 2))
             10 6 4)))
```

## Volúmenes (opciones 11 a 20)

| # | Cuerpo | Parámetros | Fórmula | Valores usados | Resultado |
|---|---|---|---|---|---|
| 11 | Cubo | lado | lado³ | 4 | 64 |
| 12 | Prisma rectangular | largo, ancho, altura | largo × ancho × altura | 6, 4, 3 | 72 |
| 13 | Prisma triangular | base, altura, altura del prisma | (base × altura × altura del prisma) / 2 | 6, 4, 10 | 120 |
| 14 | Cilindro | radio, altura | π × radio² × altura | 3, 10 | ≈ 282.74 |
| 15 | Esfera | radio | (4/3) × π × radio³ | 5 | ≈ 523.60 |
| 16 | Cono | radio, altura | (1/3) × π × radio² × altura | 3, 9 | ≈ 84.82 |
| 17 | Pirámide cuadrangular | lado, altura | (1/3) × lado² × altura | 6, 10 | 120 |
| 18 | Pirámide triangular | base, altura, altura de la pirámide | (1/3) × ((base × altura) / 2) × altura de la pirámide | 6, 4, 9 | 36 |
| 19 | Prisma hexagonal | perímetro, apotema, altura | ((perímetro × apotema) / 2) × altura | 36, 5, 10 | 900 |
| 20 | Tronco de cono | radio mayor, radio menor, altura | (π × altura / 3) × (R² + R×r + r²) | 5, 3, 8 | ≈ 410.67 |

Por ejemplo, el tronco de cono, que es la fórmula más larga:

```lisp
(20 (format t "El volumen del tronco de cono es ~A~%"
    (funcall (lambda (radioMa radioMe altura)
                (* (/ (* pi altura) 3)
                   (+ (* radioMa radioMa)
                      (* radioMa radioMe)
                      (* radioMe radioMe))))
             5 3 8)))
```

## Constantes en lugar de variables

En el programa original cada dato se pedía al usuario y se guardaba en una variable con `setq`. En esta versión los datos son valores fijos escritos directamente en el `funcall`, así que ya no hay variables que se modifiquen.

Si se quiere trabajar con constantes con nombre, se pueden definir con `defconstant` y usarlas en el `funcall`:

```lisp
(defconstant +lado+ 10)

(funcall (lambda (lado) (* lado lado)) +lado+)
```

La convención en Lisp es escribir los nombres de las constantes entre signos `+`.

## Observaciones

- Las fracciones como `(/ 4 3)` y `(/ 1 3)` en Lisp se manejan como fracciones exactas, por lo que no pierden precisión hasta que se multiplican por `pi`.
- Para que el programa arranque solo, se puede agregar `(menu)` al final del archivo.
- Comparado con la versión anterior, el código es mucho más corto: de 20 funciones con `read` y `setq` se pasó a una sola función `menu` con 20 casos.