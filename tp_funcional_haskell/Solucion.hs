module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!	44484124		
-- Nombre de grupo: {YESE}
-- Integrante1: {40936944, Eluney}
-- Integrante2: {44484124, Ceffalotti Sebastian}
-- Integrante3: {44759991, apellidoYNombre3}
-- Integrante4: {43448593, apellidoYNombre4}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío}

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula letra = ord letra < 123 && ord letra >= 97

-- EJ 2
letraANatural :: Char -> Int
letraANatural letra = (ord letra) - 97

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar letra x | not (esMinuscula letra) = letra
                  | (ord letra + (mod x 26)) >= 123 = chr (ord letra + (mod x 26)-26)   
                  | otherwise  = chr (ord letra + (mod x 26)) 

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (letra:frase) x = desplazar letra x : cifrar frase x 

-- EJ 5
descifrar :: String -> Int -> String 
descifrar frase x = cifrar frase ((-1) * x) 

-- EJ 6

-- Se les ocurre una manera mejor de hacer este codigo ? renombrar
iterador :: [String] -> Int -> [String]
iterador [] _ = []
iterador (x:xs) n = (cifrar x n):(iterador xs (n+1))

cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista (x:xs) = iterador (x:xs) 0 

-- EJ 7

cantidadDeMinusculas :: String -> Int
cantidadDeMinusculas [] = 0
cantidadDeMinusculas (x:xs) | esMinuscula x == True = 1 + cantidadDeMinusculas xs
                            | otherwise = cantidadDeMinusculas xs

cantidadDeApariciones :: String -> Char -> Int
cantidadDeApariciones [] _ = 0
cantidadDeApariciones (letraN:palabra) letra | letra == letraN = 1 + cantidadDeApariciones palabra letra
                                             | otherwise = cantidadDeApariciones palabra letra

porcentaje :: Char -> String -> Float
porcentaje letra palabra = (fromIntegral (cantidadDeApariciones palabra letra) / fromIntegral (cantidadDeMinusculas palabra))*100 

crearListaConCeros :: Int -> [Float]
crearListaConCeros n    | n <= 0 = []
                        | otherwise = (0.0):crearListaConCeros (n-1) 

hayAlgunaMinuscula :: String -> Bool
hayAlgunaMinuscula [] = False
hayAlgunaMinuscula (x:xs)   | esMinuscula x = True
                            | otherwise = hayAlgunaMinuscula xs

recorredor :: String -> Int -> [Float]
recorredor [] _ = []
recorredor palabra n    | n >= 26 = []
                        | otherwise = (porcentaje (chr(97+n)) palabra):recorredor palabra (n+1)

frecuencia :: String -> [Float]
frecuencia [] = crearListaConCeros 26
frecuencia palabra  | hayAlgunaMinuscula palabra == False = crearListaConCeros 26
                    | otherwise = recorredor palabra 0

-- EJ 7
{-
frecuencia :: String -> [Float]
frecuencia palabra = frecuenciaAux palabra 'a'

frecuenciaAux :: String -> Char -> [Float]
frecuenciaAux palabra 'z' | not (elem 'z' palabra) = 0: []
                          | otherwise = porcentaje (cantidadDeApariciones palabra 'z') (contadorMinusculas palabra): []
frecuenciaAux palabra letra | not (elem letra palabra) = 0 : frecuenciaAux palabra (desplazar letra 1)
                            | otherwise = porcentaje (cantidadDeApariciones palabra letra) (contadorMinusculas palabra) : frecuenciaAux palabra (desplazar letra 1)
                            
porcentaje :: Int -> Int-> Float
porcentaje x y = fromIntegral (x * 100) / fromIntegral y

contadorMinusculas :: String -> Int
contadorMinusculas [] = 0
contadorMinusculas (letra:palabra) | esMinuscula letra = 1 + contadorMinusculas palabra
                                   | otherwise = contadorMinusculas palabra
-}



-- Ej 8
maximoCifrado :: [Float] -> Float
maximoCifrado [num] = num
maximoCifrado (num1:num2:numeros) | num1 >= num2 = maximoCifrado (num1:numeros)
                                  | otherwise = maximoCifrado (num2:numeros) 

quitarNoMinusculas :: String -> String
quitarNoMinusculas  [] = []
quitarNoMinusculas  (x:xs) | esMinuscula x == True =  x:(quitarNoMinusculas  xs)
                           | otherwise = quitarNoMinusculas  xs


minusculaConMasApariciones :: String -> Char
minusculaConMasApariciones [x] = x
minusculaConMasApariciones (x:y:xs) | cantidadDeApariciones xs x >= cantidadDeApariciones xs y = minusculaConMasApariciones (x:xs)
                                    | otherwise = minusculaConMasApariciones (y:xs)

cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente palabra n = (minusculaConMasApariciones (quitarNoMinusculas  (cifrar palabra n)), maximoCifrado (frecuencia (cifrar palabra n)))
{-
-- Ej 8
obtenerMayor :: [Float]  -> Float 
obtenerMayor [x] = x
obtenerMayor (x:y:xs)   | x >= y = obtenerMayor (x:xs) 
                        | otherwise = obtenerMayor (y:xs)

obtenerPosicion :: Float -> [Float] -> Int
obtenerPosicion _ [] = 0
obtenerPosicion e (x:xs)    | e == x = 0
                            | otherwise = 1 + obtenerPosicion e xs

obtenerNesimoElemento :: Int -> [Float] -> Float
obtenerNesimoElemento n [] = 0
obtenerNesimoElemento n (x:xs)  | n == 0 = x
                                | otherwise = obtenerNesimoElemento (n-1) xs 

cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente palabra n = (obtenerNesimoElemento (obtenerPosicion mayorFrecuencia) palabra, mayorFrecuencia)
                                where mayorFrecuencia = obtenerMayor frecuencia (cifrar palabra n)
-}

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado palabra cifrada = elem cifrada (cifrarLista (repetirPalabraX26 palabra))

repetirPalabra :: String -> Int -> [String]
repetirPalabra [] _ = []
repetirPalabra palabra n | n > 0 = palabra : repetirPalabra palabra (n-1)
                         | otherwise = []

repetirPalabraX26 :: String -> [String]
repetirPalabraX26 palabra = repetirPalabra palabra 26    


esDescifrado2 :: String -> String -> Bool
esDescifrado2 [] _ = False
esDescifrado2 _ [] = False
esDescifrado2 palabra cifrada = esDescifradoAux palabra cifrada 1

esDescifradoAux :: String -> String -> Int -> Bool
esDescifradoAux palabra cifrada n   | palabra == (cifrar cifrada n) = True
                                    | n >= 26 = False
                                    | otherwise = esDescifradoAux palabra cifrada (n+1)

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados palabras = tuplasDeDescifrados palabras

tuplasDeDescifrados :: [String] -> [(String, String)]
tuplasDeDescifrados [] = []
tuplasDeDescifrados [p] = []
tuplasDeDescifrados (p1:palabras) = descifradosDeLaPalabra p1 palabras ++ tuplasDeDescifrados palabras
-- aca me di cuenta de que esta funcion no es necesaria, directamente sus funciones las puede cumplir todosLosdescifrados
-- obs: tienen los mismos parametros de entrada y salida

descifradosDeLaPalabra :: String -> [String] -> [(String, String)]
descifradosDeLaPalabra _ [] = []
descifradosDeLaPalabra p1 (p2:palabras) | esDescifrado p1 p2 = (p1,p2):(p2,p1):(descifradosDeLaPalabra p1 palabras)
                                        | otherwise = descifradosDeLaPalabra p1 palabras


-- EJ 11
expandirClave :: String -> Int -> String
expandirClave palabra n = reducirLongitud (concatenarPalabra palabra n) n


concatenarPalabra :: String -> Int -> String
concatenarPalabra palabra n | length palabra >= n = palabra
                            | otherwise = palabra ++ (concatenarPalabra palabra n) 

reducirLongitud :: String -> Int -> String
reducirLongitud [] _ = []
reducirLongitud (letra:palabra) n | n == 0 = []
                                  | otherwise = letra:reducirLongitud palabra (n-1)
-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ [] = []
cifrarVigenere palabra clave = cifrarVigenereAux palabra claveExpandida 1
                            where claveExpandida = expandirClave clave (length palabra)

cifrarVigenereAux :: String -> String -> Int -> String
cifrarVigenereAux _ [] _ = []
cifrarVigenereAux (letra:xs) (a:clave) direccion = (letraDesplazada):(cifrarVigenereAux xs clave direccion)
                                                where letraDesplazada = desplazar letra ((letraANatural a)*(direccion))

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere _ [] = []
descifrarVigenere palabra clave = cifrarVigenereAux palabra claveExpandida (-1)
                                where claveExpandida = expandirClave clave (length palabra)

--descifrarVigenereAux :: String -> String -> String
--descifrarVigenereAux _ [] = []
--descifrarVigenereAux (letra:xs) (a:clave) = (desplazar letra (-(letraANatural a))):descifrarVigenereAux xs clave

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado palabra claves = minimo (formarTuplas claves (listaDeDistancias palabra (cifrarVigenereConLista palabra claves)))

cifrarVigenereConLista :: String -> [String] -> [String]
cifrarVigenereConLista _ [] = []
cifrarVigenereConLista palabra (clave:claves) = cifrarVigenere palabra clave: cifrarVigenereConLista palabra claves

minimo :: [(String,Int)] -> String
minimo [(p,num)] = p
minimo ((p1,num1):(p2,num2):tuplas) | num1 <= num2 = minimo ((p1,num1):tuplas)
                                    | otherwise = minimo ((p2,num2):tuplas)

---Uso esta función para geenrar una tupla con las claves y las distancias de listaDistancias, para luego sacar el minimo y llegar al resultado.                                 
formarTuplas :: [String] -> [Int] -> [(String,Int)]
formarTuplas [] [] = []
formarTuplas (palabra:palabras) (n:num) = (palabra,n): formarTuplas palabras num

---SumaDeDistanciasuma suma la distancia entre cada letra de la palabra original y la cifrada y luego armo una lsta con ListaDeDistancias
listaDeDistancias :: String -> [String] -> [Int]
listaDeDistancias _ [] = []
listaDeDistancias palabra (cifrada:cifradas) = sumaDeDistancias palabra cifrada: listaDeDistancias palabra cifradas

sumaDeDistancias :: String -> String -> Int
sumaDeDistancias [] [] = 0
sumaDeDistancias (letra:palabra) (cifra:cifrada) = absoluto (ord letra - ord cifra) + sumaDeDistancias palabra cifrada

absoluto :: Int -> Int
absoluto x | x < 0 = x * (-1)
           | otherwise = x

-- Dejo esta alternativa que es mas corta pero usa dos de las funciones hechas
peorCifrado2 :: String -> [String] -> String
peorCifrado2 palabra [x] = x
peorCifrado2 palabra (c1:c2:resto)  | sumaDeDistancias palabra clave1 <= sumaDeDistancias palabra clave2 = peorCifrado palabra (c1:resto)
                                    | otherwise = peorCifrado palabra (c2:resto)
                                    where 
                                        clave1 = cifrarVigenere palabra c1
                                        clave2 = cifrarVigenere palabra c2
-- EJ 15

combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere [] _ _ = []
combinacionesVigenere _ [] _ = [] -- una de las dos primeras se puede sacar porque el requiere dice que las longitudes son iguales, si una es vacia la otra tambien
combinacionesVigenere _ _ [] = []
combinacionesVigenere (b:palabras) (a:claves) comparada = (esDescifradoVigenere b comparada claves) ++ (combinacionesVigenere palabras claves comparada) 

esDescifradoVigenere :: String -> String -> [String] -> [(String,String)]
esDescifradoVigenere _ _ [] = []
esDescifradoVigenere palabra comparada (clave:resto)    | cifrarVigenere palabra clave == comparada = [(palabra, clave)]
                                                        | otherwise = esDescifradoVigenere palabra comparada resto


