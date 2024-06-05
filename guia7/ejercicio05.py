def pertenece(lista:list[int], e:int) -> bool:
    for i in lista:
        if i == e:
            return True
    return False

def pertenece_a_cada_uno_version_1(matriz:list[list[int]], elemento:int) -> list[bool]:
    res:list[bool] = []
    for fila in matriz:
        if pertenece(fila,elemento):
            res.append(True)
        else:
            res.append(False)

    return res

#print(pertenece_a_cada_uno_version_1([[1,2,3],[2,4,7],[],[1,2,3,4,5,6,7]], 2))

# la version 2 implica la uno, pues es mas fuerte, es decir si ocurre 2 => ocurre 1
# a su vez la version dos es una sobre especificacion de la 1

def es_matriz(matriz:list[list[int]]) -> bool:
    tamano = len(matriz[0])
    if tamano == 0:
        return False
    for fila in matriz:
        if not(len(fila) == tamano):
            return False
    return True
"""
print(es_matriz([
    [1,2,3],
    [2,3,4],
    [7,8,0]
]))

print(es_matriz([
    [1,3],
    [2,3,4],
    [7,8,0]
]))

print(es_matriz([
    [],
    [],
    []
]))
"""

def obtener_minimo(numeros:list[int]) -> int:
    minimo:int = numeros[0]
    for numero in numeros:
        if minimo > numero:
            minimo = numero
    return minimo

def eliminar_elemento_unica_vez(numeros:list[int], elemento:int) -> list[int]:
    unica_vez:bool = True
    nueva_lista:list[int] = []
    for numero in numeros:
        if elemento != numero or unica_vez == False:
            nueva_lista.append(numero)
        else:
            unica_vez = False
    return nueva_lista

def ordenar_lista_de_numeros(numeros:list[int]) -> list[int]:
    ordenada:list[int] = []
    for numero in numeros:
        minimo:int = obtener_minimo(numeros)
        ordenada.append(minimo)
        numeros = eliminar_elemento_unica_vez(numeros, minimo)
    return ordenada

def ordenados(numeros:list[int]) -> bool:
    anterior:int = numeros[0] - 1
    for siguiente in numeros:
        if anterior >= siguiente:
            return False
        else:
            anterior = siguiente
    return True 

def filas_ordenadas(matriz:list[list[int]]) -> bool:
    for fila in matriz:
        if not(ordenados(fila)):
            return False
    return True
"""
print(filas_ordenadas([
    [1,2,3],
    [4,5,6],
    [7,8,9]
]))

print(filas_ordenadas([
    [1,2,3],
    [4,5,6],
    [7,8,8]
]))

print(filas_ordenadas([
    [1,2,3],
    [4,5,6],
    [7,9,10]
]))

"""

import numpy as np
def elevar_matriz_p_veces(d:int,p:int):
    #m = np.random.random((d, d))
    m = np.random.randint(0,3, (d, d))
    res = m.copy() #  podria generar otra con el mismo metodo y sobrescribir si estuviese prohibido usar .copy()
    print("primera vez: " + "\n" + str(res))
    for i in range(1,p):
        res = producto_matricial(res,m,d)
        #print("a la " + str(i+1) + "\n" + str(res))
    return res



def producto_matricial(m1,m2,d:int):
    res = m1.copy()
    for i in range(0,d):
        for j in range(0,d):
            suma_parcial:int = 0
            for k in range(0,d):
                suma_parcial += m1[i][k]*m2[k][j]
            res[i][j] = suma_parcial
    return res
elevar_matriz_p_veces(2,100)