g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g