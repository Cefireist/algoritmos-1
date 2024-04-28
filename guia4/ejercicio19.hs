sumanprimeroskprimos :: Integer -> Integer
sumanprimeroskprimos n  | i == 1 = 0
                        | otherwise = mod k (i-1)
menorDivisorHasta :: Integer -> Integer -> Integer
menorDivisor n i    | mod n i == 0 = 1
                    | otherwise = menorDivisorHasta n (i+1)
divisible :: Integer -> Integer
divisible n m   | mod n m == 0 = m
