import Ejercicio1
import Test.HUnit

testfibo = test [
    "Caso Base 1: fib 0" ~: (fibonacci 0) ~?= 0,
    "Caso Base 2: fib 1" ~: (fibonacci 1) ~?= 1,
    "Caso recursivo fib 2" ~: (fibonacci 2) ~?= 1
                ]

{-
importante al nombre del archivo comenzarlo con mayuscula, que coincida el nombre 
del archivo con el module del mismo, puede tener numeros al final
para ejecutar el test se escribe:
testTT testfibo 
-}