pascal = iterate next [1] where
	next xs = [head xs] ++ (take (length xs) $ zipWith mplus xs (tail xs)) ++ [last xs]
	mplus a b = mod (a+b) 100
--Note: runs in about 2 minutes.
run = sum $ map sum $ take 25000 pascal
