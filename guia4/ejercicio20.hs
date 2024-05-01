tomaValorMax :: Int ->Int ->Int
tomaValorMax x y    | x > y = tomaMax y x
                    | otherwise = tomaMax x y
tomaMax :: Int ->Int ->Int
tomaMax x y | x == y = x
            | (sumaDivisores x 1) < (sumaDivisores y 1) = tomaMax (x+1) y
            | otherwise = tomaMax x (y-1)

sumaDivisores :: Int -> Int -> Int
sumaDivisores p q   | q == p = p
                    | otherwise = esDivisible p q + sumaDivisores p (q+1)

esDivisible :: Int -> Int -> Int
esDivisible a b | mod a b == 0 = b
                | otherwise = 0