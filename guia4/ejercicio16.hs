menorDivisor :: Integer -> Integer
menorDivisor n  = esDivisible n 2 

esDivisible :: Integer -> Integer-> Integer
esDivisible n p | n == 1 = 1 
                | mod n p == 0 = p
                | otherwise = esDivisible n (p+1)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

sonCoprimos :: Integer ->Integer ->Bool
sonCoprimos p q | p == 1 || q == 1 = True
                | mod p (menorDivisor q) == 0 = False
                | otherwise =  sonCoprimos p (div q (menorDivisor q)) -- va como el mayor divisor

nEsimoPrimo2 :: Integer -> Integer
nEsimoPrimo2 n = contador n 2 

contador :: Integer -> Integer -> Integer
contador a b    | a == 0 = b-1
                | menorDivisor b == b = contador (a-1) (b+1) 
                | otherwise = contador a (b+1)
-- mejor solucion me parece esta aunque ambas funcionan
siguientePrimo :: Integer -> Integer
siguientePrimo 1 = 2
siguientePrimo n    | esPrimo n = n
                    | otherwise = siguientePrimo (n+1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n   | n == 1 = 2
                | otherwise = siguientePrimo (1+nEsimoPrimo(n-1))