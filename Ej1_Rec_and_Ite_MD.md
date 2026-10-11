# Recursividad e Iteraciones en Python - v2

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
.
.
.
.
.
.
.
.
---

# Recursividad e Iteraciones en Python - v2

## Descripción

En esta versión se mantiene el funcionamiento de la versión anterior, donde se busca obtener el cambio utilizando la menor cantidad de monedas posible mediante un método recursivo y otro iterativo.

Además, se implementó una forma de obtener otras maneras de realizar el mismo cambio, modificando las monedas utilizadas en la primera opción.

La idea consiste en comenzar con la combinación que utiliza las monedas de mayor valor y posteriormente sustituir algunas monedas por otras de menor denominación.

Por ejemplo, para un cambio de `34`:

```text
Opción 1:
$10 x 3
$2 x 2
```

A partir de esta combinación se pueden generar otras:

```text
Opción 2:
$5 x 6
$2 x 2
```

Y posteriormente:

```text
Opción 3:
$5 x 6
$1 x 4
```

Todas las opciones representan el mismo valor de 34, aunque utilizan diferentes cantidades de monedas.

## Generación de la primera opción

La función `Recursivo(n)` obtiene inicialmente el cambio utilizando las denominaciones de mayor a menor:

```python
def Recursivo(n):

    if n >= 10:
        n = n - 10
        arr[1][0] += 1
        return Recursivo(n)

    elif n < 10 and n >= 5:
        n = n - 5
        arr[1][1] += 1
        return Recursivo(n)

    elif n < 5 and n >= 2:
        n = n - 2
        arr[1][2] += 1
        return Recursivo(n)

    elif n == 1:
        arr[1][3] += 1
        return arr

    elif n == 0:
        return arr
```

Esta función genera la primera opción utilizando primero la moneda de mayor valor que sea posible.

Por ejemplo:

```text
34 → 24 → 14 → 4 → 2 → 0
```

Obteniendo:

```text
$10 x 3
$2 x 2
```

Esta combinación utiliza solamente 5 monedas.

## Generación de la segunda opción

Para obtener una segunda forma de realizar el cambio se utiliza la función `Op2()`:

```python
def Op2(r):

    if r[1][0] > 0:
        r[1][1] = r[1][1] + r[1][0] * 2
        r[1][0] = 0

    return r
```

En este caso se sustituyen las monedas de $10 por monedas de $5.

Como cada moneda de $10 equivale a dos monedas de $5, se multiplica la cantidad de monedas de $10 por 2:

```python
r[1][1] = r[1][1] + r[1][0] * 2
```

Después se eliminan las monedas de $10 de la combinación:

```python
r[1][0] = 0
```

Por ejemplo:

```text
$10 x 3
$2 x 2
```

se transforma en:

```text
$5 x 6
$2 x 2
```

## Generación de la tercera opción

La función `Op3()` realiza un proceso similar, pero ahora sustituye las monedas de $2 por monedas de $1:

```python
def Op3(r):

    if r[1][2] > 0:
        r[1][3] = r[1][3] + r[1][2] * 2
        r[1][2] = 0

    return r
```

Como cada moneda de $2 equivale a dos monedas de $1, se multiplica la cantidad de monedas de $2 por 2.

La función recibe la combinación generada por `Op2()`, por lo que la tercera opción se basa en la segunda:

```text
Opción 1:
$10 x 3
$2 x 2

    ↓ Op2

Opción 2:
$5 x 6
$2 x 2

    ↓ Op3

Opción 3:
$5 x 6
$1 x 4
```

## Copia de las opciones

Para poder conservar las opciones anteriores se realizan copias del arreglo:

```python
cambio1 = Recursivo(dinero)

cambio2 = [cambio1[0].copy(), cambio1[1].copy()]
Op2(cambio2)

cambio3 = [cambio2[0].copy(), cambio2[1].copy()]
Op3(cambio3)
```

Esto es necesario porque las listas pueden modificarse aunque se utilicen diferentes variables.

De esta manera:

```text
cambio1 → Opción 1
cambio2 → Opción 2
cambio3 → Opción 3
```

Cada una conserva su propia combinación.

## Mostrar las diferentes opciones

Para mostrar las tres opciones se utiliza `enumerate()`:

```python
for opcion, cambio in enumerate([cambio1, cambio2, cambio3], 1):

    print(f"\nOpción {opcion}:")

    for i in range(len(cambio[0])):

        if cambio[1][i] > 0:
            print(f"  ${cambio[0][i]} x {cambio[1][i]}")
```

`enumerate()` permite recorrer las tres combinaciones y asignarles un número comenzando desde 1.

El resultado para `34` sería:

```text
Su cambio es:

Opción 1:
  $10 x 3
  $2 x 2

Opción 2:
  $5 x 6
  $2 x 2

Opción 3:
  $5 x 6
  $1 x 4
```

## Implementación en el método iterativo

Las mismas operaciones pueden realizarse utilizando el resultado de `Iterativo()`:

```python
cambio1 = Iterativo(dinero)

cambio2 = [cambio1[0].copy(), cambio1[1].copy()]
Op2(cambio2)

cambio3 = [cambio2[0].copy(), cambio2[1].copy()]
Op3(cambio3)
```

De esta manera, tanto el método **recursivo** como el **iterativo** pueden generar las diferentes opciones de cambio utilizando las mismas funciones `Op2()` y `Op3()`.