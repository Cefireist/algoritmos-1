# ejercicio 1
from queue import Queue as Cola
import random

def imprimir(objeto):
    while(not objeto.empty()):
        elemento = objeto.get()
        print(elemento)


def unir_colas(cola1:Cola[tuple[str,str]],cola2:Cola[tuple[str,str]]):
    cola_concatenada:Cola[tuple[str,str]] = Cola()
    while (not cola1.empty()):
        cola_concatenada.put(cola1.get())
    while (not cola2.empty()):
        cola_concatenada.put(cola2.get())
    return cola_concatenada

def reordenar_cola_priorizando_vips(fila_clientes:Cola[tuple[str,str]]) -> Cola[tuple[str,str]]:
    copia_fila:Cola[tuple[str,str]] = Cola()
    cola_vip:Cola[tuple[str,str]] = Cola()
    cola_normal:Cola[tuple[str,str]] = Cola()
    while (not fila_clientes.empty()):
        tupla:tuple[str,str] = fila_clientes.get()
        copia_fila.put(tupla)
        if tupla[1] == "vip":
            cola_vip.put(tupla)
        else:
            cola_normal.put(tupla)
    fila_clientes = copia_fila # parametro del tipo in
    return unir_colas(cola_vip,cola_normal)

"""
# testing
cola_prueba:Cola[(str,str)] = Cola()
nombres:list[str] = ["juan","pedro","ana","ruben","cacho","anahi","nahuel"]
clases:list[str] = ["vip","comun"]
for i in range(0,7):
    tupla:tuple[str,str] = (nombres[i],random.choice(clases))
    cola_prueba.put(tupla)
    print(tupla)
print("")

imprimir(reordenar_cola_priorizando_vips(cola_prueba))

# en este ejemplo el primeri en llegar es juan, tiene que ser el primero atendido
# al imprimir se tiene que respetar eso, el primero que tengo que poner en la cola es el primero atendido
"""
def jugar_ronda(estrategia_jug1:str,estrategia_jug2:str) -> tuple[int,int]:
    if estrategia_jug1 == "me desvio siempre" and estrategia_jug2 == "me desvio siempre":
        return (-10,-10)
    elif estrategia_jug1 == "me desvio siempre" and estrategia_jug2 == "me la banco y no me desvio":
        return (-15,10)
    elif estrategia_jug1 == "me la banco y no me desvio" and estrategia_jug2 == "me desvio siempre":
        return (10,-15)
    elif estrategia_jug1 == "me la banco y no me desvio" and estrategia_jug2 == "me la banco y no me desvio":
        return (-5,-5)


def eliminar_elem_str(elem:str, lista:list[str]) -> list[str]:
    nueva_lista:list[str] = []
    for elemento in lista:
        if elemento != elem:
            nueva_lista.append(elemento)
    return nueva_lista



def torneo_de_gallinas(estrategias:dict[str,str]) -> dict[str,int]:
    resultado_torneo:dict[str,int] = {}
    llaves:list[str] = estrategias.keys()
    for nombre1 in estrategias.keys():
        llaves = eliminar_elem_str(nombre1,llaves)
        for nombre2 in llaves:
            res_jugada:tuple[int,int] = jugar_ronda(estrategias[nombre1],estrategias[nombre2]) 
            if (nombre1 in resultado_torneo.keys()):
                resultado_torneo[nombre1] += res_jugada[0]
            else:
                resultado_torneo[nombre1] = res_jugada[0]
            if (nombre2 in resultado_torneo.keys()):
                resultado_torneo[nombre2] += res_jugada[1]
            else:
                resultado_torneo[nombre2] = res_jugada[1]
    return resultado_torneo
"""
# Testing
torneo:dict[str,str] = {}
tipo_de_estrategia:list = ["me desvio siempre", "me la banco y no me desvio"]
nombres:list[str] = ["juan","pedro","ana","ruben","cacho","anahi","nahuel"]
for i in range(0,2):
    torneo[nombres[i]] = random.choice(tipo_de_estrategia)
    print(str(nombres[i]) + " :  " + str(torneo[nombres[i]]))

print("")
print(torneo_de_gallinas(torneo))
"""
def obtener_transpuesta(matriz:list[list[str]]) -> list[str]:
    matriz_transpuesta:list[str] = []
    for nro_columna in range(0,len(matriz)):
        palabra:str = ""
        for i in range(0,len(matriz)):
            caracter:str = matriz[i][nro_columna]
            if caracter == "":
                palabra += "/"
            else:
                palabra += caracter
        matriz_transpuesta.append(palabra)
    return matriz_transpuesta
def quien_gano_el_tateti_facilito(inf_tablero:list[list[str]]) -> int:
    transpuesta:list[list[str]] = obtener_transpuesta(inf_tablero)
    gano_ana = False
    gano_beto = False
    for columna in transpuesta:
        if "XXX" in columna:
            gano_ana = True
        if "OOO" in columna:
            gano_beto = True
    if gano_ana and not gano_beto:
        return 1
    elif not(gano_ana) and gano_beto:
        return 2
    elif gano_ana and gano_beto:
        return 3
    else:
        return 0
"""
#Testing
matriz:list[list[str]] = [
    ["","X","","","",""],
    ["","X","","X","",""],
    ["","X","","O","",""],
    ["","O","","X","",""],
    ["","X","","O","",""],
    ["","O","","X","",""]
]
print(quien_gano_el_tateti_facilito(matriz))
"""
# no se cual esta permitido bien, creo que el dos seguro
#def es_palindromo(texto:str) -> bool:
#    for index in range(0,len(texto)):
#        if texto[index] != texto[len(texto)-1-index]:
#            return False
#    return True

def es_palindromo2(texto_lista:list[str]) -> bool:
    lista_desarmable:list[str] = texto_lista.copy()
    reversa:list[str] = []
    longitud:int = len(texto_lista)
    for i in range(0,longitud):
        reversa.append(lista_desarmable.pop())
    return reversa == texto_lista

def eliminar_primer_elemento(lista:list[str]) -> list[str]:
    nueva_lista:list[str] = []
    for index in range(0,len(lista)):
        if index != 0:
            nueva_lista.append(lista[index])
    return nueva_lista

def texto_a_lista(texto:str) -> list[str]:
    lista:list[str] = []
    for i in texto:
        lista.append(i)
    return lista

def cuantos_sufijos_son_palindromos(texto:str) -> int:
    listado_texto:list[str] = list(texto)
    contador_palindromos:int = 0
    for i in range(0,len(texto)):
        if es_palindromo2(listado_texto):
            contador_palindromos += 1
        listado_texto = eliminar_primer_elemento(listado_texto)
    return contador_palindromos

#print(es_palindromo2(["n","e","u","q","u","e","n"]))
print(cuantos_sufijos_son_palindromos("mmmmmmmm"))