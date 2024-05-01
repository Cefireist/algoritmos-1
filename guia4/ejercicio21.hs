pitagoras :: Integer ->Integer ->Integer ->Integer
pitagoras m n r | m == -1 = 0
                | otherwise = cuantosMenores m n r + pitagoras (m-1) n r


cuantosMenores :: Integer -> Integer -> Integer -> Integer
cuantosMenores a b r    | b == -1 = 0
                        | a^2 + b^2 <= r^2 = 1 + cuantosMenores a (b-1) r
                        | otherwise = cuantosMenores a (b-1) r