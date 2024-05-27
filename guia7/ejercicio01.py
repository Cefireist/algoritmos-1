# pastebin.com/xabaQTyv

def pertenece1(s:list[int], e:int) -> bool:
    salida = False
    for i in s:
        if e == i:
            salida = True
            break
    return salida

def pertenece2(s:list[int], e:int) -> bool:
    salida = False
    i:int = 0
    while i < len(s) and salida == False:
        if e == s[i]:
            salida = True
    return salida

def pertenece3(s:list[int], e:int) -> bool:
    salida = False
    for i in range(0,len(s)-1):
        if e == i:
            salida = True
            break
    return salida

def divide_a_todos(numeros: list[int], divisor:int) -> bool:
    divide_a_todos = True
    for i in numeros:
        if i % divisor != 0:
            divide_a_todos = False
            break

def suma_total(numeros:list[int]) -> int:
    total = 0
    for i in numeros:
        total = total + i
    return total


def ordenados(numeros:list[int]) -> list[int]:
    lista_ordenada:list[int] = []
    longitud = len(numeros)
    for i in range(0,longitud-1):
        lista_ordenada.append(min(numeros))
        numeros.remove(min(numeros))
    return lista_ordenada

def palabra_con_mas_de_7_letras(palabras: list[str]) -> bool:
    palabra_larga = False
    for palabra in palabras:
        if len(palabra) > 7:
            palabra_larga = True
    return palabra_larga 


def es_palindromo(palabra:str) -> bool:
    longitud = len(palabra)
    palindromo = True
    for i in range(0,longitud):
        if palabra[i] != palabra[longitud-i-1]:
            palindromo = False
            break
    return palindromo

def fortaleza_contrasena(contrasena:str) -> str:
    longitud = len(contrasena)
    if longitud < 5:
        return "ROJO"
    elif es_verde(contrasena):
        return "VERDE"
    else:
        return "AMARILLO"

def es_verde(contrasena:str) -> bool:
    mayus = False
    numero = False
    minuscula = False
    for i in contrasena:
        if ord(i) <= 90 and ord(i) >= 65:
            mayus = True
        elif ord(i) >= 97 and ord(i) <= 122:
            minuscula = True
        elif ord(i) >= 48 and ord(i) <= 57:
            numero = True
    return mayus and numero and minuscula

def saldo_actual(historial:list[(chr,int)]) -> int:
    saldo:int = 0
    for movimiento in historial:
        if movimiento[0] == 'R':
            saldo -= movimiento[1]
        elif  movimiento[0] == 'I':
            saldo += movimiento[i]
    return saldo


def pertenece(letra:chr,lista:list[(chr,chr)]) -> (chr,chr):
    for i in lista:
        if letra == i[0] or letra == i[1]:
            return i
def es_vocal(letra:chr) -> bool:
    vocales = [('a','A'),('e','E'),('i','I'),('o','O'),('u','U')]
    return pertenece(letra,vocales)

def quitar(vocal:(chr,chr), vocales:[(chr,chr)]) -> [(chr,chr)]:
    nuevo:[(chr,chr)]  = []
    for i in vocales:
        if i != vocal:    
            nuevo.append(i)
    return nuevo

def tiene_tres_vocales_distintas(palabra:str) -> bool:
    n= 0
    vocales = ['a','e','i','o','u','A','E','I','O','U']
    for letra in palabra:
        if pertenece(letra,vocales_minus):
            n += 1
            quitar letra,vocales
