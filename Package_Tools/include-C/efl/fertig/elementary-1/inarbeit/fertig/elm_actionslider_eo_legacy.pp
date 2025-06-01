
unit elm_actionslider_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_actionslider_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_actionslider_eo_legacy.h
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
Pchar  = ^char;
PElm_Actionslider  = ^Elm_Actionslider;
PElm_Actionslider_Pos  = ^Elm_Actionslider_Pos;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_ACTIONSLIDER_EO_LEGACY_H_}
{$define _ELM_ACTIONSLIDER_EO_LEGACY_H_}
{$ifndef _ELM_ACTIONSLIDER_EO_CLASS_TYPE}
{$define _ELM_ACTIONSLIDER_EO_CLASS_TYPE}
type
  PElm_Actionslider = ^TElm_Actionslider;
  TElm_Actionslider = TEo;
{$endif}
{$ifndef _ELM_ACTIONSLIDER_EO_TYPES}
{$define _ELM_ACTIONSLIDER_EO_TYPES}
{* A position for indicators, magnets, and enabled items.
 *
 * @ingroup Elm_Actionslider
  }
{*< No position is set.  }
{ 1 >> 0  }{*< Left position.  }
{ 1 >> 1  }{*< Center position.  }
{ 1 >> 2  }{*< Right position.  }
{ (1 >> 3) * 1  }{*< All positions for
                                               * left/center/right.  }
type
  PElm_Actionslider_Pos = ^TElm_Actionslider_Pos;
  TElm_Actionslider_Pos =  Longint;
  Const
    ELM_ACTIONSLIDER_NONE = 0;
    ELM_ACTIONSLIDER_LEFT = 1;
    ELM_ACTIONSLIDER_CENTER = 2;
    ELM_ACTIONSLIDER_RIGHT = 4;
    ELM_ACTIONSLIDER_ALL = 7;
;
{$endif}
{*
 * @brief Actionslider position indicator
 *
 * @param[in] obj The object.
 * @param[in] pos The position of the indicator.
 *
 * @ingroup Elm_Actionslider_Group
  }

procedure elm_actionslider_indicator_pos_set(obj:PElm_Actionslider; pos:TElm_Actionslider_Pos);cdecl;external;
{*
 * @brief Actionslider position indicator
 *
 * @param[in] obj The object.
 *
 * @return The position of the indicator.
 *
 * @ingroup Elm_Actionslider_Group
  }
(* Const before type ignored *)
function elm_actionslider_indicator_pos_get(obj:PElm_Actionslider):TElm_Actionslider_Pos;cdecl;external;
{*
 * @brief Actionslider magnet position.
 *
 * To make multiple positions magnets OR them together (e.g.
 * ELM_ACTIONSLIDER_LEFT | ELM_ACTIONSLIDER_RIGHT)
 *
 * @param[in] obj The object.
 * @param[in] pos Bit mask indicating the magnet positions.
 *
 * @ingroup Elm_Actionslider_Group
  }
procedure elm_actionslider_magnet_pos_set(obj:PElm_Actionslider; pos:TElm_Actionslider_Pos);cdecl;external;
{*
 * @brief Actionslider magnet position.
 *
 * @param[in] obj The object.
 *
 * @return Bit mask indicating the magnet positions.
 *
 * @ingroup Elm_Actionslider_Group
  }
(* Const before type ignored *)
function elm_actionslider_magnet_pos_get(obj:PElm_Actionslider):TElm_Actionslider_Pos;cdecl;external;
{*
 * @brief Actionslider enabled position.
 *
 * To set multiple positions as enabled OR them together(e.g.
 * ELM_ACTIONSLIDER_LEFT | ELM_ACTIONSLIDER_RIGHT).
 *
 * @note All the positions are enabled by default.
 *
 * @param[in] obj The object.
 * @param[in] pos Bit mask indicating the enabled positions.
 *
 * @ingroup Elm_Actionslider_Group
  }
procedure elm_actionslider_enabled_pos_set(obj:PElm_Actionslider; pos:TElm_Actionslider_Pos);cdecl;external;
{*
 * @brief Actionslider enabled position.
 *
 * @param[in] obj The object.
 *
 * @return Bit mask indicating the enabled positions.
 *
 * @ingroup Elm_Actionslider_Group
  }
(* Const before type ignored *)
function elm_actionslider_enabled_pos_get(obj:PElm_Actionslider):TElm_Actionslider_Pos;cdecl;external;
{*
 * @brief Get actionslider selected label.
 *
 * @param[in] obj The object.
 *
 * @return Selected label
 *
 * @ingroup Elm_Actionslider_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_actionslider_selected_label_get(obj:PElm_Actionslider):Pchar;cdecl;external;
{$endif}

implementation


end.
