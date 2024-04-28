pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs)  | e == x = True
                    | otherwise = pertenece e xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs




quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs 
                | otherwise = x : quitar e xs
longitud :: (Eq t) => [t] -> Integer
longitud [] = 0
longitud (x:xs) | xs == [] = 1
                | otherwise = 1 + longitud xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x >= y = maximo (x:xs)
                | otherwise = maximo(y:xs)
--alternativa
maximo2 :: [Integer] -> Integer
maximo2 (x:xs)  | x > maximo2 xs = xs
                | otherwise = maximo2 xs

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = ordenar (quitar maximo(x) xs) ++ [maximo(x:xs)]