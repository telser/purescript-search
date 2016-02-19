module Test.Check
  ( check
  ) where

import Prelude (Unit, show, (<>))

import Control.Monad.Eff (Eff())
import Data.Either (Either(Right, Left))
import Test.StrongCheck (Result(Failed), quickCheck, (===))
import Text.SlamSearch (mkQuery)
import Text.SlamSearch.Printer (strQuery)
import Test.Check.Gen (QueryWrapper(QueryWrapper))
import Test.Effects (TEST_EFFECTS())

checkFn :: QueryWrapper -> Result
checkFn (QueryWrapper query) =
  let str = strQuery query in
  case mkQuery str of
    Left _ -> Failed (show query <> "\n" <> show str)
    Right res -> res === query

check :: Eff TEST_EFFECTS Unit
check = quickCheck checkFn
