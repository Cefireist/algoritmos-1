ruta = "/home/saludos/Desktop/algoritmos-1/guia8/ej02texto.txt"
ruta_nuevo_archivo = "/home/saludos/Desktop/algoritmos-1/guia8/"

def obtener_lineas(texto:str) -> list[str]:
    lineas:list[str] = []
    linea = ""
    for i in texto:
        if i != '\n':
            linea += i
        else:
            lineas.append(linea)
            linea = ""
    lineas.append(linea)
    return lineas

def clonar_sin_comentarios(nombre_archivo:str, nombre_archivo_clonado):
    texto_nuevo:str = ""
    with open(nombre_archivo, 'r', encoding="utf-8") as file:
        informacion_leida = file.read()
        lineas:list[str] = obtener_lineas(informacion_leida)
        print(lineas)
        for linea in lineas:
            primer_caracter:chr = ' '
            for j in linea:
                if j != ' ' and primer_caracter == ' ':
                    primer_caracter = j
            if primer_caracter != "#":
                texto_nuevo += linea
                texto_nuevo += '\n'
    with open(ruta_nuevo_archivo + nombre_archivo_clonado, 'a', encoding="utf-8") as file_to_write:
        file_to_write.write(texto_nuevo)

