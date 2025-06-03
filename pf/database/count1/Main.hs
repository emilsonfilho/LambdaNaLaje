countNeg ls = foldl (\acc x -> if x < 0 then acc+1 else acc) 0 ls

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ countNeg a
