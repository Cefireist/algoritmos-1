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

ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = x == y && x == 0 

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y  | x <= 3 && y <= 3 = True
                    | x <= 7 && y <= 7 = True        
                    | x > 7 && y > 7 = True
                    | otherwise = False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | x == y && x == z && y == z = 0
                    | x == y = z
                    | x == z = y
                    | y == z = x
                    | otherwise = x + y + z

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y = mod x y == 0

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

digitoDecenas :: Integer -> Integer
digitoDecenas x = digitoUnidades(div x 10)

