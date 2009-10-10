main = do
	f <- readFile "p94.txt"
	print . reverse . show . run . map words $ lines f

run xs = foldl (+) 0 $ map (sum . run') xs where
	run' :: [String] -> [Integer]
	run' [a,b] = [read (reverse a), read (reverse b)]
