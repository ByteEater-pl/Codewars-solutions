module WeIrDStRiNgCaSe where
import Data.Char

toWeirdCase :: String -> String
toWeirdCase =
  unwords
  . map (map (\(i, c) -> if odd i then toLower c else toUpper c) . zip [0..])
  -- . map (map (\(i, c) -> ([toUpper, toLower] !! mod i 2) c) . zip [0..])
  -- . map (map (\(e, c) -> if e then toUpper c else toLower c) . zip (cycle [True, False]))
  -- or with {-# LANGUAGE  ParallelListComp #-}
  -- . map (\w -> [if e then toUpper c else toLower c | c <- w | e <- cycle [True, False]])
  . words
