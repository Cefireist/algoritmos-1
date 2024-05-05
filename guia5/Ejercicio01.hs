module Ejercicio01 where

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [Integer] -> Integer
ultimo (x:[]) = x
ultimo (x:xs)   | xs == [] = x
                | otherwise = ultimo xs

principio :: [Integer] -> [Integer]
principio [x] = []
principio (x:xs)    | xs == [] = []
                    | otherwise = x:(principio xs)

reverso ::  [Integer] -> [Integer]
reverso [] = []
reverso (x:[]) = [x]
reverso x = (ultimo x):(reverso(principio x)) 