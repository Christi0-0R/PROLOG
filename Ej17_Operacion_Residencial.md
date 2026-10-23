# Actividad — Operación Residencial

Reglas de la operación:

- Trabajen individual (salvo indicación del docente).
- Intérprete: SWI-Prolog (swipl).
- En las misiones 1–5: solo hechos, átomos y reglas. Sin findall, sin permutation, sin listas de casas (eso queda para la misión extra).
 - Los átomos van en minúsculas (ana, roja, pez). Las variables en Mayúscula (P, Color, N).
- Cada misión pide código + consulta + salida. Sin salida de Prolog = 0.
- Si una consulta falla y creían que debía pasar, no borren el intento: anoten qué unificación falló.

Mapa de misiones

| # | Nombre en clave           | Habilidad que evalúa                                          |
|---|---                        |---                                                            |
| 1 | El Dominio de la Calle    | Átomos, hechos de dominio, variables vs constantes            |
| 2 | Pistas que ya son hechos  | Traducir pistas directas a hechos                             |
| 3 | La Fábrica de Reglas      | Reglas `cabeza :- cuerpo` que conectan predicados             |
| 4 | El Tablero de Deducción   | Razonar pista a pista (estilo Einstein) con ayuda de Prolog   |
| 5 | El Expediente Completo    | Codificar la solución y responder con reglas de consulta      |
| 6 | Código Saboteado          | Diagnosticar hechos/reglas rotas                              |
| ★ | Extra: El Buscador        | (Opcional) `member` + listas si ya vieron ese tema            |

---

### Material interceptado — Las doce pistas

Hay cuatro casas numeradas 1 – 2 – 3 – 4 de izquierda a derecha. 


| Atributo  | Posibles valores (átomos)         |
|---        |---                                |
| Persona   | `ana`, `beto`, `carla`, `diego`   |
| Color     | `blanca`, `verde`, `roja`, `azul` |
| Bebida    | `agua`, `cafe`, `leche`, `te`     |
| Mascota   | `gato`, `perro`, `pez`, `loro`    |


 Pistas:

- Ana vive en la casa 1.
- Ana vive en la casa blanca.
- Beto bebe café.
- La casa verde está inmediatamente a la izquierda de la casa roja.
- Quien vive en la casa verde bebe café.
- Carla bebe leche.
- Quien tiene el perro vive junto a quien bebe agua.
- Quien tiene el gato bebe agua.
- Diego vive en la casa azul.
- Quien tiene el loro bebe té.
- Carla tiene el pez.
- Quien bebe té vive en la casa 4.

**Pregunta del mando: ¿quién tiene el pez? (La pista 11 lo dice… pero deben *demostrarlo armando el resto del expediente. Si solo copian la pista 11 sin deducir colores, bebidas y vecinos, la misión 4–5 no cuenta.)***

---

## Misión 1 — El Dominio de la Calle


### La Historia

Antes de deducir, el analista debe fijar el vocabulario: qué átomos existen y qué predicados describirán el mundo.

### Recordatorio

```
hombre(juan).          % hecho: átomo juan
padre(X, Y) :- ...     % regla: X e Y son variables
```

### Tu Tarea

1. En `residencial.pl`, escribe hechos de dominio:
- `persona/1` para las cuatro personas
- `color/1`, `bebida/1`, `mascota/1` para el resto de átomos

2. Clasifica cada expresión: ¿átomo, variable, hecho o regla? 

| Expresión                     | Tipo          |
|---                            |---            |
| ana                           |               |
| P                             |               |
| persona(carla).               |               |
| dueno(P) :- tiene(P, pez).    |               |