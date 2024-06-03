def poner_cero_en_posicion_par(lista:list[float]) -> None:
    for i in range (0,len(lista),2):
        lista[i] = 0

def poner_cero_en_posicion_par2(lista:list[float]) -> [float]:
    nueva_lista = lista.copy()
    for i in range (0,len(nueva_lista),2):
        nueva_lista[i] = 0
    return nueva_lista

def pertenece_a_la_lista(letra:chr,lista:list[(chr,chr)]) -> int:
    for i in lista:
        if letra == i[0] or letra == i[1]:
            return True
    return False

def quitar_vocales(palabra:str) -> str:
    nueva_palabra:str = ""
    vocales = [('a','A'),('e','E'),('i','I'),('o','O'),('u','U')]
    for letra in palabra:
        if not (pertenece_a_la_lista(letra, vocales)):
            nueva_palabra += letra
    return nueva_palabra


def pertenece(letra:chr, lista:[chr]) -> bool:
    for i in lista:
        if letra == i:
            return True
    return False

def reemplazar_vocales(palabra:str) -> str:
    nueva_palabra:str = ""
    vocales = ['a','e','i','o','u']
    for letra in palabra:
        if pertenece(letra, vocales):
            nueva_palabra += '-'
        else:
            nueva_palabra += letra
    return nueva_palabra

def da_vuelta_str(palabra:str) -> str:
    reversa:str = ""
    for indice in range(0,len(palabra)):
        reversa += palabra[len(palabra)-1-indice]
    return reversa

# deja la primera aparicion del elemento
def eliminar_repetidos(palabra:str) -> str:
    sin_repetidos:str = ""
    for letra in palabra:
        if not pertenece(letra,sin_repetidos):
            sin_repetidos += letra
    return sin_repetidos


