esPar :: Integer -> Integer
esPar n | mod n 2 == 0 = n
        | otherwise = -1

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10 

compararPares :: Integer -> Integer
compararPares a | esPar (digitoUnidades a) > esPar (digitoUnidades (sacarUnidades a)) = (sacarUnidades (sacarUnidades a))*10 + digitoUnidades a
                | otherwise = sacarUnidades a

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar q    | sacarUnidades q == 0 = esPar q
                    | otherwise = mayorDigitoPar (compararPares q)