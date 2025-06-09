treatIndexes i ls
    | i < 0 = (len + i)
    | i > len = len
    | otherwise = i
    where
        len = length ls

sublist a b ls =
    let i = treatIndexes a ls
        j = treatIndexes b ls
        firstSlice = drop i ls
        final = take (j-i)  firstSlice
    in final

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    c <- readLn :: IO [Int]
    print $ sublist a b c
