module Layout exposing (..)

import Element
import Element.Font as Font
import Style


spaceRight space el =
    Element.el
        [ Element.paddingEach
              { top = 0
              , right = space
              , bottom = 0
              , left = 0
              }
        ]
        el


lit str =
    Element.text str


sym str =
    Element.el [ Font.italic ] (Element.text str)


fn baseSize name arg =
    Element.row
        []
        [ spaceRight (baseSize // 4) <| sym name
        , lit "("
        , spaceRight (baseSize // 16) <| sym arg
        , lit ")"
        ]


def baseSize name args =
    let
        elements =
            args
                |> List.map sym
                |> List.intersperse (lit ", ")
    in
    [ spaceRight (baseSize // 4) <| sym name
    , lit "("
    ] ++ elements ++
    [ lit ")"
    ]
        |> Element.row
            []


tuple elements =
    [ lit "("
    ] ++ List.intersperse (lit ", ") elements ++
    [ lit ")"
    ]
        |> Element.row
            []


arrow =
    lit "→"


reduce =
    lit "⟼"


apply baseSize abs args =
    let
        args_ =
            List.intersperse (lit ",") args
                |> Element.row [ Style.spacing baseSize ]
    in
    Element.row
        []
        [ spaceRight (baseSize // 4) <| abs
        , lit "("
        , spaceRight (baseSize // 16) <| args_
        , lit ")"
        ]
