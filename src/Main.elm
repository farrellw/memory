module Main exposing (..)

-- Try Map First
-- Try A dictionary next

import Html exposing (program)
import Models exposing (AllSquares, Model, Square)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)


-- Initial Model


initialModel : Model
initialModel =
    [ { state = Models.Closed
      , text = "A"
      , id = 1
      }
    , { state = Models.Closed
      , text = "B"
      , id = 2
      }
    , { state = Models.Closed
      , text = "A"
      , id = 3
      }
    , { state = Models.Closed
      , text = "B"
      , id = 4
      }
    , { state = Models.Closed
      , text = "C"
      , id = 5
      }
    , { state = Models.Closed
      , text = "C"
      , id = 6
      }
    , { state = Models.Closed
      , text = "D"
      , id = 7
      }
    , { state = Models.Closed
      , text = "D"
      , id = 8
      }
    ]


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
