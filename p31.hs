run = length $ filter (\x->x=='0') (show (fact 100)) where
	fact n = product [1..n] 
