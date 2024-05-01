module Main where
import Catorce
import Test.HUnit



Main = runTestTT Test

--tests = test [
--Caso1 ~: (sumaPotencias 2 1 1) ~?= 4,
--"caso2" ~: (sumaPotencias 2 2 2) ~?= 36,
--"caso3" ~: (sumaPotencias 2 3 3) ~?=260,
--]

test1 :: Test
test1 = TestCase (assertEqual "should return 4" 4 (sumaPotencias 2 1 1))