module Cardano.Enum.OrderBy where

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
data OrderBy 
  = Asc
  | Desc


instance eqOrderBy :: Eq OrderBy where 
  eq = eq `on` show

instance ordOrderBy :: Ord OrderBy where
  compare = compare `on` show

instance argToGqlOrderBy :: ArgGql OrderBy OrderBy

instance gqlArgStringOrderBy :: GqlArgString OrderBy where
  toGqlArgStringImpl = show

instance decodeJsonOrderBy :: DecodeJson OrderBy where
  decodeJson = decodeJson >=> case _ of 
    "asc" -> pure Asc
    "desc" -> pure Desc
    s -> Left $ TypeMismatch $ "Not a OrderBy: " <> s

instance encodeJsonOrderBy :: EncodeJson OrderBy where 
  encodeJson = show >>> encodeJson

instance decdoeHasuraOrderBy :: DecodeHasura OrderBy where 
  decodeHasura = decodeJson

instance encodeHasuraOrderBy :: EncodeHasura OrderBy where 
  encodeHasura = encodeJson

instance varTypeNameOrderBy :: VarTypeName OrderBy where 
  varTypeName _ = "OrderBy!"

instance showOrderBy :: Show OrderBy where
  show a = case a of 
    Asc -> "asc"
    Desc -> "desc"
