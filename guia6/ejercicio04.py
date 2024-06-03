def peso_pino(altura: float) -> float:
    if altura > 3:
        return 900 + (altura-3)*100*2
    else:
        return altura*100*2
    
def es_peso_util(peso: int) -> bool:
    return (peso > 400) and (peso < 1000)

def sirve_pino(altura: float) -> bool:
    return es_peso_util(peso_pino(altura))