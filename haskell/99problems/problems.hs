import System.Random

problem1 :: [a] -> a
problem1 [x] = x
problem1 (x:xs) = problem1 xs

problem2 :: [a] -> a
problem2 (x:y:[]) = x
problem2 (x:xs) = problem2 xs

problem3 :: Num b => [a] -> b -> a
problem3 (x:_) 1 = x
problem3 (x:xs) n = problem3 xs (n - 1)

problem4 :: Integral b => [a] -> b
problem4 [] = 0
problem4 (x:xs) = 1 + (problem4 xs)

problem5 :: [a] -> [a]
problem5 [] = []
problem5 (x:xs) = (problem5 xs) ++ [x]

problem6 :: Eq a => [a] -> Bool
problem6 xs = xs == (problem5 xs)

-- problem7 :: [a] -> [b] 
-- problem7 [] = []
-- problem7 (x:xs) = []

problem8 :: Eq a => [a] -> [a]
problem8 [] = []
problem8 [x] = [x]
problem8 (x:y:xs) 
  | x == y    = problem8 (y:xs)
  | otherwise = (x:problem8 (y:xs))
  
problem9 :: Eq a => [a] -> [[a]]
problem9 [] = []
problem9 [x] = [[x]]
problem9 list@(x:xs) = 
  let same   = takeWhile (==x) list
      remaining = problem9 (dropWhile (==x) list) 
  in [same] ++ remaining
  
problem10 :: Eq a => [a] -> [(Int, a)]
problem10 [] = []
problem10 list = [(length xs, head xs) | xs <- problem9 list]
  
data Encoding a = Multiple Int a | Single a deriving (Show)
  
problem11 :: Eq a => [a] -> [Encoding a] 
problem11 [] = []
problem11 list = map encode (problem10 list)
  where encode (1, x)      = Single x
        encode (count, x)  = Multiple count x
        
problem12 :: Eq a => [Encoding a] -> [a]
problem12 [] = []
problem12 (x:xs) = decode x ++ (problem12 xs)
  where decode (Single x)         = [x]
        decode (Multiple count x) = rep count x
        rep 1 a = [a]
        rep n a = a:rep (n - 1) a
        
problem13 :: Eq a => [a] -> [Encoding a] 
problem13 [] = []
problem13 [x] = [Single x]
problem13 (x:xs) = [Multiple count x] ++ problem13 rest 
  where rest      = dropWhile (== x) xs
        matching  = takeWhile (== x) xs
        count = (length matching) + 1
        
problem14 :: [a] -> [a]        
problem14 [] = []
problem14 (x:xs) = x:x:(problem14 xs)

problem15 :: [a] -> Int -> [a]
problem15 [] _ = []
problem15 (x:xs) n = (rep n x) ++ (problem15 xs n)
  where rep 1 a = [a]
        rep n a = a:rep (n-1) a
  
problem16 :: [a] -> Int -> [a]
problem16 [] _ = []
problem16 xs n = drop' xs n 1
  where drop' [] _ _ = []
        drop' (y:ys) n c 
          | c `mod` n == 0 = drop' ys n 1
          | otherwise      = y:drop' ys n (c + 1)
            
problem17 :: [a] -> Int -> ([a], [a])
problem17 xs n = 
  let a = take' n xs 
      b = drop' n xs
  in (a, b)
  where take' 0 _       = []
        take' n (x:xs)  = x:take' (n-1) xs
        drop' 0 xs      = xs
        drop' n (x:xs)  = drop' (n-1) xs
                            
problem18 :: [a] -> Int -> Int -> [a]
problem18 xs i k =
  let start = snd $ problem17 xs (i - 1)
      slice = fst $ problem17 start (k - i + 1)
  in slice
  
rotate :: [a] -> Int -> [a]
rotate xs 0 = xs
rotate all@(x:xs) n = 
  let len = length all 
      safeN = (len + (n `mod` len)) `mod` len
  in rotate (xs ++ [x]) (safeN - 1)
  
removeAt :: Int -> [a] -> (a, [a])
removeAt 0 (x:xs) = (x, xs)
removeAt n (x:xs) = 
  let (a, r) = removeAt (n-1) xs 
  in (a, x:r)
      
insertAt :: a -> [a] -> Int -> [a]
insertAt x xs 1 = x:xs
insertAt x (y:xs) n = y:(insertAt x xs (n-1))

range :: Int -> Int -> [Int]
range a b 
  | a < b = a:(range (succ a) b)
  | a > b = a:(range (pred a) b)
  | otherwise = [a]

rnd_select :: [a] -> Int -> IO [a]
rnd_select xs 0 = return []
rnd_select (x:xs) n = do
    i <- getStdRandom ( randomR (0, length(xs) - 1 ))
    if i < n 
      then do
        rest <- rnd_select xs (n-1)
        return (x : rest)
      else
        rnd_select xs n
  
  
    