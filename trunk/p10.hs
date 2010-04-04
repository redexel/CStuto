isprime n = all notdiv $ takeWhile (\x->x*x<=n) primes where
    notdiv x = n `mod` x /= 0
primes = 2:filter isprime [3,5..]

run = sum $ takeWhile (<5000) primes
