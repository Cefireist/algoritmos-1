from queue import Queue as Cola
import random

def imprimir(objeto):
    while(not(objeto.empty())):
        elem = objeto.get()
        print(elem)
        
def generar_nros_al_azar(cantidad:int,desde:int,hasta:int) -> Cola[int]:
    cola_numeros_aleatorios: Cola[int] = Cola()
    for i in range (0,cantidad):
        numero_aleatorio = random.randint(desde,hasta)
        cola_numeros_aleatorios.put(numero_aleatorio)
        print(numero_aleatorio)
    return cola_numeros_aleatorios

imprimir(generar_nros_al_azar(5,0,10))

