# Recurividad e Iteraciones en Python (ง🔥ﾛ🔥)ง

arr = [10, 5, 2, 1], [0, 0, 0, 0]

def Recurivo(n):
    if n >= 10:
        n = n - 10
        arr[1][0] += 1
        return Recurivo(n)
    elif n < 10 and n >= 5:
        n = n - 5
        arr[1][1] += 1
        return Recurivo(n)
    elif n < 5 and n >= 2:
        n = n - 2
        arr[1][2] += 1
        return Recurivo(n)
    elif n == 1:
        arr[1][3] += 1
        return arr
    elif n == 0:
        return arr

def main():

    # Modo recursivo -w-

    dinero_txt = input("Dinero que se recibe: ")
    dinero = int(dinero_txt)

    cambio = Recurivo(dinero) 

    print("\nSu cambio es:")

    for i in range(len(cambio[0])):
        if cambio[1][i] > 0:
            print(f"  ${cambio[0][i]} x {cambio[1][i]}")

if __name__ == '__main__':
    main()