
def agregar_frase_al_principio(nombre_archivo:str, frase:str):
    with open(nombre_archivo,"r") as file:
        texto = file.read()
    with open(nombre_archivo,"w") as file:
        file.write(str(frase) + " " + str(texto))

ruta = "/home/saludos/Desktop/algoritmos-1/guia8/ej05texto.txt"
agregar_frase_al_principio(ruta,"como esta el dia hoy eh ?")