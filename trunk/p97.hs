getNumbers s = let t = foldr next ([],[]) s in
	if length (fst t) == 0 then snd t else fst t : snd t where
	next x (ac,acx)
		| x `elem` ['0'..'9'] = (x:ac,acx)
		| otherwise = case length ac of
			0 -> ([],acx)
			_ -> ([],ac:acx)

main = print . maximum . map (sum . map read . getNumbers) . lines =<<
	readFile "p97.txt"
