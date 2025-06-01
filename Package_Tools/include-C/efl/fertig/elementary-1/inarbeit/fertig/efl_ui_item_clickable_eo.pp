
unit efl_ui_item_clickable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_item_clickable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_item_clickable_eo.h
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
PEfl_Ui_Item  = ^Efl_Ui_Item;
PEfl_Ui_Item_Clickable  = ^Efl_Ui_Item_Clickable;
PEfl_Ui_Item_Clickable_Clicked  = ^Efl_Ui_Item_Clickable_Clicked;
PEfl_Ui_Item_Clickable_Pressed  = ^Efl_Ui_Item_Clickable_Pressed;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_ITEM_CLICKABLE_EO_H_}
{$define _EFL_UI_ITEM_CLICKABLE_EO_H_}
{$ifndef _EFL_UI_ITEM_CLICKABLE_EO_CLASS_TYPE}
{$define _EFL_UI_ITEM_CLICKABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Item_Clickable = ^TEfl_Ui_Item_Clickable;
  TEfl_Ui_Item_Clickable = TEo;
{$endif}
{$ifndef _EFL_UI_ITEM_CLICKABLE_EO_TYPES}
{$define _EFL_UI_ITEM_CLICKABLE_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* A struct that expresses a click in item of container widget.
 *
 * @ingroup Efl_Ui_Item_Clickable_Clicked
  }
{*< The input clicked event data.  }
{*< The clicked item.  }
type
  PEfl_Ui_Item_Clickable_Clicked = ^TEfl_Ui_Item_Clickable_Clicked;
  TEfl_Ui_Item_Clickable_Clicked = record
      clicked : TEfl_Input_Clickable_Clicked;
      item : PEfl_Ui_Item;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* A struct that expresses a press or unpress in item of container widget.
 *
 * @ingroup Efl_Ui_Item_Clickable_Pressed
  }
{*< The button which was pressed or unpressed.  }
{*< The corresponding item.  }
type
  PEfl_Ui_Item_Clickable_Pressed = ^TEfl_Ui_Item_Clickable_Pressed;
  TEfl_Ui_Item_Clickable_Pressed = record
      button : longint;
      item : PEfl_Ui_Item;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Shared sets of events between @ref Efl_Ui_Collection and
 * @ref Efl_Ui_Collection_View.
 *
 * @ingroup Efl_Ui_Item_Clickable
  }
(* Const before type ignored *)

function efl_ui_item_clickable_interface_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_EVENT_ITEM_PRESSED : TEfl_Event_Description;cvar;external;
{* A @c pressed event occurred over an item.
 * @return Efl_Ui_Item_Clickable_Pressed
 *
 * @ingroup Efl_Ui_Item_Clickable
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ITEM_UNPRESSED : TEfl_Event_Description;cvar;external;
{* An @c unpressed event occurred over an item.
 * @return Efl_Ui_Item_Clickable_Pressed
 *
 * @ingroup Efl_Ui_Item_Clickable
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ITEM_LONGPRESSED : TEfl_Event_Description;cvar;external;
{* A @c longpressed event occurred over an item.
 * @return Efl_Ui_Item_Clickable_Pressed
 *
 * @ingroup Efl_Ui_Item_Clickable
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ITEM_CLICKED : TEfl_Event_Description;cvar;external;
{* A @c clicked event occurred over an item.
 * @return Efl_Ui_Item_Clickable_Clicked
 *
 * @ingroup Efl_Ui_Item_Clickable
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ITEM_CLICKED_ANY : TEfl_Event_Description;cvar;external;
{* A <tt>clicked,any</tt> event occurred over an item.
 * @return Efl_Ui_Item_Clickable_Clicked
 *
 * @ingroup Efl_Ui_Item_Clickable
  }

{ was #define dname def_expr }
function EFL_UI_ITEM_CLICKABLE_INTERFACE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_PRESSED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_UNPRESSED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_LONGPRESSED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_CLICKED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_CLICKED_ANY : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_ITEM_CLICKABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_ITEM_CLICKABLE_INTERFACE:=efl_ui_item_clickable_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_PRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_PRESSED:=@(_EFL_UI_EVENT_ITEM_PRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_UNPRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_UNPRESSED:=@(_EFL_UI_EVENT_ITEM_UNPRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_LONGPRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_LONGPRESSED:=@(_EFL_UI_EVENT_ITEM_LONGPRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_CLICKED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_CLICKED:=@(_EFL_UI_EVENT_ITEM_CLICKED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ITEM_CLICKED_ANY : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ITEM_CLICKED_ANY:=@(_EFL_UI_EVENT_ITEM_CLICKED_ANY);
  end;


end.
