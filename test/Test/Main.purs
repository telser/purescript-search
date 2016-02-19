module Test.Main where

import Prelude  (Unit, bind)

import Control.Monad.Eff (Eff())
import Test.Effects (TEST_EFFECTS())
import Test.Check (check)
import Test.Assertions (assertions)

main :: Eff TEST_EFFECTS Unit
main = do
  check
  assertions
