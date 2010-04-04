import Data.Char
run = sum $ map (fact . digitToInt) (show (fact 100)) where
    fact n = product [1..n]
