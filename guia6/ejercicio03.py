def alguno_es_0(numero1: int, numero2: int) -> bool:
    return (numero1 == 0 or numero2 == 0) 

def ambos_son_0(numero1: int, numero2: int) -> bool:
    return (numero1 == 0 and numero2 == 0)

def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) >= 3 and len(nombre) <= 8

def es_bisiesto(anio: int) -> bool:
    return (anio % 400 == 0) or (anio % 4 == 0 and anio % 100 != 0)