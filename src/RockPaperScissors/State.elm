module RockPaperScissors.State exposing (init, update, subscriptions)

{-| This module contains the logic controlling the state of the module.


# Definitions

@docs init, update, subscriptions

-}

import RockPaperScissors.Types exposing (Choice(..), Model, Msg(..), Winner(..))
import RockPaperScissors.Utils exposing (calcGameWinner, generateRandomInt, run)


{-| Defines the input model and command messages for the initialization.
-}
init : ( Model, Cmd Msg )
init =
    ( initModel, initCmdMsg )


{-| Inits the model.
-}
initModel : Model
initModel =
    { userChoice = NoChoice
    , computerChoice = NoChoice
    , userScore = 0
    , computerScore = 0
    , userWins = False
    , computerWins = False
    , winner = Tie
    }


{-| Inits the command messages.
-}
initCmdMsg : Cmd Msg
initCmdMsg =
    Cmd.none


{-| Updates the model when actions are triggered
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UserChoice choice ->
            case choice of
                Rock ->
                    ( { model | userChoice = Rock }, generateRandomInt )

                Paper ->
                    ( { model | userChoice = Paper }, generateRandomInt )

                Scissors ->
                    ( { model | userChoice = Scissors }, generateRandomInt )

                NoChoice ->
                    ( model, Cmd.none )

        ComputerChoice choice ->
            case choice of
                1 ->
                    ( { model | computerChoice = Rock }, run UpdateScore )

                2 ->
                    ( { model | computerChoice = Paper }, run UpdateScore )

                3 ->
                    ( { model | computerChoice = Scissors }, run UpdateScore )

                _ ->
                    ( { model | computerChoice = NoChoice }, Cmd.none )

        UpdateScore ->
            let
                winner =
                    calcGameWinner model.userChoice model.computerChoice

                updatedModel =
                    case winner of
                        Tie ->
                            { model | winner = winner, userWins = False, computerWins = False }

                        User ->
                            { model | winner = winner, userWins = True, computerWins = False, userScore = model.userScore + 1 }

                        Computer ->
                            { model | winner = winner, userWins = False, computerWins = True, computerScore = model.computerScore + 1 }
            in
            ( updatedModel, Cmd.none )


{-| Used for listing for external input.
-}
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
