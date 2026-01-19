module MineLocation where

import Data.Array

mineLocation :: Array (Int, Int) Int -> Maybe (Int, Int)
mineLocation a =
  case [p | (p,1) <- assocs a] of
    x:_ -> Just x
    _ -> Nothing
