# Recurividad e Iteraciones en Python (ง🔥ﾛ🔥)ง

# Idea de como se puede implementar diferentes maneras de realizar el cambio:
# Siguiendo la idea de utilizar el menor numero de monedas a mayor
# se quitara la modena de mayor valor

arr = [10, 5, 2, 1], [0, 0, 0, 0]

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

def Op2(r):

    if r[1][0] > 0:
        r[1][1] = r[1][1] + r[1][0]*2
        r[1][0] = 0
        
    return r

def Op3(r):

    if r[1][2] > 0:
        r[1][3] = r[1][3] + r[1][2]*2
        r[1][2] = 0
    
    return r


def Iterativo(n):

    arr = [10, 5, 2, 1], [0, 0, 0, 0]
    for i in range(len(arr[0])):

        while n >= arr[0][i]:
            n = n - arr[0][i]
            arr[1][i] += 1

    return arr

def main():

    # Modo recursivo -w-

    dinero_txt = input("Dinero que se recibe: ")
    dinero = int(dinero_txt)

    cambio1 = Recursivo(dinero)
    cambio2 = [cambio1[0].copy(), cambio1[1].copy()]
    Op2(cambio2)
    cambio3 = [cambio2[0].copy(), cambio2[1].copy()]
    Op3(cambio3)

    print("\nSu cambio es:")

    for opcion, cambio in enumerate([cambio1, cambio2, cambio3], 1):

        print(f"\nOpción {opcion}:")

        for i in range(len(cambio[0])):
            if cambio[1][i] > 0:
                print(f"  ${cambio[0][i]} x {cambio[1][i]}")

    # Modo iterativo o.o

    dinero_txt = input("Dinero que se recibe: ")
    dinero = int(dinero_txt)

    cambio1 = Iterativo(dinero)
    cambio2 = [cambio1[0].copy(), cambio1[1].copy()]
    Op2(cambio2)
    cambio3 = [cambio2[0].copy(), cambio2[1].copy()]
    Op3(cambio3)

    for opcion, cambio in enumerate([cambio1, cambio2, cambio3], 1):

        print(f"\nOpción {opcion}:")

        for i in range(len(cambio[0])):
            if cambio[1][i] > 0:
                print(f"  ${cambio[0][i]} x {cambio[1][i]}")

if __name__ == '__main__':
    main()