import Data.List (elem)
import Data.Maybe (listToMaybe)
import Data.Char (chr, ord)

-- retorna o subvetor incluindo o elemento posição índice e lim elementos a esquerda e a direita
neib :: [a] -> Int -> Int -> [a]
neib xs index lim =
    let start = max 0 (index - lim)
        end   = min (length xs - 1) (index + lim)
    in take (end - start + 1) (drop start xs)

-- verifica se o valor existe no vetor
exists :: Eq a => a -> [a] -> Bool
exists y xs = y `elem` xs

-- converte de digito para char
dig2char :: Int -> Char
dig2char dig = chr (ord '0' + dig)

-- verifica se esse valor pode ser inserido nesse índice
fit :: (String, Int) -> Int -> Int -> Bool
fit (xs, lim) index value =
    let window = neib xs index lim
        c = dig2char value
    in not (exists c window)

-- pega as posições de todos os .
getHoles :: String -> [Int]
getHoles xs = [i | (c, i) <- zip xs [0..], c == '.']

-- insere esse valor nesse index e retorna o novo vetor resultante
set :: String -> Int -> Int -> String
set xs index value =
    let (pre, _:post) = splitAt index xs
    in pre ++ [dig2char value] ++ post

-- tenta resolver o problema para essa posição
-- se é possível resolver, retorna Just resposta, senão Nothing
solve :: (String, Int) -> [Int] -> Int -> Maybe String
solve (xs, lim) holes hindex
    | hindex >= length holes = Just xs
    | otherwise =
        let index = holes !! hindex
            tryValues = [0..lim]
        in listToMaybe $ do
            v <- tryValues
            if fit (xs, lim) index v
               then case solve (set xs index v, lim) holes (hindex + 1) of
                      Just res -> return res
                      Nothing  -> []
               else []

-- prepara a entrada para a função recursiva de resolução
mainSolver :: String -> Int -> String
mainSolver xs lim =
    let holes = getHoles xs
    in case solve (xs, lim) holes 0 of
         Just result -> result
         Nothing     -> error "No solution found"

main :: IO ()
main = do
    xs <- getLine
    lim <- readLn :: IO Int
    putStrLn $ mainSolver xs lim

-- Testes auxiliares
neibTest :: IO ()
neibTest = do
    print $ neib "abcdef.." 0 2 == "abc"
    print $ neib "abc.def"  3 1 == "c.d"
    print $ neib "abc.def"  3 2 == "bc.de"
    print $ neib "abc.def"  1 2 == "abc."
    print $ neib "abc.def"  5 3 == "c.def"

dig2charTest :: IO ()
dig2charTest = do
    print $ map dig2char [0..9] == ['0'..'9']

setTest :: IO ()
setTest = do
    print $ set "12345" 0 9 == "92345"
    print $ set "12345" 1 9 == "19345"
    print $ set "12345" 4 9 == "12349"

fitTest :: IO ()
fitTest = do
    print $ map (fit ("12.345", 1) 2) [1,2,3,4,5] == [True, False, False, True, True]
    print $ map (fit ("12.345", 2) 2) [1,2,3,4,5] == [False, False, False, False, True]
    print $ map (fit ("12.345", 3) 2) [1,2,3,4,5] == [False, False, False, False, False]
    print $ map (fit ("12345.", 4) 5) [1,2,3,4,5] == [True, False, False, False, False]

getHolesTest :: IO ()
getHolesTest = do
    print $ getHoles "12.3.." == [2,4,5]
    print $ getHoles "12.3.4" == [2,4]
    print $ getHoles "...3.4" == [0,1,2,4]

mainTest :: IO ()
mainTest = do
    print $ mainSolver "01.2." 3 == "01320"
    print $ mainSolver ".0..231..5" 5 == "1045231045"
    print $ mainSolver "2..0..............3..........." 3 == "213021302130213021302130213021"
    print $ mainSolver "0..32..41." 5 == "0413250413"
    print $ mainSolver "9....7.620.5318....." 9 == "95318746209531874620"
