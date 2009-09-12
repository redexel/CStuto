fibs = 1:1:zipWith (+) fibs (tail fibs)
value x
	| x `elem` "adgjmptw" = 1
	| x `elem` "behknqux" = 2
	| x `elem` "cfilorvy" = 3
	| x `elem` "sz" = 4
values = sum . map value

main = readFile "p64.txt" >>= print.length.filter isfib.map values.lines where
	isfib x = x `elem` (takeWhile (<=x) fibs)
