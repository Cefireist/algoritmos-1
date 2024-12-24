def extraer_palabras(texto:str) -> list[str]:
    palabra:str = ""
    palabras:list[str] = []
    for letra in texto:
        if letra == " " and palabra != "":
            palabras.append(palabra)
            palabra = ""
        else:
            palabra += letra
    palabras.append(palabra)
    return palabras

def agrupar_por_longitud(nombre_archivo:str) -> dict:
    with open(nombre_archivo,"r") as archivo:
        texto_archivo:str = archivo.read()
        print(texto_archivo)
    lista_palabras:list[str] = extraer_palabras(texto_archivo)
    print(lista_palabras)
    mi_diccionario:dict = {}
    for palabra in lista_palabras:
        longitud:str = str(len(palabra))
        if not (longitud in mi_diccionario.keys()):
            mi_diccionario[longitud] = 1
        else:
            mi_diccionario[longitud] += 1
    return mi_diccionario

print(agrupar_por_longitud("ej19texto.txt"))

