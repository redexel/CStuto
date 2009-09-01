eq n
	| n!!0 == n!!1 = 1
	| otherwise = 0

main = do
	file <- readFile "p15.txt"
	let nline = lines file
	let rolls = map words nline
	print $ sum (map eq rolls)
