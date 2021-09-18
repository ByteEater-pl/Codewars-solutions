module LargestDigits where
import Data.List

digit5 :: String -> Int
digit5 xs = maximum (map (read . take 5) (init (tails xs)))
