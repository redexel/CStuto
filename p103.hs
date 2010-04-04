--This is a bit cheating.
--but it's my problem.
c m n = a `div` b where
    a = product (map fac [0..n-1]) * fac ((m-n)*n)
    b = product $ map fac [m-n..m-1]
    fac x = product [1..x]

run = c 50 12 `mod` 987654321
main = print run
