module Msgs exposing (..)

import Models exposing (AllSquares, Square)


type Msg
    = NoOp
    | ClickBox Square
    | RandomizeSquares AllSquares
    | CloseSquares
    | RestartGame



-- | CheckSuccess
