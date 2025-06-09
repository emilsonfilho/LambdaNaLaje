intersec ls ms = [x | x <- ls, elem x ms]

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    b <- readLn :: IO [Int]
    print $ intersec a b
