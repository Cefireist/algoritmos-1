import random
from queue import LifoQueue as Pila

def imprimir_pila(pila:Pila[int]):
    a_lista:list[int] = []
    while(not(pila.empty())):
        a_lista.append(pila.get())
    print(a_lista)


def generar_nros_al_azar(cantidad:int, desde:int, hasta:int) -> Pila[int]:
    pila_numeros_aleatorios:Pila[int] = Pila()
    for i in range(0,cantidad):
        numero_aleatorio = random.randint(desde,hasta)
        pila_numeros_aleatorios.put(numero_aleatorio)
    print(pila_numeros_aleatorios)
    imprimir_pila(pila_numeros_aleatorios)


generar_nros_al_azar(10,0,10)

