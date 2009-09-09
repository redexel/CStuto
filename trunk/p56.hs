--This one is really tricky.. Brute force approach was too slow
--but this program uses backtracking.
--Runs in 20 seconds with -O2.

data Square = Square Int Int
	deriving (Show, Eq)
type Size = (Int,Int)

moves :: Size -> Square -> [Square]
moves (wid,len) (Square x y) = filter p . map (\(a,b)->Square (x+a) (y+b)) $ transforms where
	transforms = [(1,2), (2,1), (1,-2), (2,-1), (-1,2), (-2,1), (-1,-2), (-2,-1)]
	p (Square a b) = a>0 && a<=wid && b>0 && b<=len

counttours size = length (search size)
search :: Size -> [[Square]]
search size@(wid,len) = helper [[Square 1 1]] where
	end = wid*len
	helper pr
		| length (head pr) == end = pr
		| otherwise = helper $ concatMap next pr
	next xs = map (\x->x:xs) $ filter (`notElem` xs) (moves size (head xs))

run = product . map counttours $ [(4,5), (4,7), (5,5)]
