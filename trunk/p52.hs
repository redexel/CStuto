binary n = reverse (rbin n) where
	rbin 0 = []
	rbin x = [rem x 2] ++ rbin (quot x 2)
count1 x = length $ filter (==1) $ binary x

run = 365 * (sum $ map (sum . map count1) day) where
	day = [[h,m,s]| h<-[0..23], m<-[0..59], s<-[0..59]]
