minimoDivisor :: Integer -> Integer -> Integer
minimoDivisor n q   | mod n q == 0 = q
                    | otherwise = minimoDivisor n (q+1)

obtenerDescomposicion :: Integer -> [Integer]
obtenerDescomposicion a | a == 1 = []
                        | otherwise = (minimoDivisor a 2):(obtenerDescomposicion (div a (minimoDivisor a 2)))
                        
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = (obtenerDescomposicion x):descomponerEnPrimos xs





