componentesIguales :: (String,String) -> Bool
componentesIguales tupla = fst tupla == snd tupla

compararTuplas :: (String,String) -> (String,String) -> Bool
compararTuplas tupla1 tupla2    | componentesIguales tupla1 == True || componentesIguales tupla2 == True = False
                                | fst tupla1 == fst tupla2 && snd tupla1 == snd tupla2 = False
                                | otherwise = True

compararRecursivamente :: [(String, String)] -> Bool
compararRecursivamente [] = False
compararRecursivamente [x] = not (componentesIguales x) 
compararRecursivamente (x:y:xs) | compararTuplas x y == False = False
                                | otherwise = compararRecursivamente (x:xs)

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas [x] = not (componentesIguales x)
relacionesValidas (x:y:xs)  | compararRecursivamente (x:y:xs) == False = False
                            | otherwise =  relacionesValidas (y:xs)

concatenar :: (String,String) -> [String]
concatenar tupla = [fst tupla]++[snd tupla]

unirTodo :: [(String, String)] -> [String]
unirTodo (x:xs) | xs == [] = concatenar x
                | otherwise = concatenar x ++ unirTodo xs

eliminarElemento :: String -> [String] -> [String]
eliminarElemento _ [] = []
eliminarElemento e (x:xs)   | e == x = eliminarElemento e xs
                            | otherwise = [x] ++ eliminarElemento e xs

--personas :: [(String,String)] -> [String]
--personas (x:xs) | xs == [] = []
--                | otherwise = x ++ eliminarElemento x (unirTodo xs)






-- [("C","D"),("A","B"),("K","S"),("B","B")]

