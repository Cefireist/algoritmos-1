sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

cantDigitos :: Integer -> Integer
cantDigitos n   | n < 10 = 1
                | otherwise = 1 + cantDigitos (sacarUnidades n)

iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i    | ((cantDigitos n) - i) == 0 = digitoUnidades n
                    | otherwise = iesimoDigito (div n 10) (i)

