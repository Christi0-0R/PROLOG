
; Funciones que calculan areas de figuras geometricas

; AREAS
(defun cuadrado(lado)
    (* lado lado)
) ; 1

(defun rectangulo(base altura)
    (* base altura)
) ; 2

(defun triangulo(base altura)
    (setq mul (* base altura))
    (/ mul 2)
) ; 3

(defun circulo(radio)
    (* pi radio radio)
) ; 4

(defun rombo(diagonalMa diagonalMe)
    (setq mul (* diagonalMa diagonalMe))
    (/ mul 2)
) ; 5

(defun trapecio(altura baseMa baseMe)
    (setq sum (+ baseMa baseMe))
    (setq mul (* sum altura))
    (/ mul 2)
) ; 6

(defun paralelogramo(base altura)
    (* base altura)
) ; 7

(defun pentagono(perimetro apotema)
    (setq mul (* perimetro apotema))
    (/ mul 2)
) ; 8

(defun hexagono(perimetro apotema)
    (setq mul (* perimetro apotema))
    (/ mul 2)
) ; 9

(defun elipse(semiejeMa semiejeMe)
    (* pi semiejeMa semiejeMe)
) ; 10


; VOLUMENES
(defun cubo(lado)
    (* lado lado lado)
) ; 11

(defun prismaRectangular(largo ancho altura)
    (* largo ancho altura)
) ; 12

(defun prismaTriangular(base altura alturaPris)
    (setq mul (* base altura alturaPris))
    (/ mul 2)
) ; 13

(defun cilindro(radio altura)
    (* pi radio radio altura)
) ; 14

(defun esfera(radio)
    (setq div(/ 4 3))
    (* div pi radio radio radio)
) ; 15

(defun cono(radio altura)
    (setq div (/ 1 3))
    (* div pi radio radio altura)
) ; 16

(defun piramideCuad(lado altura)
    (setq div (/ 1 3))
    (* div lado lado altura)
) ; 17

(defun piramideTri(base altura alturaPiramide)
    (setq div (/ 1 3))
    (setq area (triangulo base altura))
    (* div area alturaPiramide)
) ; 18

(defun prismaHexagonal(perimetro apotema altura)
    (setq area (hexagono perimetro apotema))
    (* area altura)
) ; 19


(defun troncoCono(radioMa radioMe altura)
    (setq div (/ (* pi altura) 3))
    (setq sum (+ (* radioMa radioMa) (* radioMa radioMe) (* radioMe radioMe)))
    (* div sum)
) ; 20 ??????



; Menuncito sjdhsjdhs

(defun menu()
    (format t "Areas: ~%")
    (format t "1. Cuadrado~%")
    (format t "2. Rectangulo~%")
    (format t "3. Triangulo~%")
    (format t "4. Circulo~%")
    (format t "5. Rombo~%")
    (format t "6. Trapecio~%")
    (format t "7. Paralelogramo~%")
    (format t "8. Pentagono~%")
    (format t "9. Hexagono~%")
    (format t "10. Elipse~%")

    (format t "Volumenes: ~%")
    (format t "11. Cubo~%")
    (format t "12. Prisma Rectangular~%")
    (format t "13. Prisma Triangular~%")
    (format t "14. Cilindro~%")
    (format t "15. Esfera~%")
    (format t "16. Cono~%")
    (format t "17. Piramide Cuadranfular~%")
    (format t "18. Piramide Triangular~%")
    (format t "19. Prisma Hexagonal~%")
    (format t "20. Tronco de un Cono~%")

    (format t "Dame una opcion: ")
    (setq op (read))

    (case op
        (1 (format t "Ingrese el numero del lado: ")
           (setq lado (read))
           (format t "El area del cuadrado es ~A~%" (cuadrado lado))
        )

        (2 (format t "Ingrese la base: ")
           (setq base (read))
           (format t "Ingrese la altura: ")
           (setq altura (read))
           (format t "El area del rectangulo es ~A~%" (rectangulo base altura))
        )

        (3 (format t "Ingrese la base: ")
           (setq base (read))
           (format t "Ingrese la altura: ")
           (setq altura (read))
           (format t "El area del triangulo es ~A~%" (triangulo base altura))
        )

        (4 (format t "Ingrese el radio: ")
           (setq radio (read))
           (format t "El area del circulo es ~A~%" (circulo radio))
        )

        (5 (format t "Ingrese la diagonal mayor: ")
           (setq diaMa (read))
           (format t "Ingrese la diagonal menor: ")
           (setq diaMe (read))
           (format t "El area del rombo es ~A~%" (rombo diaMa diaMe))
        )
        
        (otherwise (format t "Opcion invalida~%"))
    )
)