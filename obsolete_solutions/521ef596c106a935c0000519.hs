module PrimeTime where
import Data.List

prime :: Int -> [Int]
prime n = nubBy (\a b -> elem 0 [mod a b, mod b a]) [2..n]
