min2 a b = min a b

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    print $ min2 a b