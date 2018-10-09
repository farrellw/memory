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
        [ div []
            [ div []
                [ div []
                    [ text "A" ]
                , div []
                    [ text "B" ]
                , div []
                    [ text "C" ]
                , div []
                    [ text "D" ]
                ]
            , div []
                [ div []
                    [ text "B" ]
                , div []
                    [ text "C" ]
                , div []
                    [ text "D" ]
                , div []
                    [ text "E" ]
                ]
            , div []
                [ div []
                    [ text "F" ]
                , div []
                    [ text "G" ]
                , div []
                    [ text "H" ]
                , div []
                    [ text "I" ]
                ]
            , div []
                [ div []
                    [ text "J" ]
                , div []
                    [ text "K" ]
                , div []
                    [ text "L" ]
                , div []
                    [ text "M" ]
                ]
            ]
        ]
