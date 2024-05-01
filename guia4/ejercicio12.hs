raizDeDos :: Integer -> Float
raizDeDos n = -1 + serie n
serie :: Integer -> Float
serie n | n == 1 = 2
        | otherwise = 2 + 1 / (serie (n-1))