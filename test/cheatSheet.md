testing a simple property with `property`

https://hspec.github.io/quickcheck.html
```
property $ \(x :: String) -> reverse (reverse x) == x
```

restricting the generated value with modifiers like `Positive`

https://hackage.haskell.org/package/QuickCheck-2.14.2/docs/Test-QuickCheck-Modifiers.html#t:Positive
```
property $ \(Positive x) -> x > 0
```

creating a custom generator
```
evenNumbers :: Gen Int
evenNumbers = do
    int <- arbitrary
    return (int * 2)

numbersBetween0And100 :: Gen Int
numbersBetween0And100 = do
    int <- choose (0, 100)
    return int
```

using a custom generator with `forAll`

https://hackage.haskell.org/package/QuickCheck-2.14.2/docs/Test-QuickCheck.html#v:forAll

```
property $ forAll evenNumbers $ \x -> even x
```

restricting generated values with `suchThat`

https://hackage.haskell.org/package/QuickCheck-2.14.2/docs/Test-QuickCheck.html#v:suchThat
```
property $ forAll (suchThat arbitrary \x -> even x) $ \x -> x `mod` 2 == 0
```