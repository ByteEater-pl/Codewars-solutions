module MineLocation where

import Data.Array
import Data.Tuple

mineLocation :: Array (Int, Int) Int -> Maybe (Int, Int)
mineLocation = lookup 1 . map swap . assocs
