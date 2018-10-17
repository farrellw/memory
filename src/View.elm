module View exposing (..)

import Html exposing (Html, div, program, span, table, td, text, tr)
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
    span [ class classList, onClick message ] [ text square.text ]


buildClassList : Square -> String
buildClassList square =
    let
        classList =
            if square.clicked == True then
                "flipped"
            else
                ""
                    ++ (if square.matched == True then
                            "matched"
                        else
                            ""
                       )
    in
    classList
