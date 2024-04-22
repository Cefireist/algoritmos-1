sumaImpares :: Integer ->Integer
sumaImpares n   | n == 0 = 0
                | otherwise = 2*n -1 + sumaImpares (n-1)
