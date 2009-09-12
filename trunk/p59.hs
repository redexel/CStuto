solve xs = head $ foldr1 reduce xs where
	reduce top bottom
		|length top == 0 = bottom
	reduce (t1:tx) (b1:b2:bx) = t1 + min b1 b2 : reduce tx (b2:bx)

main = do
	file <- readFile "p59.txt"
	print . solve $ map ((\x->map read x::[Integer]) . words) $ lines file
