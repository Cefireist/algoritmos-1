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

esCapicua :: Integer -> Bool
esCapicua n | iesimoDigito n 1 /= iesimoDigito n (cantDigitos n) = False
            | cantDigitos n == 1 = True
            | otherwise = esCapicua (sacarUnidades(n-(10^cantDigitos n)*iesimoDigito n 1))