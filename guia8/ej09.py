from queue import LifoQueue as Pila

def imprimir_pila(pila:Pila[int]):
    a_lista:list[int] = []
    while(not(pila.empty())):
        a_lista.append(pila.get())
    a_lista.reverse()
    print(a_lista)

def invertir_pila(pila:Pila[int])->Pila[int]:
    invertida:Pila[int] = Pila()
    while (not(pila.empty())):
        invertida.put(pila.get())
    return invertida


mi_pila:Pila[int] = Pila()
for i in range(0,3):
    mi_pila.put(i)
def cantidad_elementos(pila:Pila[int]) -> int:
    contador: int = 0
    invertida:Pila[int] = Pila()
    while(not(pila.empty())):
        elem:int = pila.get()
        invertida.put(elem)
        contador += 1
    pila = invertir_pila(invertida)
    imprimir_pila(pila)
    return contador



print(cantidad_elementos(mi_pila))