
; Funciones auxiliares sdsd

(defun reportar-error (mensaje)
    (format t "Error: ~A~%" mensaje)
    nil
)

(defun reportar-ok (mensaje)
    (format t "~A~%" mensaje)
    t
)

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

; -----

; EJERCICIO 2
; Uso de 'when'

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

; -----

; EJERCICIO 3
; Uso de 'unless'

(defun procesar-solicitud (nombre correo edad acepta-terminos)

    (declare (ignore edad))

    (unless (and (stringp nombre) (> (length nombre) 0))

        (return-from procesar-solicitud
            (reportar-error "Falta nombre")
        )
    )

    (unless (and (stringp correo) (search "@" correo))

        (return-from procesar-solicitud
            (reportar-error "Correo invalido")
        )
    )

    (unless acepta-terminos

        (return-from procesar-solicitud
            (reportar-error "Debe aceptar terminos")
        )
    )

    (reportar-ok
        (format nil "Solicitud de ~a procesada" nombre)
    )

)

; -----

; EJERCICIO 4
; Uso de case

(defun permiso-por-rol (rol)

    (case rol

        (admin
            (reportar-ok "Puede crear usuarios y materias")
        )

        (docente
            (reportar-ok "Puede calificar y pasar lista")
        )

        (alumno
            (reportar-ok "Puede consultar calificaciones")
        )

        (padre
            (reportar-ok "Puede ver boleta de sus hijos")
        )

        (otherwise
            (reportar-error "Rol no reconocido")
        )
    )
)

; -----

; EJERCICIO 5
; Uso de cond

(defun semaforo-promedio (p)

    (unless (numberp p)

        (return-from semaforo-promedio
            (reportar-error "El promedio debe ser numerico")
        )
    )

    (unless (and (>= p 0) (<= p 100))

        (return-from semaforo-promedio
            (reportar-error "Promedio fuera de [0, 100]")
        )
    )

    (cond

        ((< p 60)
            (format t "ROJO: Reprobado~%")
        )

        ((< p 80)
            (format t "AMARILLO: Regular~%")
        )

        ((< p 90)
            (format t "VERDE: Bien~%")
        )

        (t
            (format t "ORO: Excelencia~%")
        )
    )

    t
)

; -----

; EJERCICIO 6
; Uso de and, or, not e if

(defun alta-usuario (user pass edad pais bloqueado)

    (if
        (and
            (stringp user)
            (> (length user) 4)

            (stringp pass)
            (>= (length pass) 8)

            (> edad 13)

            (or
                (string= pais "MX")
                (string= pais "CO")
                (string= pais "AR")
            )

            (not bloqueado)
        )

        (reportar-ok "Usuario dado de alta")

        (reportar-error "Alta rechazada")
    )
)

; -----

; EJERCICIO 6
; Uso de and, or, not e if

(defun alta-usuario (user pass edad pais bloqueado)

    (if
        (and
            (stringp user)
            (> (length user) 4)

            (stringp pass)
            (>= (length pass) 8)

            (> edad 13)

            (or
                (string= pais "MX")
                (string= pais "CO")
                (string= pais "AR")
            )

            (not bloqueado)
        )

        (reportar-ok "Usuario dado de alta")

        (reportar-error "Alta rechazada")
    )
)

; -----

; EJERCICIO 7
; Uso de typecase

(defun clasificar-triage (dato)

    (typecase dato

        (number

            (cond

                ((< dato 35)
                    (format t "HIPOTERMIA~%")
                )

                ((< dato 37.5)
                    (format t "NORMAL~%")
                )

                ((< dato 39)
                    (format t "FIEBRE~%")
                )

                (t
                    (format t "FIEBRE ALTA~%")
                )
            )
        )

        (string

            (cond

                ((string-equal dato "rojo")
                    (format t "TRIAGE ROJO~%")
                )

                ((string-equal dato "naranja")
                    (format t "TRIAGE NARANJA~%")
                )

                ((string-equal dato "verde")
                    (format t "TRIAGE VERDE~%")
                )

                (t
                    (reportar-error "Color no reconocido")
                )
            )
        )

        (list

            (if
                (and
                    (= (length dato) 2)
                    (stringp (first dato))
                    (numberp (second dato))
                )

                (progn
                    (format t "Paciente ~a: " (first dato))
                    (clasificar-triage (second dato))
                )

                (reportar-error "Datos del paciente invalidos")
            )
        )

        (t
            (reportar-error "Tipo no soportado")
        )
    )
)

; -----

; EJERCICIO 8
; Uso de case, unless y when

(defun cotizar-envio (codigo peso zona-riesgo)

    (let* ((servicio
                (case codigo
                    (est (list 80 20 "Estandar"))
                    (exp (list 160 10 "Express"))
                    (noc (list 220 5 "Nocturno"))
                    (int (list 450 15 "Internacional"))
                    (otherwise nil)
                )
            ))

        (unless servicio

            (return-from cotizar-envio
                (reportar-error "Codigo de servicio invalido")
            )
        )

        (let ((costo (first servicio))
              (max-peso (second servicio))
              (nombre (third servicio)))

            (unless
                (and (numberp peso)
                     (>= peso 0)
                     (<= peso max-peso))

                (return-from cotizar-envio
                    (reportar-error "Excede peso del servicio")
                )
            )

            (when zona-riesgo

                (incf costo 40)

                (format t "Recargo zona de riesgo +40~%")
            )

            (format t "Servicio: ~a~%" nombre)
            (format t "Costo final: ~a~%" costo)

            t
        )
    )
)

; -----

; EJERCICIO 9
; Validacion de registro completo

(defun validar-registro
    (usuario correo edad rol plan password acepta-terminos)

    (declare (ignore correo))

    ; [UNLESS] Terminos

    (unless acepta-terminos

        (return-from validar-registro
            (reportar-error "Debe aceptar terminos")
        )
    )

    ; [IF] Edad y plan

    (unless (integerp edad)

        (return-from validar-registro
            (reportar-error "La edad debe ser un entero")
        )
    )

    (if (< edad 13)

        (return-from validar-registro
            (reportar-error "Edad insuficiente")
        )

        (when (< edad 18)

            (unless (eq plan 'campus)

                (return-from validar-registro
                    (reportar-error "Menores requieren plan campus")
                )
            )
        )
    )

    ; [CASE] Rol

    (let ((prefijo
            (case rol
                (alumno "a/")
                (docente "d/")
                (admin "s/")
                (otherwise nil)
            )))

        (unless prefijo

            (return-from validar-registro
                (reportar-error "Rol no reconocido")
            )
        )

        ; [CASE] Plan

        (let ((cuota
                (case plan
                    (libre 0)
                    (pro 99)
                    (campus 0)
                    (otherwise nil)
                )))

            (unless
                (member plan '(libre pro campus))

                (return-from validar-registro
                    (reportar-error "Plan no reconocido")
                )
            )

            ; [WHEN] Administrador

            (when (eq rol 'admin)

                (format t
                    "Admin creado: revisa bitacora de auditoria~%"
                )
            )

            ; [WHEN] Avisos de password

            (when
                (or
                    (< (length password) 8)
                    (string= password "12345678")
                    (string= password "password")
                )

                (avisar-password password)
            )

            ; Resultado final

            (format t "Cuenta: ~a~a~%" prefijo usuario)
            (format t "Cuota mensual: ~a~%" cuota)

            t
        )
    )
)

; -----

; EJERCICIO 10
; Sistema de credito escolar

(defstruct solicitante
    nombre
    promedio
    materias-reprobadas
    beca
    monto
    historial
    semestre
)


; Validar los datos del solicitante

(defun validar-solicitante (s)

    (unless (stringp (solicitante-nombre s))
        (return-from validar-solicitante
            (reportar-error "Nombre invalido"))
    )

    (unless
        (and
            (realp (solicitante-promedio s))
            (<= 0 (solicitante-promedio s) 100)
        )

        (return-from validar-solicitante
            (reportar-error "Promedio invalido"))
    )

    (unless
        (and
            (integerp (solicitante-materias-reprobadas s))
            (>= (solicitante-materias-reprobadas s) 0)
        )

        (return-from validar-solicitante
            (reportar-error "Materias reprobadas invalidas"))
    )

    (unless
        (and
            (realp (solicitante-monto s))
            (> (solicitante-monto s) 0)
        )

        (return-from validar-solicitante
            (reportar-error "Monto invalido"))
    )

    (unless
        (and
            (integerp (solicitante-semestre s))
            (<= 1 (solicitante-semestre s) 10)
        )

        (return-from validar-solicitante
            (reportar-error "Semestre invalido"))
    )

    (unless
        (member (solicitante-historial s)
                '(limpio atrasos desconocido))

        (return-from validar-solicitante
            (reportar-error "Historial invalido"))
    )

    t
)


; Clasificar el monto solicitado

(defun categoria-monto (monto)

    (cond

        ((< monto 2000)
            'bajo
        )

        ((< monto 8000)
            'medio
        )

        (t
            'alto
        )
    )
)


; Penalizacion segun el historial

(defun penalizacion-historial (historial)

    (case historial

        (limpio 0)

        (atrasos 2)

        (desconocido 1)

        (otherwise 99)
    )
)


; Decidir si se aprueba el credito

(defun decidir-credito (s)

    (unless (validar-solicitante s)

        (return-from decidir-credito nil)
    )

    (let* ((promedio (solicitante-promedio s))
           (reprobadas (solicitante-materias-reprobadas s))
           (beca (solicitante-beca s))
           (monto (solicitante-monto s))
           (historial (solicitante-historial s))
           (categoria (categoria-monto monto))
           (penalizacion (penalizacion-historial historial))
           (decision nil))

        (cond

            ((or
                (> reprobadas 3)
                (< promedio 70)
                (>= penalizacion 99)
            )

                (setq decision 'rechazado)
            )

            ((and
                (>= promedio 85)
                (eq historial 'limpio)
                (or
                    (eq categoria 'bajo)
                    beca
                )
            )

                (setq decision 'aprobado)
            )

            (t
                (setq decision 'revision)
            )
        )

        ; Un historial desconocido nunca cuenta como limpio.
        ; Por ello, tener beca no basta para aprobar el credito.

        (when
            (and beca (not (eq decision 'rechazado)))

            (format t "Prioridad: solicitante becado~%")
        )

        (format t "~a: ~a~%"
            (solicitante-nombre s)
            (string-upcase (symbol-name decision))
        )

        decision
    )
)


; Procesar una ronda de solicitudes

(defun ronda-credito (solicitantes)

    (dolist (s solicitantes)

        (decidir-credito s)
    )

    t
)