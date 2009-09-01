fact n = foldr1 (*) [1..n]
run = sum $ map fact [1..15]
