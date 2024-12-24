from queue import Queue as Cola

def n_pacientes_urgentes(cola_pacientes:Cola[(int,str,str)]) -> int:
    nueva_cola:Cola[(int,str,str)] = Cola()
    pacientes_urgentes: int = 0
    while(not cola_pacientes.empty()):
        tripla:tuple[int,str,str] = cola_pacientes.get()
        nueva_cola.put(tripla)
        if tripla[0] >= 1 and tripla[0] <= 3:
            pacientes_urgentes += 1
    cola_pacientes = nueva_cola
    return pacientes_urgentes

cola_prueba:tuple[int,str,str] = Cola()
for i in range(0,6):
    tripla:tuple[int,str,str] = (i,"enriquencio","cirugia")
    cola_prueba.put(tripla)

print(n_pacientes_urgentes(cola_prueba))
