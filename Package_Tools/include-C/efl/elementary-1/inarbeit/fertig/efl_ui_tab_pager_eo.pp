
unit efl_ui_tab_pager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_pager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_pager_eo.h
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
PEfl_Ui_Spotlight_Manager  = ^Efl_Ui_Spotlight_Manager;
PEfl_Ui_Tab_Bar  = ^Efl_Ui_Tab_Bar;
PEfl_Ui_Tab_Pager  = ^Efl_Ui_Tab_Pager;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TAB_PAGER_EO_H_}
{$define _EFL_UI_TAB_PAGER_EO_H_}
{$ifndef _EFL_UI_TAB_PAGER_EO_CLASS_TYPE}
{$define _EFL_UI_TAB_PAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Tab_Pager = ^TEfl_Ui_Tab_Pager;
  TEfl_Ui_Tab_Pager = TEo;
{$endif}
{$ifndef _EFL_UI_TAB_PAGER_EO_TYPES}
{$define _EFL_UI_TAB_PAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Container for @ref Efl_Ui_Tab_Page
 *
 * This container consists out of a Efl.Ui.Tab_Bar and a place to display the
 * content of the pages. The items that are generated out of the pages will be
 * displayed in the tab bar of this pager.
 *
 * The object has an internal @ref Efl_Ui_Spotlight_Container which displays
 * the content of a item.
 *
 * @ingroup Efl_Ui_Tab_Pager
  }

{ was #define dname def_expr }
function EFL_UI_TAB_PAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_tab_pager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Tab bar where to add items of the @ref Efl_Ui_Tab_Page into.
 *
 * @param[in] obj The object.
 *
 * @return Tab bar for the items of the @ref Efl_Ui_Tab_Page
 *
 * @ingroup Efl_Ui_Tab_Pager
  }
(* Const before type ignored *)
function efl_ui_tab_pager_tab_bar_get(obj:PEo):PEfl_Ui_Tab_Bar;cdecl;external;
{*
 * @brief Spotlight manager of the internal spotlight container
 *
 * @param[in] obj The object.
 * @param[in] manager The @ref Efl_Ui_Spotlight_Manager to pass to the internal
 * @ref Efl_Ui_Spotlight_Container
 *
 * @ingroup Efl_Ui_Tab_Pager
  }
procedure efl_ui_tab_pager_spotlight_manager_set(obj:PEo; manager:PEfl_Ui_Spotlight_Manager);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TAB_PAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TAB_PAGER_CLASS:=efl_ui_tab_pager_class_get;
  end;


end.
