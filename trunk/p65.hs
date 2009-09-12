value x
	| x `elem` "ad0123456789" = 1
	| x `elem` "be" = 2
	| x `elem` "cf" = 3
values = sum . map value

hex i = reverse (hex' i) where
	hex' x
		| x < 16 = let table m = "0123456789abcdef" !! m in [table x]
		| otherwise = let (q,r) = quotRem x 16 in 
			(hex' r) ++ hex' q

main = readFile "p65.txt" >>=
	print.hex.sum.map values.lines
