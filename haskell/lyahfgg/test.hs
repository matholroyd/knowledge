module Main where

import Test.HUnit
import ChapterTen 

main = do
  runTestTT tests


checkSolveRPN :: String -> Float -> Test
checkSolveRPN rpn result = TestCase (assertEqual rpn (solveRPN rpn) result)

tests = TestList [
          checkSolveRPN "3 2 + => 5" 5,
          checkSolveRPN "3 10 - => -7"  (-7),
          checkSolveRPN "3 1 5 + + => 9" 9,
          checkSolveRPN "10 4 3 + 2 * -" (-4)
        ]


