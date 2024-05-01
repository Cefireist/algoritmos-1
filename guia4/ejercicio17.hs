esFibonacci :: Integer -> Bool
esFibonacci p = perteneceFibonacci p 0

perteneceFibonacci :: Integer -> Integer -> Bool
perteneceFibonacci p  n | fibonacci n == p = True
                        | fibonacci n > p = False
                        | otherwise = perteneceFibonacci p (n+1) 


-- Arranca desde el cero 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597
fibonacci :: Integer -> Integer
fibonacci n | n <= 1 = n
            | otherwise = fibonacci(n-1) + fibonacci(n-2)
