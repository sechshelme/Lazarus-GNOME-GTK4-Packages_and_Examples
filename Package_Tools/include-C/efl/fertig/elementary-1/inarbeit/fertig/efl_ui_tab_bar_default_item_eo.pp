
unit efl_ui_tab_bar_default_item_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_bar_default_item_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_bar_default_item_eo.h
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
Pchar  = ^char;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Tab_Bar_Default_Item  = ^Efl_Ui_Tab_Bar_Default_Item;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_H_}
{$define _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_H_}
{$ifndef _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_CLASS_TYPE}
{$define _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_CLASS_TYPE}
type
  PEfl_Ui_Tab_Bar_Default_Item = ^TEfl_Ui_Tab_Bar_Default_Item;
  TEfl_Ui_Tab_Bar_Default_Item = TEo;
{$endif}
{$ifndef _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_TYPES}
{$define _EFL_UI_TAB_BAR_DEFAULT_ITEM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A icon that represents the default parts in the appearance of the tab
 * bar.
 *
 * Setting the icon again after there was a previous one, will trigger an
 * animation.
 *
 * @ingroup Efl_Ui_Tab_Bar_Default_Item
  }

{ was #define dname def_expr }
function EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_tab_bar_default_item_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set the content of the default item as a image.
 *
 * The content will be re-set (means, the old content is deleted).
 *
 * @param[in] obj The object.
 * @param[in] standard_name The icon name, names are defined as standard free
 * desktop icon names.
 *
 * @ingroup Efl_Ui_Tab_Bar_Default_Item
  }
(* Const before type ignored *)
procedure efl_ui_tab_bar_default_item_icon_set(obj:PEo; standard_name:Pchar);cdecl;external;
{*
 * @brief Set the content of the default item as a image.
 *
 * The content will be re-set (means, the old content is deleted).
 *
 * @param[in] obj The object.
 *
 * @return The icon name, names are defined as standard free desktop icon
 * names.
 *
 * @ingroup Efl_Ui_Tab_Bar_Default_Item
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_tab_bar_default_item_icon_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS:=efl_ui_tab_bar_default_item_class_get;
  end;


end.
