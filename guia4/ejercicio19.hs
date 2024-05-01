esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos q = iterador q 1

iterador :: Integer -> Integer -> Bool
iterador a b    | sumaPrimerosKprimos b == a = True
                | sumaPrimerosKprimos b > a = False
                | otherwise = iterador a (b+1)

sumaPrimerosKprimos :: Integer -> Integer
sumaPrimerosKprimos a   | a == 0 = 0
                        | otherwise = nEsimoPrimo2 a + sumaPrimerosKprimos (a-1) 

menorDivisor :: Integer -> Integer
menorDivisor n  = esDivisible n 2 

esDivisible :: Integer -> Integer-> Integer
esDivisible n p | n == 1 = 1 
                | mod n p == 0 = p
                | otherwise = esDivisible n (p+1)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

nEsimoPrimo2 :: Integer -> Integer
nEsimoPrimo2 n = contador n 2 

contador :: Integer -> Integer -> Integer
contador a b    | a == 0 = b-1
                | menorDivisor b == b = contador (a-1) (b+1) 
                | otherwise = contador a (b+1)