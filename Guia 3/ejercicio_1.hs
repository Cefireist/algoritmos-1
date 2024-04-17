f :: Integer -> Integer
f n | 1 = 8
    | 4 = 131
    | 16 = 16

g :: Integer -> Integer
g n | 8 = 16
    | 16 = 4
    | 131 = 1

h :: Integer -> Integer
h n = f(g n)

k :: Integer -> Integer
k n = g.f n
