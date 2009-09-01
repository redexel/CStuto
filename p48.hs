isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) [2..] where
	notdiv n x = n `mod` x /= 0
canPrime k = isprime (6*k-1) || isprime (6*k+1)

run = sum $ filter (not.canPrime) [1..500]	--3000/6
