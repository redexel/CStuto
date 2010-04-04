pow5 = map (5^) [0..4]
tom = do
    a <- pow5
    b <- pow5
    c <- pow5
    d <- pow5
    e <- pow5
    return $ sum [a,b,c,d,e]

pow7 = map (7^) [0..6]
julie = do
    a <- pow7
    b <- pow7
    c <- pow7
    d <- pow7
    e <- pow7
    f <- pow7
    g <- pow7
    return $ sum [a,b,c,d,e,f,g]

run = length . filter tomwins $ [(a,b)| a<-tom, b<-julie] where
    tomwins (t,j) = t > j
