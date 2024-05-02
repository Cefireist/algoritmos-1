import Ejercicio01
import Test.HUnit

longitud' = test [
                "Lista vacia" ~: longitud [] ~?= 0, 
                "Un solo elemento" ~: (longitud["x"]) ~?= 1,
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
                "un solo elemento" ~: (reverso ["A"]) ~?= ["A"],
                "Dos elementos" ~: (reverso [1,2]) ~?= [2,1],
                "Cinco elementos" ~: (reverso ["A","B","C","D","E"]) ~?= ["E","D","C","B","A"],
                "Cuatro elementos" ~: (reverso [1,2,3,4]) ~?= [4,3,2,1]
                ]