import Data.Char

reverseVal n
    |isLetter n = 27-normalVal (toLower n)
    |otherwise = 0 where
        normalVal n = fromEnum n-96

run = sum $ map reverseVal "The quick brown fox jumped over the cow"
