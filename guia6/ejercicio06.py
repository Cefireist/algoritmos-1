def imprimidor_hasta_diez():
    i:int = 1
    while i <= 10:
        print(i)
        i=i+1

def imprimidor_20_40():
    i:int = 20
    while i <= 40:
        print(i)
        i=i+2

def imprimidor_eco():
    i:int = 1
    while i <= 10:
        print("eco")
        i=i+1

def cuenta_regresiva(numero_inicial:int):
    while numero_inicial > 0:
        print(numero_inicial)
        numero_inicial = numero_inicial - 1
    
def viajar_al_pasado(anio_partida:int, anio_llegada:int) -> str:
    while anio_partida > anio_llegada:
        anio_partida = anio_partida - 1
        print("Viajó un año al pasado, estamos en el año: " + str(anio_partida))
        

# el anio es el -384
def conocer_a_aristoteles(anio_partida:int) -> str:
    while anio_partida - 20 >= -384: # cosa que no se pase
        anio_partida = anio_partida - 20
        print("Viajó veinte años al pasado, estamos en el año: " + str(anio_partida))
    print("programa termino")
        