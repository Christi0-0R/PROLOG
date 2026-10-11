# Teselas

## Descripción

El programa tiene como objetivo cubrir un tablero de 8x8 con teselas en forma de L (formadas por 3 cuadritos) hasta dejar exactamente un solo cuadrito sin cubrir. Para lograrlo, se usa un algoritmo recursivo de backtracking (prueba y error): se recorre el tablero casilla por casilla, se intenta colocar una tesela, y si más adelante no hay forma de continuar, se quita la tesela y se prueba con otra. Al final se comprueba que haya quedado un único hueco.

## Representación de las teselas

Cada tesela es una lista de desplazamientos `(dx, dy)` respecto a la casilla donde se coloca, y todas juntas se guardan en un diccionario:

```python
teselas = {
    1: [(0,0), (0,1), (1,1)],
    2: [(1,0), (0,1), (1,1)],
    3: [(0,0), (1,0), (0,1)],
    4: [(0,0), (1,0), (1,1)],
}
```

Cada una es una de las 4 orientaciones posibles de una L, es decir, un cuadro de 2x2 al que le falta una esquina:

```
 Tesela 1      Tesela 2      Tesela 3      Tesela 4
  X X           . X           X X           X X
  . X           X X           X .           . X
```

*(Los dibujos son una referencia visual; en el código la primera coordenada se usa como fila y la segunda como columna.)*

## El tablero

El tablero es una matriz de 8x8 llena de ceros. Un 0 significa que la casilla está libre, y cuando se coloca una tesela, sus casillas se llenan con el número de esa tesela (1 a 4):

```python
matriz = [[0, 0, 0, 0, 0, 0, 0, 0],
          ...
          [0, 0, 0, 0, 0, 0, 0, 0]]
```

## Verificar si una tesela cabe

La función `cabe` revisa si una tesela se puede colocar en la posición `(x, y)`:

```python
def cabe(x, y, tesela):

    for dx, dy in tesela:
        nx = x + dx
        ny = y + dy

        if nx >= 8 or ny >= 8 or matriz[nx][ny] != 0:
            return False

    return True
```

Para cada cuadrito de la tesela calcula su posición real en el tablero sumando los desplazamientos. Si alguna posición se sale del tablero o ya está ocupada, regresa `False`. Si todas las posiciones están libres y dentro del tablero, regresa `True`.

## Pintar y quitar teselas

La función `pintar_tesela` coloca una tesela escribiendo un valor en cada una de sus casillas:

```python
def pintar_tesela(x, y, tesela, valor):

    for dx, dy in tesela:
        matriz[x + dx][y + dy] = valor
```

Esta misma función sirve para quitar una tesela: basta llamarla con `valor = 0`, lo que deja las casillas libres otra vez. Esto es lo que permite el backtracking.

## Recorrer el tablero

La función `siguiente` regresa la siguiente casilla a revisar, recorriendo el tablero fila por fila:

```python
def siguiente(x, y):

    if y == 7:
        return x + 1, 0

    return x, y + 1
```

Si ya se llegó a la última columna (7), pasa a la primera columna de la siguiente fila. En cualquier otro caso, solo avanza una columna.

## Función recursiva principal

La función `pintar(x, y)` es la que resuelve el problema. Funciona así:

```python
def pintar(x, y):

    if x == 8:
        cantidad_ceros = sum(fila.count(0) for fila in matriz)
        return cantidad_ceros == 1

    if matriz[x][y] != 0:
        nx, ny = siguiente(x, y)
        return pintar(nx, ny)

    for numero, tesela in teselas.items():
        if cabe(x, y, tesela):
            pintar_tesela(x, y, tesela, numero)

            nx, ny = siguiente(x, y)
            if pintar(nx, ny):
                return True

            pintar_tesela(x, y, tesela, 0)

    return False
```

1. **Caso base:** si `x == 8`, significa que ya se recorrió todo el tablero. Entonces se cuentan los ceros que quedaron: si hay exactamente uno, la solución es correcta y regresa `True`; si no, regresa `False`.
2. **Casilla ocupada:** si la casilla actual ya tiene una tesela, simplemente salta a la siguiente.
3. **Probar teselas:** si la casilla está libre, prueba las 4 teselas. Si una cabe, la pinta y llama a `pintar` con la siguiente casilla.
4. **Backtracking:** si la llamada recursiva no encontró solución, quita la tesela con `pintar_tesela(..., 0)` y prueba con la siguiente. Si ninguna funciona, regresa `False` para que la llamada anterior pruebe otra opción.

Como la tesela 2 no cubre su propia casilla de anclaje `(0,0)`, esa casilla puede quedar vacía; así es como el programa genera el único hueco permitido.

## Función main

```python
def main():

    if pintar(0, 0):
        for fila in matriz:
            print(fila)
    else:
        print("No se encontro solucion :c")
```

Inicia la búsqueda desde la casilla `(0, 0)`. Si encuentra solución, imprime el tablero fila por fila; si no, muestra un mensaje de que no hubo solución.

## Resultado

Al ejecutar el programa, se obtiene una solución válida con un solo hueco en la posición `(6, 0)` (el 0 en la salida):

```
[1, 1, 1, 1, 1, 1, 1, 1]
[4, 1, 4, 1, 4, 1, 4, 1]
[4, 4, 4, 4, 4, 4, 4, 4]
[1, 1, 1, 1, 1, 1, 1, 1]
[4, 1, 4, 1, 4, 1, 4, 1]
[4, 4, 4, 4, 4, 4, 4, 4]
[0, 2, 4, 1, 1, 4, 1, 1]
[2, 2, 4, 4, 1, 4, 4, 1]
```

Como el tablero tiene 64 casillas y cada tesela cubre 3, caben 21 teselas (63 casillas), por lo que siempre sobra exactamente una casilla.