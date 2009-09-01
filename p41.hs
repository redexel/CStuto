import qualified Data.Map as M
import Data.Maybe(fromJust)
import Data.Char(digitToInt)

factd d = fromJust (M.lookup d facts) where
	facts = M.fromList . zip [0..] $ 1:scanl1 (*) [1..9]
primes = 2:filter isprime [3,5..]
isprime n |n<2 = False
isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) primes where
	notdiv n x = n `mod` x /= 0

run = length $ filter f (takeWhile (<10^6) primes) where
	f n = isprime . sum . map (factd . digitToInt) $ show n
