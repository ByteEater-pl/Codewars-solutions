module UnlimitedGameOfLife where
import UnlimitedGameOfLife.Preloaded (htmlize)
import Data.List

getGeneration :: [[Int]] -> Int -> [[Int]]
getGeneration b n = iterate (\b ->
  let r = iterate (transpose . reverse . dropWhile (all (==0)))
        [[fromEnum (sum [e !! (i+k) !! (j+l) | k <- o, l <- o] `elem`
                  [[3],[3,4]]!!(e!!i!!j))
              | j <- [1 .. m+2]]
            | let n = length b
                  m = length (b!!0)
                  e = iterate (transpose . reverse . map ([0,0]++)) b !! 4
                  o = [-1,0,1],
          i <- [1 .. n+2]] !! 4
      in if null r then [[]] else r) b !! n
