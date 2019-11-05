module Slides.Slide4 exposing (slide)

import Element
import Element.Font as Font
import Layout
import Style


n baseSize =
    Element.row
        [ Style.spacing baseSize ]
        [ Layout.sym "n"
        , Layout.lit "="
        , Layout.lit "2"
        ]


increment baseSize =
    Element.row
        [ Style.spacing baseSize ]
        [ Layout.fn baseSize "f" "x"
        , Layout.lit "="
        , Layout.sym "x"
        , Layout.lit "+"
        , Layout.lit "1"
        ]


application baseSize =
    Layout.fn baseSize "f" "n"



slide ({ height, width } as viewport) =
    let
        baseSize =
            round (toFloat height / 13.5)

        letAssignments =
            Element.column
                [ Element.spacing (baseSize // 2)
                , Style.nested baseSize
                ]
                [ n baseSize, increment baseSize ]

        letBody =
            Element.el
                [ Style.nested baseSize ]
                (application baseSize)

        letCombined =
            Element.column
                [ Element.spacing (baseSize // 2) ]
                [ Element.text "let"
                , letAssignments
                , Element.text "in"
                , letBody
                ]
    in
    Element.row
        [ Element.centerX
        , Element.centerY
        , Element.spacing baseSize
        , Font.size baseSize
        , Style.font_family
        ]
        [ letCombined
        , Element.text "⟼"
        , Element.text "3"
        ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
