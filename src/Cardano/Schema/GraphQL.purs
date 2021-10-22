module Cardano.Schema.GraphQL where

import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import GraphQL.Client.Args (class ArgGql, class RecordArg, type (==>), NotNull)
import GraphQL.Client.ID (ID)
import Cardano.Enum.OrderBy (OrderBy)
import Cardano.Enum.OrderByWithNulls (OrderByWithNulls)
import Cardano.Enum.TokenMintAggregateDistinctOn (TokenMintAggregateDistinctOn)
import Cardano.Enum.TransactionOutputDistinctOn (TransactionOutputDistinctOn)


import Data.DateTime as Data.DateTime
import Data.Hash as Data.Hash
import Data.Percentage as Data.Percentage
import Data.Argonaut.Core as Data.Argonaut.Core

newtype Query = Query
  { activeStake ::
    { limit :: Int
    , order_by :: (Array (NotNull ActiveStakeOrderBy))
    , offset :: Int
    , where :: ActiveStakeBoolExp
    }
    ==> (Array (Maybe ActiveStake))
  , activeStake_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull ActiveStakeOrderBy))
    , offset :: Int
    , where :: ActiveStakeBoolExp
    }
    ==> ActiveStakeAggregate
  , ada :: Ada
  , assets ::
    { limit :: Int
    , order_by :: (Array (NotNull AssetOrderBy))
    , offset :: Int
    , where :: AssetBoolExp
    }
    ==> (Array (Maybe Asset))
  , assets_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull AssetOrderBy))
    , offset :: Int
    , where :: AssetBoolExp
    }
    ==> AssetAggregate
  , blocks ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> (Array (Maybe Block))
  , blocks_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> BlockAggregate
  , cardano :: Cardano
  , cardanoDbMeta :: CardanoDbMeta
  , collateralInputs ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionInputOrderBy))
    , offset :: Int
    , where :: TransactionInputBoolExp
    }
    ==> (Array (Maybe TransactionInput))
  , collateralInputs_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionInputOrderBy))
    , offset :: Int
    , where :: TransactionInputBoolExp
    }
    ==> TransactionInputAggregate
  , delegations ::
    { limit :: Int
    , order_by :: (Array (NotNull DelegationOrderBy))
    , offset :: Int
    , where :: DelegationBoolExp
    }
    ==> (Maybe (Array (Maybe Delegation)))
  , delegations_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull DelegationOrderBy))
    , offset :: Int
    , where :: DelegationBoolExp
    }
    ==> (Maybe DelegationAggregate)
  , epochs ::
    { limit :: Int
    , order_by :: (Array (NotNull EpochOrderBy))
    , offset :: Int
    , where :: EpochBoolExp
    }
    ==> (Array (Maybe Epoch))
  , epochs_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull EpochOrderBy))
    , offset :: Int
    , where :: EpochBoolExp
    }
    ==> EpochAggregate
  , genesis :: Genesis
  , paymentAddresses ::
    { addresses :: (NotNull (Array String))
    }
    ==> (Maybe (Array (Maybe PaymentAddress)))
  , redeemers ::
    { limit :: Int
    , order_by :: (Array (NotNull RedeemerOrderBy))
    , offset :: Int
    , where :: RedeemerBoolExp
    }
    ==> (Array (Maybe Redeemer))
  , redeemers_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull RedeemerOrderBy))
    , offset :: Int
    , where :: RedeemerBoolExp
    }
    ==> RedeemerAggregate
  , rewards ::
    { limit :: Int
    , order_by :: (Array (NotNull RewardOrderBy))
    , offset :: Int
    , where :: RewardBoolExp
    }
    ==> (Array (Maybe Reward))
  , rewards_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull RewardOrderBy))
    , offset :: Int
    , where :: RewardBoolExp
    }
    ==> RewardAggregate
  , scripts ::
    { limit :: Int
    , order_by :: (Array (NotNull ScriptOrderBy))
    , offset :: Int
    , where :: ScriptBoolExp
    }
    ==> (Array (Maybe Script))
  , scripts_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull ScriptOrderBy))
    , offset :: Int
    , where :: ScriptBoolExp
    }
    ==> ScriptAggregate
  , stakeDeregistrations ::
    { limit :: Int
    , order_by :: (Array (NotNull StakeDeregistrationOrderBy))
    , offset :: Int
    , where :: StakeDeregistrationBoolExp
    }
    ==> (Maybe (Array (Maybe StakeDeregistration)))
  , stakeDeregistrations_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull StakeDeregistrationOrderBy))
    , offset :: Int
    , where :: StakeDeregistrationBoolExp
    }
    ==> (Maybe StakeDeregistrationAggregate)
  , stakePools ::
    { limit :: Int
    , order_by :: (Array (NotNull StakePoolOrderBy))
    , offset :: Int
    , where :: StakePoolBoolExp
    }
    ==> (Maybe (Array (Maybe StakePool)))
  , stakePools_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull StakePoolOrderBy))
    , offset :: Int
    , where :: StakePoolBoolExp
    }
    ==> (Maybe StakePoolAggregate)
  , stakeRegistrations ::
    { limit :: Int
    , order_by :: (Array (NotNull StakeRegistrationOrderBy))
    , offset :: Int
    , where :: StakeRegistrationBoolExp
    }
    ==> (Maybe (Array (Maybe StakeRegistration)))
  , stakeRegistrations_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull StakeRegistrationOrderBy))
    , offset :: Int
    , where :: StakeRegistrationBoolExp
    }
    ==> (Maybe StakeRegistrationAggregate)
  , tokenMints ::
    { distinct_on :: (Array (NotNull TokenMintAggregateDistinctOn))
    , limit :: Int
    , order_by :: (Array (NotNull TokenMintOrderBy))
    , offset :: Int
    , where :: TokenMintBoolExp
    }
    ==> (Array (Maybe TokenMint))
  , tokenMints_aggregate ::
    { distinct_on :: (Array (NotNull TokenMintAggregateDistinctOn))
    , limit :: Int
    , order_by :: (Array (NotNull TokenMintOrderBy))
    , offset :: Int
    , where :: TokenMintBoolExp
    }
    ==> TokenMintAggregate
  , transactions ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionOrderBy))
    , offset :: Int
    , where :: TransactionBoolExp
    }
    ==> (Array (Maybe Transaction))
  , transactions_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionOrderBy))
    , offset :: Int
    , where :: TransactionBoolExp
    }
    ==> TransactionAggregate
  , utxos ::
    { distinct_on :: (Array (NotNull TransactionOutputDistinctOn))
    , limit :: Int
    , order_by :: (Array (NotNull TransactionOutputOrderBy))
    , offset :: Int
    , where :: TransactionOutputBoolExp
    }
    ==> (Array (Maybe TransactionOutput))
  , utxos_aggregate ::
    { distinct_on :: (Array (NotNull TransactionOutputDistinctOn))
    , limit :: Int
    , order_by :: (Array (NotNull TransactionOutputOrderBy))
    , offset :: Int
    , where :: TransactionOutputBoolExp
    }
    ==> TransactionOutputAggregate
  , withdrawals ::
    { limit :: Int
    , order_by :: (Array (NotNull WithdrawalOrderBy))
    , offset :: Int
    , where :: WithdrawalBoolExp
    }
    ==> (Array (Maybe Withdrawal))
  , withdrawals_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull WithdrawalOrderBy))
    , offset :: Int
    , where :: WithdrawalBoolExp
    }
    ==> (Maybe WithdrawalAggregate)
  }
derive instance newtypeQuery :: Newtype Query _
instance argToGqlQuery :: (Newtype Query {| p},  RecordArg p a u) => ArgGql Query { | a }

newtype ActiveStakeOrderBy = ActiveStakeOrderBy
  { address :: OrderBy
  , amount :: OrderBy
  , epoch :: EpochOrderBy
  , epochNo :: OrderBy
  , stakePoolHash :: OrderBy
  , stakePoolId :: OrderBy
  , registeredWith :: StakePoolOrderBy
  }
derive instance newtypeActiveStakeOrderBy :: Newtype ActiveStakeOrderBy _
instance argToGqlActiveStakeOrderBy :: (Newtype ActiveStakeOrderBy {| p},  RecordArg p a u) => ArgGql ActiveStakeOrderBy { | a }

newtype EpochOrderBy = EpochOrderBy
  { blocksCount :: OrderBy
  , fees :: OrderBy
  , number :: OrderBy
  , output :: OrderBy
  , transactionsCount :: OrderBy
  }
derive instance newtypeEpochOrderBy :: Newtype EpochOrderBy _
instance argToGqlEpochOrderBy :: (Newtype EpochOrderBy {| p},  RecordArg p a u) => ArgGql EpochOrderBy { | a }

newtype StakePoolOrderBy = StakePoolOrderBy
  { fixedCost :: OrderBy
  , hash :: OrderBy
  , id :: OrderBy
  , margin :: OrderBy
  , pledge :: OrderBy
  , updatedIn :: TransactionOrderBy
  , url :: OrderBy
  }
derive instance newtypeStakePoolOrderBy :: Newtype StakePoolOrderBy _
instance argToGqlStakePoolOrderBy :: (Newtype StakePoolOrderBy {| p},  RecordArg p a u) => ArgGql StakePoolOrderBy { | a }

newtype TransactionOrderBy = TransactionOrderBy
  { block :: BlockOrderBy
  , blockIndex :: OrderBy
  , deposit :: OrderBy
  , fee :: OrderBy
  , hash :: OrderBy
  , includedAt :: OrderBy
  , invalidBefore :: OrderByWithNulls
  , invalidHereafter :: OrderByWithNulls
  , scriptSize :: OrderByWithNulls
  , size :: OrderBy
  , totalOutput :: OrderBy
  , validContract :: OrderBy
  , withdrawals :: OrderBy
  }
derive instance newtypeTransactionOrderBy :: Newtype TransactionOrderBy _
instance argToGqlTransactionOrderBy :: (Newtype TransactionOrderBy {| p},  RecordArg p a u) => ArgGql TransactionOrderBy { | a }

newtype BlockOrderBy = BlockOrderBy
  { forgedAt :: OrderBy
  , slotLeader :: SlotLeaderOrderBy
  , epoch :: EpochOrderBy
  , fees :: OrderBy
  , hash :: OrderBy
  , number :: OrderByWithNulls
  , size :: OrderBy
  , slotNo :: OrderByWithNulls
  , transactionsCount :: OrderBy
  , vrfKey :: OrderByWithNulls
  }
derive instance newtypeBlockOrderBy :: Newtype BlockOrderBy _
instance argToGqlBlockOrderBy :: (Newtype BlockOrderBy {| p},  RecordArg p a u) => ArgGql BlockOrderBy { | a }

newtype SlotLeaderOrderBy = SlotLeaderOrderBy
  { hash :: OrderBy
  , stakePool :: StakePoolOrderBy
  }
derive instance newtypeSlotLeaderOrderBy :: Newtype SlotLeaderOrderBy _
instance argToGqlSlotLeaderOrderBy :: (Newtype SlotLeaderOrderBy {| p},  RecordArg p a u) => ArgGql SlotLeaderOrderBy { | a }

newtype ActiveStakeBoolExp = ActiveStakeBoolExp
  { _and :: (Array ActiveStakeBoolExp)
  , _not :: ActiveStakeBoolExp
  , _or :: (Array ActiveStakeBoolExp)
  , address :: StakeAddressComparisonExp
  , amount :: TextComparisonExp
  , epoch :: EpochBoolExp
  , epochNo :: IntComparisonExp
  , stakePoolHash :: Hash28HexComparisonExp
  , stakePoolId :: StakePoolIdComparisonExp
  , registeredWith :: StakePoolBoolExp
  }
derive instance newtypeActiveStakeBoolExp :: Newtype ActiveStakeBoolExp _
instance argToGqlActiveStakeBoolExp :: (Newtype ActiveStakeBoolExp {| p},  RecordArg p a u) => ArgGql ActiveStakeBoolExp { | a }

newtype StakeAddressComparisonExp = StakeAddressComparisonExp
  { _eq :: StakeAddress
  , _in :: (Array StakeAddress)
  , _neq :: StakeAddress
  , _nin :: (Array StakeAddress)
  }
derive instance newtypeStakeAddressComparisonExp :: Newtype StakeAddressComparisonExp _
instance argToGqlStakeAddressComparisonExp :: (Newtype StakeAddressComparisonExp {| p},  RecordArg p a u) => ArgGql StakeAddressComparisonExp { | a }


 -- | Bech32 encoded stake address
type StakeAddress = Data.Argonaut.Core.Json -- Unknown scalar type. Add StakeAddress to externalTypes in codegen options to override this behaviour

newtype TextComparisonExp = TextComparisonExp
  { _eq :: String
  , _gt :: String
  , _gte :: String
  , _ilike :: String
  , _in :: (Array String)
  , _is_null :: Boolean
  , _like :: String
  , _lt :: String
  , _lte :: String
  , _neq :: String
  , _nilike :: String
  , _nin :: (Array String)
  , _nlike :: String
  , _nsimilar :: String
  , _similar :: String
  }
derive instance newtypeTextComparisonExp :: Newtype TextComparisonExp _
instance argToGqlTextComparisonExp :: (Newtype TextComparisonExp {| p},  RecordArg p a u) => ArgGql TextComparisonExp { | a }

newtype EpochBoolExp = EpochBoolExp
  { _and :: (Array EpochBoolExp)
  , _not :: EpochBoolExp
  , _or :: (Array EpochBoolExp)
  , blocks :: BlockBoolExp
  , blocksCount :: TextComparisonExp
  , fees :: BigIntComparisonExp
  , number :: IntComparisonExp
  , output :: TextComparisonExp
  , startedAt :: DateComparisonExp
  , transactionsCount :: TextComparisonExp
  }
derive instance newtypeEpochBoolExp :: Newtype EpochBoolExp _
instance argToGqlEpochBoolExp :: (Newtype EpochBoolExp {| p},  RecordArg p a u) => ArgGql EpochBoolExp { | a }

newtype BlockBoolExp = BlockBoolExp
  { _and :: (Array BlockBoolExp)
  , _not :: BlockBoolExp
  , _or :: (Array BlockBoolExp)
  , forgedAt :: DateComparisonExp
  , slotLeader :: SlotLeaderBoolExp
  , epoch :: EpochBoolExp
  , fees :: BigIntComparisonExp
  , hash :: Hash32HexComparisonExp
  , number :: IntComparisonExp
  , previousBlock :: BlockBoolExp
  , nextBlock :: BlockBoolExp
  , size :: BigIntComparisonExp
  , slotInEpoch :: IntComparisonExp
  , slotNo :: IntComparisonExp
  , transactions :: TransactionBoolExp
  , transactionsCount :: TextComparisonExp
  , vrfKey :: VrfVerificationKeyComparisonExp
  }
derive instance newtypeBlockBoolExp :: Newtype BlockBoolExp _
instance argToGqlBlockBoolExp :: (Newtype BlockBoolExp {| p},  RecordArg p a u) => ArgGql BlockBoolExp { | a }



 -- | expression to compare data of type date. All fields are combined with logical 'AND'.

newtype DateComparisonExp = DateComparisonExp
  { _eq :: DateTime
  , _gt :: DateTime
  , _gte :: DateTime
  , _in :: (Array DateTime)
  , _lt :: DateTime
  , _lte :: DateTime
  , _neq :: DateTime
  , _nin :: (Array DateTime)
  }
derive instance newtypeDateComparisonExp :: Newtype DateComparisonExp _
instance argToGqlDateComparisonExp :: (Newtype DateComparisonExp {| p},  RecordArg p a u) => ArgGql DateComparisonExp { | a }


 -- | DateTime ISO 8601
type DateTime = Data.DateTime.DateTime

newtype SlotLeaderBoolExp = SlotLeaderBoolExp
  { _and :: (Array SlotLeaderBoolExp)
  , _not :: SlotLeaderBoolExp
  , _or :: (Array SlotLeaderBoolExp)
  , description :: TextComparisonExp
  , hash :: Hash28HexComparisonExp
  , stakePool :: StakePoolBoolExp
  }
derive instance newtypeSlotLeaderBoolExp :: Newtype SlotLeaderBoolExp _
instance argToGqlSlotLeaderBoolExp :: (Newtype SlotLeaderBoolExp {| p},  RecordArg p a u) => ArgGql SlotLeaderBoolExp { | a }


 -- | All fields are combined with logical 'AND'.
newtype Hash28HexComparisonExp = Hash28HexComparisonExp
  { _eq :: Hash28Hex
  , _in :: (Array Hash28Hex)
  , _neq :: Hash28Hex
  , _nin :: (Array Hash28Hex)
  }
derive instance newtypeHash28HexComparisonExp :: Newtype Hash28HexComparisonExp _
instance argToGqlHash28HexComparisonExp :: (Newtype Hash28HexComparisonExp {| p},  RecordArg p a u) => ArgGql Hash28HexComparisonExp { | a }


 -- | Hex encoded 28 byte hash, 56 characters
type Hash28Hex = Data.Argonaut.Core.Json -- Unknown scalar type. Add Hash28Hex to externalTypes in codegen options to override this behaviour

newtype StakePoolBoolExp = StakePoolBoolExp
  { _and :: (Array StakePoolBoolExp)
  , _not :: StakePoolBoolExp
  , _or :: (Array StakePoolBoolExp)
  , hash :: Hash28HexComparisonExp
  , id :: StakePoolIdComparisonExp
  , margin :: FloatComparisonExp
  , metadataHash :: Hash32HexComparisonExp
  , owners :: StakePoolOwnerBoolExp
  , pledge :: TextComparisonExp
  , registrationTransaction :: TransactionBoolExp
  , relays :: RelayBoolExp
  , retirements :: StakePoolRetirementBoolExp
  , rewardAddress :: TextComparisonExp
  , rewards :: RewardBoolExp
  , url :: TextComparisonExp
  }
derive instance newtypeStakePoolBoolExp :: Newtype StakePoolBoolExp _
instance argToGqlStakePoolBoolExp :: (Newtype StakePoolBoolExp {| p},  RecordArg p a u) => ArgGql StakePoolBoolExp { | a }

newtype StakePoolIdComparisonExp = StakePoolIdComparisonExp
  { _eq :: StakePoolId
  , _in :: (Array StakePoolId)
  , _neq :: StakePoolId
  , _nin :: (Array StakePoolId)
  }
derive instance newtypeStakePoolIdComparisonExp :: Newtype StakePoolIdComparisonExp _
instance argToGqlStakePoolIdComparisonExp :: (Newtype StakePoolIdComparisonExp {| p},  RecordArg p a u) => ArgGql StakePoolIdComparisonExp { | a }


 -- | Bech32 encoded Stake Pool ID
type StakePoolId = Data.Argonaut.Core.Json -- Unknown scalar type. Add StakePoolId to externalTypes in codegen options to override this behaviour



 -- | expression to compare data of type Float. All fields are combined with logical 'AND'.

newtype FloatComparisonExp = FloatComparisonExp
  { _eq :: Number
  , _gt :: Number
  , _gte :: Number
  , _in :: (Array (NotNull Number))
  , _is_null :: Boolean
  , _lt :: Number
  , _lte :: Number
  , _neq :: Number
  , _nin :: (Array (NotNull Number))
  }
derive instance newtypeFloatComparisonExp :: Newtype FloatComparisonExp _
instance argToGqlFloatComparisonExp :: (Newtype FloatComparisonExp {| p},  RecordArg p a u) => ArgGql FloatComparisonExp { | a }

newtype Hash32HexComparisonExp = Hash32HexComparisonExp
  { _eq :: Hash32Hex
  , _in :: (Array Hash32Hex)
  , _neq :: Hash32Hex
  , _nin :: (Array Hash32Hex)
  }
derive instance newtypeHash32HexComparisonExp :: Newtype Hash32HexComparisonExp _
instance argToGqlHash32HexComparisonExp :: (Newtype Hash32HexComparisonExp {| p},  RecordArg p a u) => ArgGql Hash32HexComparisonExp { | a }


 -- | Hex encoded 32 byte, 64 characters
type Hash32Hex = Data.Hash.Hash32Hex

newtype StakePoolOwnerBoolExp = StakePoolOwnerBoolExp
  { _and :: (Array StakePoolOwnerBoolExp)
  , _not :: StakePoolOwnerBoolExp
  , _or :: (Array StakePoolOwnerBoolExp)
  , hash :: Hash28HexComparisonExp
  }
derive instance newtypeStakePoolOwnerBoolExp :: Newtype StakePoolOwnerBoolExp _
instance argToGqlStakePoolOwnerBoolExp :: (Newtype StakePoolOwnerBoolExp {| p},  RecordArg p a u) => ArgGql StakePoolOwnerBoolExp { | a }

newtype TransactionBoolExp = TransactionBoolExp
  { _and :: (Array TransactionBoolExp)
  , _not :: TransactionBoolExp
  , _or :: (Array TransactionBoolExp)
  , block :: BlockBoolExp
  , blockIndex :: IntComparisonExp
  , collateral :: TransactionInputBoolExp
  , deposit :: BigIntComparisonExp
  , fee :: BigIntComparisonExp
  , hash :: Hash32HexComparisonExp
  , includedAt :: DateComparisonExp
  , inputs :: TransactionInputBoolExp
  , invalidBefore :: TextComparisonExp
  , invalidHereafter :: TextComparisonExp
  , metadata :: TransactionMetadataBoolExp
  , mint :: TokenBoolExp
  , outputs :: TransactionOutputBoolExp
  , scriptSize :: IntComparisonExp
  , size :: BigIntComparisonExp
  , totalOutput :: TextComparisonExp
  , validContract :: BooleanComparisonExp
  , withdrawals :: WithdrawalBoolExp
  }
derive instance newtypeTransactionBoolExp :: Newtype TransactionBoolExp _
instance argToGqlTransactionBoolExp :: (Newtype TransactionBoolExp {| p},  RecordArg p a u) => ArgGql TransactionBoolExp { | a }



 -- | expression to compare data of type Int. All fields are combined with logical 'AND'.

newtype IntComparisonExp = IntComparisonExp
  { _eq :: Int
  , _gt :: Int
  , _gte :: Int
  , _in :: (Array (NotNull Int))
  , _is_null :: Boolean
  , _lt :: Int
  , _lte :: Int
  , _neq :: Int
  , _nin :: (Array (NotNull Int))
  }
derive instance newtypeIntComparisonExp :: Newtype IntComparisonExp _
instance argToGqlIntComparisonExp :: (Newtype IntComparisonExp {| p},  RecordArg p a u) => ArgGql IntComparisonExp { | a }

newtype TransactionInputBoolExp = TransactionInputBoolExp
  { _and :: (Array TransactionInputBoolExp)
  , _not :: TransactionInputBoolExp
  , _or :: (Array TransactionInputBoolExp)
  , address :: TextComparisonExp
  , sourceTransaction :: TransactionBoolExp
  , tokens :: TokenBoolExp
  , transaction :: TransactionBoolExp
  , value :: TextComparisonExp
  }
derive instance newtypeTransactionInputBoolExp :: Newtype TransactionInputBoolExp _
instance argToGqlTransactionInputBoolExp :: (Newtype TransactionInputBoolExp {| p},  RecordArg p a u) => ArgGql TransactionInputBoolExp { | a }

newtype TokenBoolExp = TokenBoolExp
  { _and :: (Array TokenBoolExp)
  , _not :: TokenBoolExp
  , _or :: (Array TokenBoolExp)
  , asset :: AssetBoolExp
  , quantity :: TextComparisonExp
  , transactionOutput :: TransactionOutputBoolExp
  }
derive instance newtypeTokenBoolExp :: Newtype TokenBoolExp _
instance argToGqlTokenBoolExp :: (Newtype TokenBoolExp {| p},  RecordArg p a u) => ArgGql TokenBoolExp { | a }

newtype AssetBoolExp = AssetBoolExp
  { _and :: (Array AssetBoolExp)
  , _not :: AssetBoolExp
  , _or :: (Array AssetBoolExp)
  , ticker :: TextComparisonExp
  , assetId :: HexComparisonExp
  , assetName :: HexComparisonExp
  , decimals :: IntComparisonExp
  , description :: TextComparisonExp
  , fingerprint :: AssetFingerprintComparisonExp
  , logo :: TextComparisonExp
  , name :: TextComparisonExp
  , policyId :: Hash28HexComparisonExp
  , tokenMints :: TokenMintBoolExp
  , url :: TextComparisonExp
  }
derive instance newtypeAssetBoolExp :: Newtype AssetBoolExp _
instance argToGqlAssetBoolExp :: (Newtype AssetBoolExp {| p},  RecordArg p a u) => ArgGql AssetBoolExp { | a }


 -- | All fields are combined with logical 'AND'.
newtype HexComparisonExp = HexComparisonExp
  { _eq :: Hex
  , _in :: (Array Hex)
  , _neq :: Hex
  , _nin :: (Array Hex)
  }
derive instance newtypeHexComparisonExp :: Newtype HexComparisonExp _
instance argToGqlHexComparisonExp :: (Newtype HexComparisonExp {| p},  RecordArg p a u) => ArgGql HexComparisonExp { | a }


 -- | Hex encoded bytes
type Hex = Data.Argonaut.Core.Json -- Unknown scalar type. Add Hex to externalTypes in codegen options to override this behaviour

newtype AssetFingerprintComparisonExp = AssetFingerprintComparisonExp
  { _eq :: String
  , _in :: (Array String)
  , _neq :: String
  , _nin :: (Array String)
  }
derive instance newtypeAssetFingerprintComparisonExp :: Newtype AssetFingerprintComparisonExp _
instance argToGqlAssetFingerprintComparisonExp :: (Newtype AssetFingerprintComparisonExp {| p},  RecordArg p a u) => ArgGql AssetFingerprintComparisonExp { | a }

newtype TokenMintBoolExp = TokenMintBoolExp
  { _and :: (Array TokenMintBoolExp)
  , _not :: TokenMintBoolExp
  , _or :: (Array TokenMintBoolExp)
  , asset :: AssetBoolExp
  , quantity :: TextComparisonExp
  , transaction :: TransactionBoolExp
  }
derive instance newtypeTokenMintBoolExp :: Newtype TokenMintBoolExp _
instance argToGqlTokenMintBoolExp :: (Newtype TokenMintBoolExp {| p},  RecordArg p a u) => ArgGql TokenMintBoolExp { | a }

newtype TransactionOutputBoolExp = TransactionOutputBoolExp
  { _and :: (Array TransactionOutputBoolExp)
  , _not :: TransactionOutputBoolExp
  , _or :: (Array TransactionOutputBoolExp)
  , address :: TextComparisonExp
  , addressHasScript :: BooleanComparisonExp
  , index :: IntComparisonExp
  , tokens :: TokenBoolExp
  , transaction :: TransactionBoolExp
  , value :: TextComparisonExp
  }
derive instance newtypeTransactionOutputBoolExp :: Newtype TransactionOutputBoolExp _
instance argToGqlTransactionOutputBoolExp :: (Newtype TransactionOutputBoolExp {| p},  RecordArg p a u) => ArgGql TransactionOutputBoolExp { | a }

newtype BooleanComparisonExp = BooleanComparisonExp
  { _eq :: Boolean
  , _gt :: Boolean
  , _gte :: Boolean
  , _in :: (Array (NotNull Boolean))
  , _is_null :: Boolean
  , _lt :: Boolean
  , _lte :: Boolean
  , _neq :: Boolean
  , _nin :: (Array (NotNull Boolean))
  }
derive instance newtypeBooleanComparisonExp :: Newtype BooleanComparisonExp _
instance argToGqlBooleanComparisonExp :: (Newtype BooleanComparisonExp {| p},  RecordArg p a u) => ArgGql BooleanComparisonExp { | a }



 -- | expression to compare data of type BigInt. All fields are combined with logical 'AND'.

newtype BigIntComparisonExp = BigIntComparisonExp
  { _eq :: BigInt
  , _gt :: BigInt
  , _gte :: BigInt
  , _in :: (Array (NotNull BigInt))
  , _is_null :: Boolean
  , _lt :: BigInt
  , _lte :: BigInt
  , _neq :: BigInt
  , _nin :: (Array (NotNull BigInt))
  }
derive instance newtypeBigIntComparisonExp :: Newtype BigIntComparisonExp _
instance argToGqlBigIntComparisonExp :: (Newtype BigIntComparisonExp {| p},  RecordArg p a u) => ArgGql BigIntComparisonExp { | a }



 -- | The `BigInt` scalar type represents non-fractional signed whole numeric values. BigInt can represent values between -(2^53) + 1 and 2^53 - 1.

type BigInt = Data.Argonaut.Core.Json -- Unknown scalar type. Add BigInt to externalTypes in codegen options to override this behaviour

newtype TransactionMetadataBoolExp = TransactionMetadataBoolExp
  { key :: TextComparisonExp
  }
derive instance newtypeTransactionMetadataBoolExp :: Newtype TransactionMetadataBoolExp _
instance argToGqlTransactionMetadataBoolExp :: (Newtype TransactionMetadataBoolExp {| p},  RecordArg p a u) => ArgGql TransactionMetadataBoolExp { | a }

newtype WithdrawalBoolExp = WithdrawalBoolExp
  { _and :: (Array WithdrawalBoolExp)
  , _not :: WithdrawalBoolExp
  , _or :: (Array WithdrawalBoolExp)
  , address :: StakeAddressComparisonExp
  , amount :: TextComparisonExp
  , transaction :: TransactionBoolExp
  }
derive instance newtypeWithdrawalBoolExp :: Newtype WithdrawalBoolExp _
instance argToGqlWithdrawalBoolExp :: (Newtype WithdrawalBoolExp {| p},  RecordArg p a u) => ArgGql WithdrawalBoolExp { | a }

newtype RelayBoolExp = RelayBoolExp
  { _and :: (Array RelayBoolExp)
  , _not :: RelayBoolExp
  , _or :: (Array RelayBoolExp)
  , ipv4 :: TextComparisonExp
  , ipv6 :: TextComparisonExp
  , dnsName :: TextComparisonExp
  , dnsSrvName :: TextComparisonExp
  , port :: IntComparisonExp
  }
derive instance newtypeRelayBoolExp :: Newtype RelayBoolExp _
instance argToGqlRelayBoolExp :: (Newtype RelayBoolExp {| p},  RecordArg p a u) => ArgGql RelayBoolExp { | a }

newtype StakePoolRetirementBoolExp = StakePoolRetirementBoolExp
  { _and :: (Array StakePoolRetirementBoolExp)
  , _not :: StakePoolRetirementBoolExp
  , _or :: (Array StakePoolRetirementBoolExp)
  , announcedIn :: TransactionBoolExp
  , inEffectFrom :: IntComparisonExp
  }
derive instance newtypeStakePoolRetirementBoolExp :: Newtype StakePoolRetirementBoolExp _
instance argToGqlStakePoolRetirementBoolExp :: (Newtype StakePoolRetirementBoolExp {| p},  RecordArg p a u) => ArgGql StakePoolRetirementBoolExp { | a }

newtype RewardBoolExp = RewardBoolExp
  { _and :: (Array RewardBoolExp)
  , _not :: RewardBoolExp
  , _or :: (Array RewardBoolExp)
  , address :: StakeAddressComparisonExp
  , amount :: TextComparisonExp
  , earnedIn :: EpochBoolExp
  , receivedIn :: EpochBoolExp
  , stakePool :: StakePoolBoolExp
  , type :: TextComparisonExp
  }
derive instance newtypeRewardBoolExp :: Newtype RewardBoolExp _
instance argToGqlRewardBoolExp :: (Newtype RewardBoolExp {| p},  RecordArg p a u) => ArgGql RewardBoolExp { | a }

newtype VrfVerificationKeyComparisonExp = VrfVerificationKeyComparisonExp
  { _eq :: VrfVerificationKey
  , _in :: (Array VrfVerificationKey)
  , _is_null :: Boolean
  , _neq :: VrfVerificationKey
  , _nin :: (Array VrfVerificationKey)
  }
derive instance newtypeVrfVerificationKeyComparisonExp :: Newtype VrfVerificationKeyComparisonExp _
instance argToGqlVrfVerificationKeyComparisonExp :: (Newtype VrfVerificationKeyComparisonExp {| p},  RecordArg p a u) => ArgGql VrfVerificationKeyComparisonExp { | a }


 -- | Bech32 encoded VRF verification key
type VrfVerificationKey = Data.Argonaut.Core.Json -- Unknown scalar type. Add VrfVerificationKey to externalTypes in codegen options to override this behaviour

newtype ActiveStake = ActiveStake
  { address :: StakeAddress
  , amount :: String
  , epoch :: (Maybe Epoch)
  , epochNo :: Int
  , stakePoolHash :: Hash28Hex
  , stakePoolId :: StakePoolId
  , registeredWith :: StakePool
  }
derive instance newtypeActiveStake :: Newtype ActiveStake _
instance argToGqlActiveStake :: (Newtype ActiveStake {| p},  RecordArg p a u) => ArgGql ActiveStake { | a }

newtype Epoch = Epoch
  { activeStake :: (Maybe (Array (Maybe ActiveStake)))
  , activeStake_aggregate :: (Maybe ActiveStakeAggregate)
  , adaPots :: (Maybe AdaPots)
  , blocks ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> (Array Block)
  , blocks_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> BlockAggregate
  , blocksCount :: String
  , fees :: BigInt
  , output :: String
  , nonce :: (Maybe Hash32Hex)
  , number :: Int
  , protocolParams :: (Maybe ShelleyProtocolParams)
  , transactionsCount :: String
  , startedAt :: DateTime
  , lastBlockTime :: DateTime
  }
derive instance newtypeEpoch :: Newtype Epoch _
instance argToGqlEpoch :: (Newtype Epoch {| p},  RecordArg p a u) => ArgGql Epoch { | a }

newtype ActiveStakeAggregate = ActiveStakeAggregate
  { aggregate :: (Maybe ActiveStakeAggregateFields)
  }
derive instance newtypeActiveStakeAggregate :: Newtype ActiveStakeAggregate _
instance argToGqlActiveStakeAggregate :: (Newtype ActiveStakeAggregate {| p},  RecordArg p a u) => ArgGql ActiveStakeAggregate { | a }

newtype ActiveStakeAggregateFields = ActiveStakeAggregateFields
  { avg :: ActiveStakeAvgFields
  , count :: String
  , max :: ActiveStakeMaxFields
  , min :: ActiveStakeMinFields
  , sum :: ActiveStakeSumFields
  }
derive instance newtypeActiveStakeAggregateFields :: Newtype ActiveStakeAggregateFields _
instance argToGqlActiveStakeAggregateFields :: (Newtype ActiveStakeAggregateFields {| p},  RecordArg p a u) => ArgGql ActiveStakeAggregateFields { | a }

newtype ActiveStakeAvgFields = ActiveStakeAvgFields
  { amount :: (Maybe Number)
  }
derive instance newtypeActiveStakeAvgFields :: Newtype ActiveStakeAvgFields _
instance argToGqlActiveStakeAvgFields :: (Newtype ActiveStakeAvgFields {| p},  RecordArg p a u) => ArgGql ActiveStakeAvgFields { | a }

newtype ActiveStakeMaxFields = ActiveStakeMaxFields
  { amount :: (Maybe String)
  }
derive instance newtypeActiveStakeMaxFields :: Newtype ActiveStakeMaxFields _
instance argToGqlActiveStakeMaxFields :: (Newtype ActiveStakeMaxFields {| p},  RecordArg p a u) => ArgGql ActiveStakeMaxFields { | a }

newtype ActiveStakeMinFields = ActiveStakeMinFields
  { amount :: (Maybe String)
  }
derive instance newtypeActiveStakeMinFields :: Newtype ActiveStakeMinFields _
instance argToGqlActiveStakeMinFields :: (Newtype ActiveStakeMinFields {| p},  RecordArg p a u) => ArgGql ActiveStakeMinFields { | a }

newtype ActiveStakeSumFields = ActiveStakeSumFields
  { amount :: (Maybe String)
  }
derive instance newtypeActiveStakeSumFields :: Newtype ActiveStakeSumFields _
instance argToGqlActiveStakeSumFields :: (Newtype ActiveStakeSumFields {| p},  RecordArg p a u) => ArgGql ActiveStakeSumFields { | a }

newtype AdaPots = AdaPots
  { deposits :: String
  , fees :: String
  , reserves :: String
  , rewards :: String
  , slotNo :: Int
  , treasury :: String
  , utxo :: String
  }
derive instance newtypeAdaPots :: Newtype AdaPots _
instance argToGqlAdaPots :: (Newtype AdaPots {| p},  RecordArg p a u) => ArgGql AdaPots { | a }

newtype Block = Block
  {
  {-
    Genesis block does not belong to the 0th epoch, therefore it could be null
     -}
  epoch :: (Maybe Epoch)
  , epochNo :: (Maybe Int)
  , fees :: BigInt
  , forgedAt :: DateTime
  , slotLeader :: SlotLeader
  , hash :: Hash32Hex
  , number :: (Maybe Int)
  , opCert :: (Maybe Hash32Hex)
  , slotInEpoch :: (Maybe Int)
  ,
  {-
    Ouroboros Classic Epoch Boundary blocks (EBB) do not have a slot number
     -}
  slotNo :: (Maybe Int)
  ,
  {-
    Ouroboros Classic Epoch Boundary blocks (EBB) do not have a slot number
     -}
  previousBlock :: (Maybe Block)
  , protocolVersion :: (Maybe JsonObject)
  , nextBlock :: (Maybe Block)
  , size :: BigInt
  , transactions ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionOrderBy))
    , offset :: Int
    , where :: TransactionBoolExp
    }
    ==> (Array (Maybe Transaction))
  , transactions_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull TransactionOrderBy))
    , offset :: Int
    , where :: TransactionBoolExp
    }
    ==> TransactionAggregate
  , transactionsCount :: String
  , vrfKey :: (Maybe VrfVerificationKey)
  }
derive instance newtypeBlock :: Newtype Block _
instance argToGqlBlock :: (Newtype Block {| p},  RecordArg p a u) => ArgGql Block { | a }

newtype SlotLeader = SlotLeader
  { description :: String
  , hash :: Hash28Hex
  , stakePool :: (Maybe StakePool)
  }
derive instance newtypeSlotLeader :: Newtype SlotLeader _
instance argToGqlSlotLeader :: (Newtype SlotLeader {| p},  RecordArg p a u) => ArgGql SlotLeader { | a }

newtype StakePool = StakePool
  { activeStake ::
    { limit :: Int
    , order_by :: (Array (NotNull ActiveStakeOrderBy))
    , offset :: Int
    , where :: ActiveStakeBoolExp
    }
    ==> (Array (Maybe ActiveStake))
  , activeStake_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull ActiveStakeOrderBy))
    , offset :: Int
    , where :: ActiveStakeBoolExp
    }
    ==> ActiveStakeAggregate
  , blocks ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> (Array Block)
  , blocks_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull BlockOrderBy))
    , offset :: Int
    , where :: BlockBoolExp
    }
    ==> BlockAggregate
  , delegators ::
    { limit :: Int
    , order_by :: (Array (NotNull DelegationOrderBy))
    , offset :: Int
    , where :: DelegationBoolExp
    }
    ==> (Array (Maybe Delegation))
  , delegators_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull DelegationOrderBy))
    , offset :: Int
    , where :: DelegationBoolExp
    }
    ==> DelegationAggregate
  , fixedCost :: String
  , hash :: Hash28Hex
  , id :: StakePoolId
  , margin :: Number
  , metadataHash :: (Maybe Hash32Hex)
  , owners :: (Array StakePoolOwner)
  , pledge :: String
  , relays :: (Maybe (Array (Maybe Relay)))
  , retirements :: (Maybe (Array (Maybe StakePoolRetirement)))
  , rewardAddress :: StakeAddress
  , rewards :: (Array (Maybe Reward))
  , rewards_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull RewardOrderBy))
    , offset :: Int
    , where :: RewardBoolExp
    }
    ==> RewardAggregate
  , updatedIn :: Transaction
  , url :: (Maybe String)
  }
derive instance newtypeStakePool :: Newtype StakePool _
instance argToGqlStakePool :: (Newtype StakePool {| p},  RecordArg p a u) => ArgGql StakePool { | a }

newtype BlockAggregate = BlockAggregate
  { aggregate :: (Maybe BlockAggregateFields)
  }
derive instance newtypeBlockAggregate :: Newtype BlockAggregate _
instance argToGqlBlockAggregate :: (Newtype BlockAggregate {| p},  RecordArg p a u) => ArgGql BlockAggregate { | a }

newtype BlockAggregateFields = BlockAggregateFields
  { avg :: BlockAvgFields
  , count :: String
  , max :: BlockMaxFields
  , min :: BlockMinFields
  , sum :: BlockSumFields
  }
derive instance newtypeBlockAggregateFields :: Newtype BlockAggregateFields _
instance argToGqlBlockAggregateFields :: (Newtype BlockAggregateFields {| p},  RecordArg p a u) => ArgGql BlockAggregateFields { | a }

newtype BlockAvgFields = BlockAvgFields
  { fees :: (Maybe Number)
  , size :: (Maybe Number)
  }
derive instance newtypeBlockAvgFields :: Newtype BlockAvgFields _
instance argToGqlBlockAvgFields :: (Newtype BlockAvgFields {| p},  RecordArg p a u) => ArgGql BlockAvgFields { | a }

newtype BlockMaxFields = BlockMaxFields
  { fees :: (Maybe String)
  , size :: (Maybe String)
  }
derive instance newtypeBlockMaxFields :: Newtype BlockMaxFields _
instance argToGqlBlockMaxFields :: (Newtype BlockMaxFields {| p},  RecordArg p a u) => ArgGql BlockMaxFields { | a }

newtype BlockMinFields = BlockMinFields
  { fees :: (Maybe String)
  , size :: (Maybe String)
  }
derive instance newtypeBlockMinFields :: Newtype BlockMinFields _
instance argToGqlBlockMinFields :: (Newtype BlockMinFields {| p},  RecordArg p a u) => ArgGql BlockMinFields { | a }

newtype BlockSumFields = BlockSumFields
  { fees :: (Maybe String)
  , size :: (Maybe String)
  }
derive instance newtypeBlockSumFields :: Newtype BlockSumFields _
instance argToGqlBlockSumFields :: (Newtype BlockSumFields {| p},  RecordArg p a u) => ArgGql BlockSumFields { | a }

newtype DelegationOrderBy = DelegationOrderBy
  { address :: OrderBy
  , stakePool :: StakePoolOrderBy
  , stakePoolHash :: OrderBy
  , stakePoolId :: OrderBy
  , transaction :: TransactionOrderBy
  }
derive instance newtypeDelegationOrderBy :: Newtype DelegationOrderBy _
instance argToGqlDelegationOrderBy :: (Newtype DelegationOrderBy {| p},  RecordArg p a u) => ArgGql DelegationOrderBy { | a }

newtype DelegationBoolExp = DelegationBoolExp
  { _and :: (Array DelegationBoolExp)
  , _not :: DelegationBoolExp
  , _or :: (Array DelegationBoolExp)
  , address :: StakeAddressComparisonExp
  , stakePool :: StakePoolBoolExp
  , stakePoolHash :: Hash28HexComparisonExp
  , stakePoolId :: StakePoolIdComparisonExp
  , transaction :: TransactionBoolExp
  }
derive instance newtypeDelegationBoolExp :: Newtype DelegationBoolExp _
instance argToGqlDelegationBoolExp :: (Newtype DelegationBoolExp {| p},  RecordArg p a u) => ArgGql DelegationBoolExp { | a }

newtype Delegation = Delegation
  { address :: StakeAddress
  , redeemer :: (Maybe Redeemer)
  , stakePool :: StakePool
  , stakePoolHash :: Hash28Hex
  , stakePoolId :: StakePoolId
  , transaction :: (Maybe Transaction)
  }
derive instance newtypeDelegation :: Newtype Delegation _
instance argToGqlDelegation :: (Newtype Delegation {| p},  RecordArg p a u) => ArgGql Delegation { | a }

newtype Redeemer = Redeemer
  { fee :: BigInt
  , index :: Int
  , purpose :: String
  , scriptHash :: Hash28Hex
  , transaction :: Transaction
  , unitMem :: BigInt
  , unitSteps :: BigInt
  }
derive instance newtypeRedeemer :: Newtype Redeemer _
instance argToGqlRedeemer :: (Newtype Redeemer {| p},  RecordArg p a u) => ArgGql Redeemer { | a }

newtype Transaction = Transaction
  { block :: (Maybe Block)
  , blockIndex :: Int
  , collateral :: (Maybe (Array (Maybe TransactionInput)))
  , deposit :: BigInt
  , fee :: BigInt
  , hash :: Hash32Hex
  , inputs ::
    { limit :: Int
    , order_by :: (Array TransactionInputOrderBy)
    , offset :: Int
    , where :: TransactionInputBoolExp
    }
    ==> (Array TransactionInput)
  , inputs_aggregate ::
    { limit :: Int
    , order_by :: (Array TransactionInputOrderBy)
    , offset :: Int
    , where :: TransactionInputBoolExp
    }
    ==> TransactionInputAggregate
  , invalidBefore :: (Maybe String)
  , invalidHereafter :: (Maybe String)
  , metadata :: (Maybe (Array (Maybe TransactionMetadata)))
  , mint ::
    { limit :: Int
    , order_by :: (Array TokenOrderBy)
    , offset :: Int
    , where :: TokenBoolExp
    }
    ==> (Array Token)
  , mint_aggregate ::
    { limit :: Int
    , order_by :: (Array TokenOrderBy)
    , offset :: Int
    , where :: TokenBoolExp
    }
    ==> TokenAggregate
  , outputs ::
    { limit :: Int
    , order_by :: (Array TransactionOutputOrderBy)
    , offset :: Int
    , where :: TransactionOutputBoolExp
    }
    ==> (Array (Maybe TransactionOutput))
  , outputs_aggregate ::
    { limit :: Int
    , order_by :: (Array TransactionOutputOrderBy)
    , offset :: Int
    , where :: TransactionOutputBoolExp
    }
    ==> TransactionOutputAggregate
  , redeemers :: (Maybe (Array (Maybe Redeemer)))
  , scripts :: (Maybe (Array (Maybe Script)))
  , scriptSize :: Int
  , size :: BigInt
  , totalOutput :: String
  , includedAt :: DateTime
  ,
  {- True unless a contract is invalid -}
  validContract :: Boolean
  , withdrawals :: (Array (Maybe Withdrawal))
  , withdrawals_aggregate ::
    { limit :: Int
    , order_by :: (Array WithdrawalOrderBy)
    , offset :: Int
    , where :: WithdrawalBoolExp
    }
    ==> WithdrawalAggregate
  }
derive instance newtypeTransaction :: Newtype Transaction _
instance argToGqlTransaction :: (Newtype Transaction {| p},  RecordArg p a u) => ArgGql Transaction { | a }

newtype TransactionInput = TransactionInput
  { address :: String
  , redeemer :: (Maybe Redeemer)
  , sourceTransaction :: Transaction
  , sourceTxHash :: Hash32Hex
  , sourceTxIndex :: Int
  , tokens :: (Array (Maybe Token))
  , tokens_aggregate :: TokenAggregate
  , transaction :: Transaction
  , txHash :: Hash32Hex
  , value :: String
  }
derive instance newtypeTransactionInput :: Newtype TransactionInput _
instance argToGqlTransactionInput :: (Newtype TransactionInput {| p},  RecordArg p a u) => ArgGql TransactionInput { | a }

newtype Token = Token
  { asset :: Asset
  , quantity :: String
  , transactionOutput :: TransactionOutput
  }
derive instance newtypeToken :: Newtype Token _
instance argToGqlToken :: (Newtype Token {| p},  RecordArg p a u) => ArgGql Token { | a }

newtype Asset = Asset
  { assetId :: Hex
  , assetName :: (Maybe Hex)
  , decimals :: (Maybe Int)
  , description :: (Maybe String)
  , fingerprint :: (Maybe AssetFingerprint)
  , logo :: (Maybe String)
  , metadataHash :: (Maybe String)
  , tokenMints ::
    { limit :: Int
    , order_by :: (Array (NotNull TokenMintOrderBy))
    , offset :: Int
    , where :: TokenMintBoolExp
    }
    ==> (Array (Maybe TokenMint))
  , tokenMints_aggregate ::
    { limit :: Int
    , order_by :: (Array (NotNull TokenMintOrderBy))
    , offset :: Int
    , where :: TokenMintBoolExp
    }
    ==> TokenMintAggregate
  , name :: (Maybe String)
  , policyId :: Hash28Hex
  , ticker :: (Maybe String)
  , url :: (Maybe String)
  }
derive instance newtypeAsset :: Newtype Asset _
instance argToGqlAsset :: (Newtype Asset {| p},  RecordArg p a u) => ArgGql Asset { | a }



 -- | CIP14 User-facing asset fingerprint as a bech32-encoded blake2b-160 digest of the concatenation of policy id and asset name.

type AssetFingerprint = Data.Argonaut.Core.Json -- Unknown scalar type. Add AssetFingerprint to externalTypes in codegen options to override this behaviour

newtype TokenMintOrderBy = TokenMintOrderBy
  { asset :: AssetOrderBy
  , quantity :: OrderBy
  , transaction :: TransactionOrderBy
  }
derive instance newtypeTokenMintOrderBy :: Newtype TokenMintOrderBy _
instance argToGqlTokenMintOrderBy :: (Newtype TokenMintOrderBy {| p},  RecordArg p a u) => ArgGql TokenMintOrderBy { | a }

newtype AssetOrderBy = AssetOrderBy
  { assetId :: OrderBy
  , decimals :: OrderBy
  , fingerprint :: OrderBy
  , name :: OrderBy
  }
derive instance newtypeAssetOrderBy :: Newtype AssetOrderBy _
instance argToGqlAssetOrderBy :: (Newtype AssetOrderBy {| p},  RecordArg p a u) => ArgGql AssetOrderBy { | a }

newtype TokenMint = TokenMint
  { asset :: Asset
  , quantity :: String
  , transaction :: Transaction
  }
derive instance newtypeTokenMint :: Newtype TokenMint _
instance argToGqlTokenMint :: (Newtype TokenMint {| p},  RecordArg p a u) => ArgGql TokenMint { | a }

newtype TokenMintAggregate = TokenMintAggregate
  { aggregate :: (Maybe TokenMintAggregateFields)
  , nodes :: (Array TokenMint)
  }
derive instance newtypeTokenMintAggregate :: Newtype TokenMintAggregate _
instance argToGqlTokenMintAggregate :: (Newtype TokenMintAggregate {| p},  RecordArg p a u) => ArgGql TokenMintAggregate { | a }

newtype TokenMintAggregateFields = TokenMintAggregateFields
  { avg :: TokenMintAvgFields
  , count :: String
  , max :: TokenMintMaxFields
  , min :: TokenMintMinFields
  , sum :: TokenMintSumFields
  }
derive instance newtypeTokenMintAggregateFields :: Newtype TokenMintAggregateFields _
instance argToGqlTokenMintAggregateFields :: (Newtype TokenMintAggregateFields {| p},  RecordArg p a u) => ArgGql TokenMintAggregateFields { | a }

newtype TokenMintAvgFields = TokenMintAvgFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMintAvgFields :: Newtype TokenMintAvgFields _
instance argToGqlTokenMintAvgFields :: (Newtype TokenMintAvgFields {| p},  RecordArg p a u) => ArgGql TokenMintAvgFields { | a }

newtype TokenMintMaxFields = TokenMintMaxFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMintMaxFields :: Newtype TokenMintMaxFields _
instance argToGqlTokenMintMaxFields :: (Newtype TokenMintMaxFields {| p},  RecordArg p a u) => ArgGql TokenMintMaxFields { | a }

newtype TokenMintMinFields = TokenMintMinFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMintMinFields :: Newtype TokenMintMinFields _
instance argToGqlTokenMintMinFields :: (Newtype TokenMintMinFields {| p},  RecordArg p a u) => ArgGql TokenMintMinFields { | a }

newtype TokenMintSumFields = TokenMintSumFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMintSumFields :: Newtype TokenMintSumFields _
instance argToGqlTokenMintSumFields :: (Newtype TokenMintSumFields {| p},  RecordArg p a u) => ArgGql TokenMintSumFields { | a }

newtype TransactionOutput = TransactionOutput
  { address :: String
  , addressHasScript :: Boolean
  , index :: Int
  , transaction :: Transaction
  , txHash :: Hash32Hex
  , tokens :: (Array Token)
  , tokens_aggregate :: TokenAggregate
  , value :: String
  }
derive instance newtypeTransactionOutput :: Newtype TransactionOutput _
instance argToGqlTransactionOutput :: (Newtype TransactionOutput {| p},  RecordArg p a u) => ArgGql TransactionOutput { | a }

newtype TokenAggregate = TokenAggregate
  { aggregate :: (Maybe TokenAggregateFields)
  , nodes :: (Array Token)
  }
derive instance newtypeTokenAggregate :: Newtype TokenAggregate _
instance argToGqlTokenAggregate :: (Newtype TokenAggregate {| p},  RecordArg p a u) => ArgGql TokenAggregate { | a }

newtype TokenAggregateFields = TokenAggregateFields
  { avg :: TokenAvgFields
  , count :: String
  , max :: TokenMaxFields
  , min :: TokenMinFields
  , sum :: TokenSumFields
  }
derive instance newtypeTokenAggregateFields :: Newtype TokenAggregateFields _
instance argToGqlTokenAggregateFields :: (Newtype TokenAggregateFields {| p},  RecordArg p a u) => ArgGql TokenAggregateFields { | a }

newtype TokenAvgFields = TokenAvgFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenAvgFields :: Newtype TokenAvgFields _
instance argToGqlTokenAvgFields :: (Newtype TokenAvgFields {| p},  RecordArg p a u) => ArgGql TokenAvgFields { | a }

newtype TokenMaxFields = TokenMaxFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMaxFields :: Newtype TokenMaxFields _
instance argToGqlTokenMaxFields :: (Newtype TokenMaxFields {| p},  RecordArg p a u) => ArgGql TokenMaxFields { | a }

newtype TokenMinFields = TokenMinFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenMinFields :: Newtype TokenMinFields _
instance argToGqlTokenMinFields :: (Newtype TokenMinFields {| p},  RecordArg p a u) => ArgGql TokenMinFields { | a }

newtype TokenSumFields = TokenSumFields
  { quantity :: (Maybe String)
  }
derive instance newtypeTokenSumFields :: Newtype TokenSumFields _
instance argToGqlTokenSumFields :: (Newtype TokenSumFields {| p},  RecordArg p a u) => ArgGql TokenSumFields { | a }

newtype TransactionInputOrderBy = TransactionInputOrderBy
  { address :: OrderBy
  , sourceTxHash :: OrderBy
  , transaction :: TransactionOrderBy
  , txHash :: OrderBy
  , value :: OrderBy
  }
derive instance newtypeTransactionInputOrderBy :: Newtype TransactionInputOrderBy _
instance argToGqlTransactionInputOrderBy :: (Newtype TransactionInputOrderBy {| p},  RecordArg p a u) => ArgGql TransactionInputOrderBy { | a }

newtype TransactionInputAggregate = TransactionInputAggregate
  { aggregate :: (Maybe TransactionInputAggregateFields)
  }
derive instance newtypeTransactionInputAggregate :: Newtype TransactionInputAggregate _
instance argToGqlTransactionInputAggregate :: (Newtype TransactionInputAggregate {| p},  RecordArg p a u) => ArgGql TransactionInputAggregate { | a }

newtype TransactionInputAggregateFields = TransactionInputAggregateFields
  { avg :: TransactionInputAvgFields
  , count :: String
  , max :: TransactionInputMaxFields
  , min :: TransactionInputMinFields
  , sum :: TransactionInputSumFields
  }
derive instance newtypeTransactionInputAggregateFields :: Newtype TransactionInputAggregateFields _
instance argToGqlTransactionInputAggregateFields :: (Newtype TransactionInputAggregateFields {| p},  RecordArg p a u) => ArgGql TransactionInputAggregateFields { | a }

newtype TransactionInputAvgFields = TransactionInputAvgFields
  { tokens :: (Maybe TokenAvgFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionInputAvgFields :: Newtype TransactionInputAvgFields _
instance argToGqlTransactionInputAvgFields :: (Newtype TransactionInputAvgFields {| p},  RecordArg p a u) => ArgGql TransactionInputAvgFields { | a }

newtype TransactionInputMaxFields = TransactionInputMaxFields
  { tokens :: (Maybe TokenMaxFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionInputMaxFields :: Newtype TransactionInputMaxFields _
instance argToGqlTransactionInputMaxFields :: (Newtype TransactionInputMaxFields {| p},  RecordArg p a u) => ArgGql TransactionInputMaxFields { | a }

newtype TransactionInputMinFields = TransactionInputMinFields
  { tokens :: (Maybe TokenMinFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionInputMinFields :: Newtype TransactionInputMinFields _
instance argToGqlTransactionInputMinFields :: (Newtype TransactionInputMinFields {| p},  RecordArg p a u) => ArgGql TransactionInputMinFields { | a }

newtype TransactionInputSumFields = TransactionInputSumFields
  { tokens :: (Maybe TokenSumFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionInputSumFields :: Newtype TransactionInputSumFields _
instance argToGqlTransactionInputSumFields :: (Newtype TransactionInputSumFields {| p},  RecordArg p a u) => ArgGql TransactionInputSumFields { | a }

newtype TransactionMetadata = TransactionMetadata
  { key :: String
  , value :: Json
  }
derive instance newtypeTransactionMetadata :: Newtype TransactionMetadata _
instance argToGqlTransactionMetadata :: (Newtype TransactionMetadata {| p},  RecordArg p a u) => ArgGql TransactionMetadata { | a }



 -- | The `JSON` scalar type represents JSON values as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).

type Json = Data.Argonaut.Core.Json -- Unknown scalar type. Add Json to externalTypes in codegen options to override this behaviour

newtype TokenOrderBy = TokenOrderBy
  { asset :: AssetOrderBy
  , quantity :: OrderBy
  }
derive instance newtypeTokenOrderBy :: Newtype TokenOrderBy _
instance argToGqlTokenOrderBy :: (Newtype TokenOrderBy {| p},  RecordArg p a u) => ArgGql TokenOrderBy { | a }

newtype TransactionOutputOrderBy = TransactionOutputOrderBy
  { address :: OrderBy
  , addressHasScript :: OrderBy
  , index :: OrderBy
  , txHash :: OrderBy
  , value :: OrderBy
  }
derive instance newtypeTransactionOutputOrderBy :: Newtype TransactionOutputOrderBy _
instance argToGqlTransactionOutputOrderBy :: (Newtype TransactionOutputOrderBy {| p},  RecordArg p a u) => ArgGql TransactionOutputOrderBy { | a }

newtype TransactionOutputAggregate = TransactionOutputAggregate
  { aggregate :: (Maybe TransactionOutputAggregateFields)
  }
derive instance newtypeTransactionOutputAggregate :: Newtype TransactionOutputAggregate _
instance argToGqlTransactionOutputAggregate :: (Newtype TransactionOutputAggregate {| p},  RecordArg p a u) => ArgGql TransactionOutputAggregate { | a }

newtype TransactionOutputAggregateFields = TransactionOutputAggregateFields
  { avg :: TransactionOutputAvgFields
  , count :: String
  , max :: TransactionOutputMaxFields
  , min :: TransactionOutputMinFields
  , sum :: TransactionOutputSumFields
  }
derive instance newtypeTransactionOutputAggregateFields :: Newtype TransactionOutputAggregateFields _
instance argToGqlTransactionOutputAggregateFields :: (Newtype TransactionOutputAggregateFields {| p},  RecordArg p a u) => ArgGql TransactionOutputAggregateFields { | a }

newtype TransactionOutputAvgFields = TransactionOutputAvgFields
  { tokens :: (Maybe TokenAvgFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionOutputAvgFields :: Newtype TransactionOutputAvgFields _
instance argToGqlTransactionOutputAvgFields :: (Newtype TransactionOutputAvgFields {| p},  RecordArg p a u) => ArgGql TransactionOutputAvgFields { | a }

newtype TransactionOutputMaxFields = TransactionOutputMaxFields
  { tokens :: (Maybe TokenMaxFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionOutputMaxFields :: Newtype TransactionOutputMaxFields _
instance argToGqlTransactionOutputMaxFields :: (Newtype TransactionOutputMaxFields {| p},  RecordArg p a u) => ArgGql TransactionOutputMaxFields { | a }

newtype TransactionOutputMinFields = TransactionOutputMinFields
  { tokens :: (Maybe TokenMinFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionOutputMinFields :: Newtype TransactionOutputMinFields _
instance argToGqlTransactionOutputMinFields :: (Newtype TransactionOutputMinFields {| p},  RecordArg p a u) => ArgGql TransactionOutputMinFields { | a }

newtype TransactionOutputSumFields = TransactionOutputSumFields
  { tokens :: (Maybe TokenSumFields)
  , value :: (Maybe String)
  }
derive instance newtypeTransactionOutputSumFields :: Newtype TransactionOutputSumFields _
instance argToGqlTransactionOutputSumFields :: (Newtype TransactionOutputSumFields {| p},  RecordArg p a u) => ArgGql TransactionOutputSumFields { | a }

newtype Script = Script
  { hash :: Hash28Hex
  , serialisedSize :: (Maybe BigInt)
  , transaction :: Transaction
  , type :: String
  }
derive instance newtypeScript :: Newtype Script _
instance argToGqlScript :: (Newtype Script {| p},  RecordArg p a u) => ArgGql Script { | a }

newtype Withdrawal = Withdrawal
  { address :: StakeAddress
  , amount :: String
  , redeemer :: (Maybe Redeemer)
  , transaction :: Transaction
  }
derive instance newtypeWithdrawal :: Newtype Withdrawal _
instance argToGqlWithdrawal :: (Newtype Withdrawal {| p},  RecordArg p a u) => ArgGql Withdrawal { | a }

newtype WithdrawalOrderBy = WithdrawalOrderBy
  { address :: OrderBy
  , amount :: OrderBy
  , transaction :: TransactionOrderBy
  }
derive instance newtypeWithdrawalOrderBy :: Newtype WithdrawalOrderBy _
instance argToGqlWithdrawalOrderBy :: (Newtype WithdrawalOrderBy {| p},  RecordArg p a u) => ArgGql WithdrawalOrderBy { | a }

newtype WithdrawalAggregate = WithdrawalAggregate
  { aggregate :: WithdrawalAggregateFields
  }
derive instance newtypeWithdrawalAggregate :: Newtype WithdrawalAggregate _
instance argToGqlWithdrawalAggregate :: (Newtype WithdrawalAggregate {| p},  RecordArg p a u) => ArgGql WithdrawalAggregate { | a }

newtype WithdrawalAggregateFields = WithdrawalAggregateFields
  { count :: String
  , avg :: WithdrawalAvgFields
  , max :: WithdrawalMaxFields
  , min :: WithdrawalMinFields
  , sum :: WithdrawalSumFields
  }
derive instance newtypeWithdrawalAggregateFields :: Newtype WithdrawalAggregateFields _
instance argToGqlWithdrawalAggregateFields :: (Newtype WithdrawalAggregateFields {| p},  RecordArg p a u) => ArgGql WithdrawalAggregateFields { | a }

newtype WithdrawalAvgFields = WithdrawalAvgFields
  { amount :: (Maybe String)
  }
derive instance newtypeWithdrawalAvgFields :: Newtype WithdrawalAvgFields _
instance argToGqlWithdrawalAvgFields :: (Newtype WithdrawalAvgFields {| p},  RecordArg p a u) => ArgGql WithdrawalAvgFields { | a }

newtype WithdrawalMaxFields = WithdrawalMaxFields
  { amount :: (Maybe String)
  }
derive instance newtypeWithdrawalMaxFields :: Newtype WithdrawalMaxFields _
instance argToGqlWithdrawalMaxFields :: (Newtype WithdrawalMaxFields {| p},  RecordArg p a u) => ArgGql WithdrawalMaxFields { | a }

newtype WithdrawalMinFields = WithdrawalMinFields
  { amount :: (Maybe String)
  }
derive instance newtypeWithdrawalMinFields :: Newtype WithdrawalMinFields _
instance argToGqlWithdrawalMinFields :: (Newtype WithdrawalMinFields {| p},  RecordArg p a u) => ArgGql WithdrawalMinFields { | a }

newtype WithdrawalSumFields = WithdrawalSumFields
  { amount :: (Maybe String)
  }
derive instance newtypeWithdrawalSumFields :: Newtype WithdrawalSumFields _
instance argToGqlWithdrawalSumFields :: (Newtype WithdrawalSumFields {| p},  RecordArg p a u) => ArgGql WithdrawalSumFields { | a }

newtype DelegationAggregate = DelegationAggregate
  { aggregate :: (Maybe DelegationAggregateFields)
  }
derive instance newtypeDelegationAggregate :: Newtype DelegationAggregate _
instance argToGqlDelegationAggregate :: (Newtype DelegationAggregate {| p},  RecordArg p a u) => ArgGql DelegationAggregate { | a }

newtype DelegationAggregateFields = DelegationAggregateFields
  { count :: (Maybe String)
  }
derive instance newtypeDelegationAggregateFields :: Newtype DelegationAggregateFields _
instance argToGqlDelegationAggregateFields :: (Newtype DelegationAggregateFields {| p},  RecordArg p a u) => ArgGql DelegationAggregateFields { | a }

newtype StakePoolOwner = StakePoolOwner
  { hash :: Hash28Hex
  }
derive instance newtypeStakePoolOwner :: Newtype StakePoolOwner _
instance argToGqlStakePoolOwner :: (Newtype StakePoolOwner {| p},  RecordArg p a u) => ArgGql StakePoolOwner { | a }

newtype Relay = Relay
  { ipv4 :: (Maybe IPv4)
  , ipv6 :: (Maybe IPv6)
  , dnsName :: (Maybe String)
  , dnsSrvName :: (Maybe String)
  , port :: (Maybe Int)
  }
derive instance newtypeRelay :: Newtype Relay _
instance argToGqlRelay :: (Newtype Relay {| p},  RecordArg p a u) => ArgGql Relay { | a }



 -- | A field whose value is a IPv4 address: https://en.wikipedia.org/wiki/IPv4.

type IPv4 = Data.Argonaut.Core.Json -- Unknown scalar type. Add IPv4 to externalTypes in codegen options to override this behaviour



 -- | A field whose value is a IPv6 address: https://en.wikipedia.org/wiki/IPv6.

type IPv6 = Data.Argonaut.Core.Json -- Unknown scalar type. Add IPv6 to externalTypes in codegen options to override this behaviour

newtype StakePoolRetirement = StakePoolRetirement
  { announcedIn :: (Maybe Transaction)
  , inEffectFrom :: Int
  , retiredInEpoch :: (Maybe Epoch)
  }
derive instance newtypeStakePoolRetirement :: Newtype StakePoolRetirement _
instance argToGqlStakePoolRetirement :: (Newtype StakePoolRetirement {| p},  RecordArg p a u) => ArgGql StakePoolRetirement { | a }

newtype Reward = Reward
  { address :: StakeAddress
  , amount :: String
  , earnedIn :: Epoch
  , receivedIn :: Epoch
  , stakePool :: (Maybe StakePool)
  , type :: String
  }
derive instance newtypeReward :: Newtype Reward _
instance argToGqlReward :: (Newtype Reward {| p},  RecordArg p a u) => ArgGql Reward { | a }

newtype RewardOrderBy = RewardOrderBy
  { address :: OrderBy
  , amount :: OrderBy
  , earnedIn :: EpochOrderBy
  , receivedIn :: EpochOrderBy
  , stakePool :: StakePoolOrderBy
  , type :: OrderBy
  }
derive instance newtypeRewardOrderBy :: Newtype RewardOrderBy _
instance argToGqlRewardOrderBy :: (Newtype RewardOrderBy {| p},  RecordArg p a u) => ArgGql RewardOrderBy { | a }

newtype RewardAggregate = RewardAggregate
  { aggregate :: (Maybe RewardAggregateFields)
  }
derive instance newtypeRewardAggregate :: Newtype RewardAggregate _
instance argToGqlRewardAggregate :: (Newtype RewardAggregate {| p},  RecordArg p a u) => ArgGql RewardAggregate { | a }

newtype RewardAggregateFields = RewardAggregateFields
  { avg :: RewardAvgFields
  , count :: String
  , max :: RewardMaxFields
  , min :: RewardMinFields
  , sum :: RewardSumFields
  }
derive instance newtypeRewardAggregateFields :: Newtype RewardAggregateFields _
instance argToGqlRewardAggregateFields :: (Newtype RewardAggregateFields {| p},  RecordArg p a u) => ArgGql RewardAggregateFields { | a }

newtype RewardAvgFields = RewardAvgFields
  { amount :: (Maybe Number)
  }
derive instance newtypeRewardAvgFields :: Newtype RewardAvgFields _
instance argToGqlRewardAvgFields :: (Newtype RewardAvgFields {| p},  RecordArg p a u) => ArgGql RewardAvgFields { | a }

newtype RewardMaxFields = RewardMaxFields
  { amount :: (Maybe String)
  }
derive instance newtypeRewardMaxFields :: Newtype RewardMaxFields _
instance argToGqlRewardMaxFields :: (Newtype RewardMaxFields {| p},  RecordArg p a u) => ArgGql RewardMaxFields { | a }

newtype RewardMinFields = RewardMinFields
  { amount :: (Maybe String)
  }
derive instance newtypeRewardMinFields :: Newtype RewardMinFields _
instance argToGqlRewardMinFields :: (Newtype RewardMinFields {| p},  RecordArg p a u) => ArgGql RewardMinFields { | a }

newtype RewardSumFields = RewardSumFields
  { amount :: (Maybe String)
  }
derive instance newtypeRewardSumFields :: Newtype RewardSumFields _
instance argToGqlRewardSumFields :: (Newtype RewardSumFields {| p},  RecordArg p a u) => ArgGql RewardSumFields { | a }



 -- | The `JSONObject` scalar type represents JSON objects as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).

type JsonObject = Data.Argonaut.Core.Json -- Unknown scalar type. Add JsonObject to externalTypes in codegen options to override this behaviour

newtype TransactionAggregate = TransactionAggregate
  { aggregate :: (Maybe TransactionAggregateFields)
  }
derive instance newtypeTransactionAggregate :: Newtype TransactionAggregate _
instance argToGqlTransactionAggregate :: (Newtype TransactionAggregate {| p},  RecordArg p a u) => ArgGql TransactionAggregate { | a }

newtype TransactionAggregateFields = TransactionAggregateFields
  { avg :: TransactionAvgFields
  , count :: String
  , max :: TransactionMaxFields
  , min :: TransactionMinFields
  , sum :: TransactionSumFields
  }
derive instance newtypeTransactionAggregateFields :: Newtype TransactionAggregateFields _
instance argToGqlTransactionAggregateFields :: (Newtype TransactionAggregateFields {| p},  RecordArg p a u) => ArgGql TransactionAggregateFields { | a }

newtype TransactionAvgFields = TransactionAvgFields
  { deposit :: (Maybe Number)
  , fee :: (Maybe Number)
  , mint :: (Maybe TokenAvgFields)
  , scriptSize :: (Maybe Number)
  , size :: (Maybe Number)
  , totalOutput :: (Maybe Number)
  , withdrawals :: (Maybe WithdrawalAvgFields)
  }
derive instance newtypeTransactionAvgFields :: Newtype TransactionAvgFields _
instance argToGqlTransactionAvgFields :: (Newtype TransactionAvgFields {| p},  RecordArg p a u) => ArgGql TransactionAvgFields { | a }

newtype TransactionMaxFields = TransactionMaxFields
  { deposit :: (Maybe String)
  , fee :: (Maybe String)
  , invalidBefore :: (Maybe String)
  , invalidHereafter :: (Maybe String)
  , mint :: (Maybe TokenMaxFields)
  , scriptSize :: (Maybe Int)
  , size :: (Maybe String)
  , totalOutput :: (Maybe String)
  , withdrawals :: (Maybe WithdrawalMaxFields)
  }
derive instance newtypeTransactionMaxFields :: Newtype TransactionMaxFields _
instance argToGqlTransactionMaxFields :: (Newtype TransactionMaxFields {| p},  RecordArg p a u) => ArgGql TransactionMaxFields { | a }

newtype TransactionMinFields = TransactionMinFields
  { deposit :: (Maybe String)
  , fee :: (Maybe String)
  , invalidBefore :: (Maybe String)
  , invalidHereafter :: (Maybe String)
  , mint :: (Maybe TokenMinFields)
  , scriptSize :: (Maybe Int)
  , size :: (Maybe String)
  , totalOutput :: (Maybe String)
  , withdrawals :: (Maybe WithdrawalMinFields)
  }
derive instance newtypeTransactionMinFields :: Newtype TransactionMinFields _
instance argToGqlTransactionMinFields :: (Newtype TransactionMinFields {| p},  RecordArg p a u) => ArgGql TransactionMinFields { | a }

newtype TransactionSumFields = TransactionSumFields
  { deposit :: (Maybe String)
  , fee :: (Maybe String)
  , mint :: (Maybe TokenSumFields)
  , scriptSize :: (Maybe BigInt)
  , size :: (Maybe String)
  , totalOutput :: (Maybe String)
  , withdrawals :: (Maybe WithdrawalSumFields)
  }
derive instance newtypeTransactionSumFields :: Newtype TransactionSumFields _
instance argToGqlTransactionSumFields :: (Newtype TransactionSumFields {| p},  RecordArg p a u) => ArgGql TransactionSumFields { | a }

newtype ShelleyProtocolParams = ShelleyProtocolParams
  { a0 :: Number
  , coinsPerUtxoWord :: (Maybe Int)
  , collateralPercent :: (Maybe Int)
  , costModels :: (Maybe String)
  , decentralisationParam :: Number
  , eMax :: Int
  , extraEntropy :: (Maybe JsonObject)
  , keyDeposit :: Int
  , maxBlockBodySize :: Int
  , maxBlockExMem :: (Maybe String)
  , maxBlockExSteps :: (Maybe String)
  , maxBlockHeaderSize :: Int
  , maxCollateralInputs :: (Maybe Int)
  , maxTxExMem :: (Maybe String)
  , maxTxExSteps :: (Maybe String)
  , maxTxSize :: Int
  , maxValSize :: (Maybe String)
  , minFeeA :: Int
  , minFeeB :: Int
  , minPoolCost :: Int
  , minUTxOValue :: Int
  , nOpt :: Int
  , poolDeposit :: Int
  , priceMem :: (Maybe Number)
  , priceStep :: (Maybe Number)
  , protocolVersion :: JsonObject
  , rho :: Number
  , tau :: Number
  }
derive instance newtypeShelleyProtocolParams :: Newtype ShelleyProtocolParams _
instance argToGqlShelleyProtocolParams :: (Newtype ShelleyProtocolParams {| p},  RecordArg p a u) => ArgGql ShelleyProtocolParams { | a }

newtype Ada = Ada
  { supply :: AssetSupply
  }
derive instance newtypeAda :: Newtype Ada _
instance argToGqlAda :: (Newtype Ada {| p},  RecordArg p a u) => ArgGql Ada { | a }

newtype AssetSupply = AssetSupply
  { circulating :: String
  , max :: String
  , total :: (Maybe String)
  }
derive instance newtypeAssetSupply :: Newtype AssetSupply _
instance argToGqlAssetSupply :: (Newtype AssetSupply {| p},  RecordArg p a u) => ArgGql AssetSupply { | a }

newtype AssetAggregate = AssetAggregate
  { aggregate :: (Maybe AssetAggregateFields)
  }
derive instance newtypeAssetAggregate :: Newtype AssetAggregate _
instance argToGqlAssetAggregate :: (Newtype AssetAggregate {| p},  RecordArg p a u) => ArgGql AssetAggregate { | a }

newtype AssetAggregateFields = AssetAggregateFields
  { count :: String
  }
derive instance newtypeAssetAggregateFields :: Newtype AssetAggregateFields _
instance argToGqlAssetAggregateFields :: (Newtype AssetAggregateFields {| p},  RecordArg p a u) => ArgGql AssetAggregateFields { | a }

newtype Cardano = Cardano
  { tip :: Block
  , currentEpoch :: Epoch
  }
derive instance newtypeCardano :: Newtype Cardano _
instance argToGqlCardano :: (Newtype Cardano {| p},  RecordArg p a u) => ArgGql Cardano { | a }

newtype CardanoDbMeta = CardanoDbMeta
  { initialized :: Boolean
  , syncPercentage :: Percentage
  }
derive instance newtypeCardanoDbMeta :: Newtype CardanoDbMeta _
instance argToGqlCardanoDbMeta :: (Newtype CardanoDbMeta {| p},  RecordArg p a u) => ArgGql CardanoDbMeta { | a }


 -- | 0-100.00
type Percentage = Data.Percentage.Percentage

newtype EpochAggregate = EpochAggregate
  { aggregate :: EpochAggregateFields
  }
derive instance newtypeEpochAggregate :: Newtype EpochAggregate _
instance argToGqlEpochAggregate :: (Newtype EpochAggregate {| p},  RecordArg p a u) => ArgGql EpochAggregate { | a }

newtype EpochAggregateFields = EpochAggregateFields
  { avg :: EpochAvgFields
  , count :: String
  , max :: EpochMaxFields
  , min :: EpochMinFields
  , sum :: EpochSumFields
  }
derive instance newtypeEpochAggregateFields :: Newtype EpochAggregateFields _
instance argToGqlEpochAggregateFields :: (Newtype EpochAggregateFields {| p},  RecordArg p a u) => ArgGql EpochAggregateFields { | a }

newtype EpochAvgFields = EpochAvgFields
  { fees :: Number
  , output :: Number
  , transactionsCount :: Number
  }
derive instance newtypeEpochAvgFields :: Newtype EpochAvgFields _
instance argToGqlEpochAvgFields :: (Newtype EpochAvgFields {| p},  RecordArg p a u) => ArgGql EpochAvgFields { | a }

newtype EpochMaxFields = EpochMaxFields
  { blocksCount :: String
  , fees :: String
  , number :: Int
  , output :: String
  , transactionsCount :: String
  }
derive instance newtypeEpochMaxFields :: Newtype EpochMaxFields _
instance argToGqlEpochMaxFields :: (Newtype EpochMaxFields {| p},  RecordArg p a u) => ArgGql EpochMaxFields { | a }

newtype EpochMinFields = EpochMinFields
  { blocksCount :: String
  , fees :: String
  , output :: String
  , transactionsCount :: String
  }
derive instance newtypeEpochMinFields :: Newtype EpochMinFields _
instance argToGqlEpochMinFields :: (Newtype EpochMinFields {| p},  RecordArg p a u) => ArgGql EpochMinFields { | a }

newtype EpochSumFields = EpochSumFields
  { blocksCount :: String
  , fees :: String
  , output :: String
  , transactionsCount :: String
  }
derive instance newtypeEpochSumFields :: Newtype EpochSumFields _
instance argToGqlEpochSumFields :: (Newtype EpochSumFields {| p},  RecordArg p a u) => ArgGql EpochSumFields { | a }

newtype Genesis = Genesis
  { alonzo :: (Maybe AlonzoGenesis)
  , byron :: (Maybe ByronGenesis)
  , shelley :: (Maybe ShelleyGenesis)
  }
derive instance newtypeGenesis :: Newtype Genesis _
instance argToGqlGenesis :: (Newtype Genesis {| p},  RecordArg p a u) => ArgGql Genesis { | a }

newtype AlonzoGenesis = AlonzoGenesis
  { lovelacePerUTxOWord :: Int
  , executionPrices :: ExecutionPrices
  , maxTxExUnits :: ExecutionUnits
  , maxBlockExUnits :: ExecutionUnits
  , maxValueSize :: Int
  , collateralPercentage :: Int
  , maxCollateralInputs :: Int
  }
derive instance newtypeAlonzoGenesis :: Newtype AlonzoGenesis _
instance argToGqlAlonzoGenesis :: (Newtype AlonzoGenesis {| p},  RecordArg p a u) => ArgGql AlonzoGenesis { | a }

newtype ExecutionPrices = ExecutionPrices
  { prSteps :: ExecutionPrice
  , prMem :: ExecutionPrice
  }
derive instance newtypeExecutionPrices :: Newtype ExecutionPrices _
instance argToGqlExecutionPrices :: (Newtype ExecutionPrices {| p},  RecordArg p a u) => ArgGql ExecutionPrices { | a }

newtype ExecutionPrice = ExecutionPrice
  { numerator :: Int
  , denominator :: Int
  }
derive instance newtypeExecutionPrice :: Newtype ExecutionPrice _
instance argToGqlExecutionPrice :: (Newtype ExecutionPrice {| p},  RecordArg p a u) => ArgGql ExecutionPrice { | a }

newtype ExecutionUnits = ExecutionUnits
  { exUnitsMem :: BigInt
  , exUnitsSteps :: BigInt
  }
derive instance newtypeExecutionUnits :: Newtype ExecutionUnits _
instance argToGqlExecutionUnits :: (Newtype ExecutionUnits {| p},  RecordArg p a u) => ArgGql ExecutionUnits { | a }

newtype ByronGenesis = ByronGenesis
  { bootStakeholders :: JsonObject
  , heavyDelegation :: JsonObject
  , startTime :: DateTime
  , nonAvvmBalances :: JsonObject
  , blockVersionData :: ByronBlockVersionData
  , protocolConsts :: ByronProtocolConsts
  , avvmDistr :: JsonObject
  }
derive instance newtypeByronGenesis :: Newtype ByronGenesis _
instance argToGqlByronGenesis :: (Newtype ByronGenesis {| p},  RecordArg p a u) => ArgGql ByronGenesis { | a }



 -- | The javascript `Date` as integer. Type represents date and time as number of milliseconds from start of UNIX epoch.

-- type DateTime = Data.DateTime.DateTime

newtype ByronBlockVersionData = ByronBlockVersionData
  { scriptVersion :: Int
  , slotDuration :: Int
  , maxBlockSize :: Int
  , maxHeaderSize :: Int
  , maxTxSize :: Int
  , maxProposalSize :: Int
  , mpcThd :: String
  , heavyDelThd :: String
  , updateVoteThd :: String
  , updateProposalThd :: String
  , updateImplicit :: String
  , softforkRule :: ByronSoftForkRule
  , txFeePolicy :: ByronTxFeePolicy
  , unlockStakeEpoch :: String
  }
derive instance newtypeByronBlockVersionData :: Newtype ByronBlockVersionData _
instance argToGqlByronBlockVersionData :: (Newtype ByronBlockVersionData {| p},  RecordArg p a u) => ArgGql ByronBlockVersionData { | a }

newtype ByronSoftForkRule = ByronSoftForkRule
  { initThd :: String
  , minThd :: String
  , thdDecrement :: String
  }
derive instance newtypeByronSoftForkRule :: Newtype ByronSoftForkRule _
instance argToGqlByronSoftForkRule :: (Newtype ByronSoftForkRule {| p},  RecordArg p a u) => ArgGql ByronSoftForkRule { | a }

newtype ByronTxFeePolicy = ByronTxFeePolicy
  { summand :: String
  , multiplier :: String
  }
derive instance newtypeByronTxFeePolicy :: Newtype ByronTxFeePolicy _
instance argToGqlByronTxFeePolicy :: (Newtype ByronTxFeePolicy {| p},  RecordArg p a u) => ArgGql ByronTxFeePolicy { | a }

newtype ByronProtocolConsts = ByronProtocolConsts
  { k :: Int
  , protocolMagic :: (Maybe Int)
  }
derive instance newtypeByronProtocolConsts :: Newtype ByronProtocolConsts _
instance argToGqlByronProtocolConsts :: (Newtype ByronProtocolConsts {| p},  RecordArg p a u) => ArgGql ByronProtocolConsts { | a }

newtype ShelleyGenesis = ShelleyGenesis
  { activeSlotsCoeff :: Number
  , epochLength :: Int
  , genDelegs :: (Maybe JsonObject)
  , initialFunds :: JsonObject
  , maxKESEvolutions :: Int
  , maxLovelaceSupply :: String
  , networkId :: String
  , networkMagic :: Int
  , protocolParams :: ShelleyProtocolParams
  , securityParam :: Int
  , slotLength :: Int
  , slotsPerKESPeriod :: Int
  , staking :: (Maybe ShelleyGenesisStaking)
  , systemStart :: String
  , updateQuorum :: Int
  }
derive instance newtypeShelleyGenesis :: Newtype ShelleyGenesis _
instance argToGqlShelleyGenesis :: (Newtype ShelleyGenesis {| p},  RecordArg p a u) => ArgGql ShelleyGenesis { | a }

newtype ShelleyGenesisStaking = ShelleyGenesisStaking
  { pools :: JsonObject
  , stake :: JsonObject
  }
derive instance newtypeShelleyGenesisStaking :: Newtype ShelleyGenesisStaking _
instance argToGqlShelleyGenesisStaking :: (Newtype ShelleyGenesisStaking {| p},  RecordArg p a u) => ArgGql ShelleyGenesisStaking { | a }

newtype PaymentAddress = PaymentAddress
  { address :: String
  , summary ::
    { atBlock :: Int
    }
    ==> (Maybe PaymentAddressSummary)
  }
derive instance newtypePaymentAddress :: Newtype PaymentAddress _
instance argToGqlPaymentAddress :: (Newtype PaymentAddress {| p},  RecordArg p a u) => ArgGql PaymentAddress { | a }

newtype PaymentAddressSummary = PaymentAddressSummary
  { assetBalances :: (Array (Maybe AssetBalance))
  , utxosCount :: Int
  }
derive instance newtypePaymentAddressSummary :: Newtype PaymentAddressSummary _
instance argToGqlPaymentAddressSummary :: (Newtype PaymentAddressSummary {| p},  RecordArg p a u) => ArgGql PaymentAddressSummary { | a }

newtype AssetBalance = AssetBalance
  { asset :: Asset
  , quantity :: String
  }
derive instance newtypeAssetBalance :: Newtype AssetBalance _
instance argToGqlAssetBalance :: (Newtype AssetBalance {| p},  RecordArg p a u) => ArgGql AssetBalance { | a }

newtype RedeemerOrderBy = RedeemerOrderBy
  { purpose :: OrderBy
  , scriptHash :: OrderBy
  , transaction :: TransactionOrderBy
  , unitMem :: OrderBy
  , unitSteps :: OrderBy
  }
derive instance newtypeRedeemerOrderBy :: Newtype RedeemerOrderBy _
instance argToGqlRedeemerOrderBy :: (Newtype RedeemerOrderBy {| p},  RecordArg p a u) => ArgGql RedeemerOrderBy { | a }

newtype RedeemerBoolExp = RedeemerBoolExp
  { _and :: (Array RedeemerBoolExp)
  , _not :: RedeemerBoolExp
  , _or :: (Array RedeemerBoolExp)
  , fee :: BigIntComparisonExp
  , index :: IntComparisonExp
  , purpose :: TextComparisonExp
  , scriptHash :: TextComparisonExp
  , transaction :: TransactionBoolExp
  , unitMem :: BigIntComparisonExp
  , unitSteps :: BigIntComparisonExp
  }
derive instance newtypeRedeemerBoolExp :: Newtype RedeemerBoolExp _
instance argToGqlRedeemerBoolExp :: (Newtype RedeemerBoolExp {| p},  RecordArg p a u) => ArgGql RedeemerBoolExp { | a }

newtype RedeemerAggregate = RedeemerAggregate
  { aggregate :: (Maybe RedeemerAggregateFields)
  }
derive instance newtypeRedeemerAggregate :: Newtype RedeemerAggregate _
instance argToGqlRedeemerAggregate :: (Newtype RedeemerAggregate {| p},  RecordArg p a u) => ArgGql RedeemerAggregate { | a }

newtype RedeemerAggregateFields = RedeemerAggregateFields
  { avg :: RedeemerAvgFields
  , count :: String
  , max :: RedeemerMaxFields
  , min :: RedeemerMinFields
  , sum :: RedeemerSumFields
  }
derive instance newtypeRedeemerAggregateFields :: Newtype RedeemerAggregateFields _
instance argToGqlRedeemerAggregateFields :: (Newtype RedeemerAggregateFields {| p},  RecordArg p a u) => ArgGql RedeemerAggregateFields { | a }

newtype RedeemerAvgFields = RedeemerAvgFields
  { fee :: (Maybe Number)
  , unitMem :: (Maybe Number)
  , unitSteps :: (Maybe Number)
  }
derive instance newtypeRedeemerAvgFields :: Newtype RedeemerAvgFields _
instance argToGqlRedeemerAvgFields :: (Newtype RedeemerAvgFields {| p},  RecordArg p a u) => ArgGql RedeemerAvgFields { | a }

newtype RedeemerMaxFields = RedeemerMaxFields
  { fee :: (Maybe BigInt)
  , unitMem :: (Maybe BigInt)
  , unitSteps :: (Maybe BigInt)
  }
derive instance newtypeRedeemerMaxFields :: Newtype RedeemerMaxFields _
instance argToGqlRedeemerMaxFields :: (Newtype RedeemerMaxFields {| p},  RecordArg p a u) => ArgGql RedeemerMaxFields { | a }

newtype RedeemerMinFields = RedeemerMinFields
  { fee :: (Maybe BigInt)
  , unitMem :: (Maybe BigInt)
  , unitSteps :: (Maybe BigInt)
  }
derive instance newtypeRedeemerMinFields :: Newtype RedeemerMinFields _
instance argToGqlRedeemerMinFields :: (Newtype RedeemerMinFields {| p},  RecordArg p a u) => ArgGql RedeemerMinFields { | a }

newtype RedeemerSumFields = RedeemerSumFields
  { fee :: (Maybe BigInt)
  , unitMem :: (Maybe BigInt)
  , unitSteps :: (Maybe BigInt)
  }
derive instance newtypeRedeemerSumFields :: Newtype RedeemerSumFields _
instance argToGqlRedeemerSumFields :: (Newtype RedeemerSumFields {| p},  RecordArg p a u) => ArgGql RedeemerSumFields { | a }

newtype ScriptOrderBy = ScriptOrderBy
  { serialisedSize :: OrderBy
  , transaction :: TransactionOrderBy
  , type :: OrderBy
  }
derive instance newtypeScriptOrderBy :: Newtype ScriptOrderBy _
instance argToGqlScriptOrderBy :: (Newtype ScriptOrderBy {| p},  RecordArg p a u) => ArgGql ScriptOrderBy { | a }

newtype ScriptBoolExp = ScriptBoolExp
  { _and :: (Array ScriptBoolExp)
  , _not :: ScriptBoolExp
  , _or :: (Array ScriptBoolExp)
  , serialisedSize :: BigIntComparisonExp
  , transaction :: TransactionBoolExp
  , type :: TextComparisonExp
  }
derive instance newtypeScriptBoolExp :: Newtype ScriptBoolExp _
instance argToGqlScriptBoolExp :: (Newtype ScriptBoolExp {| p},  RecordArg p a u) => ArgGql ScriptBoolExp { | a }

newtype ScriptAggregate = ScriptAggregate
  { aggregate :: (Maybe ScriptAggregateFields)
  }
derive instance newtypeScriptAggregate :: Newtype ScriptAggregate _
instance argToGqlScriptAggregate :: (Newtype ScriptAggregate {| p},  RecordArg p a u) => ArgGql ScriptAggregate { | a }

newtype ScriptAggregateFields = ScriptAggregateFields
  { avg :: ScriptAvgFields
  , count :: String
  , max :: ScriptMaxFields
  , min :: ScriptMinFields
  , sum :: ScriptSumFields
  }
derive instance newtypeScriptAggregateFields :: Newtype ScriptAggregateFields _
instance argToGqlScriptAggregateFields :: (Newtype ScriptAggregateFields {| p},  RecordArg p a u) => ArgGql ScriptAggregateFields { | a }

newtype ScriptAvgFields = ScriptAvgFields
  { serialisedSize :: (Maybe Number)
  }
derive instance newtypeScriptAvgFields :: Newtype ScriptAvgFields _
instance argToGqlScriptAvgFields :: (Newtype ScriptAvgFields {| p},  RecordArg p a u) => ArgGql ScriptAvgFields { | a }

newtype ScriptMaxFields = ScriptMaxFields
  { serialisedSize :: (Maybe BigInt)
  }
derive instance newtypeScriptMaxFields :: Newtype ScriptMaxFields _
instance argToGqlScriptMaxFields :: (Newtype ScriptMaxFields {| p},  RecordArg p a u) => ArgGql ScriptMaxFields { | a }

newtype ScriptMinFields = ScriptMinFields
  { serialisedSize :: (Maybe BigInt)
  }
derive instance newtypeScriptMinFields :: Newtype ScriptMinFields _
instance argToGqlScriptMinFields :: (Newtype ScriptMinFields {| p},  RecordArg p a u) => ArgGql ScriptMinFields { | a }

newtype ScriptSumFields = ScriptSumFields
  { serialisedSize :: (Maybe BigInt)
  }
derive instance newtypeScriptSumFields :: Newtype ScriptSumFields _
instance argToGqlScriptSumFields :: (Newtype ScriptSumFields {| p},  RecordArg p a u) => ArgGql ScriptSumFields { | a }

newtype StakeDeregistrationOrderBy = StakeDeregistrationOrderBy
  { address :: OrderBy
  , transaction :: TransactionOrderBy
  }
derive instance newtypeStakeDeregistrationOrderBy :: Newtype StakeDeregistrationOrderBy _
instance argToGqlStakeDeregistrationOrderBy :: (Newtype StakeDeregistrationOrderBy {| p},  RecordArg p a u) => ArgGql StakeDeregistrationOrderBy { | a }

newtype StakeDeregistrationBoolExp = StakeDeregistrationBoolExp
  { _and :: (Array StakeDeregistrationBoolExp)
  , _not :: StakeDeregistrationBoolExp
  , _or :: (Array StakeDeregistrationBoolExp)
  , address :: StakeAddressComparisonExp
  , transaction :: TransactionBoolExp
  }
derive instance newtypeStakeDeregistrationBoolExp :: Newtype StakeDeregistrationBoolExp _
instance argToGqlStakeDeregistrationBoolExp :: (Newtype StakeDeregistrationBoolExp {| p},  RecordArg p a u) => ArgGql StakeDeregistrationBoolExp { | a }

newtype StakeDeregistration = StakeDeregistration
  { address :: StakeAddress
  , redeemer :: (Maybe Redeemer)
  , transaction :: Transaction
  }
derive instance newtypeStakeDeregistration :: Newtype StakeDeregistration _
instance argToGqlStakeDeregistration :: (Newtype StakeDeregistration {| p},  RecordArg p a u) => ArgGql StakeDeregistration { | a }

newtype StakeDeregistrationAggregate = StakeDeregistrationAggregate
  { aggregate :: (Maybe StakeDeregistrationAggregateFields)
  }
derive instance newtypeStakeDeregistrationAggregate :: Newtype StakeDeregistrationAggregate _
instance argToGqlStakeDeregistrationAggregate :: (Newtype StakeDeregistrationAggregate {| p},  RecordArg p a u) => ArgGql StakeDeregistrationAggregate { | a }

newtype StakeDeregistrationAggregateFields = StakeDeregistrationAggregateFields
  { count :: (Maybe String)
  }
derive instance newtypeStakeDeregistrationAggregateFields :: Newtype StakeDeregistrationAggregateFields _
instance argToGqlStakeDeregistrationAggregateFields :: (Newtype StakeDeregistrationAggregateFields {| p},  RecordArg p a u) => ArgGql StakeDeregistrationAggregateFields { | a }

newtype StakePoolAggregate = StakePoolAggregate
  { aggregate :: (Maybe StakePoolAggregateFields)
  }
derive instance newtypeStakePoolAggregate :: Newtype StakePoolAggregate _
instance argToGqlStakePoolAggregate :: (Newtype StakePoolAggregate {| p},  RecordArg p a u) => ArgGql StakePoolAggregate { | a }

newtype StakePoolAggregateFields = StakePoolAggregateFields
  { avg :: StakePoolAvgFields
  , count :: String
  , max :: StakePoolMaxFields
  , min :: StakePoolMinFields
  , sum :: StakePoolSumFields
  }
derive instance newtypeStakePoolAggregateFields :: Newtype StakePoolAggregateFields _
instance argToGqlStakePoolAggregateFields :: (Newtype StakePoolAggregateFields {| p},  RecordArg p a u) => ArgGql StakePoolAggregateFields { | a }

newtype StakePoolAvgFields = StakePoolAvgFields
  { fixedCost :: (Maybe String)
  , margin :: (Maybe Number)
  , pledge :: (Maybe String)
  }
derive instance newtypeStakePoolAvgFields :: Newtype StakePoolAvgFields _
instance argToGqlStakePoolAvgFields :: (Newtype StakePoolAvgFields {| p},  RecordArg p a u) => ArgGql StakePoolAvgFields { | a }

newtype StakePoolMaxFields = StakePoolMaxFields
  { fixedCost :: (Maybe String)
  , margin :: (Maybe Number)
  , pledge :: (Maybe String)
  }
derive instance newtypeStakePoolMaxFields :: Newtype StakePoolMaxFields _
instance argToGqlStakePoolMaxFields :: (Newtype StakePoolMaxFields {| p},  RecordArg p a u) => ArgGql StakePoolMaxFields { | a }

newtype StakePoolMinFields = StakePoolMinFields
  { fixedCost :: (Maybe String)
  , margin :: (Maybe Number)
  , pledge :: (Maybe String)
  }
derive instance newtypeStakePoolMinFields :: Newtype StakePoolMinFields _
instance argToGqlStakePoolMinFields :: (Newtype StakePoolMinFields {| p},  RecordArg p a u) => ArgGql StakePoolMinFields { | a }

newtype StakePoolSumFields = StakePoolSumFields
  { fixedCost :: (Maybe String)
  , margin :: (Maybe Number)
  , pledge :: (Maybe String)
  }
derive instance newtypeStakePoolSumFields :: Newtype StakePoolSumFields _
instance argToGqlStakePoolSumFields :: (Newtype StakePoolSumFields {| p},  RecordArg p a u) => ArgGql StakePoolSumFields { | a }

newtype StakeRegistrationOrderBy = StakeRegistrationOrderBy
  { address :: OrderBy
  , transaction :: TransactionOrderBy
  }
derive instance newtypeStakeRegistrationOrderBy :: Newtype StakeRegistrationOrderBy _
instance argToGqlStakeRegistrationOrderBy :: (Newtype StakeRegistrationOrderBy {| p},  RecordArg p a u) => ArgGql StakeRegistrationOrderBy { | a }

newtype StakeRegistrationBoolExp = StakeRegistrationBoolExp
  { _and :: (Array StakeRegistrationBoolExp)
  , _not :: StakeRegistrationBoolExp
  , _or :: (Array StakeRegistrationBoolExp)
  , address :: StakeAddressComparisonExp
  , transaction :: TransactionBoolExp
  }
derive instance newtypeStakeRegistrationBoolExp :: Newtype StakeRegistrationBoolExp _
instance argToGqlStakeRegistrationBoolExp :: (Newtype StakeRegistrationBoolExp {| p},  RecordArg p a u) => ArgGql StakeRegistrationBoolExp { | a }

newtype StakeRegistration = StakeRegistration
  { address :: StakeAddress
  , transaction :: Transaction
  }
derive instance newtypeStakeRegistration :: Newtype StakeRegistration _
instance argToGqlStakeRegistration :: (Newtype StakeRegistration {| p},  RecordArg p a u) => ArgGql StakeRegistration { | a }

newtype StakeRegistrationAggregate = StakeRegistrationAggregate
  { aggregate :: (Maybe StakeRegistrationAggregateFields)
  }
derive instance newtypeStakeRegistrationAggregate :: Newtype StakeRegistrationAggregate _
instance argToGqlStakeRegistrationAggregate :: (Newtype StakeRegistrationAggregate {| p},  RecordArg p a u) => ArgGql StakeRegistrationAggregate { | a }

newtype StakeRegistrationAggregateFields = StakeRegistrationAggregateFields
  { count :: (Maybe String)
  }
derive instance newtypeStakeRegistrationAggregateFields :: Newtype StakeRegistrationAggregateFields _
instance argToGqlStakeRegistrationAggregateFields :: (Newtype StakeRegistrationAggregateFields {| p},  RecordArg p a u) => ArgGql StakeRegistrationAggregateFields { | a }

newtype Mutation = Mutation
  {
  {- Submit a signed transaction to the network -}
  submitTransaction ::
    { transaction :: (NotNull String)
    }
    ==> TransactionSubmitResponse
  }
derive instance newtypeMutation :: Newtype Mutation _
instance argToGqlMutation :: (Newtype Mutation {| p},  RecordArg p a u) => ArgGql Mutation { | a }

newtype TransactionSubmitResponse = TransactionSubmitResponse
  { hash :: String
  }
derive instance newtypeTransactionSubmitResponse :: Newtype TransactionSubmitResponse _
instance argToGqlTransactionSubmitResponse :: (Newtype TransactionSubmitResponse {| p},  RecordArg p a u) => ArgGql TransactionSubmitResponse { | a }

newtype AssetSupplyBoolExp = AssetSupplyBoolExp
  { _and :: (Array AssetSupplyBoolExp)
  , _not :: AssetSupplyBoolExp
  , _or :: (Array AssetSupplyBoolExp)
  , circulating :: TextComparisonExp
  , max :: TextComparisonExp
  , total :: TextComparisonExp
  }
derive instance newtypeAssetSupplyBoolExp :: Newtype AssetSupplyBoolExp _
instance argToGqlAssetSupplyBoolExp :: (Newtype AssetSupplyBoolExp {| p},  RecordArg p a u) => ArgGql AssetSupplyBoolExp { | a }

newtype AssetSupplyOrderBy = AssetSupplyOrderBy
  { circulating :: OrderBy
  , max :: OrderBy
  , total :: OrderBy
  }
derive instance newtypeAssetSupplyOrderBy :: Newtype AssetSupplyOrderBy _
instance argToGqlAssetSupplyOrderBy :: (Newtype AssetSupplyOrderBy {| p},  RecordArg p a u) => ArgGql AssetSupplyOrderBy { | a }



 -- | expression to compare data of type Percentage. All fields are combined with logical 'AND'.

newtype PercentageComparisonExp = PercentageComparisonExp
  { _eq :: Percentage
  , _gt :: Percentage
  , _gte :: Percentage
  , _lt :: Percentage
  , _lte :: Percentage
  , _neq :: Percentage
  }
derive instance newtypePercentageComparisonExp :: Newtype PercentageComparisonExp _
instance argToGqlPercentageComparisonExp :: (Newtype PercentageComparisonExp {| p},  RecordArg p a u) => ArgGql PercentageComparisonExp { | a }
