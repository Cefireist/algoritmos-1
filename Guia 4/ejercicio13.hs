dobleSumaPot :: Integer -> Integer -> Integer
dobleSumaPot n m   | n == 0 = 0 
                   | otherwise = dobleSumaPot (n-1) m + simpleSuma n m
simpleSuma :: Integer -> Integer -> Integer
simpleSuma i j  | j == 1 = i 
                | otherwise = i^j + simpleSuma i (j-1)

