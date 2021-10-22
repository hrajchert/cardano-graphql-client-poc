module Data.Percentage where

import Data.Argonaut.Decode.Class (class DecodeJson)

newtype Percentage = Percentage Number

derive newtype instance DecodeJson Percentage