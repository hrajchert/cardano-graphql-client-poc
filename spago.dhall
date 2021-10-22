{ name = "cardano-graphql-client-poc"
, dependencies =
    [ "console"
    , "effect"
    , "halogen"
    , "psci-support"
    , "aff"
    , "argonaut-codecs"
    , "argonaut-core"
    , "arrays"
    , "datetime"
    , "debug"
    , "either"
    , "graphql-client"
    , "maybe"
    , "newtype"
    , "ordered-collections"
    , "prelude"
    , "tuples"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
