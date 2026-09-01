# Uso de arreglos para definir el orden de jerarquia de una operacion
# ingresada por el usuario

# La idea es ingresar la operacion a un arreglo y de esa forma 
# primero localizar las operacion es con "*/" para ser las primeras
# en estar en parentesis y despues seguir con suma y resta

# Despues eliminar los numeros y simbolos y de esa manera 
# checar si los parentesis estan bien o si alguno esta mal
# si esta bien sera nulo sino saldra un parentesis sdgdfgrdsfvsdfg


class Nodo:
    def __init__(self, dato):
        self.dato = dato
        self.izq = None
        self.der = None


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

def dividir_operacion(elementos):

    if len(elementos)== 1:
        return elementos[0]

    operadores = []

    for i in range(1, len(elementos), 2):
        operadores.append((i, elementos[i]))

    menor_jerarquia = 10

    for posicion, operador in operadores:

        if operador in "+-":
            jeraquia = 1
        else:
            jeraquia = 2

        if jeraquia < menor_jerarquia:
            menor_jerarquia = jeraquia

    candidatos = []

    for posicion, operador in operadores:

        if operador in "+-" and menor_jerarquia == 1:
            candidatos.append(posicion)

        elif operador in "*/" and menor_jerarquia == 2:
            candidatos.append(posicion)

    posicion = candidatos[len(candidatos) // 2]

    izquierda = elementos[:posicion]
    derecha = elementos[posicion + 1:]

    operador = elementos[posicion]

    izquierda = dividir_operacion(izquierda)
    derecha = dividir_operacion(derecha)

    return f"({izquierda} {operador} {derecha})"


def obtener_parentesis(operacion):
    parentesis = []

    for caracter in operacion:

        if caracter == "(" or caracter == ")":
            parentesis.append(caracter)

    return parentesis


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



def main():

    operacion = input("Ingresa una operacion: ")

    elementos = separar_operacion(operacion)

    # Imprimir la operacion uwur
    print("\nArreglo de la operacion: ", elementos)

    operacion_dividida = dividir_operacion(elementos)

    # Como se ve en el arreglo :v
    print("\nOperacion dividida: ", operacion_dividida)


    parentesis = obtener_parentesis(operacion_dividida)

    # Con parentesis
    print("\nArreglo de parentesis: ", parentesis)


    resultado = validar_parentesis(parentesis)

    # Muestra si esta bien o no
    print("\nValidacion:")

    if resultado is None:
        print("NULL")
    else:
        print(resultado)




if __name__ == "__main__":
    main()