
unit efl_ui_container_selectable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_container_selectable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_container_selectable_eo.h
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
PEfl_Ui_Container_Selectable  = ^Efl_Ui_Container_Selectable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CONTAINER_SELECTABLE_EO_H_}
{$define _EFL_UI_CONTAINER_SELECTABLE_EO_H_}
{$ifndef _EFL_UI_CONTAINER_SELECTABLE_EO_CLASS_TYPE}
{$define _EFL_UI_CONTAINER_SELECTABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Container_Selectable = ^TEfl_Ui_Container_Selectable;
  TEfl_Ui_Container_Selectable = TEo;
{$endif}
{$ifndef _EFL_UI_CONTAINER_SELECTABLE_EO_TYPES}
{$define _EFL_UI_CONTAINER_SELECTABLE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Temporare interface, this is here until collection_view lands
 *
 * @ingroup Efl_Ui_Container_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_CONTAINER_SELECTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_container_selectable_interface_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_EVENT_ITEM_SELECTED : TEfl_Event_Description;cvar;external;
{* Called when selected
 * @return Efl_Object *
 *
 * @ingroup Efl_Ui_Container_Selectable
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ITEM_UNSELECTED : TEfl_Event_Description;cvar;external;
{* Called when no longer selected
 * @return Efl_Object *
 *
 * @ingroup Efl_Ui_Container_Selectable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_SELECTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_UNSELECTED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_CONTAINER_SELECTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_CONTAINER_SELECTABLE_INTERFACE:=efl_ui_container_selectable_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_SELECTED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_SELECTED:=@(_EFL_UI_EVENT_ITEM_SELECTED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_UNSELECTED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_UNSELECTED:=@(_EFL_UI_EVENT_ITEM_UNSELECTED);
  end;


end.
