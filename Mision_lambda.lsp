; 「」eh

; Material interceptado
; (nombre, edad, nivel, base, puntos)
(setq *agentes*
    '((ana      28 3 morelia    120)
      (beto     35 5 uruapan    340)
      (carla    22 1 morelia    45)
      (diego    41 4 zamora     210)
      (elena    30 2 patzcuaro  90)
      (fausto   26 5 morelia    400)
    )
)

(setq *alfabeto*
    '(a b c d e f g h i j k l m n o p q r s t u v w x y z)
)

; mensaje cifrado: una sublista por palabra
(setq *interceptado*
    '(
        (22 20 3 11 6 17 20)
        (16 11 24 7 14)
        (5 11 16 5 17)
        (8 23 7 20 3)
        (6 7)
        (15 17 20 7 14 11 3)
    )
)

(setq *bonos*
    '(10 0 5 20 15 0)
)



; Mapa de misiones
; 1 - El expediente desordenado: navegar registros con car / cdr y predecir salidas

; Clave     Expresion                                                   Prediccion
; a 	    (car (cdr (car *agentes*))) 	  	                        28
; b 	    (car (car (cdr *agentes*))) 	                            beto  	 
; c 	    (cdr (car (cdr (cdr *agentes*)))) 	                        22 1 morelia 45	 
; d 	    (car (cdr (cdr (cdr (car (cdr (cdr (cdr *agentes*)))))))) 	zamora
; e 	    (caddr (cadr *agentes*)) 	  	                            5
; f 	    (car (cdr (cdr (car (cdr (cdr (cdr (cdr *agentes*)))))))) 	


(setq lista ())
(defun nombre (ag)
    (if ag
        (cond
            (setq lista (append lista (list (car (car ag)))))
            (append lista (car (car ag)))
            (nombre (cdr ag))
        )
        (format t "Lista de nombres: ~A" lista)
    )
)










(defun edad (ag)
)

(defun nivel (ag)
)

(defun base   (ag) ...)
(defun puntos (ag) ...)