module Data.Hash where

import Data.Argonaut.Decode.Class (class DecodeJson)
import GraphQL.Client.Args (class ArgGql)
import GraphQL.Client.ToGqlString (class GqlArgString)


newtype Hash32Hex = Hash32Hex String

instance ArgGql Hash32Hex Hash32Hex
derive newtype instance DecodeJson Hash32Hex
derive newtype instance GqlArgString Hash32Hex