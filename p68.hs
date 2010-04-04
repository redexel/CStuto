primes = 2:filter isprime [3,5..] where
    isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
    notdiv n x = n `mod` x /= 0
tree = tree' 0 primes where
    tree' n xs = take n xs : tree' (n+1) (drop n xs)
run = sum $ tree !! 100
