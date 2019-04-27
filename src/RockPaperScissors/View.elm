module RockPaperScissors.View exposing (view)

{-| This module contains the main view component of the page.


# Definition

@docs view

-}

import Html exposing (Html, div, h5, hr, img, p, span, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import RockPaperScissors.Types exposing (Choice(..), Model, Msg(..))
import RockPaperScissors.Utils exposing (gameWinnerMessage)


{-| Main app view element
-}
view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header model
        , scoreboard model
        , choices model
        ]


{-| Page header
-}
header : Model -> Html Msg
header model =
    div [ class "row p-5" ]
        [ div [ class "col text-center" ]
            [ hr [ class "hr-line-1" ] []
            , span [ class "title-1" ] [ text "Rock Paper Scissors" ]
            , hr [ class "hr-line-1" ] []
            ]
        ]


{-| RockPaperScissors scoreboard
-}
scoreboard : Model -> Html Msg
scoreboard model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ div [ class "row justify-content-center" ]
                [ div [ class "col-auto col-md-4 rock-paper-scissors__scoreboard" ]
                    [ div [ class "row  border-bottom" ]
                        [ div [ class "col-auto rock-paper-scissors__scoreboard-computer-color" ]
                            []
                        , div [ class "col-8 text-center" ]
                            [ span [ class "rock-paper-scissors__scoreboard-text" ] [ text "Computer" ] ]
                        , div [ class "col-auto border-left" ]
                            [ span
                                [ class
                                    ("rock-paper-scissors__scoreboard-text "
                                        ++ (if model.computerScore > model.userScore then
                                                "rock-paper-scissors__scoreboard-winner"

                                            else
                                                ""
                                           )
                                    )
                                ]
                                [ text (Basics.toString model.computerScore) ]
                            ]
                        ]
                    , div [ class "row  border-top" ]
                        [ div [ class "col-auto rock-paper-scissors__scoreboard-user-color" ]
                            []
                        , div [ class "col-8 text-center" ]
                            [ span [ class "rock-paper-scissors__scoreboard-text" ] [ text "User" ] ]
                        , div [ class "col-auto border-left" ]
                            [ span
                                [ class
                                    ("rock-paper-scissors__scoreboard-text "
                                        ++ (if model.userScore > model.computerScore then
                                                "rock-paper-scissors__scoreboard-winner"

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
            , div [ class "row justify-content-center p-5" ]
                [ div [ class "col-auto" ]
                    [ span [ class "rock-paper-scissors__scoreboard-winner-msg" ] [ text (gameWinnerMessage model.userChoice model.computerChoice) ] ]
                ]
            ]
        ]


{-| RockPaperScissors choices
-}
choices : Model -> Html Msg
choices model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ div
                [ class "row p-5" ]
                [ div [ class "col-4" ]
                    [ rock model ]
                , div [ class "col-4" ]
                    [ paper model ]
                , div [ class "col-4" ]
                    [ scissors model ]
                ]
            , div [ class "row justify-content-center" ]
                [ div [ class "col-auto" ]
                    [ span [ class "abstract" ] [ text "Make your move!" ]
                    ]
                ]
            ]
        ]


{-| Rock option
-}
rock : Model -> Html Msg
rock model =
    div
        [ class ""
        , onClick (UserChoice Rock)
        ]
        [ p [ class "text-white" ] [ text "Rock" ]
        ]


{-| Paper option
-}
paper : Model -> Html Msg
paper model =
    div
        [ class ""
        , onClick (UserChoice Paper)
        ]
        [ p [ class "text-white" ] [ text "Paper" ]
        ]


{-| Scissors option
-}
scissors : Model -> Html Msg
scissors model =
    div
        [ class ""
        , onClick (UserChoice Scissors)
        ]
        [ p [ class "text-white" ] [ text "Scissors" ]
        ]
