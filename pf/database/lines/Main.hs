line n = take n ([(sum [1..n-1])+1..])

main :: IO ()
main = do
    a <- readLn :: IO Int
    print $ line a
