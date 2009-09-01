import Data.List
import Numeric

fibs = 1:1:zipWith (+) fibs (tail fibs)
primes = 2:filter isprime [3,5..] where
	isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
	notdiv n x = n `mod` x /= 0

run = showFFloat Nothing result "" where
	result = realToFrac (length (filter issub list)) / realToFrac (length list)
	list = [(show x, show y)| x<-fibs25, y<-primes25]
	fibs25 = take 25 fibs
	primes25 = take 25 primes
	issub (a,b) = isInfixOf b a
