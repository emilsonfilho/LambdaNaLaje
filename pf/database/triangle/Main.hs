line n = take n ([(sum [1..n-1])+1..])

triangle 0 = []
triangle n = [line x | x <- [1..n]]

main :: IO ()
main = do
    a <- readLn :: IO Int
    print $ triangle a
