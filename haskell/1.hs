scalar :: Num a => [a] -> [a] -> a 
scalar a b = sum (zipWith (*) a b)
