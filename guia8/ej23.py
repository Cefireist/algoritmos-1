inventario:dict[str,dict[str,float,int]] = {}
def agregar_producto(inventario:dict[str,dict[str,float,int]],nombre:str,precio:float,cantidad:int):
    datos_producto:dict[str,float,int] = {}
    datos_producto["cantidad"] = cantidad
    datos_producto["precio"] = precio
    inventario[nombre] = datos_producto

def actualizar_stock(inventario:dict[str,dict[str,float,int]],nombre:str,cantidad:int):
    if nombre in inventario.keys():
        inventario[nombre]["cantidad"] = cantidad

def actualizar_precio(inventario:dict[str,dict[str,float,int]],nombre:str,precio:float):
    if nombre in inventario.keys():
        inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario:dict[str,dict[str,float,int]]) -> float:
    total:float = 0
    for nombre_producto in inventario.keys():
        datos_producto:dict[str,float,int] = inventario[nombre_producto]
        total += datos_producto["precio"]*datos_producto["cantidad"]
    return total

agregar_producto(inventario, "sandias", 5000.0, 10)
agregar_producto(inventario, "naranja", 30.0, 1200)
actualizar_stock(inventario, "sandias", 5)
actualizar_stock(inventario,"naranja",20)
# argentina
actualizar_precio(inventario,"naranja",2000)
actualizar_precio(inventario,"sandias",10000)
agregar_producto(inventario,"kiwi",5,12000)
valor_total = calcular_valor_inventario(inventario)
print("Valor total del inventario:", valor_total) # Deberiıa imprimir
# 5*10.000 + 20*2.000+5*12.000 = $ 150.000