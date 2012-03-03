import Test.HUnit
import ChapterTen 

main = do
  runTestTT tests


tests = TestList [TestLabel "1" (
                    TestCase (assertEqual "3 2 + => 5"  (solveRPN "3 2 +") 5)
                  ),
                  TestLabel "2" (
                    TestCase (assertEqual "3 10 - => -7"  (solveRPN "3 10 -") (-7))
                  ),
                  TestLabel "3" (
                    TestCase (assertEqual "3 1 5 + + => 9"  (solveRPN "3 1 5 + +") 9)
                  )
                  ]


