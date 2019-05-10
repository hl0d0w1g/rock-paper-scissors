module RockPaperScissors.View exposing (view)

{-| This module contains the main view component of the page.


# Definition

@docs view

-}

import Html exposing (Html, div, h5, hr, i, img, p, span, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import RockPaperScissors.Types exposing (Choice(..), Model, Msg(..))
import RockPaperScissors.Utils exposing (addGameResultClass, gameWinnerMessage)


{-| Main app view element
-}
view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header model
        , scoreboard model
        , computerMsg model
        , winnerMsg model
        , choices model
        ]


{-| Page header
-}
header : Model -> Html Msg
header model =
    div [ class "row p-5" ]
        [ div [ class "col text-center" ]
            [ hr [ class "hr-line" ] []
            , span [ class "title-1" ] [ text "Rock Paper Scissors" ]
            , hr [ class "hr-line" ] []
            ]
        ]


{-| RockPaperScissors scoreboard
-}
scoreboard : Model -> Html Msg
scoreboard model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ div [ class "row justify-content-center" ]
                [ div [ class "col-auto col-md-4 scoreboard" ]
                    [ div [ class "row  border-bottom" ]
                        [ div [ class "col-8 text-center" ]
                            [ span [ class "scoreboard-text" ] [ text "Computer" ] ]
                        , div [ class "col-auto border-left" ]
                            [ span
                                [ class
                                    ("scoreboard-text "
                                        ++ (if model.computerScore > model.userScore then
                                                "scoreboard-winner"

                                            else
                                                ""
                                           )
                                    )
                                ]
                                [ text (Basics.toString model.computerScore) ]
                            ]
                        ]
                    , div [ class "row  border-top" ]
                        [ div [ class "col-8 text-center" ]
                            [ span [ class "scoreboard-text" ] [ text "User" ] ]
                        , div [ class "col-auto border-left" ]
                            [ span
                                [ class
                                    ("scoreboard-text "
                                        ++ (if model.userScore > model.computerScore then
                                                "scoreboard-winner"

                                            else
                                                ""
                                           )
                                    )
                                ]
                                [ text (Basics.toString model.userScore) ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


{-| Renders the computer choice
-}
computerMsg : Model -> Html Msg
computerMsg model =
    if model.computerChoice /= NoChoice then
        div [ class "row justify-content-center pt-5 pb-2" ]
            [ div [ class "col-auto" ]
                [ span [ class "computer-msg" ] [ text "Computer says" ] ]
            , div [ class "col-auto" ]
                [ case model.computerChoice of
                    Rock ->
                        i [ class "fas fa-hand-rock computer-choice" ] []

                    Paper ->
                        i [ class "fas fa-hand-paper computer-choice" ] []

                    Scissors ->
                        i [ class "fas fa-hand-scissors computer-choice" ] []

                    NoChoice ->
                        i [] []
                ]
            ]

    else
        div [] []


{-| Renders the winner message
-}
winnerMsg : Model -> Html Msg
winnerMsg model =
    div [ class "row justify-content-center p-3" ]
        [ div [ class "col-auto" ]
            [ span [ class "winner-msg" ] [ text (gameWinnerMessage model.userChoice model.computerChoice) ] ]
        ]


{-| RockPaperScissors choices
-}
choices : Model -> Html Msg
choices model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ div
                [ class "row p-5" ]
                [ div [ class "col-4 text-center" ]
                    [ rock model ]
                , div [ class "col-4 text-center" ]
                    [ paper model ]
                , div [ class "col-4 text-center" ]
                    [ scissors model ]
                ]
            , div [ class "row justify-content-center" ]
                [ div [ class "col-auto" ]
                    [ span [ class "title-2" ] [ text "Make your move!" ]
                    ]
                ]
            ]
        ]


{-| Rock option
-}
rock : Model -> Html Msg
rock model =
    div
        [ onClick (UserChoice Rock) ]
        [ i [ class ("fas fa-hand-rock user-choice " ++ addGameResultClass Rock model.userChoice model.winner) ] [] ]


{-| Paper option
-}
paper : Model -> Html Msg
paper model =
    div
        [ onClick (UserChoice Paper) ]
        [ i [ class ("fas fa-hand-paper user-choice " ++ addGameResultClass Paper model.userChoice model.winner) ] [] ]


{-| Scissors option
-}
scissors : Model -> Html Msg
scissors model =
    div
        [ onClick (UserChoice Scissors) ]
        [ i [ class ("fas fa-hand-scissors user-choice " ++ addGameResultClass Scissors model.userChoice model.winner) ] [] ]
