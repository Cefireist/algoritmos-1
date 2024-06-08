from queue import LifoQueue as Pila

caracteres_validos:list[chr] = ['*','/','+','-','(',')',' ']
numeros:list[chr] = ['0','1','2','3','4','5','6','7','8','9']

def esta_bien_balanceada(la_ecuacion:str) -> bool:
    ecuacion:Pila[chr] = Pila()
    for i in la_ecuacion:
        ecuacion.put(i)
    contador_parentesis: int = 0

    while(not(ecuacion.empty())):
        caracter = ecuacion.get()
        if caracter == ")":
            contador_parentesis += 1
        elif caracter == "(":
            contador_parentesis -= 1
        if contador_parentesis < 0 or (ecuacion.empty() and contador_parentesis != 0):
            return False
    return True


def caracter_es_valido(caracter:chr) -> bool:
    if caracter in caracteres_validos or caracter in numeros:
        return True
    else: 
        return False
print(esta_bien_balanceada("1 + ) 2 x 3 ( ( )"))