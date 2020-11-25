import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Prelude.reverse" $ do
    it "reversing a String twice yields the original String" $ do
      -- https://hspec.github.io/quickcheck.html
      property $ \(x :: String) -> reverse (reverse x) == x