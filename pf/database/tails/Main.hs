filtrandoCaudas :: [[Int]] -> [[Int]]
filtrandoCaudas xss = [tail xs | xs <- xss, xs /= []]

main :: IO ()
main = do
    a <- readLn :: IO [[Int]]
    print $ filtrandoCaudas a
