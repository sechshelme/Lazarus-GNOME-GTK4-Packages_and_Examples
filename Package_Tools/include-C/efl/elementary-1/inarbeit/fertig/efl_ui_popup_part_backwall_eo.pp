
unit efl_ui_popup_part_backwall_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_popup_part_backwall_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_popup_part_backwall_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Popup_Part_Backwall  = ^Efl_Ui_Popup_Part_Backwall;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_POPUP_PART_BACKWALL_EO_H_}
{$define _EFL_UI_POPUP_PART_BACKWALL_EO_H_}
{$ifndef _EFL_UI_POPUP_PART_BACKWALL_EO_CLASS_TYPE}
{$define _EFL_UI_POPUP_PART_BACKWALL_EO_CLASS_TYPE}
type
  PEfl_Ui_Popup_Part_Backwall = ^TEfl_Ui_Popup_Part_Backwall;
  TEfl_Ui_Popup_Part_Backwall = TEo;
{$endif}
{$ifndef _EFL_UI_POPUP_PART_BACKWALL_EO_TYPES}
{$define _EFL_UI_POPUP_PART_BACKWALL_EO_TYPES}
{$endif}
{*
 * @brief A Popup backwall is the background object for an @ref Efl_Ui_Popup
 * widget. It can be returned from a given Popup widget by using the
 * @ref Efl_Part API to fetch the "backwall" part.
 *
 * This object provides functionality for determining the look and interaction
 * methods of a Popup's background.
 *
 * If a Popup should allow input events to reach the objects behind the Popup,
 * @ref efl_ui_popup_part_backwall_repeat_events_get can be enabled.
 *
 * To set an image to be used as a background for the Popup, the @ref Efl_File
 * API can be used directly on the backwall object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Popup_Part_Backwall
  }

{ was #define dname def_expr }
function EFL_UI_POPUP_PART_BACKWALL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_popup_part_backwall_class_get:PEfl_Class;cdecl;external;
{*
 * @brief If this property is set to @c true, input events will be able to
 * reach objects below the Popup. This allows for e.g., a click to activate a
 * widget below the Popup while the Popup is active.
 *
 * @param[in] obj The object.
 * @param[in] repeat Whether to repeat events to objects below the Popup. The
 * default is @c false.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Popup_Part_Backwall
  }
procedure efl_ui_popup_part_backwall_repeat_events_set(obj:PEo; _repeat:TEina_Bool);cdecl;external;
{*
 * @brief If this property is set to @c true, input events will be able to
 * reach objects below the Popup. This allows for e.g., a click to activate a
 * widget below the Popup while the Popup is active.
 *
 * @param[in] obj The object.
 *
 * @return Whether to repeat events to objects below the Popup. The default is
 * @c false.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Popup_Part_Backwall
  }
(* Const before type ignored *)
function efl_ui_popup_part_backwall_repeat_events_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_POPUP_PART_BACKWALL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_POPUP_PART_BACKWALL_CLASS:=efl_ui_popup_part_backwall_class_get;
  end;


end.
