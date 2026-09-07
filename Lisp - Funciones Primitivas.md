# 30 Funciones Primitivas y Fundamentales de Lisp

De estas 30 operaciones, no todas son primitivas en sentido estricto. Las primeras primitivas históricas de Lisp incluyen CAR, CDR, CONS, EQ y ATOM; las demás son funciones, operadores o formas especiales fundamentales que forman parte del lenguaje y permiten trabajar con estructuras de datos, control de flujo y operaciones comunes.

## Que es Lisp

Lisp (históricamente LISP) es una familia de lenguajes de programación de computadora de tipo multiparadigma con larga historia y una inconfundible y útil sintaxis homoicónica basada en la notación polaca.

Lisp fue creado originalmente como una notación matemática práctica para los programas de computadora, basada en el cálculo lambda de Alonzo Church. Se convirtió rápidamente en el lenguaje de programación favorito en la investigación de la inteligencia artificial (AI). Como lenguajes de programación precursor, Lisp fue pionero en muchas ideas en ciencias de la computación, incluyendo las estructuras de datos de árbol, el manejo de almacenamiento automático, tipos dinámicos, y el compilador auto contenido.

El acrónimo LISP significa «LISt Processor» (‘procesador de listas’). Las listas encadenadas son una de las estructuras de datos importantes de Lisp, y el código fuente de Lisp en sí mismo está compuesto de listas. Como resultado, los programas de Lisp pueden manipular código fuente de Lisp como si fueran simples datos, dando lugar a sistemas de macros que permiten a los programadores crear lenguajes de dominio específico embebidos en Lisp.

# Lista de Funciones Primitivas y Fundamentales

Son las operaciones básicas que ya vienen integradas en el lenguaje (no las define el programador), y a partir de ellas se pueden construir todas las demás funciones más complejas. En Lisp, las más "elementales" o fundamentales son: car, cdr, cons, eq y atom. Según un artículo académico, la versión más reducida de muLISP reconoce justamente estas cinco como las primitivas fundamentales o básicas: CAR, CDR, CONS, EQ, y ATOM.

## Selectores y constructores de lista
### 1. car

Es la función que extrae el primer elemento de una lista (o el primer puntero de una celda cons). Es una de las operaciones más antiguas y básicas de Lisp, ya que toda lista se construye internamente con estas celdas.

```lisp
(car '(1 2 3)) ; termina devolviendo 1

(car '(manzana pera uva)) ; devuelve manzana
```

### 2. cdr

Es la función complementaria a car: devuelve la lista completa menos el primer elemento, es decir, "la cola". Junto con car, permite recorrer una lista elemento por elemento.

```lisp
(cdr '(1 2 3)) ; devuelve (2 3), 2 y 3

(cdr '(manzana pera uva) ; (pera uva))
```

### 3. cons

Es la función "constructora": toma un elemento y una lista, y crea una nueva lista poniendo ese elemento al inicio. Es la operación inversa a car/cdr: mientras esas desarman, cons arma.

```lisp
(cons 21 '(22 23)) ; devuelve (21 22 23)

(cons 'rojo '(azul verde)) ; devuelve (rojo azul verde)
```

### 4. atom

Sirve para preguntar si algo es un átomo, es decir, un elemento simple que no es una lista (como un número, un símbolo o una cadena). Devuelve verdadero (T) o falso (NIL).

```lisp
(atom 5) ; termina devolviendo T, verdadero

(atom '(1 2 3)) ; dara NIL, falso
```

## Comparación de elementos
### 5. eq

Compara si dos objetos son idénticos según las reglas de identidad de la implementación de Lisp. Se utiliza principalmente para comparar símbolos y otros objetos cuya identidad puede determinarse de forma apropiada.

```list
(eq 'a 'a) ; devuelve T

(eq '(1 2) '(1 2)) ; devuelve NIL ya que son listas distintas en memoria, aunque se vean iguales
```

### 6. equal

Compara si dos estructuras tienen el mismo contenido, sin importar si son el mismo objeto en memoria. Es más flexible que eq y se usa para comparar listas o cadenas.

```lisp
(equal '(1 2) '(1 2)) ; devuelve T

(equal "hola" "hola") ; tambien devuelve T
```

### 7. null

Pregunta si una lista está vacía. En Lisp, la lista vacía () es equivalente a NIL, así que null revisa justamente eso.

```lisp
(null '()) ; devuelve T

(null '(1)) ; devuelve NIL
```

## Construcción y manipulación de listas
### 8. list

Crea una lista nueva a partir de los argumentos que le des, sin necesidad de comillas como con **quote.**

```lisp
(list 1 2 3) ; (1 2 3)

(list 'a '(b c) 5) ; (a (b c) 5)
```

### 9. append

Une dos o más listas en una sola, "pegando" sus elementos en orden (a diferencia de cons, que solo agrega un elemento al inicio).

```lisp
(append '(1 2) '(3 4)) ; (1 2 3 4)

(append '(a) '(b) '(c)) ; (a b c)
```

### 10. reverse

Devuelve una copia invertida del orden de los elementos de una lista.

```lisp
(reverse '(1 2 3)) ; (3 2 1)

(reverse '(a b c d)) ; (d c b a)
```

### 11. length

Devuelve el número de elementos que tiene una lista.

```lisp
(length '(1 2 3)) ; 3

(length '()) ; 0
```

### 12. member

Busca un elemento dentro de una lista; si lo encuentra, devuelve la sublista a partir de esa posición (no solo T o NIL).

```lisp
(member 2 '(1 2 3)) ; (2 3)

(member 5 '(1 2 3)) ; NIL
```

### 13. assoc

Funciona como una búsqueda en un diccionario: recibe una clave y una lista de pares (listas de dos elementos), y devuelve el par cuya primera posición coincide con la clave.

```lisp
(assoc 'b '((a 1) (b 2) (c 3))) ; (b 2)

(assoc 'z '((a 1) (b 2))) ; NIL
```

### 14. subst

Reemplaza todas las apariciones de un elemento por otro dentro de una lista, sin importar en qué posición estén.

```lisp
(subst 'x 'a '(a b a c)) ; (x b x c)

(subst 0 1 '(1 2 1 3)) ; (0 2 0 3)
```

### 15. remove

Elimina todas las apariciones de un elemento dado, dejando el resto de la lista intacto.

```lisp
(remove 2 '(1 2 3 2 4)) ; (1 3 4)

(remove 'a '(a b a c)) ; (b c)
```

## Funciones de orden superior
### 16. mapcar

Aplica una función a cada elemento de una lista (o de varias listas en paralelo) y devuelve una nueva lista con los resultados.

```lisp
(mapcar (lambda (x) (+ x 1)) '(1 2 3))

(mapcar #'+ '(1 2 3) '(10 20 30)) ; (11 22 33)
```

### 17. apply

Aplica una función a una lista de argumentos, tratándolos como si se los hubieras pasado uno por uno.

```lisp
(apply #'+ '(1 2 3)) ; 6

(apply #'list '(a b c)) ; (a b c)
```
### 18. funcall

Es parecido a apply, pero los argumentos se pasan directamente, no dentro de una lista. Se usa cuando ya tienes los valores sueltos.

```lisp
(funcall #'+ 1 2 3) ; 6

(funcall #'max 5 9 2) ; 9
```

### 19. quote

Por defecto, una lista que aparece en una posición evaluable se interpreta como una expresión: normalmente, el primer elemento indica la operación o función y los demás son sus argumentos. Sin embargo, algunas formas especiales tienen reglas de evaluación diferentes.

```lisp
(quote (1 2 3)) ; (1 2 3) (equivalente a '(1 2 3))

(quote a) ; a (sin quote, a se buscaría como variable)
```

### 20. setq

Asigna un valor a una variable, sin evaluar el nombre de la variable (solo evalúa el valor).

```lisp
(setq x 10) ; asigna 10 a x

(setq nombre "Ana") ; asigna la cadena "Ana" a nombre
```

### 21. let

Las expresiones que proporcionan los valores iniciales se evalúan antes de establecer las variables locales, por lo que una variable definida en el mismo let no puede utilizar directamente a otra variable del mismo let.

```lisp
(let ((x 5) (y 10)) (+ x y)) ; 15

(let ((a 1) (b 2)) (list a b)) ; (1 2)
```

### 22. let*

Igual que let, pero las asignaciones son secuenciales: cada variable puede usar el valor de las anteriores.

```lisp
(let* ((x 5) (y (* x 2))) y) ; 10

(let* ((a 1) (b (+ a 1)) (c (+ b 1))) (list a b c)) ; (1 2 3)
```
### 23. if

Es el condicional simple: evalúa una condición y devuelve un valor si es verdadera, u otro si es falsa.

```lisp
(if (> 5 3) 'si 'no) ; si

(if (null '()) 'vacia 'llena) ; vacia
```

### 24. cond

Es un condicional múltiple: revisa una lista de condiciones en orden y ejecuta la primera que resulte verdadera (como una cadena de "si... si no... si no...").

```lisp
(cond ((> 3 5) 'a) ((< 3 5) 'b) (t 'c)) ; b

(cond ((= 1 2) 'igual) (t 'distinto)) ; distinto
```

### 25. lambda

Define una función anónima, es decir, sin necesidad de darle un nombre. Viene directamente del cálculo lambda de Alonzo Church.

```lisp
((lambda (x) (* x x)) 4) ; 16

(mapcar (lambda (x) (+ x 1)) '(1 2 3)) ; (2 3 4)
```

### 26. and

Devuelve verdadero solo si todos los argumentos son verdaderos; si alguno es falso, devuelve NIL de inmediato.

```lisp
(and t t t) ; T

(and t nil t) ; NIL
```
### 27. or

Devuelve verdadero si al menos uno de los argumentos es verdadero.

```lisp
(or nil nil t) ; T

(or nil nil nil) ; NIL
```

### 28. not

Invierte un valor lógico: si es verdadero lo vuelve falso, y viceversa.

```lisp
(not nil) ; T

(not t) ; NIL
```

### 29. +

Suma dos o más números.

```lisp
(+ 2 3) ; 5

(+ 1 2 3 4) ; 10
```
### 30. -

Resta números; con un solo argumento devuelve su negativo.

```lisp
(- 5 2) ; 3

(- 10 3 2) ; 5
```

## Regla base: Lisp evalúa todo por defecto

Cuando escribes algo entre paréntesis, Lisp asume que es una llamada a función: toma el primer elemento como el nombre de la función y el resto como argumentos.

```lisp
(+ 1 2) ; Lisp ve esto como "llama a la función con 1 y 2" que da 3

(1 2 3) ; Lisp intentaría llamar a la función "1" con argumentos 2 y 3, que terminaría retornando error
```

El problema es que a veces no quieres que se evalúe, sino que quieres tratar (1 2 3) como un simple dato, una lista literal. Ahí es donde entra el `'`:

```lisp
'(1 2 3) ; De esta forma Lisp no lo evalua, sino que lo toma como un dato: (1 2 3)
```

### ¿Cuándo sí necesitas ponerlo?

Cuando le pasas una lista o un símbolo como dato, no como código a ejecutar:

```lisp
'(1 2 3) ; lista literal, sin ' intentaría ejecutar "1" como función

'a ; el símbolo "a" tal cual, sin ' buscaría el valor de la variable a

(car '(a b c)) ; necesitas quote aquí para que (a b c) no se evalúe como código
```

### ¿Cuándo no lo necesitas?

1. Con números, porque se autoevalúan — un número siempre "vale por sí mismo", no hay nada que evaluar:

```lisp
(+ 1 2) ; no necesitas '1 ni '2, los números no se evalúan a otra cosa
```

2. Con cadenas de texto, pasa lo mismo:

```lisp
(list "hola" "mundo") ; no necesitas comillas extra, un string ya es un dato
```

3. Cuando el símbolo va como PRIMER elemento de una lista, es decir, el nombre de la función — ahí Lisp espera un nombre de función, no lo evalúa como variable:

```lisp
(car '(1 2 3)) ; "car" no lleva ' porque es el nombre de la función a llamar
```

4. Dentro de let, setq, defun, los nombres de variables/funciones tampoco llevan quote, porque esas funciones especiales ya saben que ese argumento es un nombre y no lo evalúan:

```lisp
(setq x 10) ; "x" no lleva ' — setq ya sabe que el primer argumento es un nombre

(let ((x 5)) x) ; igual aquí, "x" no se evalúa como si fuera código
```

5. Cuando ya estás DENTRO de algo quoteado, todo lo de adentro queda protegido automáticamente, no hace falta repetir el ' en cada elemento:

```lisp
'(a b c) ; ya con un solo ' toda la lista completa queda "congelada", no se necesita escribir '(a 'b 'c)
```