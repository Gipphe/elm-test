import Char exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }

--- COMPONENTS

hr_comp : Html Msg
hr_comp =
  hr [] []

--- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

model : Model
model =
  Model "" "" ""

--- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    Password password ->
      { model | password = password }
    PasswordAgain password ->
      { model | passwordAgain = password }

--- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter password", onInput PasswordAgain ] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      let (anyUpper, isLongEnough, passwordsMatch) =
        ( String.any Char.isUpper model.password
        , String.length model.password > 8
        , model.password == model.passwordAgain
        )
      in
        if passwordsMatch
        && isLongEnough
        && anyUpper
        then
          ("green", "OK")
        else if not anyUpper then
          ("red", "Password needs to contain an upper case letter")
        else if not isLongEnough then
          ("red", "Password must be a minumum length of 9 characters")
        else
          ("red", "Passwords do not match!")
  in
    div [ style [("color", color)] ] [ text message ]
