module RockPaperScissors.Types exposing
    ( Model
    , Msg(..)
    , Choice(..)
    , Winner(..)
    )

{-| This module contains the types used all over the page.


# Basic Types

@docs Model
@docs Msg


# Secondary Types

@docs Choice
@docs Winner

-}


{-| Defines the messages used.
-}
type Msg
    = UserChoice Choice
    | ComputerChoice Int
    | UpdateScore


{-| Holds the Model of the page.
-}
type alias Model =
    { userChoice : Choice
    , computerChoice : Choice
    , userScore : Int
    , computerScore : Int
    , userWins : Bool
    , computerWins : Bool
    , winner : Winner
    }


{-| Defines the posibilities of the game.
-}
type Choice
    = NoChoice
    | Rock
    | Paper
    | Scissors


{-| Defines the winner of the each game.
-}
type Winner
    = Tie
    | Computer
    | User
