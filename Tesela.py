# Debe ser recursivo u-u

# Cada tesela sera una lista de desplazamiento dx y dy respecto a x y

#  Tesela 1                 Tesela 2                Tesela 3               Tesela 4
#   (0,0)                          (1,0)              (0,0) (1,0)           (0,0) (1,0)
#   (0,1) (1,1)              (0,1) (1,1)              (0,1)                       (1,1)

# Ya no se usaran como funciones sino como un arreglo
teselas = {
    1: [(0,0), (0,1), (1,1)],
    2: [(1,0), (0,1), (1,1)],
    3: [(0,0), (1,0), (0,1)],
    4: [(0,0), (1,0), (1,1)],
}

matriz = [[0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0]]

# matris 8x8 uwu)r



def cabe(x, y, tesela): # funcion para saber si la tesela cabe dentro de la matriz

    for dx, dy in tesela: #porque es una matriz
        nx = x + dx
        ny = y + dy

        if nx >= 8 or ny >= 8 or matriz[nx][ny] != 0:
            return False


def pintar_tesela(x, y, tesela, valor): # pintar toda la matriz con teselas menos un cuadrito

    # u-u

    for dx, dy in tesela:
        matriz[x + dx][y + dy] = valor


def siguiente(x, y):
    # devuelve la siguiente posicion a revisar recorriendo cada fila

    if y == 7:
        return x + 1, 0

    return x, y + 1


def pintar(x, y):
    # debe ser recursivo ¯\_(ツ)_/¯
    
    if x == 8: # Matriz recorrida 100%

        # comprobacion sjd
        cantidad_ceros = sum(fila.count(0) for fila in matriz)
        return cantidad_ceros == 1

    # si esta la casilla ya pintada salta a la siguiente
    if matriz[x][y] != 0:
        nx, ny = siguiente(x, y)
        return pintar(nx, ny)

    # Probar las 4 teselas en esta casilla
    for numero, tesela in teselas.items():
        if cabe(x, y, tesela):
            pintar_tesela(x, y, tesela, numero)

            nx, ny = siguiente(x, y)
            if pintar(nx, ny):
                return True

            # si no funciona lo quita y prueba la siguiente tesela Bv
            pintar_tesela(x, y, tesela, 0)

    return False



'''        for i in range(8):
            for j in range(8):
                
                if matriz[i][j] == 0:
                    cantidad_ceros += 1

        if cantidad_ceros == 1:
            return True
        else:
            return False
                

    if matriz[x][y] != 0: # Buscar casillas no pintadas

        if y == 7:
            return pintar(x+1, 0)
        else:
            return pintar(x, y+1)

    if ((x + 1 <= 8) and (y + 1 <= 8)):

        if buscar_tesela_1(x, y):

            if y == 7:
                terminado = pintar(x+1, 0)
            else:
                terminado = pintar(x, y+1)

            if terminado:
                return True

            # si no funciono TwT
            despintar_tesela_1(x, y)

        if buscar_tesela_4(x, y):

            if y == 7:
                terminado = pintar(x+1, 0)
            else:
                terminado =  pintar(x, y+1)

            if terminado:
                return True

            # si no :,v
            despintar_tesela_4(x, y)

    return False
'''





def main():

    if pintar(0, 0):
        for fila in matriz:
            print(fila)
    else:
        print("No se encontro solucion :c")


if __name__=="__main__":
    main()

