# TT W TT Laberinto fijo =w=

laberinto = [
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [1, 1, 0, 1, 0],
    [0, 0, 0, 0, 2]
]
# salida (4, 4)

def busqueda(x, y):

    if laberinto[x][y] == 2: 
        print ('Se encontro la salida en %d, %d' % (x, y))
        return True # poque dos es salida sdjfh
    elif laberinto[x][y] == 1:
        return False # osea que sigue la recurisvidad
    elif laberinto[x][y] == 3:
        return False # se usara para saber donde vamos

    laberinto[x][y] = 3

    if ((x < len(laberinto)-1 and busqueda(x+1, y))):
        return True
    elif ((y > 0 and busqueda(x, y-1))):
        return True
    elif ((x > 0 and busqueda(x-1, y))):
        return True
    elif ((y < len(laberinto)-1 and busqueda(x, y+1))):
        return True

    return False


def main():
    busqueda(0, 0)


if __name__=="__main__":
    main()