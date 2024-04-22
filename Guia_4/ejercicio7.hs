sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

todosDigitosIguales :: Integer ->Bool
todosDigitosIguales n   | n < 10 = True
                        | digitoUnidades n /= digitoUnidades (sacarUnidades n) = False
                        | otherwise = todosDigitosIguales (sacarUnidades n)