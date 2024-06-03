def imprimir_saludo(nombre: str):
    print("hola " + nombre)

def raiz_cuadrada_de(numero: float) -> float:
    return numero**(0.5)

def fahrenheit_a_celcius(temperatura: float) -> float:
    return (temperatura-32)*(5/9)

def imprimir_dos_veces(estribillo: str):
    print(estribillo*2)

def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    cantidad_pizzas: int = comensales*min_cant_de_porciones // 8 
    if comensales*min_cant_de_porciones % 8 > 0:
        return cantidad_pizzas + 1
    else:
        return cantidad_pizzas
def cantidad_de_pizzas2_aux(comensales: int, min_cant_porciones: int, pizzas: int) -> int:
    #print(pizzas)
    if comensales*min_cant_porciones -8*pizzas < 0:
        return pizzas
    else:
        return cantidad_de_pizzas2_aux(comensales, min_cant_porciones, pizzas +1)

def cantidad_de_pizzas2(comensales: int, min_cant_porciones: int) -> int:
    return cantidad_de_pizzas2_aux(comensales, min_cant_porciones, 0)

def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)