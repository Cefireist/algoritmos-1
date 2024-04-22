sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

sumaDigitos :: Integer -> Integer
sumaDigitos n   | n < 10 = n
                | otherwise = digitoUnidades n + sumaDigitos (sacarUnidades n)

