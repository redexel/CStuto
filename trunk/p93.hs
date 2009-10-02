hex = reverse . hex' where
	hex' 0 = ""
	hex' x = let (d,m) = x `divMod` 16 in
		lookup!!m : hex' d
	lookup = "0123456789abcdef"

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

--Very similar to p92.
--30s, less than p92 because the strings are a bit shorter.
mx = 10^7
run = sum . map (uncurry distance . pad . (both hex)) $ zip [0..] [1..mx] where
	both f (a,b) = (f a,f b)
