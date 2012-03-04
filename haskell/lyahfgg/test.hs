module Main where

import Test.HUnit hiding (Path)
import ChapterTen 

main = do
  runTestTT testsRPN
  runTestTT testsOP


checkSolveRPN :: (String, Float) -> Test
checkSolveRPN (rpn, result) = TestCase $ assertEqual rpn (solveRPN rpn) result

testsRPN = TestList $ map checkSolveRPN [
          ("3 2 +",                 5),           
          ("3 10 -",                (-7)),        
          ("3 1 5 + +",             9),           
          ("10 4 3 + 2 * -",        (-4)),        
          ("2.7 ln",                0.9932518),
          ("10 10 10 10 sum 4 /",   10.0)
        ]

checkOP :: (RoadSystem, Path) -> Test
checkOP (rs, path) = TestCase $ assertEqual "checking" (optimalPath rs) path

testsOP = TestList $ map checkOP [
          ([Section 10 20 0], [(A, 10)])
        ]
