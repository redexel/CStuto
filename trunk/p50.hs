fibs = 1:1:zipWith (+) fibs (tail fibs)
primes = 2:filter isprime [3,5..] where
	isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
	notdiv n x = n `mod` x /= 0

run = primes!!49 + fibs!!49 + [1,3..]!!49
