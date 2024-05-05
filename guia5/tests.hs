import Ejercicio01
import Test.HUnit

ejecutarlongitud = runTestTT longitud'
ejecutarultimo = runTestTT ultimo'
ejecutarprincipio = runTestTT principio'
ejecutarreverso = runTestTT reverso'
longitud' = test [
                "Lista vacia" ~: longitud [] ~?= 0, 
                "Un solo elemento" ~: (longitud[7]) ~?= 1,
                "3 elementos" ~: (longitud[4,5,6]) ~?= 3
                ]

ultimo' = test [
                "Un solo elemento" ~: (ultimo[9]) ~?= 9,
                "3 elementos" ~: (ultimo[1,23,5]) ~?= 5
                ]

principio' = test [
                "un solo elemento" ~: (principio [5]) ~?= [],
                "dos elementos" ~: (principio [2,5]) ~?= [2],
                "5 elementos" ~: (principio [1,2,3,4,5]) ~?= [1,2,3,4] 
                ]

reverso' = test [
                "lista vacia" ~: (reverso []) ~?= [],
                "un solo elemento" ~: (reverso [6]) ~?= [6],
                "Dos elementos" ~: (reverso [1,2]) ~?= [2,1],
                "Cinco elementos" ~: (reverso [1,2,3,4,5]) ~?= [5,4,3,2,1],
                "Cuatro elementos" ~: (reverso [1,2,3,4]) ~?= [4,3,2,1]
                ]