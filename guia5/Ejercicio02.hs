pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs)  | e == x = True
                    | otherwise = pertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:[]) = True
todosIguales (x:xs) | pertenece x xs == False = False
                    | otherwise =  todosIguales (xs)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs)   | pertenece x xs == True = False
                        | otherwise = todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (y:ys) | pertenece y ys == True = True
                    | otherwise = hayRepetidos ys

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs
                | otherwise = x:(quitar e xs) 

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)    | e == x = quitarTodos e xs
                        | otherwise = x:(quitarTodos e xs)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)    | pertenece x xs = eliminarRepetidos xs
                            | otherwise = x:(eliminarRepetidos xs)


mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] _ = False
mismosElementos _ [] = False
mismosElementos (x:xs) (y:ys) = mismosElementos (quitarTodos x (x:xs)) (quitarTodos x (y:ys))


principio :: (Eq t) => [t] -> [t]
principio [x] = []
principio (x:xs)    | xs == [] = [] 
                    | otherwise = x:principio xs
ultimo :: (Eq t) => [t] -> t
ultimo [x] = x
ultimo (x:xs)   | xs == [] = x
                | otherwise = ultimo xs

reverso :: (Eq t) => [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = (ultimo (x:xs)):(reverso (principio (x:xs)))

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) = (x:xs) == reverso (x:xs)