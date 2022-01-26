import Control.Monad (sequence)
import Data.List ((\\))
import Lib (Coins, change)
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Prelude.reverse" $ do
    it "reversing a String twice yields the original String" $ do
      -- https://hspec.github.io/quickcheck.html
      property $ \(x :: String) -> reverse (reverse x) == x

  describe "coin changer example based tests" $ do
    it "returns a the solution with the least required amount of coins" $ do
      change 19 [1, 1, 1, 1, 5, 14, 15] `shouldBe` ([14, 5], 0)

  describe "coin changer property based tests" $ do
    it "returns the amount when there are no coins available" $ do
      property $ \(Positive amount) -> change amount [] `shouldBe` ([], amount)

    it "returns the coin with no remainder when there is a coin that equals the amount" $ do
      property $ \(Positive amount) -> change amount [amount] `shouldBe` ([amount], 0)

    it "remainder and coins sum up to the amount" $ do
      property $ \(positiveCoins :: [Positive Int], Positive amount) ->
        let coins = map getPositive positiveCoins
            (resultCoins, resultRemainder) = change amount coins
         in sum resultCoins + resultRemainder == amount

    it "only leaves coins unused that are bigger than the remaining amount" $ do
      property $ \(positiveCoins :: [Positive Int], Positive amount) ->
        let coins = map getPositive positiveCoins
            (resultCoins, resultRemainder) = change amount coins
            remainingCoins = coins \\ resultCoins
         in remainingCoins `shouldSatisfy` all (> resultRemainder)
