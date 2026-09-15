# Áreas y Volumenes en Lisp

## Descripción

El programa tiene como objetivo calcular el área de distintas figuras geométricas planas y el volumen de varios cuerpor geométricos en tres dimensiones. Para lograrlo se implementó una función independiente por cada figura, todas siguiendo la misma estrcutura: piden los datos necesarios al usuario, realizan el cálculo correspondiente y muestran el resultado en pantalla.

Además se construyó un menú interactivo que permite elegir mediante un número, que figura o cuerpo se desea calcular.

En total el programa cuenta con 20 opciones: **10 áreas** y **10 volúmenes**.

Áreas:

1. Cuadrado
2. Rectangulo
3. Triangulo
4. Circulo
5. Rombo
6. Trapecio
7. Paralelogramo
8. Pentagono
9. Hexagono
10. Elipse

Volumenes:

11. Cubo
12. Prisma Rectangular
13. Prisma Triangular
14. Cilindro
15. Esfera
16. Cono
17. Piramide Cuadrangular
18. Piramide Triangular
19. Prisma Hexagonal
20. Tronco de un Cono


---

## Estructura general de una función

Todas las funciones del programa, sin importar si calculan área o volumen, siguen el mismo esqueleto de tres pasos:

1. Pedir los datos al usuario con `format` y `read`.
2. Calcular el resultado usando variables auxiliares: `mul`, `sum`, `div`, etc; cuando la formula lo requiere.
3. Imprimir el resultado con `format`, usando `~A` para insertar el valor calculado y `~%` para salto de linea.

Esto se puede ver en la funcino del cuadrado como ejemplo:

```clisp
(defun cuadrado()
    (format t "Ingrese el numero del lado: ")
    (setq lado (read))
    
    (setq resultado (* lado lado))
    
    (format t "El area del cuadrado es ~A~%" resultado)
)
```

Aqui `(format t "Ingrese el numero del lado: ")` imprime el mensaje sin salto de linea (para que el usuario escriba justo después), `(setq lado (read))` guarda lo que el usuario tecleó en la variable **lado**. Y finalmente se multiplica **lado** por si mismo para obtener el área.

---

## Funciones de área

Las 10 funciones de area comparten esta misma estrctura pero cada una pide datos distintos segun la figura:

|Figura             |Datos que pide                 |Formula                            |
| ---               | ---                           | :---:                             |
|1. Cuadrado        |lado                           |`lado * lado`                      |
|2. Rectangulo      |base, altura                   |`base * altura`                    |
|3. Triangulo       |base, altura                   |`(base * altura) / 2`              |
|4. Circulo         |radio                          |`pi * radio * radio`               |
|5. Rombo           |diagonal mayor, diagonal menor |`(diagMa * diagMe) / 2`            |
|6. Trapecio        |altura, base mayor, base menor |`((baseMa + baseMe) * altura) / 2` |
|7. Paralelogramo   |base, altura                   |`base * altura`                    |
|8. Pentagono       |perimetro, apotema             |`(perimetro * apotema) / 2`        |
|9. Hexagono        |perimetro, apotema             |`(perimetro * apotema) / 2`        |
|10. Elipse         |semieje mayor, semieje menor   |`pi * semiejeMa * semiejeMe`       |

Por ejemplo, cuando una formula necesita mas de una oprecaion, se usan variables intermedias antes de llegar al resultado final, como en el trapecio:

```clisp
(setq sum (+ baseMa baseMe))
(setq mul (* sum altura))
(setq resultado (/ mul 2))
```

Esto se hizo asi en vez de escribir todo en una sola linea para que el codigo fuera mas facil de leer y de seguir paso a paso.

---

## Funciones de volumen

Las funciones de volumen siguen exactamente la misma filosofia que las de area: cada una pide sus propios datos con `read`, en lugar de recibirlos como parametros de la funcion. Esta desicion se tomo para que todas las funciones se comportaran de la misma forma y puieran llamarse directamente desde el menu sin tener que pasarles argumentos manualmente.

```clisp
(defun cubo()
    (format t "Ingrese el lado: ")
    (setq lado (read))

    (setq resultado (* lado lado lado))

    (format t "El volumen del cubo es ~A~%" resultado)
)
```

Algunas funcinoes de volumen reutilizan la misma idea de las areas, pero agregando una dimension extra o un factor de escala como **1/3** o **4/3**, como por ejemplo el cono:

```clisp
(defun cono()
    (format t "Ingrese el radio: ")
    (setq radio (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq div (/ 1 3))
    (setq resultado (* div pi radio radio altura))

    (format t "El volumen del cono es ~A~%" resultado)
)
```

Y la esfera, que no depende de una altura sino solo del radio:

```clisp
(defun esfera()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (setq div (/ 4 3))
    (setq resultado (* div pi radio radio radio))

    (format t "El volumen de la esfera es ~A~%" resultado)
)
```

El caso mas complejo es el del `tronco de cono`, que combina tres radios distintos dentro de una sola formula, apoyandose en dos variables auxiliares (`div` y `sum`) para no tener que escribir una expresion gigante de una sola vez:

```clisp
(defun troncoCono()
    (format t "Ingrese el radio mayor: ")
    (setq radioMa (read))
    (format t "Ingrese el radio menor: ")
    (setq radioMe (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq div (/ (* pi altura) 3))
    (setq sum (+ (* radioMa radioMa) (* radioMa radioMe) (* radioMe radioMe)))
    (setq resultado (* div sum))

    (format t "El volumen del tronco de cono es ~A~%" resultado)
)
```

En total, las 10 funciones de volumenes siguen este mismo patron de pedir, calcular e imprimir.

|Cuerpo                     |Datos que pide                                     |Formula                                                        |
| ---                       | ---                                               | :---:                                                         |
|11. Cubo                   |lado                                               |`lado * lado * lado`                                           |
|12. Prisma Rectangular     |largo, ancho, altura                               |`largo * ancho * altura`                                       |
|13. Prisma Triangular      |base, altura, altura del prisma                    |`(base * altura * alturaPris) / 2`                             |
|14. Cilindro               |radio, altura                                      |`pi * radio * radio * altura`                                  |
|15. Esfera                 |radio                                              |`(4/3) * pi * radio * radio * radio`                           |
|16. Cono                   |radio, altura                                      |`(1/3) * pi * radio * radio * altura`                          |
|17. Piramide Cuadrangular  |lado, altura                                       |`(1/3) * lado * lado * altura`                                 |
|18. Piramide Triangular    |base, altura del triangulo, altura de la piramide  |`(1/3) * ((base * altura) / 2) * alturaPiramide`               |
|19. Prisma Hexagonal       |perimetro, apotema, altura                         |`((perimetro * apotema) / 2) * altura`                         |
|20. Tronco de un Cono      |radio mayor, radio menor, altura                   |`((pi * altura) / 3) * (radioMa² + radioMa*radioMe + radioMe²)`| 

---

## El menu

La funcion `menu()` es la que conecta todas las funciones. Primero imprime una lista completa de opciones con una serie de `(format t ...)`, separando visualmente las areas y los volumenes:


```clisp
(format t "Areas: ~%")
(format t "1. Cuadrado~%")
...
(format t "Volumenes: ~%")
(format t "11. Cubo~%")
...
```

Despues le pide al usuario que escriba una opcion:

```clips
(format t "Dame una opcion: ")
(setq op (read))
```

Y con ese numero decide que funcion ejecutar usando el `case` que funciona omo una serie de comparaciones: revisa el valor de **op** y ejecuta el bloque que coincida con el numero.

```clisp
(case op
    ; Areas
    (1 (cuadrado))
    (2 (rectangulo))
    (3 (triangulo))
    (4 (circulo))
    (5 (rombo))
    (6 (trapecio))
    (7 (paralelogramo))
    (8 (pentagono))
    (9 (hexagono))
    (10 (elipse))
    ; Volumenes
    (11 (cubo))
    (12 (prismaRectangular))
    (13 (prismaTriangular))
    (14 (cilindro))
    (15 (esfera))
    (16 (cono))
    (17 (piramideCuad))
    (18 (piramideTri))
    (19 (prismaHexagonal))
    (20 (troncoCono))

    (otherwise (format t "Opcion invalida~%"))
)
```

Como cada funcion de area y de volumen ya pide sus propios datos internamente, dentro del case solo hace falta llamarlas sin argumentos, por ejemplo `(cilindro)` en lugar de `(cilindro radio altura)`. Si el usuario ingresa un numero que no corresponde a ninguna opcion del 1 al 20, se activa la rama `otherwise`, que muestra el mensaje "Opcion invalida" en lugar de dejar el programa sin respuesta.