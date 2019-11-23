module Main where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Math (pi, sqrt)

main :: Effect Unit
main =
  logShow (diagonal 3.0 4.0)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w*w + h*h)

circleArea :: Number -> Number
circleArea r = pi * r * r
