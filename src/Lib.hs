module Lib
    ( helloWorld
    ) where

helloWorld :: IO ()
helloWorld = putStrLn "Hello World!"

-- “Given an amount and a series of Coin Values, 
-- give me the best possible solution that requires the least amount of Coins 
-- and the remaining value if there is any”

-- Example: For the series of Coin Values [5 Cent, 10 Cent, 10 Cent, 20 Cent]
--  and the amount "25" I get back the solution [5 Cent, 20 Cent]
--   and the remaining amount 0