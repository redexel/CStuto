fibs = 1:1:zipWith (+) fibs (tail fibs)
run = length $ show (fibs !! 1000)
