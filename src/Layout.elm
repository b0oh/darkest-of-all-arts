module Layout exposing (..)

import Element
import Element.Font as Font


space_right space el =
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


fn base_size name arg =
    Element.row
        []
        [ space_right (base_size // 4) <| sym name
        , lit "("
        , space_right (base_size // 16) <| sym arg
        , lit ")"
        ]
