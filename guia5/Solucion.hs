module Solucion where

{-
duplicados1 = [("X", "Z"), ("P", "Q"), ("A", "A")] -> FAlse
duplicados2 = [("X", "Z"), ("P", "Q"), ("A", "B"), ("Z", "X")] -> False
validas1 = [("X", "Z")] -> True
validas2 = [("X", "Z"), ("P", "Q"), ("A", "B")] -> True
-}

relacionesValidas:: [([Char],[Char])] -> Bool
relacionesValidas [] = True
relacionesValidas [x] = componentesIguales x
relacionesValidas (x:xs)    | pertenece x xs == True = False
                            | otherwise = relacionesValidas (xs)

invertirTupla :: ([Char],[Char]) -> ([Char],[Char])
invertirTupla x = (snd x, fst x)

componentesIguales :: ([Char],[Char]) -> Bool
componentesIguales (x,y) = x /= y

pertenece :: ([Char],[Char]) -> [([Char],[Char])] -> Bool
pertenece e [] = False
pertenece e (x:xs)  | e == x = True
                    | e == invertirTupla x = True
                    | otherwise = pertenece e xs

{-
ejercicio 2
problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
}
-}
aplanar :: [([Char],[Char])] -> [[Char]]
aplanar [] = []
aplanar (x:xs) = [fst x] ++ [snd x] ++ aplanar xs

estaEnLaLista :: [Char] -> [[Char]] -> Bool
estaEnLaLista _ [] = False
estaEnLaLista e (x:xs)  | e == x = True
                        | otherwise = estaEnLaLista e xs

eliminarRepetidos :: [[Char]] -> [[Char]]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)    | estaEnLaLista x xs == True = eliminarRepetidos xs
                            | otherwise = x:(eliminarRepetidos xs)

personas :: [([Char],[Char])] -> [[Char]]
personas [] = []
personas (x:xs) = eliminarRepetidos (aplanar (x:xs))

{-
Ejercicio 3
problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
}
-}

amigosDe :: [Char] -> [([Char],[Char])] -> [[Char]]
amigosDe [] _ = []
amigosDe e [] = []
amigosDe e (x:xs)   | e == fst x = [snd x] ++ amigosDe e xs
                    | e == snd x = [fst x] ++ amigosDe e xs
                    | otherwise = amigosDe e xs


-- "grillo" [("pepe","grillo"),("grillo","jorge"), ("A","B"), ("enemigodepepe","pepe")] -> ["pepe","jorge"]
-- "jorge" -> "grillo"
-- "juan" -> []
-- [] -> []

{-
Ejercicio 4
problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}
-}

cantidadDeApariciones :: [Char] -> [[Char]] -> Integer
cantidadDeApariciones e [] = 0
cantidadDeApariciones e (x:xs)  | e == x = 1 + cantidadDeApariciones e xs
                                | otherwise = cantidadDeApariciones e xs

quitarElemento :: [Char] -> [[Char]] -> [[Char]]
quitarElemento [] (x:xs) = (x:xs)
quitarElemento _ [] = []
quitarElemento e (x:xs) | e == x = quitarElemento e xs
                        | otherwise = [x] ++ quitarElemento e xs

trabajoSucio :: (Integer,[Char]) -> [[Char]] -> [Char]
trabajoSucio (n,elem) [] = elem
trabajoSucio (n, elem) (x:xs)   | cantidadDeApariciones x xs >= n = trabajoSucio (cantidadDeApariciones x xs,x) (quitarElemento x (x:xs))
                                | otherwise = (trabajoSucio (n, elem) (quitarElemento x (x:xs)))

personaConMasAmigos :: [([Char],[Char])] -> [Char]
personaConMasAmigos [x] =  snd x
personaConMasAmigos (x:xs) = trabajoSucio (0," ") (aplanar (x:xs))

                    
-- [("jorge","cacho"),("jorge","jorge"),("a","b"),("c","d"),("a","b")] False
-- [("jorge","cacho"),("a","b"),("c","d"),("a","b"),("l","p")]  False
-- [("jorge","cacho"),("a","b"),("c","d"),("b","a"),("l","p")]  False
-- [("jorge","cacho"),("jorge","noJorge"),("a","b"),("c","d"),("b","a")] True