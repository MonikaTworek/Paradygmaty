import Data.List (delete)
permutations :: Eq a => [a] -> [[a]]
permutations [] = [[]]
permutations list = [head:tail | head <- list, tail <- permutations (delete head list)]
