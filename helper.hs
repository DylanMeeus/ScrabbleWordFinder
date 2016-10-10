import Data.List as DL
import System.Environment
import System.IO


-- I could maybe add a flag to not break the search after the first matches have been found.

buildPermutations i = permutations i


-- create a list of words where there is always a different letter missing from the original
removeLetter :: String -> [String]
removeLetter w = [take (x-1) w ++ take (l-x) (reverse w) | x <- [1..l]]
    where l = length w


-- finds matching words, removes single letters
matchingWords i ws = filter(\x -> length x > 1) . nub $ intersect (ps) wsl
    where ps =  buildPermutations i
          wsl = lines ws



findWords :: [String] -> String -> [String]
findWords [] ws = [""]

-- finds matching words, stops after first words have been found.
findWords i ws =
        if (length resultSet) /= 0
            then concat resultSet
        else
            findWords (removeLetter (last i)) ws
    where resultSet = filter(\y -> y /= []) $ map (\x -> matchingWords x ws) i



main = do
    [i,wf] <- getArgs
    contents <- readFile wf
    putStrLn $ show (findWords (i:[]) contents)

