from queue import Queue as Cola

def imprimir(objeto):
    while(not(objeto.empty())):
        print(objeto.get())

def buscar_el_maximo(cola:[int]) -> int:
    nueva_cola:Cola[int] = Cola()

    maximo:int = cola.get()
    nueva_cola.put(maximo)

    while(not cola.empty()):
        elem = cola.get()
        nueva_cola.put(elem)
        if elem > maximo:
            maximo = elem
        
    cola = nueva_cola
    imprimir(cola)
    return maximo

mi_cola:Cola[int] = Cola()
for i in range(3,4):
    mi_cola.put(i)

print(buscar_el_maximo(mi_cola))