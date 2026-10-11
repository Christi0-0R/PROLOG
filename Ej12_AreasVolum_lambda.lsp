
; Funciones que calculan areas de figuras geometricas
; AHORA CON LAMBDA JSDHCJDHFS



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

    ; CASE

    (case op
        
        ; AREAS
        (1 (format t "El area del cuadrado es ~A~%"
            (funcall (lambda (lado) (* lado lado)) 10)))

        (2 (format t "El area del rectangulo es ~A~%"
            (funcall (lambda (base altura) (* base altura)) 10 5)))

        (3 (format t "El area del triangulo es ~A~%"
            (funcall (lambda (base altura) (/ (* base altura) 2)) 10 5)))

        (4 (format t "El area del circulo es ~A~%"
            (funcall (lambda (radio) (* pi radio radio)) 5)))

        (5 (format t "El area del rombo es ~A~%"
            (funcall (lambda (dMayor dMenor) (/ (* dMayor dMenor) 2)) 10 6)))

        (6 (format t "El area del trapecio es ~A~%"
            (funcall (lambda (baseMa baseMe altura)
                        (/ (* (+ baseMa baseMe) altura) 2))
                     10 6 4)))

        (7 (format t "El area del paralelogramo es ~A~%"
            (funcall (lambda (base altura) (* base altura)) 8 5)))

        (8 (format t "El area del pentagono es ~A~%"
            (funcall (lambda (perimetro apotema) (/ (* perimetro apotema) 2)) 30 4)))

        (9 (format t "El area del hexagono es ~A~%"
            (funcall (lambda (perimetro apotema) (/ (* perimetro apotema) 2)) 36 5)))

        (10 (format t "El area de la elipse es ~A~%"
            (funcall (lambda (semiMa semiMe) (* pi semiMa semiMe)) 6 4)))

        ; VOLUMENES
        (11 (format t "El volumen del cubo es ~A~%"
            (funcall (lambda (lado) (* lado lado lado)) 4)))

        (12 (format t "El volumen del prisma rectangular es ~A~%"
            (funcall (lambda (largo ancho altura) (* largo ancho altura)) 6 4 3)))

        (13 (format t "El volumen del prisma triangular es ~A~%"
            (funcall (lambda (base altura alturaPrisma)
                        (/ (* base altura alturaPrisma) 2))
                     6 4 10)))

        (14 (format t "El volumen del cilindro es ~A~%"
            (funcall (lambda (radio altura) (* pi radio radio altura)) 3 10)))

        (15 (format t "El volumen de la esfera es ~A~%"
            (funcall (lambda (radio) (* (/ 4 3) pi radio radio radio)) 5)))

        (16 (format t "El volumen del cono es ~A~%"
            (funcall (lambda (radio altura) (* (/ 1 3) pi radio radio altura)) 3 9)))

        (17 (format t "El volumen de la piramide cuadrangular es ~A~%"
            (funcall (lambda (lado altura) (* (/ 1 3) lado lado altura)) 6 10)))

        (18 (format t "El volumen de la piramide triangular es ~A~%"
            (funcall (lambda (base altura alturaPiramide)
                        (* (/ 1 3) (/ (* base altura) 2) alturaPiramide))
                     6 4 9)))

        (19 (format t "El volumen del prisma hexagonal es ~A~%"
            (funcall (lambda (perimetro apotema altura)
                        (* (/ (* perimetro apotema) 2) altura))
                     36 5 10)))

        (20 (format t "El volumen del tronco de cono es ~A~%"
            (funcall (lambda (radioMa radioMe altura)
                        (* (/ (* pi altura) 3)
                           (+ (* radioMa radioMa)
                              (* radioMa radioMe)
                              (* radioMe radioMe))))
                     5 3 8)))

        (otherwise (format t "Opcion invalida~%"))

    )
)