module Update exposing (..)

import Models exposing (Model, Square)
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.ClickBox square ->
            ( updateIsClicked square.id model
            , Cmd.none
            )



-- Msg.CheckSuccess ->
--     ( updateIsClicked model, Cmd.none )
-- filterOnlyClicked : List Square -> List Square
-- filterOnlyClicked =
--     isMatch
-- updateSuccess : Model -> List Square -> Model
-- updateSuccess model squares =
--     model


updateIsClicked : Int -> List Square -> List Square
updateIsClicked id squares =
    let
        updatedSquares =
            List.map (\square -> updateSquare square id) squares
    in
    updatedSquares


updateSquare : Square -> Int -> Square
updateSquare square id =
    if square.id == id then
        { square | state = Models.Opened }
    else
        square


haveMatch : List Square -> Bool
haveMatch squares =
    case squares of
        a :: b :: [] ->
            a.text == b.text

        _ ->
            False
