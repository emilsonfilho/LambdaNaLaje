uniao ls ms = foldl (\acc x -> if not (elem x acc) then acc ++ [x] else acc) ls ms

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    b <- readLn :: IO [Int]
    print $ uniao a b
