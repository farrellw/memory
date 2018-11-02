module Update exposing (..)

import Models exposing (Model, Square)
import Msgs exposing (Msg)
import Process exposing (sleep)
import Random exposing (generate)
import Random.List exposing (shuffle)
import Task exposing (perform)
import Time exposing (Time, second)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updateFromModel (updateFromMessage msg model)


updateFromModel : ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
updateFromModel ( model, msg ) =
    ( model, msg )


updateFromMessage : Msg -> Model -> ( Model, Cmd Msg )
updateFromMessage msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.RestartGame ->
            ( model
            , restartGame (flipAllClosed model.squares)
            )

        Msgs.RandomizeSquares randomSquares ->
            ( { squares = randomSquares
              , state = model.state
              , points = model.points
              }
            , Cmd.none
            )

        Msgs.ClickBox square ->
            if model.state == Models.Clickable && squareIsClickable square then
                ( updateGameState
                    (incrementPoints
                        { model
                            | squares =
                                model.squares
                                    |> updateOpenedSquares square.id
                                    |> updateMatchedSquares
                        }
                    )
                , delay (second * 2) Msgs.CloseSquares
                )
            else
                ( model, Cmd.none )

        Msgs.CloseSquares ->
            ( updateGameState { model | squares = updateClosedSquares model.squares }
            , Cmd.none
            )


squareIsClickable : Square -> Bool
squareIsClickable square =
    square.state == Models.Closed


restartGame : List Square -> Cmd Msg
restartGame squares =
    generate Msgs.RandomizeSquares (shuffle squares)


incrementPoints : Model -> Model
incrementPoints model =
    { model | points = model.points + 1 }


delay : Time -> msg -> Cmd msg
delay time msg =
    sleep time
        |> perform (\_ -> msg)


updateOpenedSquares : Int -> List Square -> List Square
updateOpenedSquares id squares =
    let
        updatedSquares =
            List.map (\square -> openSelectedSquare square id) squares
    in
    updatedSquares


openSelectedSquare : Square -> Int -> Square
openSelectedSquare square id =
    if square.id == id && square.state == Models.Closed then
        { square | state = Models.Opened }
    else
        square


updateMatchedSquares : List Square -> List Square
updateMatchedSquares squares =
    if matchExists (filterOpened squares) then
        List.map
            (\square -> matchOpenedSquare square)
            squares
    else
        squares


matchOpenedSquare : Square -> Square
matchOpenedSquare square =
    if square.state == Models.Opened then
        { square | state = Models.Matched }
    else
        square


matchExists : List Square -> Bool
matchExists squares =
    case squares of
        a :: b :: [] ->
            a.text == b.text

        _ ->
            False


flipAllClosed : List Square -> List Square
flipAllClosed squares =
    List.map (\square -> closeSquare square) squares


closeSquare : Square -> Square
closeSquare square =
    { square | state = Models.Closed }


updateClosedSquares : List Square -> List Square
updateClosedSquares squares =
    if List.length (filterOpened squares) >= 2 then
        List.map (\square -> closeOpenedSquare square) squares
    else
        squares


closeOpenedSquare : Square -> Square
closeOpenedSquare square =
    if square.state == Models.Opened then
        closeSquare square
    else
        square


filterOpened : List Square -> List Square
filterOpened squares =
    List.filter (\square -> isOpened square) squares


isOpened : Square -> Bool
isOpened square =
    square.state == Models.Opened


updateGameState : Model -> Model
updateGameState model =
    if List.length (filterOpened model.squares) >= 2 then
        { model
            | state = Models.Frozen
        }
    else
        { model
            | state = Models.Clickable
        }
