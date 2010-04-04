import Data.Numbers.Primes
import System.Random
main = do
    g <- getStdGen
    let np (xs,gen,n) = let (k,ngen) = isProbablyPrime n gen in if k then (n:xs,ngen,n+1) else (xs,ngen,n+1)
    print . sum . (\(x,_,_)->x) . last . take (10^5) $ iterate np ([],g,10^12)
