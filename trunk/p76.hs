
import Data.List
import Data.Maybe

fibs a b = a : fibs' a b where
    fibs' a b = b : fibs' b (a+b)

primes = 2:3:5:filter isprime (concat [[6*k+1,6*k+5] | k<-[1..]]) where
    isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes
    notdiv n x = n `mod` x /= 0

search table el = search' 0 table where
    search' r (row:rest)
        | el `elem` row = (r, fromJust $ el `elemIndex` row)
        | otherwise = search' (r+1) rest

table size = map (row size) [0..size]
row size 0 = take size $ fibs 1 2
row size n = let (x,y) = search (table size) n; fb = row size x in
    take size . drop 2 $ fibs n ((fb!!(y+1))+1)

--A bit lame, just map primes!!n to the table on problem 75.
--Primes is a bit slow though.
run = primes !! (p75-1) where
    p75 = table 17 !! 15 !! 15
