interior [] = []
interior [a] = []
interior [a,b] = []
interior ls = tail (init ls)

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ interior a
