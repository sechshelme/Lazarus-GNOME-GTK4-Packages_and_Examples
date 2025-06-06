
unit efl_ui_single_selectable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_single_selectable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_single_selectable_eo.h
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
PEfl_Ui_Single_Selectable  = ^Efl_Ui_Single_Selectable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SINGLE_SELECTABLE_EO_H_}
{$define _EFL_UI_SINGLE_SELECTABLE_EO_H_}
{$ifndef _EFL_UI_SINGLE_SELECTABLE_EO_CLASS_TYPE}
{$define _EFL_UI_SINGLE_SELECTABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Single_Selectable = ^TEfl_Ui_Single_Selectable;
  TEfl_Ui_Single_Selectable = TEo;
{$endif}
{$ifndef _EFL_UI_SINGLE_SELECTABLE_EO_TYPES}
{$define _EFL_UI_SINGLE_SELECTABLE_EO_TYPES}
{$endif}
{*
 * @brief Interface for getting access to a single selected item in the
 * implementor.
 *
 * The implementor is free to allow a specific number of selectables being
 * selected or not. This interface just covers always the latest selected
 * selectable.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_SINGLE_SELECTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_single_selectable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The selectable that was selected most recently.
 *
 * @param[in] obj The object.
 *
 * @return The latest selected item.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }
(* Const before type ignored *)
function efl_ui_selectable_last_selected_get(obj:PEo):PEfl_Ui_Selectable;cdecl;external;
{*
 * @brief A object that will be selected in case nothing is selected
 *
 * A object set to this property will be selected instead of no item being
 * selected. Which means, there will be always at least one element selected.
 * If this property is @c NULL, the state of "no item is selected" can be
 * reached.
 *
 * Setting this property as a result of selection events results in undefined
 * behavior.
 *
 * @param[in] obj The object.
 * @param[in] fallback
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }
procedure efl_ui_selectable_fallback_selection_set(obj:PEo; fallback:PEfl_Ui_Selectable);cdecl;external;
{*
 * @brief A object that will be selected in case nothing is selected
 *
 * A object set to this property will be selected instead of no item being
 * selected. Which means, there will be always at least one element selected.
 * If this property is @c NULL, the state of "no item is selected" can be
 * reached.
 *
 * Setting this property as a result of selection events results in undefined
 * behavior.
 *
 * @param[in] obj The object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }
(* Const before type ignored *)
function efl_ui_selectable_fallback_selection_get(obj:PEo):PEfl_Ui_Selectable;cdecl;external;
{*
 * @brief This controlls if a selected item can be deselected due to clicking
 *
 * @param[in] obj The object.
 * @param[in] allow_manual_deselection @c true if clicking while selected
 * results in a state change to unselected
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }
procedure efl_ui_selectable_allow_manual_deselection_set(obj:PEo; allow_manual_deselection:TEina_Bool);cdecl;external;
{*
 * @brief This controlls if a selected item can be deselected due to clicking
 *
 * @param[in] obj The object.
 *
 * @return @c true if clicking while selected results in a state change to
 * unselected
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }
(* Const before type ignored *)
function efl_ui_selectable_allow_manual_deselection_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when there is a change in the selection state. This event will
 * collect all the item selection change events that are happening within one
 * loop iteration. This means, you will only get this event once, even if a lot
 * of items have changed. If you are interested in detailed changes, subscribe
 * to the individual @[Efl.Ui.Selectable.selected,changed] events of each item.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Single_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SINGLE_SELECTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_SINGLE_SELECTABLE_INTERFACE:=efl_ui_single_selectable_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED:=@(_EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED);
  end;


end.
