from queue import LifoQueue as Pila

lista_nombres_de_usuario:list[str] = ["pepe","grillo","jorge","Nahuel","Rigoberto"]
def crear_diccionario(nombres_de_usuario:list[str]) -> dict[str,Pila[str]]:
    historiales:dict[str, Pila[str]] = {}
    for nombre in lista_nombres_de_usuario:
        pila_vacia:Pila[str] = Pila()
        historiales[nombre] = pila_vacia
    return historiales

def visitar_sitio(historiales:dict[str,Pila[str]], nombre_usuario:str, nombre_sitio:str):
    historiales[nombre_usuario].put(nombre_sitio)

def navegar_atras(historiales:dict[str,Pila[str]], nombre_usuario:str):
    ultimo_sitio:str = historiales[nombre_usuario].get()
    anteultimo_sitio:str = historiales[nombre_usuario].get()

    historial_aux:Pila[str] = Pila()
    historial_aux.put(anteultimo_sitio)
    while(not historiales[nombre_usuario].empty()):
        sitio:str = historiales[nombre_usuario].get()
        historial_aux.put(sitio)
    historial_aux.put(ultimo_sitio)
    #historiales[nombre_usuario].clear()
    while (not historial_aux.empty()):
        elem:str = historial_aux.get()
        historiales[nombre_usuario].put(elem)
    
def imprimir(objeto):
    while(not objeto.empty()):
        elemento = objeto.get()
        print(elemento)

historiales:dict[str,Pila[str]] = crear_diccionario(lista_nombres_de_usuario)
visitar_sitio(historiales,"Nahuel","4")
visitar_sitio(historiales,"Nahuel","3")
navegar_atras(historiales,"Nahuel")
visitar_sitio(historiales,"Nahuel","2")
visitar_sitio(historiales,"Nahuel","1")
navegar_atras(historiales,"Nahuel")
imprimir(historiales["Nahuel"])

"""
-> vaciando: 1,2,3,4
-> 3,4 -> 4,3
-> 1,2,4,3
->al vacia el orden de obtencion deberia ser: 2,4,3,1
"""