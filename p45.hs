import Data.Char
toDec s = sum $ zipWith (*) (map (2^) [0..]) (map digitToInt (reverse s))
maxn = 2^13
tri x = x `elem` (takeWhile (<maxn) (map (\x->x*(x+1)`quot`2) [1..]))
pent x = x `elem` (takeWhile (<maxn) (map (\x->x*(3*x-1)`quot`2) [1..]))
hex x = x `elem` (takeWhile (<maxn) (map (\x->x*(2*x-1)) [1..]))
main = do
	f <- readFile "p45.txt"
	let s = map toDec $ lines f
	print $ tot3 s * tot5 s * tot6 s where
		tot3 x = length $ filter tri x
		tot5 x = length $ filter pent x
		tot6 x = length $ filter hex x
