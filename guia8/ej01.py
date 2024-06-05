def contar_lineas(nombre_archivo:str) -> int:
    with open(nombre_archivo, 'r', encoding="utf-8") as file:
        informacion_leida = file.read()
        contador:int = 1
        for i in informacion_leida:
            if i == "\n":
                contador += 1
    return contador

# print(contar_lineas("/home/saludos/Desktop/algoritmos-1/guia8/ej01.txt"))
def obtener_palabras(texto:str) -> list[str]:
    palabras:list[str] = []
    palabra:str = ""
    elem_anterior:chr = ' '
    for i in texto:
        if i != '\n' and i != ' ':
            palabra += i
        else:
            if elem_anterior != '\n' and elem_anterior != ' ':
                palabras.append(palabra)
                palabra = ""
        elem_anterior = i
    return palabras

def pertenece(lista:list[str], elemento:str) -> bool:
    for i in lista:
        if i == elemento:
            return True
    return False
def existe_palabra(nombre_archivo:str, palabra:str) -> bool:
    with open(nombre_archivo, 'r', encoding="utf-8") as file:
        informacion_leida = file.read()
        palabras = obtener_palabras(informacion_leida)
    return pertenece(palabras,palabra)

# print(existe_palabra("/home/saludos/Desktop/algoritmos-1/guia8/ej01.txt","some"))

def cantidad_de_apariciones(nombre_archivo:str, palabra:str) -> bool:
    with open(nombre_archivo, 'r', encoding="utf-8") as file:
        informacion_leida = file.read()
        palabras:list[str] = obtener_palabras(informacion_leida)
    contador:int = 0
    for i in palabras:
        if palabra == i:
            contador += 1
    return contador

#print(cantidad_de_apariciones("/home/saludos/Desktop/algoritmos-1/guia8/ej01.txt","some"))