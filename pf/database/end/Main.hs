import Data.List ( intercalate ) 
import Text.Printf ( printf )

process :: String -> String
process line = case words line of
    ["sum", x, y] -> show (readInt x + readInt y)
    ["half", x]   -> printf "%.2f" (readDouble x / 2)
    _             -> error $ "Invalid command: " ++ line
    where
        readInt :: String -> Int
        readInt = read

        readDouble :: String -> Double
        readDouble = read

main :: IO ()
main = do
    line_list <- takeWhile (/="end") . lines <$> getContents
    putStrLn $ intercalate "\n" . map process $ line_list
    
