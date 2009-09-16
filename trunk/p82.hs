import Data.Char

sqseq = 1 : map last (iterate next [1,1])
next xs = let s = sum xs in xs ++ [s*s]
run = sum . map digitToInt . show $ sqseq !! 9

