import Data.List
fibs = 1:1:zipWith (+) fibs (tail fibs)
primes = 2:filter isprime [3,5..] where
	isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
	notdiv n x = n `mod` x /= 0

run = sum $ ((take 2000 fibs) `intersect` (take 2000 primes)) `intersect` (take 2000 [1,3..])
