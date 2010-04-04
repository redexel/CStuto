fibs n = let r = replicate n 1 in r ++ next' r where
    next' l = let s = mod (sum l) 1000000 in s : next' ((tail l) ++ [s])

isprime 1 = False
isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) [2..] where
    notdiv n x = n `mod` x /= 0

--10 seconds with -O2
run = length . filter isprime . take 1000000 $ fibs 25
