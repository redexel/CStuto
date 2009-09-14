--Woot! My first problem submitted, and this one is NOT TRIVIAL.

import Data.List

type Point = (Integer,Integer)
type Polyomino = [Point]

--Align polyomino to origin (minimum becomes 0)
align :: Polyomino -> Polyomino
align points = map normalize points where
	mx = minimum $ map fst points
	my = minimum $ map snd points
	normalize (x,y) = (x-mx, y-my)

--List all transformations of a polyomino
transformations :: Polyomino -> [Polyomino]
transformations p = 
	[p,
	map rotate p,
	map (rotate.rotate) p,
	map (rotate.rotate.rotate) p] where
		rotate (x,y) = (y,-x)

--All possible polyominos from a certain polyomino
next :: Polyomino -> [Polyomino]
next poly = nub $ map (reduce . (\x -> x:poly) ) nextpts where
	nextpts = nub . filter (`notElem` poly) . concatMap adjacent $ poly
	reduce p = minimum $ map (sort . align) (transformations p)
	adjacent (x,y) = [(x+1,y), (x-1,y), (x,y+1), (x,y-1)]

--All polyominos of a certain length
polyominos :: Integer -> [Polyomino]
polyominos 1 = [ [(0,0)] ]
polyominos n = nub $ concatMap next $ polyominos (n-1)

run = length (polyominos 8)

