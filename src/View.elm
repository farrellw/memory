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
        [ div [ class "row" ]
            (List.map
                squareRow
                model
            )
        ]


squareRow : Square -> Html Msg
squareRow square =
    let
        message =
            Msgs.ClickBox square

        classList =
            buildClassList square
    in
    div [ class "cell", onClick message ]
        [ Html.i [ class "fa fa-check-circle" ] []
        , span [ class classList ] [ text square.text ]
        ]


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
                ""
    in
    classList
