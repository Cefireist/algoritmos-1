absoluto :: Integer -> Integer
absoluto x  | x < 0 = -x
            | otherwise = x

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod (absoluto x) 10 + mod (div (absoluto x) 10) 10

comparar :: Integer ->Integer ->Integer
comparar a b    | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
                | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
                | otherwise = 0