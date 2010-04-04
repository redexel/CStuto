import Data.List(nub)
power n = map (^n) [1..]
run = sum $ nub [a+b | a <- take (rt 2) (power 2), b <- take (rt 3) (power 3), a+b < 100000]
    where rt n = ceiling $ 100000 ** (1/n)
