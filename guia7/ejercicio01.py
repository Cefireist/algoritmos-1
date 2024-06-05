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
            saldo += movimiento[1]
    return saldo


      
# si el elemento esta en la lista, devuelve su posicion. si no esta en la lista devuelve -1          
def obtener_posicion(letra:chr,lista:list[(chr,chr)]) -> int:
    posicion = -1
    for i in lista:
        posicion += 1
        if letra == i[0] or letra == i[1]:
            return posicion
    return -1

#print(obtener_posicion(('e','E'),[('a','A'),('e','E'),('i','I'),('o','O'),('u','U')]))

# recibe una posicion, una lista de tuplas y elimina la tupla en la posicion dada
def quitar(posicion:int, vocales:[(chr,chr)]) -> [(chr,chr)]:
    nuevo:[(chr,chr)]  = []
    for i in range(0, len(vocales)):
        if i != posicion:    
            nuevo.append(vocales[i])
    return nuevo

#print(quitar(1,[('a','A'),('e','E'),('i','I'),('o','O'),('u','U')]))

def tiene_tres_vocales_distintas(palabra:str) -> bool:
    n = 0
    vocales = [('a','A'),('e','E'),('i','I'),('o','O'),('u','U')]
    for letra in palabra:
        posicion = obtener_posicion(letra, vocales)
        if posicion != -1:
            n += 1
            vocales = quitar(posicion, vocales)
    return n >= 3

print(tiene_tres_vocales_distintas("jorgei"))