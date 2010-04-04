import Data.Char

thirdterm n
    |elem '.' ns && length tail' > 3 = digitToInt (tail' !! 3)
    |otherwise = 0 where
        ns = show n
        tail' = (dropWhile (\x->x/='.') ns)
f n = (3*n+2) / (2*n+3)

run = sum $ map thirdterm $ map f [1..10000]
