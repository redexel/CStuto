import Data.List
tree = prune $ iterate next [(0,1),(1,0)] where
	next [(a,b),(c,d)] = [(a,b),(a+c,b+d),(c,d)]
	next ((a,b):(c,d):xs) = (a,b):(a+c,b+d):next ((c,d):xs)
	prune (x:y:xs) = (y\\x):prune (y:xs)

run = sum . head . filter (0.7 `elem`) $ map (map frac) tree where
	frac (a,b) = realToFrac a / realToFrac b
