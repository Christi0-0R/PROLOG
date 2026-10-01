; 1. Que calcule el sieldo que le corresponde al trabajador de una empresa que cobra 40,000 euros anuales, el programa debe realizar los calculos en funcino a de los siguente criterios:

; - Si lleva mas de 10 años en la empresa se le palica un aumento del 10%
; - Si lleva menos de 10 años pero mas que 5 se le aplica un aumento del 7%
; - Si lleva menos de 5 años pero mas que 3 se le aplica un aumento del 5%
; - Si lleva menos de 3 años se le aplica un aumento del 3%


; se ocupa saber los años del trabajador
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




; 2. Hacer un algoritmo que tome el peso en libras