module Codewars.Kata.Permutations (permutations) where
import Data.List (nub,inits,tails)

permutations :: String -> [String]
permutations [] = [""]
permutations (h:t) = nub $ concat
  [zipWith ((.(h:)) . (++)) (inits p) (tails p) | p <- permutations t]
