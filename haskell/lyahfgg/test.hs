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
checkOP (rs, path) = TestCase $ assertEqual (show rs) path (optimalPath rs)

testsOP = TestList $ map checkOP [
          ([Section 10 20 0],   [(A, 10)]),
          ([Section 20 10 0],   [(B, 10)]),
          ([Section 20 10 100, Section 10 10 0],   [(B, 10), (B, 10)]),
          ([Section 20 10 100, Section 10 100 0],   [(A, 20), (A, 10)]),
          (heathrowToLondon,    [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)])
        ]
