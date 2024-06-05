def promedio(notas:list[int]) -> float:
    suma_notas = 0
    for i in notas:
        suma_notas += i
    return suma_notas/len(notas)

def todos_mayores_a_n(n:int, numeros:list[int]) -> bool:
    for i in numeros:
        if i < n:
            return False
    return True

def aprobado(notas:list[int]):
    if todos_mayores_a_n(4, notas):
        if promedio(notas) >= 7:
            return 1
        else:
            return 2
    else:  
        return 3



print(aprobado([7,8,9]))
print(aprobado([4,10,10]))
print(aprobado([5,6,7]))
print(aprobado([3,9,9]))