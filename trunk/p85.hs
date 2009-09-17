import Data.Char
fibs = 1:1: zipWith (+) fibs (tail fibs)
fact n = product [1..n]

run = sum $ map (sum . (map (fact . digitToInt)) . show) $ take 75 fibs
