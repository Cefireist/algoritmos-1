sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x*productoria(xs)

maximo :: [Integer] -> Integer
maximo (x:[]) = x
maximo (y:ys)   | y >= maximo ys = y
                | otherwise =  maximo ys

sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n [x] = [x+n]
sumarN n (x:xs) = (x+n):sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [x] = [x+x]
sumarElPrimero (x:xs) = sumarN x (x:xs)



ultimo :: [Integer] -> Integer
ultimo [x] = x
ultimo (x:xs) = ultimo xs

longitud (x:xs) = 1 + longitud xs
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [x] = [x+x]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)    | mod x 2 /= 0 = pares xs 
                | otherwise = x:pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)   | mod x n == 0 = x:multiplosDeN n xs
                        | otherwise = multiplosDeN n xs

quitar :: Integer -> [Integer] -> [Integer]
quitar _ [] = []
quitar e (x:xs) | x == e = xs
                | otherwise = x:(quitar e xs)
{-
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs
                | otherwise = x:(quitar e xs) 
-}
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar (x:xs) = ordenar (quitar (maximo (x:xs)) (x:xs)) ++ [maximo (x:xs)]