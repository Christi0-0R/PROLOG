
; De la lista `(car '(1 2 3 4 5 6 7 8 9 10))` optener el 6, 8 y 10

(setq e1 '(1 2 3 4 5 6 7 8 9 10))

(car (cdr (cdr (cdr (cdr (cdr e1))))))
; 6   (5 cdr + car)
(car (cdr (cdr (cdr (cdr (cdr (cdr (cdr e1))))))))
; 8   (7 cdr + car)
(car (cdr (cdr (cdr (cdr (cdr (cdr (cdr (cdr (cdr e1))))))))))
; 10  (9 cdr + car)


; De la lista `(1 2 (3 4) (A B C D))` optener la D, C, 4, 2, A 

(setq e2 '(1 2 (3 4) (A B C D)))

(car (cdr (cdr (cdr (car (cdr (cdr (cdr e2)))))))) ; D
(car (cdr (cdr (car (cdr (cdr (cdr e2))))))) ; C
(car (cdr (car (cdr (cdr e2))))) ; 4
(car (cdr e2)) ; 2
(car (car (cdr (cdr (cdr e2))))) ; A


; De la lista `((A B C) (R (T X) (Z W)))` optener W, Z, T, R, X, A

(setq e3 '((A B C) (R (T X) (Z W))))

(car (cdr (car (cdr (cdr (car (cdr e3))))))) ; W
(car (car (cdr (cdr (car (cdr e3)))))) ; Z
(car (car (cdr (car (cdr e3))))) ; T
(car (car (cdr e3))) ; R
(car (cdr (car (cdr (car (cdr e3)))))) ; X
(car (car e3)) ; A


; De la lista `((((a b) (c d) (f g))))` optener A, B, C, D, F, G

(setq e4 '((((a b) (c d) (f g)))))

(car (car (car (car e4)))) ; A
(car (cdr (car (car (car e4))))) ; B
(car (car (cdr (car (car e4))))) ; C
(car (cdr (car (cdr (car (car e4)))))) ; D
(car (car (cdr (cdr (car (car e4)))))) ; F
(car (cdr (car (cdr (cdr (car (car e4))))))) ; G