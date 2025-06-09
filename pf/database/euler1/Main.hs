euler1 n = foldl (\acc x -> if (x `multiple` 3 || x `multiple` 5) then acc + x else acc) 0 [1..n-1]
    where
        multiple x n = x `mod` n == 0

main :: IO ()
main = do
    a <- readLn :: IO Int
    print $ euler1 a
