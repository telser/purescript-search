module Test.Check.Gen
  ( QueryWrapper(..)
  ) where

import Prelude (one, (*), ($), pure, (<$>), bind)
import Test.StrongCheck.Gen (vectorOf, chooseInt)
import Test.StrongCheck (class Arbitrary, arbitrary)
import Data.Semiring.Free (free)
import Text.SlamSearch.Types (SearchQuery())
import Data.Foldable (foldl)

-- helper type not to add orphan instances of Arbitrary on Free a
newtype QueryWrapper = QueryWrapper SearchQuery

instance arbQueryWrapper :: Arbitrary QueryWrapper where
  arbitrary = do
    k <- chooseInt 1.0 10.0
    lst <- vectorOf k $ free <$> arbitrary
    pure $ QueryWrapper $ foldl (*) one lst
