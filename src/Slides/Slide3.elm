module Slides.Slide3 exposing (slide)

import Element
import Element.Font as Font
import Slides.Slide2 as Slide2
import Style

slide ({ height, width } as viewport) =
    let
        base_size =
            round (toFloat height / 12)

        inner_slide =
            Slide2.slide viewport
    in
    Element.row
        [ Element.centerX
        , Element.centerY
        , Element.spacing base_size
        , Font.size base_size
        , Style.font_family
        ]
        [ inner_slide
        , Element.text "⟼"
        , Element.text "3"
        ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
