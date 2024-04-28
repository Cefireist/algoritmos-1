f1 :: Integer -> Integer
f1 n    | n == 0 = 1
        | otherwise = 2^n + f1 (n-1)

f2 :: Integer->Integer->Integer
f2 n q  | n <= 1 = q
        | otherwise = q^n + f2 (n-1) q

f3 :: Integer->Integer->Integer
f3 n q  | n <= 1 = q
        | otherwise = f2 n q + (q^n)*f2 n q

f4 :: Integer->Integer->Integer
f4 n q  | n <= 1 = q
        | otherwise = (q^n)*f2 n q