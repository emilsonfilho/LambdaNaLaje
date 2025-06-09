import Data.Char (ord, chr)

next c = chr (ord c + 1)

modifyStr str i ch = ini ++ [ch] ++ end
    where
        ini = take i str
        end = drop (i+1) str

getInfSupLim lim i len = [x | x <- [-lim..lim], 0 <= (i+x) && (i+x) < len]

canBePlaced str i el lim len = null [x | x <- getInfSupLim lim i len, str !! (i + x) == el]

change str i lim el
    | i >= length str = str
    | (str !! i) /= '.' = change str (i+1) lim el
    | el `notElem` ['0'..'9'] = str
    | otherwise = if (canBePlaced str i el lim (length str)) then (change (modifyStr str i el) (i+1) lim '0') else change str i lim (next el)