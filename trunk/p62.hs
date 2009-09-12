import Data.Char
ishappy n = (head $ dropWhile (\x -> x/=1 && x/=4) happy) == 1 where
	happy = iterate sqd n
	sqd x = sum $ map ((^2) . digitToInt) (show x)

run = length $ filter ishappy [1..300000]
