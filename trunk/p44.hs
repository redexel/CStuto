import Numeric
fibs = 1:1:zipWith (+) fibs (tail fibs)
primes = 2:filter isprime [3,5..] where
	isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
	notdiv n x = n `mod` x /= 0
tris = map tri [1..] where
	tri n = n*(n+1) `quot` 2

run = showFFloat Nothing res "" where
	res = (realToFrac . length) (filter f list) / (realToFrac . length) list
	list = [(r,g,b) | r<-take 50 primes, g<-take 75 fibs, b<-take 100 tris]
	f (r,g,b) = odd r && odd g && odd b && last (show r) == '7'
