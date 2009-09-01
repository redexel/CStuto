powf a b = a^b + b^a
sumpow n = sum $ take n plist
	where plist = zipWith powf [1..] [2..]

run = sumpow 15
