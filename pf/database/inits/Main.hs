inits [] = [[]]
inits (x:xs) = [] : map (x:) (inits xs)

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ inits a
