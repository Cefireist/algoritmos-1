sumaPotencias :: Integer ->Integer ->Integer ->Integer
sumaPotencias q n m | n == 0 = 0
                    | otherwise = sumaSimple q n m + sumaPotencias q (n-1) m

sumaSimple :: Integer -> Integer -> Integer -> Integer
sumaSimple q n m    | m == 0 = 0
                    | otherwise = q^(n+m) + sumaSimple q n (m-1) 


