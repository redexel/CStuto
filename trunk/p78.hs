import Data.List

mfromlines :: [String] -> [[String]]
mfromlines f = 
	case ("---" `elemIndex` f) of
		Just index -> [take index f, drop (index+1) f]

parse [] = []
parse (line:lines)
	| otherwise = map read' (words line) : parse lines where
		read' s = read s :: Integer

matrix m1 m2 = let l = length m1-1 in map (\k -> map (cell k) [0..l]) [0..l] where
	cell x y = sum $ zipWith (*) (m1!!x) (map (!!y) m2)

main = do
	file <- readFile "p78.txt"
	print . sumall . matrix' . map parse . mfromlines . lines $ file where
		matrix' [a,b] = matrix a b
		sumall x = sum $ map sum x

