pertence num ls = elem num ls

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO [Int]
    print $ pertence a b
