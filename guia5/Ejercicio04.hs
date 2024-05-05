
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:ys)  | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:ys)
                                | otherwise = (x):sacarBlancosRepetidos (y:ys)

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:y:ys) | x == ' ' = 1 + contarPalabras (sacarBlancosRepetidos (y:ys))
                        | otherwise = contarPalabras (sacarBlancosRepetidos (y:ys))



primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs)   | x == ' ' = []
                        | otherwise = x:primeraPalabra xs

sacarPrimeraPalabra :: [Char] -> [Char]
sacarPrimeraPalabra [] = []
sacarPrimeraPalabra (x:xs)  | x == ' ' = xs
                            | otherwise = sacarPrimeraPalabra xs

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = [primeraPalabra (sacarBlancosRepetidos (x:xs))] ++ palabras (sacarPrimeraPalabra (sacarBlancosRepetidos (x:xs)))

longitud :: [Char] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


segundaPalabra :: [Char] -> [Char]
segundaPalabra [] = []
segundaPalabra (x:xs) = primeraPalabra (sacarPrimeraPalabra (x:xs))

sacarDesde2daPalabra :: [Char] -> [Char]
sacarDesde2daPalabra [] = []
sacarDesde2daPalabra (x:xs) = sacarPrimeraPalabra (sacarPrimeraPalabra (x:xs))

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga (x:xs)  | sacarPrimeraPalabra (x:xs) == [] = (x:xs)
                        | longitud (primeraPalabra (x:xs)) > longitud (segundaPalabra (x:xs)) = palabraMasLarga (primeraPalabra (x:xs) ++ [' '] ++ sacarDesde2daPalabra (x:xs))
                        | otherwise = palabraMasLarga (sacarPrimeraPalabra (x:xs))

aplanar :: [[Char]] -> [Char]
aplanar []  = []
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs)    | xs == [] = x
                            | otherwise = x ++ [' '] ++ aplanarConBlancos xs
nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = [' '] ++ nBlancos (n-1)

type Texto = [Char]

aplanarConNBlancos :: [Texto] -> Integer -> Texto
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n | xs == [] = x
                            | otherwise = x ++ nBlancos n ++ aplanarConNBlancos xs n
{-
incisio b, no cambia porque es solo un nombre 
-}
-- [' ',' ',' ',' ','g','h',' ',' ','p','e','p','e',' ',' ',' ',' ']
-- ['u','n',' ','d','i','a','s','s',' ','v','i',' ','u','n','a',' ','v','a','c','a']
-- ['u','n',' ',' ',' ','d','i','a',' ',' ','v','i',' ','u','n','a',' ','v','a','c','a',' ',' ']
-- [' ', ' ',' ',]

