third :: (Integer,Integer,Integer) -> Integer
third (x,y,z) = z

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt x y = (fst x) * (fst y) + (snd x) * snd(y)

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor x y = (fst x) < (fst y) && (snd x) < (snd y)

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos x y = (((fst x) - (fst y))**2 + ((snd x) - snd(y))**2)**0.5

sumaTerna :: (Integer,Integer,Integer) -> Integer
sumaTerna (x,y,z) = x + y + z

sumarSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumarSoloMultiplos (x,y,z) n  | mod x n == 0 && mod y n == 0 && mod z n == 0 = x + y + z
                            | mod x n == 0 && mod y n == 0 = x + y
                            | mod x n == 0 && mod z n == 0 = x + z
                            | mod y n == 0 && mod z n == 0 = y + z
                            | mod x n == 0 = x
                            | mod y n == 0 = y
                            | mod z n == 0 = z

esMultiplo :: Integer -> Integer -> Integer
esMultiplo x n  | mod x n == 0 = 1
                | otherwise = 0

sumarSoloMultiplos_v2 :: (Integer,Integer,Integer) -> Integer -> Integer
sumarSoloMultiplos_v2 (x, y, z)  n = (esMultiplo x n) * x + (esMultiplo y n) * y + (esMultiplo z n) * z 

posPrimerPar :: (Integer,Integer,Integer) -> Integer
posPrimerPar (x,y,z)  | mod x 2 == 0 = 0
                | mod y 2 == 0 = 1
                | mod z 2 == 0 = 2
                | otherwise = 4

crearPar :: a ->b ->(a, b)
crearPar  a b = (a,b)

invertir :: (a,b) ->(b, a)
invertir (a,b) = (b,a)
