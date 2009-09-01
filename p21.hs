hex n = reverse (rbin n) where
	rbin 0 = []
	rbin x = [rem x 16] ++ rbin (quot x 16)
countD xs = length $ filter (==13) $ hex (read xs)

main = do
	file <- readFile "p21.txt"
	let nline = lines file
	print $ sum $ map countD nline
