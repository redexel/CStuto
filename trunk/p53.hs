--Brute force, takes 6 minutes with -O2 but gives the correct answer.
import Data.List
adjacent a b = abs (a-b) <= 1
com12 = 
	[(0,1), (0,2), (0,3), (0,4), (1,3), (1,4), (1,5), (2,3), (2,6), (2,7), (3,4), (3,6), (3,7), (3,8),
	(4,5), (4,7), (4,8), (4,9), (5,8), (5,9), (6,7), (6,10), (7,8), (7,10), (7,11), (8,9), (8,10), (8,11),
	(9,11), (10,11)]
run = length . filter f $ permutations [1..12] where
	f x = all (notadj x) com12
	notadj x (n1, n2) = not $ adjacent (x!!n1) (x!!n2)
