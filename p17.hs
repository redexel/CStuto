import Data.Char

sumexp s = sum $ map exp (group2 s) where
	group2 [a,b] = [(a,b)]
	group2 (x:y:rest) = [(x,y)] ++ group2 rest
	exp (a,b) = (digitToInt a)^(digitToInt b)

run = sumexp "342345820139586830203845861938475676"
