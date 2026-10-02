
; EJERCICIO 1

(defun validar_edad_cine(?edad)

    (if (integerp ?edad)

        (if (> ?edad 0) ; them
            
            (if (< ?edad 120) ; them

                (if (> ?edad 18) ; them
                
                    (format t "B15/C (adultos)") ; them

                    (if (< ?edad 13) ; else

                        (format t "AA (infantil)") ; them

                        (format t "B (adolescentes)") ; else
                    )
                )

                (format t "Edad no realista") ; else
            )

            (format t "Edad negativa") ; else
        )

        (format t "La edad debe ser un entero") ; else
    )
)

; EJERCICIO 2

; uso de `when`

(defun avisar_password (?clave)

    (if (< (str-length ?clave) 8)
    
        (format t "Aviso: clave muy corta (< 8)")

    )

    (setq num (12345678))
    (setq pass ("password"))
    (if (or (= ?clave num) (= ?clave pass))
    
        (format t "Aviso: clave demasiado común")
    )

    (if (eq ?clave (lowcase ?clave))
    
        (format t "Aviso: no hay mayúsculas")
    )
    
)


; EJERCICIO 2
; Uso de `when`

(defun avisar-password (clave)

    (when (< (length clave) 8)
        (format t "Aviso: clave muy corta (< 8)~%")
    )

    (setq num "12345678")
    (setq pass "password")

    (when (or (string= clave num) (string= clave pass))
        (format t "Aviso: clave demasiado común~%")
    )

    (when (string= clave (string-downcase clave))
        (format t "Aviso: no hay mayúsculas~%")
    )
)

