allDifferent n = foldr (*) 1 $ map nprob [1..n-1]
    where nprob n = 1-(n/365)

birthday n = 1-allDifferent n
run = birthday 25
