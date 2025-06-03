import Text.Printf

calcTaxes p = 5 * p - 5

calc v p = v + (calcTaxes p)/100*v

main :: IO ()
main = do
    value <- readLn :: IO Float
    times <- readLn :: IO Float
    let total = calc value times
    printf "%.2f\n" (total / times :: Float)
    printf "%.2f\n" (total :: Float)
