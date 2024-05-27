def lindo_nombre (nombre: str) -> str:
    if len(nombre) >= 5: return "Tu nombre tiene muchas letras"
    else: return "Tu nombre tiene menos de 5 caractere"

def elRango(numero: float) -> str:
    if numero > 20: return "Mayor a 20"
    elif numero >= 10: return "Entre 10 y 20"
    elif numero >= 5: return "Entre 5 y 10"
    else: return "Menor a 5"

def decididor_de_destinos(edad:int, sexo:chr) -> str:
    if edad <= 18 or edad >= 65: return "Anda de vacaciones"
    elif edad >= 60 and sexo == 'F':
        return "Anda de vacaciones"
    else: return "Te toca trabajar"
