module ContiguousVowels where

import Data.Char
import Data.List

sortByVowels l =
  snd . snd <$> sort [(
    -maximum (scanl
      (\m c ->
        if toLower c `elem` "aeiou"
        then m + 1
        else 0)
      0
      s),
    p)
    | p@(_,s) <- zip [0..] l]
