module Main where

import Test.HUnit
import ChapterTen 

main = do
  runTestTT tests


tests = TestList [
          TestCase (assertEqual "3 2 + => 5"  (solveRPN "3 2 +") 5),
          TestCase (assertEqual "3 10 - => -7"  (solveRPN "3 10 -") (-7)),
          TestCase (assertEqual "3 1 5 + + => 9"  (solveRPN "3 1 5 + +") 9),
          TestCase (assertEqual "10 4 3 + 2 * - => 4" (solveRPN "10 4 3 + 2 * -") (-4))
        ]


