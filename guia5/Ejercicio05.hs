longitud :: (Num t) => [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

parcial :: (Num t) => Integer -> [t] -> [t]
parcial n (x:xs)    | n >= longitud (x:xs) = []
                    | otherwise = (sumaTodo (tomarPrimerosN (n+1) (x:xs))):parcial (n+1) (x:xs)

sumaTodo :: (Num t) => [t] -> t
sumaTodo [] = 0
sumaTodo (y:ys) = y + sumaTodo ys

tomarPrimerosN :: (Num t) => Integer -> [t] -> [t]
tomarPrimerosN 0 _ = []
tomarPrimerosN _ [] = []
tomarPrimerosN n (x:xs) | fromIntegral n == 0 = []
                        | otherwise = x:(tomarPrimerosN (n-1) xs)


sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:xs) = parcial 0 (x:xs)



