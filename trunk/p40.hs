sumpascal n = next (n-1) 1 [] where
    next 0 m _ = m
    next r m lst = next (r-1) (m + sum this) this where
        this = 1 : zipWith (\a b -> (a+b) `mod` 100) lst (tail lst) ++ [1]

run = sumpascal 25000
