
unit efl_ui_tab_page_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_page_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_page_eo.h
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
PEfl_Ui_Tab_Bar_Default_Item  = ^Efl_Ui_Tab_Bar_Default_Item;
PEfl_Ui_Tab_Page  = ^Efl_Ui_Tab_Page;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TAB_PAGE_EO_H_}
{$define _EFL_UI_TAB_PAGE_EO_H_}
{$ifndef _EFL_UI_TAB_PAGE_EO_CLASS_TYPE}
{$define _EFL_UI_TAB_PAGE_EO_CLASS_TYPE}
type
  PEfl_Ui_Tab_Page = ^TEfl_Ui_Tab_Page;
  TEfl_Ui_Tab_Page = TEo;
{$endif}
{$ifndef _EFL_UI_TAB_PAGE_EO_TYPES}
{$define _EFL_UI_TAB_PAGE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A holder class for setting up a page in the pager.
 *
 * The item assosiated with this page can be used to setup a item which will
 * later be displayed in the @ref Efl_Ui_Tab_Bar of the @ref Efl_Ui_Tab_Pager
 * where this page was added to.
 *
 * @ingroup Efl_Ui_Tab_Page
  }

{ was #define dname def_expr }
function EFL_UI_TAB_PAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_tab_page_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Get this page represented as a @ref Efl_Ui_Tab_Bar_Default_Item
 *
 * The object returned here will reflect all the properties from the part here.
 * Properties will be automatically updated. This property is unique per
 * @ref Efl_Ui_Tab_Page.
 *
 * @param[in] obj The object.
 *
 * @return The @ref Efl_Ui_Tab_Bar_Default_Item for the tab bar.
 *
 * @ingroup Efl_Ui_Tab_Page
  }
(* Const before type ignored *)
function efl_ui_tab_page_tab_bar_item_get(obj:PEo):PEfl_Ui_Tab_Bar_Default_Item;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TAB_PAGE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TAB_PAGE_CLASS:=efl_ui_tab_page_class_get;
  end;


end.
