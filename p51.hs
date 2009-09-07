--Changed to actual nqueens algorithm.
nqueens n = foldl putq [[]] [1..n] where
	putq pos y = [((x,y):ys) | ys<-pos, x<-[1..n], all (safe (x,y)) ys]
	safe (x1,y1) (x2,y2) = x1/=x2 && y1/=y2 && abs (x1-x2) /= abs (y1-y2)

run = product $ map (fromIntegral . length . nqueens) [4..10]
