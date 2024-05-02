module Ejercicio01 where

longitud :: (Eq t) => [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: (Eq t) => [t] -> t
ultimo (x:[]) = x
ultimo (x:xs)   | xs == [] = x
                | otherwise = ultimo xs

principio :: (Eq t) => [t] -> [t]
principio [x] = []
principio (x:xs)    | xs == [] = []
                    | otherwise = x:(principio xs)

reverso :: (Eq t) => [t] -> [t]
reverso [] = []
reverso (x:[]) = [x]
reverso x = (ultimo x):(reverso(principio x)) 