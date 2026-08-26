# Recursividad e Iteraciones en Python - v1

## Descripción

El programa tiene como objetivo calcular el cambio de una cantidad de dinero utilizando las denominaciones de **$10, $5, $2 y $1**, buscando utilizar la menor cantidad de monedas posible. Para esto se implementaron dos métodos diferentes: uno **recursivo** y otro **iterativo**. Ambos realizan el mismo proceso, pero utilizando una forma diferente de repetir las operaciones.

## Arreglo utilizado

Primero se creó un arreglo que contiene las denominaciones y otro que almacena la cantidad de monedas utilizadas:

```python
arr = [10, 5, 2, 1], [0, 0, 0, 0]
```

La primera lista contiene las denominaciones disponibles:

```text
[10, 5, 2, 1]
```

Mientras que la segunda comienza con todas las cantidades en cero:

```text
[0, 0, 0, 0]
```

Cada posición de la segunda lista corresponde a la denominación que se encuentra en la misma posición de la primera lista.

Por ejemplo:

```text
10 → cantidad de monedas de $10
5  → cantidad de monedas de $5
2  → cantidad de monedas de $2
1  → cantidad de monedas de $1
```

## Método recursivo

La función `Recursivo(n)` recibe como parámetro la cantidad de dinero que se quiere convertir en cambio.

Primero comprueba si puede utilizar una moneda de $10. Si es posible, resta 10 a la cantidad y aumenta en uno el contador de monedas de $10. Después vuelve a llamar a la misma función con la cantidad restante. El mismo proceso se realiza con las denominaciones de $5, $2 y finalmente $1.

Por ejemplo, si se recibe `34`:

```text
34 - 10 = 24
24 - 10 = 14
14 - 10 = 4
4 - 2 = 2
2 - 2 = 0
```

Por lo tanto, el resultado es:

```text
$10 x 3
$2 x 2
```

El `return Recursivo(n)` permite que la función continúe llamándose a sí misma hasta que la cantidad llegue a cero.

## Método iterativo

La función `Iterativo(n)` realiza el mismo procedimiento, pero en lugar de utilizar llamadas recursivas utiliza ciclos `for` y `while`.

El `for` recorre las diferentes denominaciones del arreglo:

```python
for i in range(len(arr[0])):
```

Mientras que el `while` se encarga de restar repetidamente la denominación actual mientras todavía sea posible utilizarla:

```python
while n >= arr[0][i]:
    n = n - arr[0][i]
    arr[1][i] += 1
```

De esta manera, el programa comienza utilizando las monedas de mayor valor y continúa con las siguientes denominaciones cuando ya no puede utilizar la anterior.

## Impresión del resultado

Después de calcular el cambio, se recorre el arreglo para mostrar solamente las denominaciones que fueron utilizadas:

```python
for i in range(len(cambio[0])):
    if cambio[1][i] > 0:
        print(f"  ${cambio[0][i]} x {cambio[1][i]}")
```

Por ejemplo, para una cantidad de `25`, el resultado sería:

```text
Su cambio es:
  $10 x 2
  $5 x 1
```