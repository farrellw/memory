module View exposing (..)

import Html exposing (Html, div, program, table, td, text, tr)
import Html.Attributes exposing (class)
import Msgs exposing (..)


type alias Model =
    String


view : Model -> Html Msg
view model =
    div
        [ class "game-table" ]
        [ table []
            [ tr []
                [ td [] [ text "A" ]
                , td [] [ text "B" ]
                , td [] [ text "C" ]
                , td [] [ text "D" ]
                ]
            , tr []
                [ td [] [ text "E" ]
                , td [] [ text "F" ]
                , td [] [ text "G" ]
                , td [] [ text "H" ]
                ]
            , tr []
                [ td [] [ text "I" ]
                , td [] [ text "J" ]
                , td [] [ text "K" ]
                , td [] [ text "L" ]
                ]
            , tr []
                [ td [] [ text "M" ]
                , td [] [ text "N" ]
                , td [] [ text "O" ]
                , td [] [ text "P" ]
                ]
            ]
        ]
