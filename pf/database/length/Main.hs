total ls = length ls

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ total a
