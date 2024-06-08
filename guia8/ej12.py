from queue import LifoQueue as Pila

def imprimir_pila(pila:Pila[int]):
    a_lista:list[int] = []
    while(not(pila.empty())):
        a_lista.append(pila.get())
    a_lista.reverse()
    print(a_lista)

def ejecutar_operacion(numero_1:int , numero_2:int , operacion:chr) -> float:
    if operacion == "+":
        return numero_1 + numero_2
    elif operacion == "-":
        return numero_1 - numero_2
    elif operacion == "*":
        return numero_1 * numero_2
    else:
        return numero_1 / numero_2

def evaluar_expresion(expresion:str) -> float:
    ecuacion:Pila[float] = Pila()
    resultado:Pila[float] = Pila()
    operadores:list[chr] = ['*','/','+','-']
    numero:str = ""
    for i in range(len(expresion)-1,-1,-1):
        ecuacion.put(expresion[i])
    while (not(ecuacion.empty())):
        caracter = ecuacion.get()
        if (caracter in operadores):
            numero_1:float = float(resultado.get())
            numero_2:float = float(resultado.get())
            resultado.put(ejecutar_operacion(numero_2,numero_1,caracter))
        elif caracter == " " and numero != "":
            resultado.put(numero)
            numero = ""
        else:
            numero += caracter
    return resultado.get()

print(evaluar_expresion("3 4 + 5 * 2 - 3.14 + 0 - 1 *"))