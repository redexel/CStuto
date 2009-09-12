next [a] = []
next (a:b:xs) = a+b : next (b:xs)
triangle xs = take (length xs) $ iterate next xs
run = s . filter p . map (reverse . triangle) $ [[7,a,8,5,b] | a<-[1..10], b<-[1..10]] where
	s = sum . concat . head 
	p a =
		a!!0!!0==115&&
		a!!2!!0==33&&
		a!!3!!2==13
