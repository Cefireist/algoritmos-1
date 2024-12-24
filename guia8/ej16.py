from queue import Queue as Cola
import random

def imprimir(objeto):
    while(not(objeto.empty())):
        print(objeto.get())

def eliminar_elemento(elem,lista:list) -> list:
    nueva_lista:list = []
    for i in lista:
        if elem != i:
            nueva_lista.append(i)
    return nueva_lista

def armar_secuencia_de_bingo() -> Cola[int]:
    cola_de_numeros:Cola[int] = Cola()
    lista_de_numeros:list[int] = []
    for i in range(0,100):
        lista_de_numeros.append(i)
    for i in range(0,100):
        numero_aleatorio:int = random.randint(0,len(lista_de_numeros)-1)
        numero:int = lista_de_numeros[numero_aleatorio]
        lista_de_numeros = eliminar_elemento(numero,lista_de_numeros)
        cola_de_numeros.put(numero)
    return cola_de_numeros


def pertenece(elem:int,lista:list[int]) -> bool:
    for i in lista:
        if i == elem:
            return True
    return False

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int]) -> int:
    nuevo_bolillero:Cola[int] = Cola()
    contador:int = 0
    numero_jugadas:int = 0
    while contador < 11:
        numero_jugadas += 1
        elem:int = bolillero.get()
        nuevo_bolillero.put(elem)
        if pertenece(elem,carton):
            contador += 1
    bolillero = nuevo_bolillero
    return numero_jugadas

#imprimir(armar_secuencia_de_bingo())
carton:list[int] = [1,6,68,45,99,0,13,34,88,70,11,55]
for i in range(0,100):
    print(jugar_carton_de_bingo(carton,armar_secuencia_de_bingo()))