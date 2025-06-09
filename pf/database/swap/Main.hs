treatIndex i len
    | i < 0 = len + i
    | i > len = len - 1
    | otherwise = i

swap [] _ _ = []
swap ls start end = ini ++ elem_j ++ middle ++ elem_i ++ final
    where
        len = length ls
        i = treatIndex start len
        j = treatIndex end len
        ini = take i ls
        elem_i = if (i /= j) then [ls !! i] else []
        elem_j = [ls !! j]
        final = drop (j+1) ls
        middle = take (j-i-1) (drop (i+1) ls)

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    b <- readLn :: IO Int
    c <- readLn :: IO Int
    print $ swap a b c
