-- finds words in a list, based on permuations of input
-- We don't need to use all letters provided, but the more, the better
    -- Permutate over the
    -- Well actually different letters have different values, I could probably hook that up

import Data.List as DL
import System.Environment
import System.IO



-- build a list of permutations of the provided letters


--- we also want permutations of every 'smaller part'
-- I actually want a combinatorial selection here
-- for i = 0, i <= n, select all ways to take n from word

buildPermutations i = permutations i


-- create a list of words where there is always a different letter missing from the original
removeLetter :: String -> [String]
removeLetter w = [take (x-1) w ++ take (l-x) (reverse w) | x <- [1..l]]
    where l = length w


matchingWords i ws = nub $ intersect (ps) wsl
    where ps =  buildPermutations i
          wsl = lines ws


findWords i ws =
        if (length resultSet) /= 0
            then resultSet
        else
            findWords (removeLetter (last i)) ws
    where resultSet = filter(\y -> y /= []) $ map (\x -> matchingWords x ws) i


main = do
    [i,wf] <- getArgs
    contents <- readFile wf
    putStrLn $ show (findWords (i:[]) contents)

