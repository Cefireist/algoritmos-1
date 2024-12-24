def sumar_a_diccionario(key:str,diccionario:dict) -> dict:
    if not(key in diccionario.keys()):
        diccionario[key] = 1
    else:
        diccionario[key] += 1

def extraer_frecuencias_palabras(texto:str) -> dict:
    palabras:dict = {}
    palabra:str = ""
    for caracter in texto:
        if caracter == " " or caracter == "\n":
            sumar_a_diccionario(palabra,palabras)
            palabra = ""
        else:
            palabra += caracter
    sumar_a_diccionario(palabra,palabras)
    print(palabras)
    return palabras

def obtener_maximos(frecuencias_palabras:list[tuple[str,int]]) -> list[tuple[str,int]]:
    maximo:int = -1
    mas_frecuentes:list[str] = []
    for tupla in frecuencias_palabras:
        if maximo < tupla[1]:
            maximo = tupla[1]
    for tupla in frecuencias_palabras:
        if maximo == tupla[1]:
            mas_frecuentes.append(tupla)
    return mas_frecuentes


def la_palabra_mas_frecuente(nombre_archivo:str) -> str:
    with open(nombre_archivo,"r") as file:
        texto = file.read()
    frecuencias_palabras:dict = extraer_frecuencias_palabras(texto)
    palabras:list[str] = obtener_maximos(frecuencias_palabras.items())
    return palabras

print(la_palabra_mas_frecuente("ej21texto.txt"))



