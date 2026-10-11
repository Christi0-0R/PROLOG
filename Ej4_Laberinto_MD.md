# Resolución de Laberinto con Recursividad en Python

## Descripción

El programa busca la salida de un laberinto representado como una matriz de números, utilizando recursividad para explorar las posibles rutas. El laberinto está compuesto por celdas que pueden ser camino libre (0), pared (1) o salida (2). La función principal va probando moverse en las cuatro direcciones posibles (abajo, izquierda, arriba, derecha) hasta encontrar la celda marcada como salida.

## El laberinto

El laberinto se representa como una matriz de 5x5, donde cada número tiene un significado distinto:

```python
laberinto = [
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [1, 1, 0, 1, 0],
    [0, 0, 0, 0, 2]
]
```

```
0 → camino libre, se puede pasar
1 → pared, no se puede pasar
2 → salida del laberinto
```

La salida se encuentra en la posición (4, 4), es decir, la última fila y la última columna de la matriz.

## Función de búsqueda

La función busqueda(x, y) es el corazón del programa. Recibe una posición dentro del laberinto (fila x, columna y) y revisa qué hay en esa celda antes de decidir qué hacer:

```python
def busqueda(x, y):

    if laberinto[x][y] == 2: 
        print ('Se encontro la salida en %d, %d' % (x, y))
        return True

    elif laberinto[x][y] == 1:
        return False

    elif laberinto[x][y] == 3:
        return False
```

Aquí se revisan tres casos posibles antes de seguir avanzando:

- Si la celda es 2, significa que se llegó a la salida, se imprime la posición y la función retorna True, lo cual detiene toda la búsqueda porque ya se cumplió el objetivo.
- Si la celda es 1, es una pared, así que no se puede pasar por ahí y la función retorna False para que la recursividad intente por otro camino.
- Si la celda es 3, significa que ya se pasó por ahí antes (como se explica más adelante), así que tampoco tiene caso volver a intentarlo, y se retorna False.


## Marcar el camino recorrido

Si la celda no es ninguno de los tres casos anteriores (es decir, es un 0, camino libre y no visitado), el programa la marca como visitada cambiándola a 3:

```python
    laberinto[x][y] = 3
```

Esto es clave para que el algoritmo no entre en un ciclo infinito, ya que sin esta marca la función podría ir y volver entre las mismas celdas una y otra vez. Al convertir la celda en 3, cualquier llamada futura que intente pasar por ahí la reconocerá como ya visitada (por el elif laberinto[x][y] == 3 de arriba) y no volverá a intentarlo.

## Exploración en las cuatro direcciones

Una vez marcada la celda actual, el programa intenta moverse en cuatro direcciones posibles, llamándose a sí misma (recursividad) para cada una:

```python
    if ((x < len(laberinto)-1 and busqueda(x+1, y))):
        return True
    elif ((y > 0 and busqueda(x, y-1))):
        return True
    elif ((x > 0 and busqueda(x-1, y))):
        return True
    elif ((y < len(laberinto)-1 and busqueda(x, y+1))):
        return True

    return False
```

El orden en el que se intenta moverse es:

```
1. Abajo    → busqueda(x+1, y)
2. Izquierda → busqueda(x, y-1)
3. Arriba    → busqueda(x-1, y)
4. Derecha   → busqueda(x, y+1)
```

Cada condición primero verifica que el movimiento no se salga de los límites de la matriz (por ejemplo, x < len(laberinto)-1 antes de bajar, o y > 0 antes de ir a la izquierda), y solo si eso es válido se hace la llamada recursiva a busqueda. Gracias al uso de elif, en cuanto una dirección regresa True (porque encontró la salida por ese camino), las demás direcciones ya no se intentan y la función retorna True de inmediato, propagando el resultado hacia todas las llamadas anteriores.

Si ninguna de las cuatro direcciones logra llegar a la salida desde esa celda, la función retorna False al final, indicando que ese camino no llevó a ningún lado.

## Función principal

La función main() simplemente arranca la búsqueda desde la posición inicial (0, 0), es decir, la esquina superior izquierda del laberinto:

```python
def main():
    busqueda(0, 0)


if __name__=="__main__":
    main()
```

Desde ahí, toda la exploración del laberinto ocurre gracias a las llamadas recursivas de busqueda, sin necesidad de ciclos for o while explícitos: es la propia función la que se repite a sí misma para recorrer las celdas.