{-
problema esMinuscula (c: Char) : Bool {
requiere: {True}
asegura: {res es igual a true si y s ́olo si c es una letra min ́uscula (entre “a” y “z” ambos inclusive, pero sin incluir
“ ̃n” ni vocales con tildes)}
-}
import Test.HUnit
import Solucion
import Data.List

runGrupoTests = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista
                ]

testsEjesMinuscula = test [
    esMinuscula 'h' ~?= True,
    esMinuscula 'H' ~?= False,
    esMinuscula '/' ~?= False,
    esMinuscula 'ñ' ~?= False,
    esMinuscula '{' ~?= False
                        ]

testsEjletraANatural = test [
    letraANatural 'k' ~?= 10,
    letraANatural 'a' ~?= 0,
    letraANatural 'z' ~?= 25
    ]

testsEjdesplazar = test [
    desplazar 'g' 0 ~?= 'g',
    desplazar 'b' 26 ~?= 'b',
    desplazar 't' (-26) ~?= 't',
    desplazar 'K' 3 ~?= 'K'
    ]

testsEjcifrar = test [
    cifrar "xyzabcDEF" 2 ~?= "zabcdeDEF",
    cifrar "lloVeRa" 0 ~?= "lloVeRa",
    cifrar "lloVeRa" 26 ~?= "lloVeRa"
    ]

testsEjdescifrar = test [
    descifrar [] 30 ~?= [],
    descifrar "zabcdeDEF" 2 ~?= "xyzabcDEF",
    descifrar "ABCdefghjzy" 0 ~?= "ABCdefghjzy",
    descifrar "ABCdefghjzy" 26 ~?= "ABCdefghjzy"
    ]

testsEjcifrarLista = test [
    cifrarLista [] ~?= [],
    cifrarLista ["noimportalaprimeraASB", "abc", "xyz"] ~?= ["noimportalaprimeraASB", "bcd", "zab"],
    cifrarLista ["a","b","t","u","v","x","y","z"] ~?= ["a","c","v","x","z","c","e","g"]
    ]

testsEjfrecuencia = test [
    expectlistProximity (frecuencia "") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "ABCDEFGHIJKLMNOPQRSTUVWXYZ<>,.?/'|") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "1234567890-=!@#$%^&*()_+`~") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "A{}123456789+_|:><,.?!@#$%^&*()") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "abcdefghijklmnopqrstuvwxyzA{}123456789+_|:><,.?!@#$%^&*()") [3.846154,
    3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,
    3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154,3.846154]
    ]

testsEjcifradoMasFrecuente = test [
    "Caso 1" ~: cifradoMasFrecuente "a{123124" 5 ~?= ('f',100.0),
    "Caso 2" ~: expectAnyTuplaAprox (cifradoMasFrecuente "abba" 2) [('d',50.0),('c',50.0)],
    "Caso 3" ~: expectAnyTuplaAprox (cifradoMasFrecuente "dcEXACTAS" 0) [('d',50.0),('c',50.0)],
    "Caso 4" ~: expectAnyTuplaAprox (cifradoMasFrecuente "aabcA{}123456789+_|:><,.?!@#$%^&*()" 7) [('h',50.0)],
    "Caso 5" ~: expectAnyTuplaAprox (cifradoMasFrecuente "aabcde{?" 26) [('a',33.33333)]
    ]

testsEjesDescifrado = test [
    "Palabra es vacio" ~: (esDescifrado "" "compu") ~?= False,
    "la comparada es vacio" ~: (esDescifrado "compu" "") ~?= False,
    "Palabra y comparada son vacias" ~: (esDescifrado "" "") ~?= False,
    "palabra y comparada son iguales" ~: (esDescifrado "compu" "compu") ~?= True,
    "caso verdadero 1" ~: (esDescifrado "abcde" "xyzab") ~?= True,
    "caso verdadero 2" ~: (esDescifrado "zbc" "acd") ~?= True,
    "caso verdadero 3" ~: (esDescifrado "COMPU" "COMPU") ~?= True,
    "caso falso 1" ~: (esDescifrado "ABCDE123abc{/45" "EFGHI123efg{/45") ~?= False
    ]

testsEjtodosLosDescifrados = test [
    "Caso base lista vacia" ~: (todosLosDescifrados []) ~?= [],
    "Caso 1" ~: expectPermutacion (todosLosDescifrados ["{SIUabc","tau","{SIUzab"]) [("{SIUzab","{SIUabc"),("{SIUabc","{SIUzab")],
    "Caso 2" ~: expectPermutacion (todosLosDescifrados ["123z","no","si","123g","es","tj"]) [("123z","123g"),("123g","123z"),("si","tj"),("tj","si")],
    "Caso 3" ~: (todosLosDescifrados ["12","13","14","a","bc"]) ~?= [],
    "Caso 3" ~: expectPermutacion (todosLosDescifrados ["a","z","q","A","aa"]) [("a","q"),("a","z"),("q","a"),("z","a"),("q","z"),("z","q")]
    ]

testsEjexpandirClave = test [
    "Caso 1" ~: expandirClave "z" 1 ~?= "z",
    "Caso 2" ~: expandirClave "dc" 1 ~?= "d",
    "Caso 3" ~: expandirClave "dc" 2 ~?= "dc",
    "Caso 4" ~: expandirClave "cauchy" 3 ~?= "cau",
    "Caso 5" ~: expandirClave "z" 3 ~?= "zzz"
    ]

testsEjcifrarVigenere = test [
    cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv"
    ]

testsEjdescifrarVigenere = test [
    descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion"
    ]

testsEjpeorCifrado = test [
    peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef"
    ]

testsEjcombinacionesVigenere = test [
    combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")]
    ]




-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)