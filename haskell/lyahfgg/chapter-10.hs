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
optimalPath rs = 
  let paths = foldl nextSteps ([], []) rs 
      bestPath = cheapestPath paths
      cleanedUpPath = if head bestPath == (C, 0)
                      then tail bestPath
                      else bestPath
  in reverse cleanedUpPath  
  
nextSteps :: (Path, Path) -> Section -> (Path, Path)
nextSteps (a, b) (Section aStep bStep cStep) =
  let priceA = pathLength a
      priceB = pathLength b
      bestA = if priceA + aStep < priceB + bStep + cStep
              then (A, aStep):a
              else (C, cStep):(B, bStep):b
      bestB = if priceB + bStep < priceA + aStep + cStep
              then (B, bStep):b
              else (C, cStep):(A, aStep):a
  in (bestA, bestB)

cheapestPath :: (Path, Path) -> Path
cheapestPath (pA, pB) = 
  let priceA = pathLength pA
      priceB = pathLength pB
  in  if priceA < priceB
      then pA
      else pB
  
pathLength :: Path -> Int
pathLength = sum . map (snd) 