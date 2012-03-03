import Data.List

doubleMe x = x + x
doubleUs x y = x*2 + y*2  

boomBangs xs = [if x < 10 then "BANG!" else "BOOM!" | x <- xs, odd x ]

factorial :: Integer -> Integer
factorial n = product [1.. n]

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number sever!"
lucky _ = "Sorry, you're out of luck"


fact2 :: Integer -> Integer
fact2 1 = 1
fact2 x = x * fact2 (x - 1)

capital :: String -> String
capital "" = "Empty stringm whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= 18.5 = "You're underweight, you emo you!"
  | bmi <= 25.0 = "Normal!"
  | bmi <= 30.0 = "You're fat!"
  | otherwise   = "Holy crap, loose some weight!"
  where bmi = calcBmi weight height
  
calcBmi :: (RealFloat a) => a -> a -> a
calcBmi weight height = weight / height ^ 2

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis bmis = [bmi | (w, h) <- bmis, let bmi = w / h ^ 2, bmi >= 25.0]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
  let as = [a | a <- xs, a <= x]
      bs = [b | b <- xs, b > x]
  in quicksort as ++ [x] ++ quicksort bs


quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = quicksort' (filter (<= x) xs) ++ [x] ++ quicksort' (filter (> x) xs)
  
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

bigNum = head (filter p [100000, 99999..])
  where p x = x `mod` 3829 == 0

sqs = sum (takeWhile (<10000) (map (^2) [1, 3..]))  

chain :: (Integral a) => a -> [a]  
chain 1 = [1]
chain n
 | even n = n:chain (n `div` 2)
 | odd  n = n:chain (n*3 + 1)
 
 
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

swap :: (a -> b -> c) -> (b -> a -> c)
swap f a b = f b a

applyTwice :: (x -> x) -> x -> x
applyTwice f x = f (f x)


on :: (b -> b -> c) -> (a -> b) -> a -> a -> c  
f `on` g = \x y -> f (g x) (g y)


data Point = Point Float Float deriving (Show) 
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float  
surface (Circle _ r) = pi * r ^ 2  
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)


data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     , height :: Float  
                     , phoneNumber :: String  
                     , flavor :: String  
                     } deriving (Show)
                     

infixr 5 :-:
data MyList a = Empty | a :-: (MyList a) deriving (Show)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum)
           

solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
  where foldingFunction (x:y:xs) "*" = (x * y):xs
        foldingFunction (x:y:xs) "+" = (x + y):xs
        foldingFunction (x:y:xs) "-" = (y - x):xs
        foldingFunction (x:y:xs) "/" = (y / x):xs
        foldingFunction (x:y:xs) "^" = (y ** x):xs
        foldingFunction (x:xs) "ln"  = log x:xs
        foldingFunction xs "sum"     = [sum xs]
        foldingFunction xs number    = read number:xs
           


--     A           
--  VERY
-- HAPPY
-- 2012:

type Alias = (Char, Int)
type Mapping = [Alias]

solveWM :: String -> String -> String -> [Mapping]
solveWM a b c = 
  let letters = nub $ a ++ b ++ c
      mappings = map (zip letters) (permutations [0..9])
  in filter (\m -> ((mapToInt a m) + (mapToInt b m) + (mapToInt c m)) == 20128) mappings

mapToInt :: String -> Mapping -> Int
mapToInt s m = read nums :: Int
  where nums = concat $ map (charToNum m) s 

charToNum :: Mapping -> Char -> String
charToNum mapping char = show $ snd alias
  where found = find (\(c, x) -> c == char) mapping
        Just alias = found

-- zip function
-- possibleMapping :: [Char] -> [Int] -> [(Char, Int)]
-- possibleMapping [c] (x:_) = [(c, x)]
-- possibleMapping (c:_) [x] = [(c, x)]
-- possibleMapping (c:cs) (x:xs)        

-- permutations ::[a] -> [[a]]
-- permutations [] = []
-- permutations (x:xs) = 
--   
--   
-- newPermutations :: [a] -> [[a]] -> [[a]]
-- newPermutations [] results = results
-- newPermutations (x:xs) results = 
--   let newResults
--   
--   in