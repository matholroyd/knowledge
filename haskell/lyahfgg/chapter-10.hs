-- Functionally solving problems

module ChapterTen
( solveRPN
, Section(..)
, RoadSystem(..)
, Label(..)
, Path(..)
, heathrowToLondon
, optimalPath
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


data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)  
type RoadSystem = [Section]

data Label = A | B | C deriving (Show, Eq)  
type Path = [(Label, Int)]

heathrowToLondon :: RoadSystem  
heathrowToLondon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

optimalPath :: RoadSystem -> Path
optimalPath rs = [(A, 10)]