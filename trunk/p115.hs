
-- nf k d recursively computes the number of combinations of sequences that are
-- k numbers long where the last number is exactly d. Also instead of 0..9 we use 1..10.
nf 1 d = d
nf k d = sum $ map (nf (k-1)) [1..d]

run = nf 25 10
main = print run
