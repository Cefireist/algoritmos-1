"""
constructor: 
c = Cola()
c.put(elemento)
c.get() 1er elemento
e.empty()
idem pila

claves:list[str] = mi_dicc.keys() -> devuelve una lista con las claves
for clave, valor in mi_dicc.items():
    algo

"""
import random
from queue import Queue as Cola

def generar_nros_al_azar(cantidad:int, desde:int, hasta:int) -> Cola[int]:
    res:Cola[int] = Cola()
    for _ in range(0,cantidad):
        x:int = random.randint(desde,hasta)
        res.put(x)
    return res

def imprimir(lista_o_cola):
    while(not(lista_o_cola.empty())):
        print(lista_o_cola.get())


def armar_secuencia_de_bingo() -> Cola[int]:
    res:Cola[int] = Cola()
    lista_pendiente = list(range(0,100))
    hasta = 99
    while(len(lista_pendiente > 0)):
        i = random.randint(0,h)
        res.put(lista_pendiente[i])
        lista_pendiente.remove(lista_pendiente[i])
        h -= 1

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int]) -> int:
    copia:Cola = copiar_cola(bolillero)
    jugadas:int = 0
    contador:int = 0
    while contador < 12:
        n:int = copia.get()
        jugadas += 1
        if n in carton:
            contador += 1
    return jugadas


