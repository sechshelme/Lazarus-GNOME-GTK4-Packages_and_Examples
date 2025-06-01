
unit efl_ui_selectable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_selectable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_selectable_eo.h
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
PEfl_Ui_Selectable  = ^Efl_Ui_Selectable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SELECTABLE_EO_H_}
{$define _EFL_UI_SELECTABLE_EO_H_}
{$ifndef _EFL_UI_SELECTABLE_EO_CLASS_TYPE}
{$define _EFL_UI_SELECTABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Selectable = ^TEfl_Ui_Selectable;
  TEfl_Ui_Selectable = TEo;
{$endif}
{$ifndef _EFL_UI_SELECTABLE_EO_TYPES}
{$define _EFL_UI_SELECTABLE_EO_TYPES}
{$endif}
{*
 * @brief Selectable interface for UI objects
 *
 * An object implementing this interface can be selected. When the selected
 * property of this object changes, the @[Efl.Ui.Selectable.selected,changed]
 * event is emitted.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_SELECTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_selectable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The selected state of this object
 *
 * A change to this property emits the changed event.
 *
 * @param[in] obj The object.
 * @param[in] selected The selected state of this object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Selectable
  }
procedure efl_ui_selectable_selected_set(obj:PEo; selected:TEina_Bool);cdecl;external;
{*
 * @brief The selected state of this object
 *
 * A change to this property emits the changed event.
 *
 * @param[in] obj The object.
 *
 * @return The selected state of this object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Selectable
  }
(* Const before type ignored *)
function efl_ui_selectable_selected_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SELECTED_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the selected state has changed.
 * @return Eina_Bool
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SELECTED_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SELECTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_SELECTABLE_INTERFACE:=efl_ui_selectable_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SELECTED_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SELECTED_CHANGED:=@(_EFL_UI_EVENT_SELECTED_CHANGED);
  end;


end.
