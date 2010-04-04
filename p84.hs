import Data.Char
primes = 2:3:5:filter isprime (concat [[6*k+1,6*k+5] | k<-[1..]]) where
    isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
    notdiv n x = n `mod` x /= 0

fact n = product [1..n]

run = sum $ map (sum . (map (fact . digitToInt)) . show) $ take 500 primes
