def crear_lista_con_nombres() -> list[str]:
    nombre:str = ""
    lista_de_nombres: list[str] = []
    while nombre != "listo":
        nombre = input("ingrese nombre: ")
        if nombre != "listo":
            lista_de_nombres.append(nombre)

    return lista_de_nombres

def historial_sube() -> [(chr,int)]:
    historial:(chr,int) = []
    saldo = 0
    operacion:chr = ''
    while operacion != "X":
        operacion = input("ingrese operacion: ")
        if operacion == "C":
            cargar = input("ingrese monto a cargar: ")
            saldo += int(cargar)
            historial.append((operacion,saldo))
        elif operacion == "D":
            descontar = input("ingrese monto a descontar: ")
            saldo -= int(descontar)
            historial.append((operacion,saldo))
    return historial

import random

def obtener_numero_entre_1_12() -> int:
    numeros:list[int] = [0,1,2,3,4,5,6,7,10,11,12]
    numero_aleatorio:int = random.randint(0,10)
    return numeros[numero_aleatorio]


def jugar_siete_y_medio() -> list[int]:
    suma: int = 0 
    seguir_sacando: int = 1
    historial:list[int] = []
    while suma <= 7.5 and seguir_sacando == 1:
        carta: int = obtener_numero_entre_1_12()
        print("Se obtuvo la carta: " + str(carta))
        if carta >= 10:
            suma += 0.5
        else:
            suma += carta
        historial.append(carta)
        if suma > 7.5:
            print("Perdiste")
        seguir_sacando = 2
        while seguir_sacando == 2 and suma <= 7.5:
            seguir_juego:str = input("seguir juego ?: ")
            if seguir_juego == "si":
                seguir_sacando = 1
            elif seguir_juego == "no":
                seguir_sacando = 0
    return historial


