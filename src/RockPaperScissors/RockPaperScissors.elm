module RockPaperScissors exposing (main)

{-| Main of the app


# Definition

@docs main

-}

import Html exposing (program)
import RockPaperScissors.State exposing (init, subscriptions, update)
import RockPaperScissors.Types exposing (Model, Msg)
import RockPaperScissors.View exposing (view)



-- Entry point


{-| Used as the entry point
-}
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
