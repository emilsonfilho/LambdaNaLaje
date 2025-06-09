primeiros [] = []
primeiros [a] = []
primeiros (x:xs) = x : primeiros xs

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ primeiros a
