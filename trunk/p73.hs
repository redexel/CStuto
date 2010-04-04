import Data.Char

fibs = 1:1:zipWith (+) fibs (tail fibs)
triangle = tri' 1 fibs where
    tri' n xs = take n xs : tri' (n+1) (drop n xs)
leftdiag = map head triangle

run = sum . map digitToInt . show . sum $ take 25 leftdiag
