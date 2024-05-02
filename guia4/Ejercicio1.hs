module Ejercicio1 where

fibonacci :: Integer -> Integer
fibonacci n | n <= 1 = n
            | otherwise = fibonacci(n-1) + fibonacci(n-2)
            