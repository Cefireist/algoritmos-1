from queue import Queue as Cola
def imprimir(objeto):
    lista:list = []
    while(not objeto.empty()):
        elem = objeto.get()
        lista.append(elem)
        #print(elem)
    print(lista)
def concatenar_colas(lista_colas:list[Cola,Cola,Cola]) -> Cola:
    cola_unida:Cola = Cola()
    for i in lista_colas:
        cola_unida = agregar_cola(i, cola_unida)
    return cola_unida
def agregar_cola(cola:Cola, cola_unida:Cola) -> Cola:
    while (not cola.empty()):
        elemento = cola.get()
        cola_unida.put(elemento)
    return cola_unida

def atencion_al_cliente(fila:Cola[tuple[str,int,bool,bool]]) -> Cola[tuple[str,int,bool,bool]]:
    nueva_fila:Cola[tuple[str,int,bool,bool]] = Cola()
    cola_prioritaria:Cola[tuple[str,int,bool,bool]] = Cola()
    cola_preferencial:Cola[tuple[str,int,bool,bool]] = Cola()
    cola_normal:Cola[tuple[str,int,bool,bool]] = Cola()
    while (not fila.empty()):
        cuatrupla:tuple[str,int,bool,bool] = fila.get()
        nueva_fila.put(cuatrupla)
        if cuatrupla[3]:
            cola_prioritaria.put(cuatrupla)
        elif cuatrupla[2]:
            cola_preferencial.put(cuatrupla)
        else:
            cola_normal.put(cuatrupla)
    fila = nueva_fila
    return concatenar_colas([cola_prioritaria,cola_preferencial,cola_normal])

import random
cola_prueba:Cola[tuple[str,int,bool,bool]] = Cola()
for i in range(0,10):
    prioritario:bool = random.choice([True,False])
    preferencial:bool = random.choice([True,False])
    cuatrupla:tuple[str,int,bool,bool] = ("grillo",i+100,prioritario,preferencial)
    cola_prueba.put(cuatrupla)
    print(cuatrupla)
print("")

imprimir(atencion_al_cliente(cola_prueba))