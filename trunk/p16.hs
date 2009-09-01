blackjack n = (bj (sub 0 2 n)) + (bj (sub 2 4 n)) + (bj (sub 4 6 n)) where
	sub a b = take (b-a) . drop a
	matchA s = any (=='A') s
	matchFace s = sub 0 2 s == "10" || any (\x->x=='J'||x=='Q'||x=='K') s
	bj n
		| any matchA n && any matchFace n = 1
		| otherwise = 0

main = do
	file <- readFile "p16.txt"
	let nline = lines file
	let decks = map words nline
	print $ sum (map blackjack decks)
