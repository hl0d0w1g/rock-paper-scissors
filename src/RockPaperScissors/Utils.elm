module RockPaperScissors.Utils exposing
    ( run
    , generateRandomInt
    , calcGameWinner
    , gameWinnerMessage
    , addGameResultClass
    )

{-| This module contains the utils functions of the module.


# Definitions

@docs run
@docs generateRandomInt
@docs calcGameWinner
@docs gameWinnerMessage
@docs addGameResultClass

-}

import Random
import RockPaperScissors.Types exposing (Choice(..), Msg(..), Winner(..))
import Task


{-| Runs another messsage on the update fucntion.
-}
run : msg -> Cmd msg
run m =
    Task.perform (always m) (Task.succeed ())


{-| Generates a random int between 1 and 3.
-}
generateRandomInt : Cmd Msg
generateRandomInt =
    Random.generate ComputerChoice (Random.int 1 3)


{-| Calcs the game winner based on their choices.
-}
calcGameWinner : Choice -> Choice -> Winner
calcGameWinner userChoice computerChoice =
    case userChoice of
        Rock ->
            case computerChoice of
                Rock ->
                    Tie

                Paper ->
                    Computer

                Scissors ->
                    User

                NoChoice ->
                    Tie

        Paper ->
            case computerChoice of
                Rock ->
                    User

                Paper ->
                    Tie

                Scissors ->
                    Computer

                NoChoice ->
                    Tie

        Scissors ->
            case computerChoice of
                Rock ->
                    Computer

                Paper ->
                    User

                Scissors ->
                    Tie

                NoChoice ->
                    Tie

        NoChoice ->
            Tie


{-| Renders the game winner message based on their choices.
-}
gameWinnerMessage : Choice -> Choice -> String
gameWinnerMessage userChoice computerChoice =
    case userChoice of
        Rock ->
            case computerChoice of
                Rock ->
                    "Rock equals Rock. It's a draw!"

                Paper ->
                    "Rock loses to Paper. You lost!"

                Scissors ->
                    "Rock beats Scissors. You win!"

                NoChoice ->
                    ""

        Paper ->
            case computerChoice of
                Rock ->
                    "Paper covers Rock. You win!"

                Paper ->
                    "Paper equals Paper. It's a draw!"

                Scissors ->
                    "Paper loses to Scissors. You lost!"

                NoChoice ->
                    ""

        Scissors ->
            case computerChoice of
                Rock ->
                    "Scissors loses to Rock. You lost!"

                Paper ->
                    "Scissors cuts Paper. You win!"

                Scissors ->
                    "Scissors equals Scissors. It's a draw!"

                NoChoice ->
                    ""

        NoChoice ->
            ""


{-| Returns the correct css class to the choice.
-}
addGameResultClass : Choice -> Choice -> Winner -> String
addGameResultClass choice userChoice winner =
    if choice == userChoice then
        case winner of
            User ->
                "winner-choice"

            Computer ->
                "loser-choice"

            Tie ->
                "tie-choice"

    else
        ""
