module Euler where

import Prelude

{- from package lists -}
import Data.List (range, filter)

{- from package foldable-traversable -}
import Data.Foldable (sum)

ns = range 0 999

multiples = filter (\n -> mod n 3 == 0 || mod n 5 == 0) ns

answer = sum multiples