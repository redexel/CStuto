choose n r = fact n `quot` (fact r * fact (n-r)) where    
    fact n = foldl (*) 1 [1..n]
run = choose 17 10 - choose 30 12 + choose 50 3
