run = myage + lcm' [3,4,5] where
	myage = head $ [x | x<-[1..], mod x 3 == 1, mod x 4 == 2, mod x 5 == 4]
	lcm' n = foldl lcm 1 n
