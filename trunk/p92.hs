binary = reverse . binary' where
	binary' 0 = ""
	binary' x = let (d,m) = x `divMod` 2 in
		(show m) ++ binary' d

distance as bs = foldr nx 0 (zip as bs) where
	nx (aq,bq) acc
		| aq == bq = acc
		| otherwise = 1+acc

pad (a,b)
	| length a == length b = (a,b)
	| otherwise = (pad' (length b) a, b) where
		pad' n xs
			| length xs == n = xs
			| otherwise = '0' : pad' (n-1) xs

--Brute force, 90 seconds.
mx = 10^7
run = sum . map (uncurry distance . pad . (both binary)) $ zip [0..] [1..mx] where
	both f (a,b) = (f a,f b)
