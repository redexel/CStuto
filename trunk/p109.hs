sq n = floor . sqrt $ realToFrac n
prime n | n < 2 = False
prime n = all (\x -> n `mod` x /= 0) [2..sq n]

primefactors n | prime n = [n]
primefactors n = let h = head $ filter (\x -> n `mod` x == 0) [2..] in
    h : primefactors (n `div` h)

--Formula derived from Wolfram Alpha.
f x = map primefactors [x-1,x+1,x^2+1,x^2-x+1,x^2+x+1,x^4+1,x^4-x^2+1,x^8+1,x^8-x^4+1,x^16-x^8+1]

run = sum . concat $ f 10
