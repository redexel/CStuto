fibs = 1:1:zipWith (+) fibs (tail fibs)
run = sum $ take 75 fibs
