# Coin Changer kata with property based testing

> Given a list of coins and an amount, give a solution that requires the least amount of coins to add up to the amount.
Return the combination of coins and any leftover amount.

Implement the Coin Changer program and cover it with tests.

You are only allowed to write property based tests using Haskell's [QuickCheck](https://hackage.haskell.org/package/QuickCheck) library.

## Example
Given the amount `26` and the coins `[5, 10, 10, 20]` we expect the solution to be:
```
coins: [5, 20]
leftover amount: 1
```

Feel free to use any encoding of the input and output that you seem fit. For example, the coins given could also be given in a map-like structure: `[("5 Cent", 1), ("10 Cent", 2), ("20 Cent", 1)]`

## Variants
* Assume that you have an unlimited amount of coins. The coins then specify the available types of coins

## Run the tests

You can run the tests provided in this example project with [Stack](https://docs.haskellstack.org):

```
> stack test
...        
Prelude.reverse
  reversing a String twice yields the original String
    +++ OK, passed 100 tests.

Finished in 0.0029 seconds
1 example, 0 failures
...                          
```
