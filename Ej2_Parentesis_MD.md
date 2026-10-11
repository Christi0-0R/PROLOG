# Jerarquía de Operaciones con Arreglos en Python

## Descripción

El programa tiene como objetivo tomar una operación matemática ingresada por el usuario (como 3+5*2-8) y determinar el orden correcto en el que deben resolverse sus operaciones, respetando la jerarquía matemática: primero multiplicación y división, y después suma y resta. Para lograrlo, la operación se convierte en un arreglo de elementos y se va dividiendo recursivamente hasta armar una expresión con paréntesis que refleja ese orden. Además, el programa revisa que los paréntesis generados estén bien balanceados.

## Separación de la operación en un arreglo

Lo primero que hace el programa es tomar el texto de la operación y convertirlo en una lista donde cada número y cada operador quedan como elementos separados. Esto se hace con la función separar_operacion:

```python
def separar_operacion(operacion):

    elemento = []
    numero = ""

    for caracter in operacion:

        if caracter.isdigit():
            numero += caracter
        elif caracter in "+-*/":
            if numero:
                elemento.append(numero)
                numero = ""
            elemento.append(caracter)

    if numero:
        elemento.append(numero)

    return elemento
```

La función recorre la operación caracter por caracter. Si el caracter es un dígito, lo va acumulando en la variable numero (porque un número puede tener más de una cifra, como 12 o 34). Si el caracter es un operador (+, -, * o /), primero guarda el número que se había acumulado hasta ese momento y después agrega el operador como un elemento aparte. Al final del ciclo se agrega el último número, ya que no hay ningún operador después de él que dispare su guardado.

Por ejemplo, la operación 12+3*4 se convierte en:

```
['12', '+', '3', '*', '4']
```

## División recursiva según la jerarquía

Una vez que la operación está en forma de arreglo, la función dividir_operacion se encarga de encontrar el operador de menor jerarquía (suma/resta antes que multiplicación/división) y dividir la expresión en una parte izquierda y una derecha alrededor de ese operador:

```python
def dividir_operacion(elementos):

    if len(elementos) == 1:
        return elementos[0]

    operadores = []

    for i in range(1, len(elementos), 2):
        operadores.append((i, elementos[i]))
    ...
```

Como los operadores siempre están en las posiciones impares del arreglo (posición 1, 3, 5, etc.), el for los recorre de dos en dos para ubicarlos junto con su posición.

Después, el programa calcula cuál es la jerarquía más baja presente en la operación: si hay una suma o resta, esa jerarquía (1) tiene prioridad sobre la de multiplicación/división (2), porque en la jerarquía matemática lo que se resuelve al final es justamente la suma y la resta, así que es lo primero que se debe "envolver" en paréntesis desde afuera hacia adentro:

```python
    menor_jerarquia = 10

    for posicion, operador in operadores:

        if operador in "+-":
            jeraquia = 1
        else:
            jeraquia = 2

        if jeraquia < menor_jerarquia:
            menor_jerarquia = jeraquia
```

Una vez identificada la jerarquía mínima, se buscan todos los operadores que la comparten y se elige el que está más al centro de la expresión:

```python
    candidatos = []

    for posicion, operador in operadores:

        if operador in "+-" and menor_jerarquia == 1:
            candidatos.append(posicion)

        elif operador in "*/" and menor_jerarquia == 2:
            candidatos.append(posicion)

    posicion = candidatos[len(candidatos) // 2]
```

Con esa posición se separa el arreglo en dos mitades (izquierda y derecha del operador elegido), y la función se llama a sí misma con cada mitad, hasta que cada lado quede reducido a un solo elemento:

```python
    izquierda = elementos[:posicion]
    derecha = elementos[posicion + 1:]

    operador = elementos[posicion]

    izquierda = dividir_operacion(izquierda)
    derecha = dividir_operacion(derecha)

    return f"({izquierda} {operador} {derecha})"
```

Gracias a esta recursividad, cada nivel de la operación queda envuelto en su propio par de paréntesis, reflejando el orden real en que debe resolverse. Por ejemplo, 12+3*4 termina convertido en:

```
(12 + (3 * 4))
```

## Obtención y validación de paréntesis

Ya con la operación transformada en una cadena con paréntesis, el programa extrae únicamente los símbolos ( y ) con la función obtener_parentesis:

```python
def obtener_parentesis(operacion):
    parentesis = []

    for caracter in operacion:

        if caracter == "(" or caracter == ")":
            parentesis.append(caracter)

    return parentesis
```

Esto se hace descartando números, operadores y espacios, para quedarse solo con la secuencia de paréntesis, algo así como:

```
['(', '(', ')', ')']
```

Con esa lista, la función validar_parentesis revisa si los paréntesis están bien balanceados, usando un contador:

```python
def validar_parentesis(parentesis):

    contador = 0

    for parentesis_actual in parentesis:

        if parentesis_actual == "(":
            contador += 1

        elif parentesis_actual == ")":
            contador -= 1

        if contador < 0:
            return "Error: paréntesis incorrectos"

    if contador != 0:
        return "Error: paréntesis incorrectos"

    return None
```

Cada vez que se encuentra un ( el contador sube, y cada vez que se encuentra un ) el contador baja. Si en algún momento el contador se vuelve negativo, significa que se cerró un paréntesis que nunca se abrió, por lo que se retorna un error de inmediato. Si al final del recorrido el contador no regresó a cero, significa que quedaron paréntesis sin cerrar. En cualquier otro caso, la función retorna None, indicando que todo está correcto.

Como los paréntesis en este programa se generan automáticamente a partir de dividir_operacion, en teoría siempre deberían estar balanceados, pero esta validación sirve como una comprobación extra de que el proceso de división funcionó bien.

## Función principal

La función main() conecta todo el flujo del programa: pide la operación, la separa en arreglo, la divide según su jerarquía, extrae los paréntesis resultantes y finalmente valida que estén correctos:

```python
def main():

    operacion = input("Ingresa una operacion: ")

    elementos = separar_operacion(operacion)
    print("\nArreglo de la operacion: ", elementos)

    operacion_dividida = dividir_operacion(elementos)
    print("\nOperacion dividida: ", operacion_dividida)

    parentesis = obtener_parentesis(operacion_dividida)
    print("\nArreglo de parentesis: ", parentesis)

    resultado = validar_parentesis(parentesis)
    print("\nValidacion:")

    if resultado is None:
        print("NULL")
    else:
        print(resultado)
```

En cada paso se va imprimiendo el resultado intermedio, para que el usuario pueda seguir visualmente cómo la operación pasa de ser un texto plano a un arreglo, después a una expresión con paréntesis, y finalmente a una validación.