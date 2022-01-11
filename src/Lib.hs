module Lib
  ( helloWorld,
    change,
    Coins,
  )
where

import Data.Function ((&))
import Data.List (find, sort, (\\))
import Data.Maybe (fromMaybe, listToMaybe)

helloWorld :: IO ()
helloWorld = putStrLn "Hello World!"

-- Add your coin changer function here

type Coins = [Int]

change :: Int -> Coins -> (Coins, Int)
change 0 availableCoins = ([], 0)
change amount [] = ([], amount)
change toChange availableCoins =
  maybe
    ([], toChange)
    ( \coin ->
        let (restChange, restRemainder) = change (toChange - coin) (availableCoins \\ [coin])
         in (coin : restChange, restRemainder)
    )
    findLargestCoin
  where
    findLargestCoin = find (<= toChange) (reverse $ sort availableCoins)
