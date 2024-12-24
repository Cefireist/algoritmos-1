def obtener_lineas_csv(nombre_archivo:str,delimiter:str) -> list:
    with open(nombre_archivo,"r") as file:
        texto = file.read()
    lineas:list = []
    linea:list= []
    palabra:str = ""
    for caracter in texto:
        if caracter == "\n":
            linea.append(palabra)
            lineas.append(linea)
            linea = []
            palabra=""
        elif caracter == delimiter:
            linea.append(palabra)
            palabra = ""
        else:
            palabra += caracter
    linea.append(palabra)
    lineas.append(linea)
    return lineas

def promedio_de_un_estudiante(libreta:str, filas:list[list[str]]) -> float:
    total:int = 0
    cant_materias:int = 0
    for fila in filas:
        if libreta == fila[1]:
            total += int(fila[3])
            cant_materias += 1
    return total/cant_materias

def calcular_promedio_por_estudiante(nombre_archivo:str):
    filas:list = obtener_lineas_csv(nombre_archivo,",")
    datos:dict = {}
    for fila in filas:
        libreta:str = fila[1]
        if not (libreta in datos.keys()):
            promedio:float = promedio_de_un_estudiante(libreta,filas)
            datos[libreta] = promedio
    return datos



print(calcular_promedio_por_estudiante("ej20csv.csv"))


    
