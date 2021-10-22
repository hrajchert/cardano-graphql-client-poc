module App.Poc where

import Prelude

import Cardano.Schema.GraphQL (Query)
import Cardano.Symbols (initialized, key, number, slotNo, syncPercentage, value)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Array (catMaybes)
import Data.Hash (Hash32Hex(..))
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Percentage (Percentage)
import Data.Tuple.Nested ((/\))
import Debug (traceM)
import Effect.Aff.Class (class MonadAff, liftAff)
import GraphQL.Client.Args ((=>>))
import GraphQL.Client.Query (query_)
import GraphQL.Client.Types (class GqlQuery)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Type.Proxy (Proxy(..))



type State
  = Unit

data Action
  = GetData

component :: forall q i o m.  MonadAff m => H.Component q i o m
component =
  H.mkComponent
    { initialState: const unit
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }

render :: forall cs m. State -> H.ComponentHTML Action cs m
render _ =
  HH.div_
    [ HH.p_
        [ HH.text $ "Click to fetch the information, the results are in the console" ]
    , HH.button
        [ HE.onClick \_ -> GetData ]
        [ HH.text "Click me" ]
    ]

handleAction :: forall cs o m. MonadAff m => Action → H.HalogenM State Action cs o m Unit
handleAction = case _ of
  GetData -> do
    initializationStatus <- getInitializationStatus
    traceM {msg: "intial status", initializationStatus}
    mTip <- getTip
    traceM {msg: "Node tip", mTip}
    mMetadata <- getTxMetadata $ Hash32Hex "602e5d45983b60ecd320644672bbd659b5dcedacd99265eb6bb93415259fd024"
    traceM {msg: "Metadata", mMetadata}


getInitializationStatus :: forall m. MonadAff m => m {syncPercentage :: Percentage, initialized:: Boolean }
getInitializationStatus =
  cardanoGql "initialization status" { cardanoDbMeta: { initialized, syncPercentage } }
  <#> \{cardanoDbMeta: {initialized, syncPercentage }} -> { initialized, syncPercentage }

getTip :: forall m. MonadAff m => m (Maybe {slotNo :: Int, number :: Int, epoch :: Int})
getTip =  do
  {cardano: { tip }} <- cardanoGql "initialization status"
      { cardano:
        { tip:
          { number
          , slotNo
          , epoch:
            { number
            }
          }
        }
      }
  let
    buildResponse slotNo number epoch = {slotNo, number, epoch: epoch.number}
  pure $ buildResponse <$> tip.slotNo <*> tip.number <*> tip.epoch

type Metadata = Map String Json

getTxMetadata :: forall m. MonadAff m => Hash32Hex -> m (Maybe Metadata)
getTxMetadata txId = do
  { transactions } <- cardanoGql "Transaction with metadata"
      { transactions:
        { where:
          { hash:
            { _eq: txId
            }
          }
        } =>>
        { metadata:
          { key
          , value
          }
        }
      }
  let
    result = case catMaybes transactions of
      [{metadata}] ->
        map (
            Map.fromFoldable
            <<< map (\{key, value} -> key /\ value)
            <<< catMaybes
            )
            metadata
      _ -> Nothing
  pure result

-- Run gql query
cardanoGql ::
  forall query returns m.
  GqlQuery Query query returns =>
  DecodeJson returns =>
  MonadAff m =>
  String -> query -> m returns
cardanoGql name query = liftAff $ query_ "http://localhost:3100/graphql" (Proxy :: Proxy Query) name query