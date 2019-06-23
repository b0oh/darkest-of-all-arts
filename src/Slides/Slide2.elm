module Slides.Slide2 exposing (slide)

import Element
import Element.Font as Font
import Layout
import Style


line1 base_size =
    Element.row
        [ Style.spacing base_size ]
        [ Layout.sym "n"
        , Layout.lit "="
        , Layout.lit "2"
        ]


line2 base_size =
    Element.row
        [ Style.spacing base_size ]
        [ Layout.fn base_size "f" "x"
        , Layout.lit "="
        , Layout.sym "x"
        , Layout.lit "+"
        , Layout.lit "1"
        ]


line3 base_size =
    Layout.fn base_size "f" "n"


slide { height, width } =
    let
        base_size = round (toFloat height / 13.5)
    in
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.spacing (base_size // 2)
        , Font.size base_size
        , Style.font_family
        ]
        [ line1 base_size, line2 base_size, line3 base_size ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
