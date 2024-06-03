def devolver_el_doble_si_es_par(numero:float) -> float:
    if numero % 2 == 0:
        return 2*numero
    else:
        return numero

# pienso en los requiere que numero es un entero     
def devolver_valor_si_es_par_sino_el_que_sigue(numero:int) -> int:
    if numero % 2 == 0:
        return numero
    else:
        return numero + 1   

# alternativa con dos ifs
def devolver_valor_si_es_par_sino_el_que_sigue2(numero:int) -> int:
    if numero % 2 == 0:
        return numero
    if numero % 2 != 0:
        return numero + 1
# un numero multiplo de 9 en particular tambien es multplo de 3, voy a considerar los casos donde sea
# multiplo de 9 devolviendo el triple, y cuando solo sea multiplo de 3 el doble
 
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 3 == 0:
        if numero % 9 == 0:
            return 3*numero
        else:
            return 2*numero
    else:
        return numero

        

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

