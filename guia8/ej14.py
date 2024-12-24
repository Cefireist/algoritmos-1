from queue import Queue as Cola

def imprimir(objeto):
    while(not(objeto.empty())):
        print(objeto.get())

def cantidad_elementos(cola:Cola[all]) -> int:
    nueva_cola:Cola[all] = Cola()
    contador:int = 0
    while (not(cola.empty())):
        contador += 1
        nueva_cola.put(cola.get())
    cola = nueva_cola
    return contador

mi_cola:Cola[int] = Cola()
for i in range(3,6):
    mi_cola.put(i)

print(cantidad_elementos(mi_cola))
# ahora no tengo que invertirla como con la pila, FIFO first in first out