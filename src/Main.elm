module Main exposing (main)

import Array
import Browser
import Browser.Events as Events
import Browser.Navigation as Nav
import Json.Decode as Decode
import Element exposing (Element)
import Element.Font as Font
import Html exposing (Html)
import Html.Events.Extra.Touch as Touch
import Slides.Slide1 as Slide2
import Style
import Url exposing (Url)


type alias Viewport =
    { height : Int
    , width : Int
    }


type alias State =
    { nav_key : Nav.Key
    , slide_no : Int
    , viewport : Viewport
    }


type Message
    = Idle
    | NextSlide
    | PrevSlide
    | SetUrl Url
    | ViewportChange Viewport


slide1 _ =
    let
        size = 64
    in
    Element.text "Universal Language"
        |> Element.el
           [ Element.centerX
           , Element.centerY
           , Font.size size
           , Style.font_family
           ]


slides =
    [ slide1
    , Slide2.slide
    ]


slides_quantity =
    List.length slides


slide_no_from_url url =
    let
        fragment =
            url.fragment
                |> Maybe.andThen String.toInt
                |> Maybe.withDefault 1
    in
    if fragment < 1 then
        1

    else if fragment > slides_quantity then
        slides_quantity

    else
        fragment


flags_decoder : Decode.Decoder Viewport
flags_decoder =
    Decode.map2
        Viewport
        (Decode.field "height" Decode.int)
        (Decode.field "width" Decode.int)


init : Decode.Value -> Url -> Nav.Key -> ( State, Cmd Message )
init flags url nav =
    let
        slide_no =
            slide_no_from_url url

        viewport =
            Decode.decodeValue flags_decoder flags
                |> Result.withDefault { height = 240, width = 320 }
    in
    ( { nav_key = nav
      , slide_no = slide_no
      , viewport = viewport
      }
    , Cmd.none
    )


key_decoder : Decode.Decoder String
key_decoder =
    Decode.field "key" Decode.string


key_to_message key =
    case key of
        "ArrowRight" ->
            NextSlide

        " " ->
            NextSlide

        "ArrowLeft" ->
            PrevSlide

        "Backspace" ->
            PrevSlide

        _ ->
            Idle


set_slide slide_no state =
    ( { state | slide_no = slide_no }
    , Nav.pushUrl state.nav_key <| "#" ++ String.fromInt slide_no
    )


update : Message -> State -> ( State, Cmd Message )
update message ({ slide_no } as state) =
    case message of
        Idle ->
            ( state, Cmd.none )

        NextSlide ->
            let
                new_slide_no =
                    if slide_no + 1 > slides_quantity then
                        slide_no

                    else
                        slide_no + 1
            in
            set_slide new_slide_no state

        PrevSlide ->
            let
                new_slide_no =
                    if slide_no < 2 then
                        slide_no

                    else
                        slide_no - 1
            in
            set_slide new_slide_no state

        SetUrl url ->
            let
                new_slide_no =
                    slide_no_from_url url
            in
            ( { state | slide_no = new_slide_no }
            , Cmd.none
            )

        ViewportChange viewport ->
            ( { state | viewport = viewport }
            , Cmd.none
            )


subscriptions : State -> Sub Message
subscriptions state =
    let
        on_resize =
            Events.onResize <|
                \width height ->
                    ViewportChange { height = height, width = width }

        on_key_down =
            Decode.map key_to_message key_decoder
                |> Events.onKeyDown
    in
    Sub.batch [ on_resize, on_key_down ]


render : State -> Element Message
render state =
    let
        maybe_slide =
            Array.fromList slides
                |> Array.get (state.slide_no - 1)
    in
    case maybe_slide of
        Just slide ->
            slide state.viewport

        _ ->
            Element.none


view : State -> Browser.Document Message
view state =
    let
        html =
            render state
                |> Element.layout [ Element.htmlAttribute (Touch.onStart (\_ -> NextSlide)) ]
    in
    { title = "The Darkest of All Arts"
    , body = [ html ]
    }


main : Program Decode.Value State Message
main =
    Browser.application
        { init = init
        , onUrlChange = SetUrl
        , onUrlRequest = always Idle
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
