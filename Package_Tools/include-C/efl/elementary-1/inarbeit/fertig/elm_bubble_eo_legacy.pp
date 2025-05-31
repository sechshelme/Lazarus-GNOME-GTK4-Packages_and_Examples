
unit elm_bubble_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_bubble_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_bubble_eo_legacy.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PElm_Bubble  = ^Elm_Bubble;
PElm_Bubble_Pos  = ^Elm_Bubble_Pos;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_BUBBLE_EO_LEGACY_H_}
{$define _ELM_BUBBLE_EO_LEGACY_H_}
{$ifndef _ELM_BUBBLE_EO_CLASS_TYPE}
{$define _ELM_BUBBLE_EO_CLASS_TYPE}
type
  PElm_Bubble = ^TElm_Bubble;
  TElm_Bubble = TEo;
{$endif}
{$ifndef _ELM_BUBBLE_EO_TYPES}
{$define _ELM_BUBBLE_EO_TYPES}
{*
 * @brief Defines the corner values for a bubble.
 *
 * The corner will be used to determine where the arrow of the bubble points
 * to.
 *
 * @ingroup Elm_Bubble
  }
{ +1  }{*< Invalid corner.  }
{*< The arrow of the bubble points to the top left
                            * corner.  }
{*< The arrow of the bubble points to the top right
                             * corner.  }
{*< The arrow of the bubble points to the bottom
                               * left corner.  }
{*< The arrow of the bubble points to the bottom
                               * right corner.  }
type
  PElm_Bubble_Pos = ^TElm_Bubble_Pos;
  TElm_Bubble_Pos =  Longint;
  Const
    ELM_BUBBLE_POS_INVALID = -(1);
    ELM_BUBBLE_POS_TOP_LEFT = (-(1))+1;
    ELM_BUBBLE_POS_TOP_RIGHT = (-(1))+2;
    ELM_BUBBLE_POS_BOTTOM_LEFT = (-(1))+3;
    ELM_BUBBLE_POS_BOTTOM_RIGHT = (-(1))+4;
;
{$endif}
{*
 * @brief The corner of the bubble
 *
 * This function sets the corner of the bubble. The corner will be used to
 * determine where the arrow in the frame points to and where label, icon and
 * info are shown. See @ref Elm_Bubble_Pos
 *
 * @param[in] obj The object.
 * @param[in] pos The given corner for the bubble.
 *
 * @ingroup Elm_Bubble_Group
  }

procedure elm_bubble_pos_set(obj:PElm_Bubble; pos:TElm_Bubble_Pos);cdecl;external;
{*
 * @brief The corner of the bubble
 *
 * This function sets the corner of the bubble. The corner will be used to
 * determine where the arrow in the frame points to and where label, icon and
 * info are shown. See @ref Elm_Bubble_Pos
 *
 * @param[in] obj The object.
 *
 * @return The given corner for the bubble.
 *
 * @ingroup Elm_Bubble_Group
  }
(* Const before type ignored *)
function elm_bubble_pos_get(obj:PElm_Bubble):TElm_Bubble_Pos;cdecl;external;
{$endif}

implementation


end.
