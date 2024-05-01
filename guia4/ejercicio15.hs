sumaRacionales :: Integer ->Integer ->Float
sumaRacionales p q  | p == 0 = 0
                    | otherwise = parcial p q + sumaRacionales (p-1) q

parcial :: Integer -> Integer -> Float
parcial p q | q == 1 = fromIntegral p
            | otherwise = fromIntegral(p) / fromIntegral (q) + parcial p (q-1)