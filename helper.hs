import Data.List as DL
import System.Environment
import System.IO

-- create a list of words where there is always a different letter missing from the original
removeLetter :: String -> [String]
removeLetter w = [take (x-1) w ++ take (l-x) (reverse w) | x <- [1..l]]
    where l = length w


-- finds matching words, removes single letters
matchingWords i ws = filter(\x -> length x > 1) . nub $ intersect (ps) wsl
    where ps =  permutations i
          wsl = lines ws



findWords :: [String] -> String -> Bool ->  [String]
findWords [] ws r = [""]

-- finds matching words, stops after first words have been found.
findWords i ws r =
        if ( (length resultSet) /= 0 && r == True)
            then concat resultSet
        else if ( (length resultSet) /= 0 && r == False)
            then (concat resultSet) ++ (findWords (removeLetter (last i)) ws r)
        else
            findWords (removeLetter (last i)) ws r
    where resultSet = filter(\y -> y /= []) $ map (\x -> matchingWords x ws) i



-- i : input word
-- wf : word file
-- r (True/False) : find all, or return after first one found.
main = do
    [i,wf,r] <- getArgs
    contents <- readFile wf
    putStrLn $ show $ nub $ filter(\x -> x /= "")  (findWords (i:[]) contents (read r :: Bool))

