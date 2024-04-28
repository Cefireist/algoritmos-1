
factorial :: Float -> Float
factorial n | n <= 1 = 1
            | otherwise = n*factorial(n-1)

eAprox :: Integer -> Float
eAprox n    | n == 0 = 1
            | otherwise =  (1 / factorial (fromIntegral n)) + eAprox (n-1)

e :: Float
e = eAprox 10