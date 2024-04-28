bisiesto :: Integer ->Bool
bisiesto n  | mod n 400 /= 0 && mod n 100 == 0 = False
            | mod n 4 /= 0 = False
            | otherwise = True