gangorra p1 c1 p2 c2
    | left == right = 0
    | left > right = -1
    | otherwise = 1
    where
        left = p1 * c1
        right =  p2 * c2

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    c <- readLn :: IO Int
    d <- readLn :: IO Int
    print $ gangorra a b c d
