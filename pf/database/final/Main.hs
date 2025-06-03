final x ls = drop ((length ls) - x) ls

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO [Int]
    print $ final a b
