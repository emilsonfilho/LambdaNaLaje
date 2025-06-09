elemento i ls = ls !! (if i >= 0 then i else (length ls) + i)

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO [Int]
    print $ elemento a b
