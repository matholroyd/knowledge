import System.IO  
  
main = do  
    handle <- openFile "girlfriend.txt" ReadMode  
    contents <- hGetContents handle  
    putStr contents  
    hClose handle

-- import Control.Monad  
--   
-- main = do   
--     colors <- forM [1,2] (\a -> do  
--         putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"  
--         getLine)  
--     putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "  
--     mapM putStrLn colors
    
-- import Control.Monad  
-- import Data.Char  
-- 
-- main = forever $ do  
--     l <- getLine  
--     putStrLn $ map toUpper l
    
-- import Data.Char  
--   
-- main = do  
--     contents <- getContents  
--     putStr (map toUpper contents)    
    
-- main = do  
--     rs <- sequence [getLine, getLine, getLine]  
--     print rs
    
    
-- import Control.Monad   
--   
-- main = do  
--     c <- getChar  
--     when (c /= ' ') $ do  
--         putChar c  
--         main
-- 
-- main = do     
--     c <- getChar  
--     if c /= ' '  
--         then do  
--             putChar c  
--             main  
--         else return ()
        
-- main = do   
--     line <- getLine  
--     if null line  
--         then return ()  
--         else  
--             putStrLn $ reverseWords line  
--             main
-- 
-- reverseWords :: String -> String  
-- reverseWords = unwords . map reverse . words
--             
-- main = do
--   putStrLn "Hello, what's your name?"
--   name <- getLine
--   putStrLn ("Hey " ++ name ++ ", you rock!")