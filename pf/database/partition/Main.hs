splitints f ls = ([x | x <- ls, f x == True], [x | x <- ls, f x == False])

splitints' f = foldr (\x (ts, fs) -> if f x then (x:ts, fs) else (ts, x:fs)) ([],[])

main :: IO ()
main = do
    list <- readLn :: IO [Int]
    putStrLn $ "odd " ++ show (splitints' odd list)
    putStrLn $ "(<5) " ++ show (splitints' (<5) list)
