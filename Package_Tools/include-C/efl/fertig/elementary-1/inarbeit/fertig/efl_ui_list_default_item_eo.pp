
unit efl_ui_list_default_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_list_default_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_list_default_item_eo.h
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
PEfl_Ui_List_Default_Item  = ^Efl_Ui_List_Default_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LIST_DEFAULT_ITEM_EO_H_}
{$define _EFL_UI_LIST_DEFAULT_ITEM_EO_H_}
{$ifndef _EFL_UI_LIST_DEFAULT_ITEM_EO_CLASS_TYPE}
{$define _EFL_UI_LIST_DEFAULT_ITEM_EO_CLASS_TYPE}
type
  PEfl_Ui_List_Default_Item = ^TEfl_Ui_List_Default_Item;
  TEfl_Ui_List_Default_Item = TEo;
{$endif}
{$ifndef _EFL_UI_LIST_DEFAULT_ITEM_EO_TYPES}
{$define _EFL_UI_LIST_DEFAULT_ITEM_EO_TYPES}
{$endif}
{* Default Item class to be used inside @ref Efl_Ui_List containers. It
 * displays the three parts in horizontal order: @c icon, @c text and @c extra.
 * Theming can change this arrangement.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_List_Default_Item
  }

{ was #define dname def_expr }
function EFL_UI_LIST_DEFAULT_ITEM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_list_default_item_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LIST_DEFAULT_ITEM_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LIST_DEFAULT_ITEM_CLASS:=efl_ui_list_default_item_class_get;
  end;


end.
