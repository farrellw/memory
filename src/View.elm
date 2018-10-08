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
                [ text "A"
                ]
            ]
        ]
