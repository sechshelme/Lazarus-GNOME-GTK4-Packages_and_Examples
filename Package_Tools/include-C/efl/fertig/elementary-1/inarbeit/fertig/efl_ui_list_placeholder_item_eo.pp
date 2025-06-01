
unit efl_ui_list_placeholder_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_list_placeholder_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_list_placeholder_item_eo.h
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
PEfl_Ui_List_Placeholder_Item  = ^Efl_Ui_List_Placeholder_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_H_}
{$define _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_H_}
{$ifndef _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_CLASS_TYPE}
{$define _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_CLASS_TYPE}
type
  PEfl_Ui_List_Placeholder_Item = ^TEfl_Ui_List_Placeholder_Item;
  TEfl_Ui_List_Placeholder_Item = TEo;
{$endif}
{$ifndef _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_TYPES}
{$define _EFL_UI_LIST_PLACEHOLDER_ITEM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* List Placeholder Item class. This item have only one swallow space, thus
 * user can decorate item by filling the swallow with any kind of container.
 *
 * @ingroup Efl_Ui_List_Placeholder_Item
  }

{ was #define dname def_expr }
function EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_list_placeholder_item_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS:=efl_ui_list_placeholder_item_class_get;
  end;


end.
