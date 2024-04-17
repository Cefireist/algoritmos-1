absoluto :: Float -> Float
absoluto x  | x < 0 = -x
            | otherwise = x
    
maximoabsoluto :: Float -> Float -> Float
maximoabsoluto x y  | absoluto x >= absoluto y = x
                    | otherwise = y 

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z   | x >= y && x >= z = x
                | y >= x && y >= z = y
                | otherwise = z

algunoEs0 :: Float -> Float -> Bool
algunoEs0 p q   | p == 0 || q == 0 = True
                | otherwise = False
algunoEs0_v2 :: Float -> Float -> Bool
algunoEs0_v2 p q = p*q == 0