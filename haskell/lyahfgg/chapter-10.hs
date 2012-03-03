-- Functionally solving problems

module ChapterTen
( solveRPN
) where

solveRPN :: String -> Float
-- solveRPN expression = head $ foldl foldingFunction [] (words expression)
-- solveRPN = head . (foldl foldingFunction []) . words 
solveRPN = head . foldl foldingFunction [] . words
  where foldingFunction (x:y:xs) "*" = (x * y):xs
        foldingFunction (x:y:xs) "+" = (x + y):xs
        foldingFunction (x:y:xs) "-" = (y - x):xs
        foldingFunction (x:y:xs) "/" = (y / x):xs
        foldingFunction (x:y:xs) "^" = (y ** x):xs
        foldingFunction (x:xs) "ln"  = log x:xs
        foldingFunction xs "sum"     = [sum xs]
        foldingFunction xs number    = read number:xs


