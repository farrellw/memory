module Models exposing (GameState(..), Model, Square, SquareState(..))


type alias Model =
    { squares : List Square
    , state : GameState
    , points : Int
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
