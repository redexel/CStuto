ints n = filter (\s -> sum s == n && length s > 1) $
	map (chain 0) [1..n] where
	chain sm t | sm>=n = []
	chain sm t = t : chain (sm+t) (t+1)

run = sum . map (\s -> head s + last s) $ ints 2009
