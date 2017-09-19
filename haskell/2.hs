split :: [a] -> ([a], [a])
split [] = ([], [])
split [x] = ([x], [])
split (first:second:rest) = (first:firstrest, second:secondrest) where (firstrest, secondrest) = split rest
