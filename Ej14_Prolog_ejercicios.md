# Ejercicios de relaciones


## 1. Primer Ejercicio ═════════════════════════════════════

Variables de individuo, constantes de individuo, cuantificador,
propiedades, relaciones, dominio del discurso

- La Tierra es un planeta.
```
Constante de individuo: tierra
Propiedades: es un planeta
Dominio del discurso: Sistema Solar
```

- La Luna no es un planeta.
```
Constante de individuo: luna
Propiedades: no es un planeta
Dominio del discurso: Sistema Solar
```

- La Luna es un satélite.
```
Constante de individuo: luna
Propiedades: es un satelite
Dominio del discurso: Sistema Solar
```

- La Tierra gira alrededor del Sol.
```
Constantes de individuos: tierra, sol
Propiedades: gira alrededor
Relacion: la tierra gira alrededor del sol
Dominio del discurso: Sistema Solar
```

- Todo planeta es un satélite.
```
Variables de individuo: X es un planeta, y es un satelite
Cuantificador: universal ∀
Propiedades, es un planeta, es un satelite
Relacion: si es un planeta, es un satelite
Dominio del discurso: Sistema Solar
```

- Todo planeta gira alrededor del Sol.
```
Variable de individuo: X es un planeta
Constante de individuo: sol
Cuantificador: universal ∀
Propiedades: ser un planeta, girar alrededor
Relacion: todos los planetas giran alrededor del sol
Dominio del discurso: Sistema Solar
```

- Algún planeta gira alrededor de la Luna.
```
Variable de individuo: X es un planeta
Constante de individuo: luna
Cuantificador: existencial ∃
Propiedades: ser un planeta, girar alrededor
Relacion: algun planeta gira alrededor de la luna
Dominio del discurso: Sistema Solar
```

- Hay por lo menos un satélite.
```
Variable de individuo: X es un satelite
Cuantificador: existencial ∃
Dominio del discurso: Sistema Solar
```

- Todos los perros del vecindario muerden a algún cartero.
```
Variables de individuo: X es un perro, Y es un cartero
Cuantificador: universal ∀, existencial ∃
Propiedades: ser perro del vecino, ser un cartero
Relacion: los perror mueren a un cartero
Dominio del discurdo: Animales y personas del vecindario
```

- Hay un cartero al que lo muerden todos los perros.
```
Variables de individuo: X es un cartero, Y es un perro
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un cartero, ser un perro
Relaciones: a un cartero los muerden todos los perros
Dominio del discurso: Animales y personas del vecindario
```

- Todos los carteros son mordidos por algún perro.
```
Variables de individuo: X es un cartero, Y es un perro
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un cartero, ser un perro
Relaciones: los carteros son mordidos por un perro
Dominio del discurso: Animales y personas del vecindario
```

- Hay un perro que muerde a todos los carteros.
```
Variables de individuo: X es un perro, Y es un cartero
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un perro, ser un cartero
Relaciones: un perro muerde todos los carteros
Dominio del discurso: Animales y personas del vecindario
```

- Todos los perros que asustan a algún cartero, lo muerden.
```
Variables de individuo: X es un perro, Y es un cartero
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un perro, ser un cartero
Relaciones: los perros asustan a un cartero, los perros muerden a un cartero
Dominio del discurso: Animales y personas del vecindario
```

- Hay un perro que muerde a todos los perros que muerden a algún cartero.
```
Variables de individuo: X es un perro, Y es un perro, Z es un cartero
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un perro, ser un cartero
Relaciones: un perro muerde a un perro, un perro muerde a un cartero
Dominio del discurso: Animales y personas del vecindario
```

- Hay un solo perro que se muerde a sí mismo.
```
Variables de individuo: X es un perro
Propiedades: ser un perro
Relaciones: se muerde a si mismo
Dominio del discurso: Animales y personas del vecindario
```


## 2. Segundo Ejercicio ═════════════════════════════════════

- La Biblioteca Nacional tiene el libro "Don Quijote de la Mancha".
```
Constantes de individuo: Biblioteca Nacional, Don Quijote de la Mancha
Propiedades: ser una biblioteca, ser un libro
Relaciones: la biblioteca tiene un libro
Dominio del discurso: Libros y Bibliotecas
```

- Todos los libros en la Biblioteca Nacional están catalogados.
```
Variables de individuo: X es un libro
Constantes de individuo: Biblioteca Nacional
Cuantificador: universal ∀
Propiedades: ser un libro, ser una biblioteca, estar catalogado
Relaciones: los libros estan catalogados en la biblioteca
Dominio del discurso: Libros y Bibliotecas
```

- Existen libros que están en más de una biblioteca.
```
Variables de individuo: X es un libro, Y es una biblioteca
Cuantificador: existencial ∃
Propiedades:ser un libro, ser una biblioteca
Relaciones: estar en una biblioteca, ser distinta una biblioteca de otra
Dominio del discurso: Libros y Bibliotecas
```

- Si un libro es raro, entonces no se puede prestar.
```
Variables de individuo: X es un libro
Cuantificador: universal ∀
Propiedades: ser un libro, ser raro, no poder prestarse
Relaciones: un libro es raro
Dominio del discurso: Libros y Bibliotecas
```

- La Biblioteca Central tiene más de 10,000 libros.
```
Variables de individuo: X es un libro
Constantes de individuo: Biblioteca Central
Cuantificador: existencial ∃
Propiedades: ser un libro, ser una biblioteca
Relaciones: uan biblioteca tiene libros
Dominio del discurso: Libros y Bibliotecas
```

- Todos los autores tienen al menos un libro en una biblioteca.
```
Variables de individuo: X es un autor, Y es un libro, Z es una biblioteca
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un autor, ser un libro, ser una biblioteca
Relaciones: o, estar un libro en una biblioteca
Dominio del discurso: Libros y Bibliotecas
```

- Existe un autor que tiene más de 5 libros publicados.
```
Variables de individuo: X es un autor, Y es un libro
Cuantificador: existencial ∃
Propiedades: ser un autor, ser un libro
Relaciones: un autor tiene libros publicados
Dominio del discurso: Libros y Bibliotecas
```

- No todos los libros de la biblioteca están en buen estado.
```
Variables de individuo: X  es un libro, Y es una bibilioteca
Cuantificador: existencial ∃
Propiedades: ser un libro, ser una biiblioteca, estar en buen esatdo
Relaciones: un libro esta en la biblioteca
Dominio del discurso: Libros y Bibliotecas
```

- Si un libro está en buen estado, puede ser prestado.
```
Variables de individuo: X es un libro
Propiedades: ser un libro, ser prestado
Relaciones:si esta en buen estado, un libro es prestado
Dominio del discurso: Libros y Bibliotecas
```

- Todos los usuarios registrados pueden tomar prestado un libro.
```
Variables de individuo: X es un usuario, Y es un libro
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un usuario, ser un libro
Relaciones: poder tomar prestado un libro
Dominio del discurso: Libros y Bibliotecas
```

- Existen libros que solo se pueden consultar en la biblioteca.
```
Variables de individuo: X es un libro, Y es una biblioteca
Cuantificador: existencial ∃
Propiedades: ser un libro, ser un biblioteca
Relaciones: poder consultarse en la biblioteca, poder prestarse
Dominio del discurso: Libros y Bibliotecas
```

- Todo libro prestado debe ser devuelto en 15 días.
```
Variables de individuo: X es un libro
Cuantificador: universal ∀
Propiedades: ser un libro, devuelto en 15 dias
Relaciones: ser prestado a un usuario, deber devolverse dentro de un plazo
Dominio del discurso: Libros y Bibliotecas
```

- Hay un libro que nadie ha pedido en préstamo.
```
Variables de individuo: X es un libro
Propiedades: ser un libro, no ser pedido
Relaciones: un libro no ha sido prestado
Dominio del discurso: Libros y Bibliotecas
```

- Si un usuario tiene una multa, no puede pedir un libro prestado.
```
Variables de individuo: X es un usuario, Y es un libro
Propiedades: ser un usuario, ser un libro
Relaciones: si tienes una multa, no puedes pedir un libro
Dominio del discurso: Libros y Bibliotecas
```

- Todos los libros escritos por un mismo autor están en la misma sección.
```
Variables de individuo: X es un libro, Y es un autor
Cuantificador: universal ∀
Propiedades: ser un libro, ser un escritor
Relaciones: escribir un libro, pertenecer a la misma sección
Dominio del discurso: Libros y Bibliotecas
```

- Existe un libro que tiene más de un ejemplar en la biblioteca.
```
Variables de individuo: X es un libro, Y es una bobolioteca
Cuantificador: existencial ∃
Propiedades: ser un libro, ser unas biblioteca
Relaciones: pertenecer un ejemplar a un libro, estar en una biblioteca
Dominio del discurso: Libros y Bibliotecas
```

- Todo usuario con más de tres préstamos debe devolver uno para pedir otro.
```
Variables de individuo: X es un usuario, Y es un libro
Cuantificador: universal ∀
Propiedades: ser un usuario, ser un libro, tener mas de tres prestamos
Relaciones: tener préstamos, devolver un libro, solicitar otro
Dominio del discurso: Libros y Bibliotecas
```

- Hay una sección de la biblioteca donde todos los libros son de ciencias.
```
Variables de individuo: X es una biblioteca, Y es un libro
Cuantificador: universal ∀, existencial ∃
Propiedades: ser una biblioteca, ser un libro
Relaciones: pertenecer un libro a una sección
Dominio del discurso: Libros y Bibliotecas
```

- No todos los libros en la biblioteca tienen más de 100 páginas.
```
Variables de individuo: X es un libro, Y es una biblioteca
Cuantificador: existencial ∃
Propiedades: ser un libro, ser una biblioteca
Relaciones: pertenecer a una biblioteca
Dominio del discurso: Libros y Bibliotecas
```

- Existe un usuario que ha tomado prestados todos los libros de la sección infantil.
```
Variables de individuo: X es un usuario, Y es un libro
Cuantificador: universal ∀, existencial ∃
Propiedades: ser un usuario, ser un libro
Relaciones: tomar prestado un libro, pertenecer a una sección
Dominio del discurso: Libros y Bibliotecas
```