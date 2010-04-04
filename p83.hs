--Yay, done all problems! (for now)
--This one was actually very tricky.
import Data.List
import Data.Char

sq n = floor . sqrt $ realToFrac n
prime n | n < 2 = False
prime n = all (\x -> n `mod` x /= 0) [2..sq n]

primefactors n | prime n = [n]
primefactors n = let h = head $ filter (\x -> n `mod` x == 0) [2..] in
    h : primefactors (n `div` h)

sumdivisors n = let p = group (primefactors n) in
    product . map k $ p where
        k g = ((head g)^(length g+1)-1) `div` (head g-1)

run = sum . map digitToInt . show $ sumdivisors (product [1..1000])

