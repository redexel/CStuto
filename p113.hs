--Multinomial coefficient: Ways to choose k elements from set of n
--if repetitions are allowed.
--Cm(n,k) = C(n+k-1,k).
import Char

fact n = product [1..n]
binomial n k = fact n `div` (fact k * fact (n-k))
multinomial n k = binomial (n+k-1) k

run = sum . map digitToInt . show $ multinomial 10000 2500
