
def obtener_lineas(texto:str) -> list[str]:
    lineas:list[str] = []
    linea:str = ""
    for i in texto:
        if i == '\n':
            lineas.append(linea)
            linea = ""
        else:
            linea += i
    lineas.append(linea)
    return lineas
def invertir_lineas(nombre_archivo_a_invertir:str):
    with open(nombre_archivo_a_invertir, 'r') as file:
        info_leida = file.read()
    lineas = obtener_lineas(info_leida)
    nueva_info:str = ""
    for i in range(0,len(lineas)):
        nueva_info += lineas[len(lineas)-1-i] + '\n'
    with open("/home/saludos/Desktop/algoritmos-1/guia8/" + "invertido_ej03texto.txt", 'a') as file:
        file.write(nueva_info)
invertir_lineas("/home/saludos/Desktop/algoritmos-1/guia8/ej03texto.txt")