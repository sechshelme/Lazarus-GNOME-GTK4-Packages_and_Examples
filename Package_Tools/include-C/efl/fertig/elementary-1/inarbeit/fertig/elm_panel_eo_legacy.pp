
unit elm_panel_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_panel_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_panel_eo_legacy.h
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
PElm_Panel  = ^Elm_Panel;
PElm_Panel_Orient  = ^Elm_Panel_Orient;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PANEL_EO_LEGACY_H_}
{$define _ELM_PANEL_EO_LEGACY_H_}
{$ifndef _ELM_PANEL_EO_CLASS_TYPE}
{$define _ELM_PANEL_EO_CLASS_TYPE}
type
  PElm_Panel = ^TElm_Panel;
  TElm_Panel = TEo;
{$endif}
{$ifndef _ELM_PANEL_EO_TYPES}
{$define _ELM_PANEL_EO_TYPES}
{* Panel orientation mode
 *
 * @ingroup Elm_Panel_Group
  }
{*< Panel (dis)appears from the top  }
{*< Panel (dis)appears from the bottom  }
{*< Panel (dis)appears from the left  }
{*< Panel (dis)appears from the right  }
type
  PElm_Panel_Orient = ^TElm_Panel_Orient;
  TElm_Panel_Orient =  Longint;
  Const
    ELM_PANEL_ORIENT_TOP = 0;
    ELM_PANEL_ORIENT_BOTTOM = 1;
    ELM_PANEL_ORIENT_LEFT = 2;
    ELM_PANEL_ORIENT_RIGHT = 3;
;
{$endif}
{*
 * @brief Set the orientation of the panel
 *
 * Set from where the panel will (dis)appear.
 *
 * @param[in] obj The object.
 * @param[in] orient The panel orientation.
 *
 * @ingroup Elm_Panel_Group
  }

procedure elm_panel_orient_set(obj:PElm_Panel; orient:TElm_Panel_Orient);cdecl;external;
{*
 * @brief Get the orientation of the panel.
 *
 * @param[in] obj The object.
 *
 * @return The panel orientation.
 *
 * @ingroup Elm_Panel_Group
  }
(* Const before type ignored *)
function elm_panel_orient_get(obj:PElm_Panel):TElm_Panel_Orient;cdecl;external;
{*
 * @brief Set the state of the panel.
 *
 * @param[in] obj The object.
 * @param[in] hidden If @c true, the panel will run the animation to disappear.
 *
 * @ingroup Elm_Panel_Group
  }
procedure elm_panel_hidden_set(obj:PElm_Panel; hidden:TEina_Bool);cdecl;external;
{*
 * @brief Get the state of the panel.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the panel will run the animation to disappear.
 *
 * @ingroup Elm_Panel_Group
  }
(* Const before type ignored *)
function elm_panel_hidden_get(obj:PElm_Panel):TEina_Bool;cdecl;external;
{*
 * @brief Set the scrollability of the panel.
 *
 * @param[in] obj The object.
 * @param[in] scrollable The scrollable state.
 *
 * @ingroup Elm_Panel_Group
  }
procedure elm_panel_scrollable_set(obj:PElm_Panel; scrollable:TEina_Bool);cdecl;external;
{*
 * @brief Get the state of the scrollability.
 *
 * @param[in] obj The object.
 *
 * @return The scrollable state.
 *
 * @since 1.12
 *
 * @ingroup Elm_Panel_Group
  }
(* Const before type ignored *)
function elm_panel_scrollable_get(obj:PElm_Panel):TEina_Bool;cdecl;external;
{*
 * @brief Set the size of the scrollable panel.
 *
 * @param[in] obj The object.
 * @param[in] ratio Size ratio
 *
 * @ingroup Elm_Panel_Group
  }
procedure elm_panel_scrollable_content_size_set(obj:PElm_Panel; ratio:Tdouble);cdecl;external;
{*
 * @brief Get the size of the scrollable panel.
 *
 * @param[in] obj The object.
 *
 * @return Size ratio
 *
 * @since 1.19
 *
 * @ingroup Elm_Panel_Group
  }
(* Const before type ignored *)
function elm_panel_scrollable_content_size_get(obj:PElm_Panel):Tdouble;cdecl;external;
{* Toggle the hidden state of the panel from code
 *
 * @ingroup Elm_Panel_Group
  }
procedure elm_panel_toggle(obj:PElm_Panel);cdecl;external;
{$endif}

implementation


end.
