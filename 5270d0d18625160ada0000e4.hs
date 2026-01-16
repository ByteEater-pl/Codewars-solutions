module Greed (score) where

import Data.List

score :: [Int] -> Int
score dice = sum [
  (if n > 2 then [700, 200, 300, 400, 350, 600] !! (v - 1) else 0) + n *
  case v of
    1 -> 100
    5 -> 50
    _ -> 0
  | l@(v:_) <- group $ sort dice,
    let n = length l]
