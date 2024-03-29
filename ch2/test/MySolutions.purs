module MySolutions where

import Prelude

import Effect (Effect)
import Effect.Console (log)

{- from package numbers -}
import Data.Number (sqrt, pi)

{- from package integers -}
import Data.Int (rem)

diagonal w h = sqrt (w * w  + h * h)

circleArea r = pi * r * r

leftoverCents n = rem n 100