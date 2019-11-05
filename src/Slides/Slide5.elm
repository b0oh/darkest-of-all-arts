module Slides.Slide5 exposing (slide)

import Element
import Element.Font as Font
import Layout
import Style


slide ({ height, width } as viewport) =
    let
        baseSize =
            round (toFloat height / 13.5)

        parabola1 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.sym "y"
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                ]

        parabola2 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.fn baseSize "f" "x"
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                ]

        parabola3 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.fn baseSize "parabola" "x"
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                ]

        parabola4 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.sym "parabola"
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.arrow
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                ]
    in
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.spacing baseSize
        , Font.size baseSize
        , Style.font_family
        ]
        [ parabola1
        , parabola2
        , parabola3
        , parabola4
        ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
