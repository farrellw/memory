module View exposing (..)

import Html exposing (Html, div, i, program, span, table, td, text, tr)
import Html.Attributes exposing (attribute, class)
import Html.Events exposing (onClick)
import Models exposing (AllSquares, Model, Square)
import Msgs exposing (..)


view : Model -> Html Msg
view model =
    div
        [ class "game-table" ]
        (List.map
            squareIntoCell
            model.squares
        )


squareIntoCell : Square -> Html Msg
squareIntoCell square =
    let
        message =
            Msgs.ClickBox square

        classList =
            buildClassList square
    in
    div [ class classList, onClick message ]
        [ case square.state of
            Models.Closed ->
                text ""

            Models.Opened ->
                span [] [ text square.text ]

            Models.Matched ->
                span [] [ text square.text ]
        ]



-- Use Pattern Match (case / switch statement)


buildClassList : Square -> String
buildClassList square =
    let
        classList =
            if square.state == Models.Closed then
                "cell closed"
            else if square.state == Models.Opened then
                "cell flipped"
            else if square.state == Models.Matched then
                "cell matched"
            else
                "cell"
    in
    classList
