
-- This problem is tricky, but OEIS helped me here.
-- See A076791.

a n 0 = let fibs = 1:1:zipWith (+) fibs (tail fibs) in fibs !! (n+1)
a n k
	| n >= 2 && k == n-1 = 1
	-- Everything from here to n-6 is optional but greatly
	-- speeds up the calculation. Leaving it out would give
	-- me a stack overflow.
	| n >= 3 && k == n-2 = 2
	| n >= 4 && k == n-3 = n+1
	| n >= 5 && k == n-4 = 3*n-5
	| n >= 6 && k == n-5 = (n^2 + 5*n - 26) `div` 2
	| n >= 7 && k == n-6 = 2*n^2 - 8*n - 4
	|otherwise = (a (n-1) k + a (n-2) k) +
		(sum $ zipWith (\e f -> a e f) [n-3,n-4..n-k-2] [k-1,k-2..0])

run = a 100 90
main = print run
