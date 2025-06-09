partes ls = go (reverse ls)
  where
    go [] = [[]]
    go (x:xs) = go xs ++ (map (++[x]) (go xs))

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ partes a
