module Models exposing (..)


type alias Model =
    { squares : List Square
    , state : GameState
    }


type GameState
    = Frozen
    | Clickable
    | GameOver


type SquareState
    = Closed
    | Opened
    | Matched


type alias Square =
    { state : SquareState
    , text : String
    , id : Int
    }
