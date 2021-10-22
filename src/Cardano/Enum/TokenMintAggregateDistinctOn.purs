module Cardano.Enum.TokenMintAggregateDistinctOn where

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


data TokenMintAggregateDistinctOn 
  = AssetId
  | PolicyId


instance eqTokenMintAggregateDistinctOn :: Eq TokenMintAggregateDistinctOn where 
  eq = eq `on` show

instance ordTokenMintAggregateDistinctOn :: Ord TokenMintAggregateDistinctOn where
  compare = compare `on` show

instance argToGqlTokenMintAggregateDistinctOn :: ArgGql TokenMintAggregateDistinctOn TokenMintAggregateDistinctOn

instance gqlArgStringTokenMintAggregateDistinctOn :: GqlArgString TokenMintAggregateDistinctOn where
  toGqlArgStringImpl = show

instance decodeJsonTokenMintAggregateDistinctOn :: DecodeJson TokenMintAggregateDistinctOn where
  decodeJson = decodeJson >=> case _ of 
    "assetId" -> pure AssetId
    "policyId" -> pure PolicyId
    s -> Left $ TypeMismatch $ "Not a TokenMintAggregateDistinctOn: " <> s

instance encodeJsonTokenMintAggregateDistinctOn :: EncodeJson TokenMintAggregateDistinctOn where 
  encodeJson = show >>> encodeJson

instance decdoeHasuraTokenMintAggregateDistinctOn :: DecodeHasura TokenMintAggregateDistinctOn where 
  decodeHasura = decodeJson

instance encodeHasuraTokenMintAggregateDistinctOn :: EncodeHasura TokenMintAggregateDistinctOn where 
  encodeHasura = encodeJson

instance varTypeNameTokenMintAggregateDistinctOn :: VarTypeName TokenMintAggregateDistinctOn where 
  varTypeName _ = "TokenMintAggregateDistinctOn!"

instance showTokenMintAggregateDistinctOn :: Show TokenMintAggregateDistinctOn where
  show a = case a of 
    AssetId -> "assetId"
    PolicyId -> "policyId"
