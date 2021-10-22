module Cardano.Enum.OrderByWithNulls where

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



 -- | ordering options
data OrderByWithNulls 
  = Asc
  | Asc_nulls_first
  | Asc_nulls_last
  | Desc
  | Desc_nulls_first
  | Desc_nulls_last


instance eqOrderByWithNulls :: Eq OrderByWithNulls where 
  eq = eq `on` show

instance ordOrderByWithNulls :: Ord OrderByWithNulls where
  compare = compare `on` show

instance argToGqlOrderByWithNulls :: ArgGql OrderByWithNulls OrderByWithNulls

instance gqlArgStringOrderByWithNulls :: GqlArgString OrderByWithNulls where
  toGqlArgStringImpl = show

instance decodeJsonOrderByWithNulls :: DecodeJson OrderByWithNulls where
  decodeJson = decodeJson >=> case _ of 
    "asc" -> pure Asc
    "asc_nulls_first" -> pure Asc_nulls_first
    "asc_nulls_last" -> pure Asc_nulls_last
    "desc" -> pure Desc
    "desc_nulls_first" -> pure Desc_nulls_first
    "desc_nulls_last" -> pure Desc_nulls_last
    s -> Left $ TypeMismatch $ "Not a OrderByWithNulls: " <> s

instance encodeJsonOrderByWithNulls :: EncodeJson OrderByWithNulls where 
  encodeJson = show >>> encodeJson

instance decdoeHasuraOrderByWithNulls :: DecodeHasura OrderByWithNulls where 
  decodeHasura = decodeJson

instance encodeHasuraOrderByWithNulls :: EncodeHasura OrderByWithNulls where 
  encodeHasura = encodeJson

instance varTypeNameOrderByWithNulls :: VarTypeName OrderByWithNulls where 
  varTypeName _ = "OrderByWithNulls!"

instance showOrderByWithNulls :: Show OrderByWithNulls where
  show a = case a of 
    Asc -> "asc"
    Asc_nulls_first -> "asc_nulls_first"
    Asc_nulls_last -> "asc_nulls_last"
    Desc -> "desc"
    Desc_nulls_first -> "desc_nulls_first"
    Desc_nulls_last -> "desc_nulls_last"
