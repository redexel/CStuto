fibs = 1:1:zipWith (+) fibs (tail fibs)
run = head $ dropWhile (\n->length (show n) < 15) fibs
