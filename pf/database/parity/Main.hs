paridade [] = False
paridade ls = numOdds `mod` 2 /= 0
  where
    numOdds = foldl (\acc x -> if x then (acc+1) else acc) 0 ls

main :: IO ()
main = do
    a <- readLn :: IO [Bool]
    print $ paridade a
