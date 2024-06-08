ruta = "/home/saludos/Desktop/algoritmos-1/guia8/ej04texto.txt"
def agregar_frase_al_final(nombre_archivo:str, frase:str):
    with open (nombre_archivo,'a') as file:
        #texto += " " + str(frase)
        file.write(" " + str(frase))
agregar_frase_al_final(ruta, "un lindo dia para tomar sol")