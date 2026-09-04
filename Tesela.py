
matriz = [[0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0]]

# matis 8x8

# una Tesela debera tener una estructura similar a:
#
#  Tesela 1
#              posicion[0][0]
#             posicion[0][1] posicion[1][1]
#
#  Tesela 2
#                             posicion[1][0]
#             posicion[0][1] posicion[1][1]
#
#  Tesela 3
#             posicion[0][0] posicion[1][0]
#              posicion[0][1] 
#
#
#  Tesela 4
#             posicion[0][0] posicion[1][0]
#                             posicion[1][1]
#
#######################################################
#######################################################


def buscar_tesela_1(x, y):

    if ((matriz[x][y] == 0)
        and (matriz[x][y+1] == 0)
        and (matriz[x+1][y+1] == 0)):

        matriz[x][y] = 1
        matriz[x][y+1] = 1
        matriz[x+1][y+1] = 1

        return True

    return False

def buscar_tesela_4(x, y):

    if ((matriz[x][y] == 0)
        and (matriz[x+1][y] == 0)
        and (matriz[x+1][y+1] == 0)):

        matriz[x][y] = 1
        matriz[x+1][y] = 1
        matriz[x+1][y+1] =1

        return True

    return False

# =========================

def despintar_tesela_1(x, y):

    matriz[x][y] = 0
    matriz[x][y + 1] = 0
    matriz[x + 1][y + 1] = 0


def despintar_tesela_4(x, y):

    matriz[x][y] = 0
    matriz[x+1][y] = 0
    matriz[x+1][y+1] = 0


# ==========================

def pintar(x, y): # pintar toda la matriz con teselas menos un cuadrito

    # u-u

    if x == 8: # Matriz recorrida 100%

        # comprobacion sjd
        cantidad_ceros = 0

        for i in range(8):
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


def main():

    print (matriz)

    print (pintar(0,0))



if __name__=="__main__":
    main()

