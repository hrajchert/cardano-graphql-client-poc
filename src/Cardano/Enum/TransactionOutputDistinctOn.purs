module Cardano.Enum.TransactionOutputDistinctOn where

import Prelude

import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError(..), decodeJson)
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Data.Either (Either(..))
import Data.Function (on)
import GraphQL.Client.Args (class ArgGql)
import GraphQL.Client.ToGqlString (class GqlArgString)
import GraphQL.Hasura.Decode (class DecodeHasura)
import GraphQL.Hasura.Encode (class EncodeHasura)
import GraphQL.Client.Variables.TypeName (class VarTypeName)


data TransactionOutputDistinctOn 
  = Address


instance eqTransactionOutputDistinctOn :: Eq TransactionOutputDistinctOn where 
  eq = eq `on` show

instance ordTransactionOutputDistinctOn :: Ord TransactionOutputDistinctOn where
  compare = compare `on` show

instance argToGqlTransactionOutputDistinctOn :: ArgGql TransactionOutputDistinctOn TransactionOutputDistinctOn

instance gqlArgStringTransactionOutputDistinctOn :: GqlArgString TransactionOutputDistinctOn where
  toGqlArgStringImpl = show

instance decodeJsonTransactionOutputDistinctOn :: DecodeJson TransactionOutputDistinctOn where
  decodeJson = decodeJson >=> case _ of 
    "address" -> pure Address
    s -> Left $ TypeMismatch $ "Not a TransactionOutputDistinctOn: " <> s

instance encodeJsonTransactionOutputDistinctOn :: EncodeJson TransactionOutputDistinctOn where 
  encodeJson = show >>> encodeJson

instance decdoeHasuraTransactionOutputDistinctOn :: DecodeHasura TransactionOutputDistinctOn where 
  decodeHasura = decodeJson

instance encodeHasuraTransactionOutputDistinctOn :: EncodeHasura TransactionOutputDistinctOn where 
  encodeHasura = encodeJson

instance varTypeNameTransactionOutputDistinctOn :: VarTypeName TransactionOutputDistinctOn where 
  varTypeName _ = "TransactionOutputDistinctOn!"

instance showTransactionOutputDistinctOn :: Show TransactionOutputDistinctOn where
  show a = case a of 
    Address -> "address"
