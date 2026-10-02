;;;; ===================================================================
;;;; Taller: if / when / unless / case / cond / typecase / and-or-not
;;;; ===================================================================

(defparameter *errores* 0)
(defparameter *avisos* 0)

(defun reportar-error (msg)
  (incf *errores*)
  (format t "[ERROR] ~A~%" msg)
  nil)

(defun reportar-ok (msg)
  (format t "[OK] ~A~%" msg)
  t)


;;; ===================================================================
;;; Ejercicio 1 -- if: edad para cine
;;; ===================================================================

(defun validar-edad-cine (edad)
  (if (not (integerp edad))
      (reportar-error "La edad debe ser un entero")
      (if (< edad 0)
          (reportar-error "Edad negativa")
          (if (> edad 120)
              (reportar-error "Edad no realista")
              (if (< edad 13)
                  (reportar-ok "AA (infantil)")
                  (if (< edad 18)
                      (reportar-ok "B (adolescentes)")
                      (reportar-ok "B15/C (adultos)")))))))

;; (validar-edad-cine 10)     ; AA
;; (validar-edad-cine 16)     ; B
;; (validar-edad-cine 21)     ; adultos
;; (validar-edad-cine -3)     ; error
;; (validar-edad-cine 200)    ; error
;; (validar-edad-cine 17.5)   ; error (no entero)


;;; ===================================================================
;;; Ejercicio 2 -- when: avisos, no bloqueos
;;; ===================================================================

(defun avisar-password (clave)
  (when (< (length clave) 8)
    (format t "Aviso: clave corta (< 8)~%")
    (incf *avisos*))
  (when (or (string= clave "12345678") (string= clave "password"))
    (format t "Aviso: clave demasiado común~%")
    (incf *avisos*))
  (when (and (plusp (length clave))
             (string= clave (string-downcase clave)))
    (format t "Aviso: no hay mayúsculas~%")
    (incf *avisos*))
  t)

;; (avisar-password "abc")
;; (avisar-password "password")
;; (avisar-password "Secreta99")


;;; ===================================================================
;;; Ejercicio 3 -- unless: guardianes con return-from
;;; ===================================================================

(defun procesar-solicitud (nombre correo edad acepta-terminos)
  (declare (ignore edad))
  (unless (and (stringp nombre) (> (length nombre) 0))
    (return-from procesar-solicitud (reportar-error "Falta nombre")))
  (unless (and (stringp correo) (search "@" correo))
    (return-from procesar-solicitud (reportar-error "Correo inválido")))
  (unless acepta-terminos
    (return-from procesar-solicitud (reportar-error "Debe aceptar términos")))
  (reportar-ok (format nil "Solicitud de ~A procesada" nombre)))

;; (procesar-solicitud "" "a@b.com" 20 t)
;; (procesar-solicitud "Ana" "ana.b.com" 20 t)
;; (procesar-solicitud "Ana" "ana@b.com" 20 nil)
;; (procesar-solicitud "Ana" "ana@b.com" 20 t)


;;; ===================================================================
;;; Ejercicio 4 -- case: roles (símbolos, compara con EQL)
;;; ===================================================================

(defun permiso-por-rol (rol)
  (case rol
    (admin   (reportar-ok "Puede crear usuarios y materias"))
    (docente (reportar-ok "Puede calificar y pasar lista"))
    (alumno  (reportar-ok "Puede consultar calificaciones"))
    (padre   (reportar-ok "Puede ver boleta de sus hijos"))
    (otherwise (reportar-error "Rol no reconocido"))))

;; Nota: "admin" (string) NUNCA es eql al símbolo ADMIN, cae en otherwise.

;; (permiso-por-rol 'admin)
;; (permiso-por-rol 'docente)
;; (permiso-por-rol 'invitado)
;; (permiso-por-rol "admin")   ; debe fallar


;;; ===================================================================
;;; Ejercicio 5 -- cond: semáforo de promedio (rangos)
;;; ===================================================================

(defun semaforo-promedio (p)
  (unless (numberp p)
    (return-from semaforo-promedio (reportar-error "El promedio debe ser un número")))
  (unless (<= 0 p 100)
    (return-from semaforo-promedio (reportar-error "Promedio fuera de [0, 100]")))
  (cond
    ((< p 60) (reportar-ok "ROJO - Reprobado"))
    ((< p 80) (reportar-ok "AMARILLO - Regular"))
    ((< p 90) (reportar-ok "VERDE - Bien"))
    (t        (reportar-ok "ORO - Excelencia"))))

;; (semaforo-promedio 45)
;; (semaforo-promedio 75)
;; (semaforo-promedio 88)
;; (semaforo-promedio 97)
;; (semaforo-promedio 110)
;; (semaforo-promedio "nueve")


;;; ===================================================================
;;; Ejercicio 6 -- and / or / not: alta de usuario
;;; OJO: con las reglas ">" tal cual las pide el enunciado, "ana"(3) y
;;; "secreto1"(8) NO pasan (>4 y >8 son estrictos). Si tu profe quería
;;; que ese caso diera "ok", cambia los > por >= abajo.
;;; ===================================================================

(defun alta-usuario (user pass edad pais bloqueado)
  (if (and (stringp user) (> (length user) 4)
           (stringp pass) (> (length pass) 8)
           (> edad 13)
           (or (string= pais "MX") (string= pais "CO") (string= pais "AR"))
           (not bloqueado))
      (reportar-ok "Usuario dado de alta")
      (reportar-error "Alta rechazada")))

;; Extra opcional: cuál condición falló, sin rechazar de nuevo
(defun diagnosticar-alta (user pass edad pais bloqueado)
  (when (not (and (stringp user) (> (length user) 4)))
    (format t "  -> falla: usuario~%"))
  (when (not (and (stringp pass) (> (length pass) 8)))
    (format t "  -> falla: password~%"))
  (when (not (> edad 13))
    (format t "  -> falla: edad~%"))
  (when (not (or (string= pais "MX") (string= pais "CO") (string= pais "AR")))
    (format t "  -> falla: pais~%"))
  (when bloqueado
    (format t "  -> falla: bloqueado~%")))

;; (alta-usuario "ana" "secreto1" 20 "MX" nil)
;; (alta-usuario "ana" "secreto1" 20 "US" nil)   ; país
;; (alta-usuario "ana" "secreto1" 20 "MX" t)     ; bloqueado
;; (alta-usuario "an"  "secreto1" 20 "MX" nil)   ; user corto


;;; ===================================================================
;;; Ejercicio 7 -- typecase: triage según tipo de dato
;;; ===================================================================

(defun clasificar-triage (dato)
  (typecase dato
    (number
     (cond
       ((< dato 35)          (reportar-ok "HIPOTERMIA"))
       ((< 35 dato 37.5)     (reportar-ok "NORMAL"))
       ((< 37.5 dato 39)     (reportar-ok "FIEBRE"))
       (t                    (reportar-ok "FIEBRE ALTA"))))
    (string
     (cond
       ((string-equal dato "rojo")    (reportar-ok "ROJO"))
       ((string-equal dato "naranja") (reportar-ok "NARANJA"))
       ((string-equal dato "verde")   (reportar-ok "VERDE"))
       (t (reportar-error "Color no reconocido"))))
    (list
     (let ((nombre (first dato))
           (temp   (second dato)))
       (cond
         ((< temp 35)      (reportar-ok (format nil "~A: HIPOTERMIA" nombre)))
         ((< 35 temp 37.5) (reportar-ok (format nil "~A: NORMAL" nombre)))
         ((< 37.5 temp 39) (reportar-ok (format nil "~A: FIEBRE" nombre)))
         (t                (reportar-ok (format nil "~A: FIEBRE ALTA" nombre))))))
    (t (reportar-error "Tipo no soportado"))))

;; (clasificar-triage 36.8)
;; (clasificar-triage 39.5)
;; (clasificar-triage "rojo")
;; (clasificar-triage '("Mia" 38.2))
;; (clasificar-triage 'paciente)


;;; ===================================================================
;;; Ejercicio 8 -- case de códigos + when de recargo (paquetería)
;;; ===================================================================

(defun cotizar-envio (codigo peso zona-riesgo)
  (let (base max nombre)
    (case codigo
      (est (setq base 80  max 20 nombre "Estándar"))
      (exp (setq base 160 max 10 nombre "Express"))
      (noc (setq base 220 max 5  nombre "Nocturno"))
      (int (setq base 450 max 15 nombre "Internacional"))
      (otherwise
       (return-from cotizar-envio (reportar-error "Código de servicio inválido"))))
    (unless (< peso max)
      (return-from cotizar-envio (reportar-error "Excede peso del servicio")))
    (when zona-riesgo
      (setq base (+ base 40))
      (format t "Recargo zona de riesgo +40~%"))
    (format t "Costo final (~A): ~A~%" nombre base)
    t))

;; (cotizar-envio 'est 3.0 nil)
;; (cotizar-envio 'exp 12.0 nil)   ; excede peso
;; (cotizar-envio 'noc 2.0 t)      ; recargo
;; (cotizar-envio 'xxx 1.0 nil)    ; código inválido


;;; ===================================================================
;;; Ejercicio 9 -- formulario completo: if + when + unless + case
;;; ===================================================================

(defun validar-registro (usuario correo edad rol plan password acepta-terminos)
  (declare (ignore correo))

  ;; [UNLESS] terminos
  (unless acepta-terminos
    (return-from validar-registro (reportar-error "Debe aceptar términos")))

  ;; [IF] edad / plan
  (if (< edad 13)
      (return-from validar-registro (reportar-error "Menor de 13 no puede registrarse"))
      (when (< edad 18)
        (unless (eq plan 'campus)
          (return-from validar-registro
            (reportar-error "Menor de edad requiere plan campus (cuenta tutelada)")))))

  ;; [CASE] rol
  (let ((prefijo (case rol
                   (alumno  "a/")
                   (docente "d/")
                   (admin   "s/")
                   (otherwise nil))))
    (unless prefijo
      (return-from validar-registro (reportar-error "Rol inválido")))

    ;; [CASE] plan
    (let ((cuota (case plan
                   (libre  0)
                   (pro    99)
                   (campus 0)
                   (otherwise nil))))
      (unless cuota
        (return-from validar-registro (reportar-error "Plan inválido")))

      ;; [WHEN] admin
      (when (eq rol 'admin)
        (format t "Aviso: Admin creado, revisa bitácora de auditoría~%"))

      ;; [WHEN] password
      (avisar-password password)

      (format t "Cuenta creada: ~A~A, cuota mensual: $~A~%" prefijo usuario cuota)
      t)))

;; (validar-registro "lu"   "l@x.com" 20 'alumno 'pro    "Secreta99" t)
;; (validar-registro "pepe" "p@x.com" 15 'alumno 'pro    "Secreta99" t)
;; (validar-registro "nina" "n@x.com" 16 'alumno 'campus "Secreta99" t)
;; (validar-registro "root" "r@x.com" 30 'admin  'libre  "Secreta99" t)
;; (validar-registro "x"    "x@x.com" 22 'alumno 'pro    "Secreta99" nil)


;;; ===================================================================
;;; Ejercicio 10 -- mini sistema: crédito escolar
;;; ===================================================================

(defstruct solicitante
  nombre
  promedio
  materias-reprobadas
  beca
  monto
  historial
  semestre)

(defun validar-solicitante (s)
  (unless (and (numberp (solicitante-promedio s))
               (<= 0 (solicitante-promedio s) 100))
    (return-from validar-solicitante (reportar-error "Promedio inválido")))
  (unless (and (numberp (solicitante-monto s)) (> (solicitante-monto s) 0))
    (return-from validar-solicitante (reportar-error "Monto inválido")))
  (unless (<= 1 (solicitante-semestre s) 10)
    (return-from validar-solicitante (reportar-error "Semestre inválido")))
  t)

(defun categoria-monto (monto)
  (cond
    ((< monto 2000) 'bajo)
    ((< monto 8000) 'medio)
    (t 'alto)))

(defun penalizacion-historial (historial)
  (case historial
    (limpio      0)
    (atrasos     2)
    (desconocido 1)
    (otherwise   99)))

;; Política: 'desconocido' NUNCA cuenta como historial limpio para
;; aprobación automática, aunque su penalización sea baja; solo abre
;; la puerta a REVISIÓN, nunca a APROBADO directo.
(defun decidir-credito (s)
  (unless (validar-solicitante s)
    (return-from decidir-credito nil))
  (let* ((reprobadas   (solicitante-materias-reprobadas s))
         (promedio     (solicitante-promedio s))
         (penalizacion (penalizacion-historial (solicitante-historial s)))
         (categoria    (categoria-monto (solicitante-monto s)))
         (beca         (solicitante-beca s))
         (historial    (solicitante-historial s))
         (veredicto
           (cond
             ((or (> reprobadas 3) (< promedio 70) (>= penalizacion 99))
              'rechazado)
             ((and (>= promedio 85) (eq historial 'limpio)
                   (or (eq categoria 'bajo) beca))
              'aprobado)
             (t 'revision))))
    (when (and beca (not (eq veredicto 'rechazado)))
      (format t "Prioridad: solicitante becado~%"))
    (format t "~A -> ~A~%" (solicitante-nombre s) (string-upcase (symbol-name veredicto)))
    veredicto))

(defun ronda-credito (lista)
  (dolist (s lista)
    (decidir-credito s)))

(defparameter *ronda*
  (list
   (make-solicitante :nombre "Ana"  :promedio 92 :materias-reprobadas 0
                     :beca t   :monto 1500 :historial 'limpio      :semestre 4)
   (make-solicitante :nombre "Beto" :promedio 68 :materias-reprobadas 1
                     :beca nil :monto 3000 :historial 'limpio      :semestre 3)
   (make-solicitante :nombre "Cris" :promedio 80 :materias-reprobadas 0
                     :beca nil :monto 9000 :historial 'atrasos     :semestre 6)
   (make-solicitante :nombre "Dani" :promedio 88 :materias-reprobadas 0
                     :beca nil :monto 4000 :historial 'limpio      :semestre 2)
   (make-solicitante :nombre "Eva"  :promedio 90 :materias-reprobadas 0
                     :beca t   :monto 5000 :historial 'desconocido :semestre 8)))

;; (ronda-credito *ronda*)