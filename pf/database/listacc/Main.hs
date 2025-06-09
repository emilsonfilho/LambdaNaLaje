listacc ls = reverse (snd (foldl (\(sum, xs) x -> (x + sum, (x + sum):xs)) (0,[]) ls))

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ listacc a
