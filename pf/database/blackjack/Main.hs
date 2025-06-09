cardValue 1 = 11
cardValue 11 = 10
cardValue 12 = 10
cardValue 13 = 10
cardValue n = n

adjust cardsSum aceCount
    | cardsSum <= 21 = cardsSum
    | aceCount == 0 = cardsSum
    | otherwise = (adjust (cardsSum - 10)) (aceCount - 1)

blackjack cards = adjust cardsSum aceCount
    where
        cardsSum = sum [cardValue card | card <- cards]
        aceCount = length $ filter (== 1) cards

main :: IO ()
main = do
    a <- readLn :: IO [Int]
    print $ blackjack a