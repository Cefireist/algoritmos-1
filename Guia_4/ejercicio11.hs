
factorial :: Float -> Float
factorial n | n == 2 = 2
            | otherwise = n*factorial(n-1)

eAprox :: Float -> Float
eAprox n    | n == 1 = 1
            | otherwise =  1 + 1 / factorial (n-1)