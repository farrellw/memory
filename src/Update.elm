module Update exposing (..)

import Models exposing (Model, Square)
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.ClickBox square ->
            ( mapSquares model square.id, Cmd.none )


mapSquares : List Square -> Int -> List Square
mapSquares squares id =
    let
        updatedSquares =
            List.map (\square -> updateSquare square id) squares
    in
    updatedSquares


updateSquare : Square -> Int -> Square
updateSquare square id =
    if square.id == id then
        { square | clicked = True }
    else
        square
