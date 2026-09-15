
; Funciones que calculan areas de figuras geometricas

; AREAS
(defun cuadrado()
    (format t "Ingrese el numero del lado: ")
    (setq lado (read))
    
    (setq resultado (* lado lado))
    
    (format t "El area del cuadrado es ~A~%" resultado)
) ; 1

(defun rectangulo()
    (format t "Ingrese la base: ")
    (setq base (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
    
    (setq resultado (* base altura))
    
    (format t "El area del rectangulo es ~A~%" resultado)
) ; 2

(defun triangulo()
    (format t "Ingrese la base: ")
    (setq base (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq mul (* base altura))
    (setq resultado (/ mul 2))

    (format t "El area del triangulo es ~A~%" resultado)
) ; 3

(defun circulo()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (setq resultado (* pi radio radio))

    (format t "El area del circulo es ~A~%" resultado)
) ; 4

(defun rombo()
    (format t "Ingrese la diagonal mayor: ")
    (setq diagonalMa (read))
    (format t "Ingrese la diagonal menor: ")
    (setq diagonalMe (read))
    
    (setq mul (* diagonalMa diagonalMe))
    (setq resultado (/ mul 2))

    (format t "El area del rombo es ~A~%" resultado)
) ; 5

(defun trapecio()
    (format t "Ingrese la altura: ")
    (setq altura (read))
    (format t "Ingrese la base Mayor: ")
    (setq baseMa (read))
    (format t "Ingrese la base Menor: ")
    (setq baseMe (read))

    (setq sum (+ baseMa baseMe))
    (setq mul (* sum altura))
    (setq resultado (/ mul 2))

    (format t "El area del trapecio es ~A~%" resultado)
) ; 6

(defun paralelogramo()
    (format t "Ingrese la base: ")
    (setq base (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq resultado (* base altura))

    (format t "El area del paralelogramo es ~A~%" resultado)
) ; 7

(defun pentagono()
    (format t "Ingrese el perimetro: ")
    (setq perimetro (read))
    (format t "Ingrese el apotema: ")
    (setq apotema (read))
    
    (setq mul (* perimetro apotema))
    (setq resultado (/ mul 2))

    (format t "El area del pentagono es ~A~%" resultado)
) ; 8

(defun hexagono()
    (format t "Ingrese el perimetro: ")
    (setq perimetro (read))
    (format t "Ingrese el apotema: ")
    (setq apotema (read))

    (setq mul (* perimetro apotema))
    (setq resultado (/ mul 2))

    (format t "El area del hexagono es ~A~%" resultado)
) ; 9

(defun elipse()
    (format t "Ingrese el semi eje mayor: ")
    (setq semiejeMa (read))
    (format t "Ingrese el semi eje menor: ")
    (setq semiejeMe (read))

    (setq resultado (* pi semiejeMa semiejeMe))

    (format t "El area de la elipse es ~A~%" resultado)
) ; 10


; VOLUMENES
(defun cubo()
    (format t "Ingrese el lado: ")
    (setq lado (read))
 
    (setq resultado (* lado lado lado))
 
    (format t "El volumen del cubo es ~A~%" resultado)
) ; 11
 
(defun prismaRectangular()
    (format t "Ingrese el largo: ")
    (setq largo (read))
    (format t "Ingrese el ancho: ")
    (setq ancho (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
 
    (setq resultado (* largo ancho altura))
 
    (format t "El volumen del prisma rectangular es ~A~%" resultado)
) ; 12
 
(defun prismaTriangular()
    (format t "Ingrese la base: ")
    (setq base (read))
    (format t "Ingrese la altura del triangulo: ")
    (setq altura (read))
    (format t "Ingrese la altura del prisma: ")
    (setq alturaPris (read))
 
    (setq mul (* base altura alturaPris))
    (setq resultado (/ mul 2))
 
    (format t "El volumen del prisma triangular es ~A~%" resultado)
) ; 13
 
(defun cilindro()
    (format t "Ingrese el radio: ")
    (setq radio (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
 
    (setq resultado (* pi radio radio altura))
 
    (format t "El volumen del cilindro es ~A~%" resultado)
) ; 14
 
(defun esfera()
    (format t "Ingrese el radio: ")
    (setq radio (read))
 
    (setq div (/ 4 3))
    (setq resultado (* div pi radio radio radio))
 
    (format t "El volumen de la esfera es ~A~%" resultado)
) ; 15
 
(defun cono()
    (format t "Ingrese el radio: ")
    (setq radio (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
 
    (setq div (/ 1 3))
    (setq resultado (* div pi radio radio altura))
 
    (format t "El volumen del cono es ~A~%" resultado)
) ; 16
 
(defun piramideCuad()
    (format t "Ingrese el lado: ")
    (setq lado (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
 
    (setq div (/ 1 3))
    (setq resultado (* div lado lado altura))
 
    (format t "El volumen de la piramide cuadrangular es ~A~%" resultado)
) ; 17
 
(defun piramideTri()
    (format t "Ingrese la base: ")
    (setq base (read))
    (format t "Ingrese la altura del triangulo: ")
    (setq altura (read))
    (format t "Ingrese la altura de la piramide: ")
    (setq alturaPiramide (read))
 
    (setq div (/ 1 3))
    (setq mul (* base altura))
    (setq area (/ mul 2))
    (setq resultado (* div area alturaPiramide))
 
    (format t "El volumen de la piramide triangular es ~A~%" resultado)
) ; 18
 
(defun prismaHexagonal()
    (format t "Ingrese el perimetro: ")
    (setq perimetro (read))
    (format t "Ingrese el apotema: ")
    (setq apotema (read))
    (format t "Ingrese la altura: ")
    (setq altura (read))
 
    (setq mul (* perimetro apotema))
    (setq area (/ mul 2))
    (setq resultado (* area altura))
 
    (format t "El volumen del prisma hexagonal es ~A~%" resultado)
) ; 19
 
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
)