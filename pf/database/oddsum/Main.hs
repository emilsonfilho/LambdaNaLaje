isEven x = x `mod` 2 == 0

somaImpares ls = foldl (\sum x -> if not (isEven x) then sum + x else sum) 0 ls

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ somaImpares a
