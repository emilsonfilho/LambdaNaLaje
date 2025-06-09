divide ls i = (take i ls, drop i ls)

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    b <- readLn :: IO Int
    print $ divide a b
