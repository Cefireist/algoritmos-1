from queue import LifoQueue as Pila

mi_pila:Pila[int] = Pila()
mi_lista = [1,5,2,8,3]
for i in mi_lista:
    mi_pila.put(i) # entra la pila [1,5,2,8,3] si el ultimo agregado es el de la derecha

def imprimir_pila(pila:Pila[int]):
    a_lista:list[int] = []
    while(not(pila.empty())):
        a_lista.append(pila.get())
    a_lista.reverse()
    print(a_lista)

def invertir_pila(pila:Pila[int]) -> Pila[int]:
    invertida:Pila[int] = Pila()
    while(not(pila.empty())):
        invertida.put(pila.get())
    return invertida

def buscar_el_maximo(pila:Pila[int]) -> int:
    nueva_pila:Pila[int] = Pila()
    max:int = pila.get()
    elem:int = max
    nueva_pila.put(elem)
    while(not(pila.empty())):
        elem = pila.get()
        nueva_pila.put(elem)
        if max < elem:
            max = elem
    pila = invertir_pila(nueva_pila)
    imprimir_pila(pila)
    return max

print(buscar_el_maximo(mi_pila))