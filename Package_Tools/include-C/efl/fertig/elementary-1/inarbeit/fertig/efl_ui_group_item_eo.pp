
unit efl_ui_group_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_group_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_group_item_eo.h
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
PEfl_Ui_Group_Item  = ^Efl_Ui_Group_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_GROUP_ITEM_EO_H_}
{$define _EFL_UI_GROUP_ITEM_EO_H_}
{$ifndef _EFL_UI_GROUP_ITEM_EO_CLASS_TYPE}
{$define _EFL_UI_GROUP_ITEM_EO_CLASS_TYPE}
type
  PEfl_Ui_Group_Item = ^TEfl_Ui_Group_Item;
  TEfl_Ui_Group_Item = TEo;
{$endif}
{$ifndef _EFL_UI_GROUP_ITEM_EO_TYPES}
{$define _EFL_UI_GROUP_ITEM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Special @ref Efl_Ui_Item that acts as group header.
 *
 * Items in this group have to be added directly to the @ref Efl_Ui_Group_Item
 * using the @ref Efl_Pack_Linear interface, instead of being added to the
 * container. For example, an @ref Efl_Ui_List container where all items are
 * inside a group will contain only @ref Efl_Ui_Group_Item objects. Normal
 * @ref Efl_Ui_Item objects will be contained inside the group items.
 *
 * Each container chooses how group headers are rendered. See for example
 * @ref Efl_Ui_List or @ref Efl_Ui_Grid.
 *
 * @ingroup Efl_Ui_Group_Item
  }

{ was #define dname def_expr }
function EFL_UI_GROUP_ITEM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_group_item_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_GROUP_ITEM_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_GROUP_ITEM_CLASS:=efl_ui_group_item_class_get;
  end;


end.
