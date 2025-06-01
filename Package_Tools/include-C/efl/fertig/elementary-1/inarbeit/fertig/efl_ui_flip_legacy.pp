
unit efl_ui_flip_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_flip_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_flip_legacy.h
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
PElm_Flip  = ^Elm_Flip;
PElm_Flip_Direction  = ^Elm_Flip_Direction;
PElm_Flip_Interaction  = ^Elm_Flip_Interaction;
PElm_Flip_Mode  = ^Elm_Flip_Mode;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Flip = ^TElm_Flip;
  TElm_Flip = TEo;
{* Elm flip mode
 *
 * @ingroup Elm_Flip
  }
{*< Rotate Y center axis flip mode  }
{*< Rotate X center axis flip mode  }
{*< Rotate XZ center axis flip mode  }
{*< Rotate YZ center axis flip mode  }
{*< Cube left flip mode  }
{*< Cube right flip mode  }
{*< Cube up flip mode  }
{*< Cube down flip mode  }
{*< Page left flip mode  }
{*< Page right flip mode  }
{*< Page up flip mode  }
{*< Page down flip mode  }
{*< Cross fade flip mode  }

  PElm_Flip_Mode = ^TElm_Flip_Mode;
  TElm_Flip_Mode =  Longint;
  Const
    ELM_FLIP_ROTATE_Y_CENTER_AXIS = 0;
    ELM_FLIP_ROTATE_X_CENTER_AXIS = 1;
    ELM_FLIP_ROTATE_XZ_CENTER_AXIS = 2;
    ELM_FLIP_ROTATE_YZ_CENTER_AXIS = 3;
    ELM_FLIP_CUBE_LEFT = 4;
    ELM_FLIP_CUBE_RIGHT = 5;
    ELM_FLIP_CUBE_UP = 6;
    ELM_FLIP_CUBE_DOWN = 7;
    ELM_FLIP_PAGE_LEFT = 8;
    ELM_FLIP_PAGE_RIGHT = 9;
    ELM_FLIP_PAGE_UP = 10;
    ELM_FLIP_PAGE_DOWN = 11;
    ELM_FLIP_CROSS_FADE = 12;
;
{* Efl UI flip interaction
 *
 * @ingroup Efl_Ui
  }
{*< No interaction  }
{*< Rotate interaction  }
{*< Cube interaction  }
{*< Page interaction  }
type
  PElm_Flip_Interaction = ^TElm_Flip_Interaction;
  TElm_Flip_Interaction =  Longint;
  Const
    ELM_FLIP_INTERACTION_NONE = 0;
    ELM_FLIP_INTERACTION_ROTATE = 1;
    ELM_FLIP_INTERACTION_CUBE = 2;
    ELM_FLIP_INTERACTION_PAGE = 3;
;
{* Allows interaction with the top of the widget
                               }
{* Allows interaction with the bottom of the widget
                             }
{* Allows interaction with the left portion of the
                            * widget  }
{* Allows interaction with the right portion of the
                            * widget  }
type
  PElm_Flip_Direction = ^TElm_Flip_Direction;
  TElm_Flip_Direction =  Longint;
  Const
    ELM_FLIP_DIRECTION_UP = 0;
    ELM_FLIP_DIRECTION_DOWN = 1;
    ELM_FLIP_DIRECTION_LEFT = 2;
    ELM_FLIP_DIRECTION_RIGHT = 3;
;
{*
 * @brief Set the amount of the flip that is sensitive to interactive flip.
 *
 * Set the amount of the flip that is sensitive to interactive flip, with 0
 * representing no area in the flip and 1 representing the entire flip. There
 * is however a consideration to be made in that the area will never be smaller
 * than the finger size set (as set in your Elementary configuration), and
 * dragging must always start from the opposite half of the flip (eg. right
 * half of the flip when dragging to the left).
 *
 * @note The @c dir parameter is not actually related to the direction of the
 * drag, it only refers to the area in the flip where interaction can occur
 * (top, bottom, left, right).
 *
 * Negative values of @c hitsize will disable this hit area.
 *
 * See also @ref elm_flip_interaction_set.
 *
 * @param[in] hitsize The amount of that dimension (0.0 to 1.0) to use.
 *
 * @ingroup Elm_Flip
  }

procedure elm_flip_interaction_direction_hitsize_set(obj:PElm_Flip; dir:TElm_Flip_Direction; hitsize:Tdouble);cdecl;external;
{*
 * @brief Get the amount of the flip that is sensitive to interactive flip.
 *
 * @param[in] dir The direction to check.
 *
 * @return The size set for that direction.
 *
 * @ingroup Elm_Flip
  }
function elm_flip_interaction_direction_hitsize_get(obj:PElm_Flip; dir:TElm_Flip_Direction):Tdouble;cdecl;external;
{*
 * @brief Set which directions of the flip respond to interactive flip
 *
 * By default all directions are disabled, so you may want to enable the
 * desired directions for flipping if you need interactive flipping. You must
 * call this function once for each direction that should be enabled.
 *
 * You can also set the appropriate hit area size by calling
 * @ref efl_ui_flip_interaction_direction_hitsize_set. By default, a minimum
 * hit area will be created on the opposite edge of the flip.
 *
 * @param[in] enabled If that direction is enabled or not.
 *
 * @ingroup Elm_Flip
  }
procedure elm_flip_interaction_direction_enabled_set(obj:PElm_Flip; dir:TElm_Flip_Direction; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Get the enabled state of that flip direction.
 *
 * @param[in] dir The direction to check.
 *
 * @return If that direction is enabled or not.
 *
 * @ingroup Elm_Flip
  }
function elm_flip_interaction_direction_enabled_get(obj:PElm_Flip; dir:TElm_Flip_Direction):TEina_Bool;cdecl;external;
{*
 * @brief Add a new flip to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Flip
  }
function elm_flip_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set flip perspective
 *
 * @param obj The flip object
 * @param foc The coordinate to set the focus on
 * @param x The X coordinate
 * @param y The Y coordinate
 *
 * @warning This function currently does nothing.
 *
 * @ingroup Elm_Flip
  }
procedure elm_flip_perspective_set(obj:PEvas_Object; foc:TEvas_Coord; x:TEvas_Coord; y:TEvas_Coord);cdecl;external;
{$include "efl_ui_flip_eo.legacy.h"}

implementation


end.
