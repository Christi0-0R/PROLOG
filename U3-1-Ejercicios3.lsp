; 1. Que calcule el sueldo que le corresponde al trabajador de una empresa que cobra 40,000 euros anuales. El programa debe realizar los cálculos en función de los siguientes criterios:

; - Si lleva más de 10 años en la empresa, se le aplica un aumento del 10%.
; - Si lleva menos de 10 años, pero más de 5, se le aplica un aumento del 7%.
; - Si lleva menos de 5 años, pero más de 3, se le aplica un aumento del 5%.
; - Si lleva menos de 3 años, se le aplica un aumento del 3%.


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


; 2. Hacer un algoritmo que tome el peso en libras de una cantidad de ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del peso. Además, nos informe la cantidad de litros de agua que necesitamos. Se sabe que con más de 30 libras la lavadora no funcionará, ya que es demasiado. Pero, si la ropa pesa 22 o más libras, el nivel será el máximo; si pesa 15 o más, será de alto; si pesa 8 o más, será un nivel medio o, de lo contrario, el nivel será mínimo.

; para calcular agua iguess
(defun calculo_agua(libras)
    (+ 30 (* libras 4))
)

; niveles :p
(defun definir_nivel(peso)
    (cond
        ((< peso 8) "Bajo")
        ((< peso 15) "Medio")
        ((< peso 22) "Alto")
        ( t "Maximo")
    )
)

; gud, se ocupa el peso de la ropa para la lavadora
(defun lavar()

    (format t "Ingrese el tamaño en libras de la ropa: ")
    ; para que se vea nice
    (setq peso (read))

    (format t "Calculando el nivel del lavado . . . ~%")

    (setq agua (calculo_agua peso))

    ; calculos
    (when (<= peso 30)
        (format t "Nivel de lavado: ~A~%" (definir_nivel peso))
        (format t "Cantidad de agua: ~A L~%" (calculo_agua peso))
    )

    (when (> peso 30)
        (format t "Peso excedido, el proceso no puede seguir, por favor, retire el exceso de ropa")
    )

)

; 3. Martha va a realizar su fiesta de quince años. Por lo cual ha invitado a una gran cantidad de personas. Pero tambien