module BreakingChocolate where

breakChocolate :: Int -> Int -> Int
breakChocolate n m = if n>0 && m>0 then n*m-1 else 0
