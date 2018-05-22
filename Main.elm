import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Html.beginnerProgram
    { init = init
    , view = view
    , update = update
    }

type alias Model =
  { topic : String
  , gifUrl : String
  }

init : (Model, Cmd Msg)
init =
  (Model "cats" "waiting.gif", Cmd.none)

type Msg = MorePlease

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlease ->
      (model, Cmd.none)

view : Model -> Html Msg
view model =
  div []
    [ h2 [] [ text model.topic ]
    , img [ src model.gifUrl ] []
    , button [ onClick MorePlease ] [ text "More please!" ]
    ]
