
unit efl_ui_calendar_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_calendar_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_calendar_item_eo.h
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
PEfl_Ui_Calendar_Item  = ^Efl_Ui_Calendar_Item;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CALENDAR_ITEM_EO_H_}
{$define _EFL_UI_CALENDAR_ITEM_EO_H_}
{$ifndef _EFL_UI_CALENDAR_ITEM_EO_CLASS_TYPE}
{$define _EFL_UI_CALENDAR_ITEM_EO_CLASS_TYPE}
type
  PEfl_Ui_Calendar_Item = ^TEfl_Ui_Calendar_Item;
  TEfl_Ui_Calendar_Item = TEo;
{$endif}
{$ifndef _EFL_UI_CALENDAR_ITEM_EO_TYPES}
{$define _EFL_UI_CALENDAR_ITEM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Item in a @ref Efl_Ui_Calendar
 *
 * @ref efl_parent_set is the @ref Efl_Ui_Calendar object where this item is
 * in.
 *
 * This object is usally internal and should not be instantiated or used.
 *
 * @ingroup Efl_Ui_Calendar_Item
  }

{ was #define dname def_expr }
function EFL_UI_CALENDAR_ITEM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_calendar_item_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Day number
 *
 * @param[in] obj The object.
 * @param[in] i Day number
 *
 * @ingroup Efl_Ui_Calendar_Item
  }
procedure efl_ui_calendar_item_day_number_set(obj:PEo; i:longint);cdecl;external;
{*
 * @brief Day number
 *
 * @param[in] obj The object.
 *
 * @return Day number
 *
 * @ingroup Efl_Ui_Calendar_Item
  }
(* Const before type ignored *)
function efl_ui_calendar_item_day_number_get(obj:PEo):longint;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_CALENDAR_ITEM_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_CALENDAR_ITEM_CLASS:=efl_ui_calendar_item_class_get;
  end;


end.
