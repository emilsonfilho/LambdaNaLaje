fatorial 0 = 1
fatorial 1 = 1
fatorial 2 = 2
fatorial n = n * fatorial (n-1)

main :: IO ()
main = do
    a <- readLn :: IO Int
    print $ fatorial a
